package bdbt_project.SpringApplication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;

@Configuration
public class AppController implements WebMvcConfigurer {

    @Autowired
    private BlokiDAO blokiDAO;
    @Autowired
    private AdresyDAO adresyDAO;

    @Autowired
    private RachunkiDAO rachunkiDAO;




    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/index").setViewName("index");
        registry.addViewController("/").setViewName("index");
        registry.addViewController("/main").setViewName("main");
        registry.addViewController("/login").setViewName("login");

        registry.addViewController("/main_admin").setViewName("admin/main_admin");
        registry.addViewController("/main_user").setViewName("user/main_user");

        registry.addViewController("/admin/bloki").setViewName("admin/bloki");
        registry.addViewController("/admin/bloki/create").setViewName("admin/blokiCreate");
        registry.addViewController("/admin/bloki/{id}/update").setViewName("admin/blokiUpdate");

        registry.addViewController("/admin/adresy").setViewName("admin/adresy");
        registry.addViewController("/admin/adresy/create").setViewName("admin/adresyCreate");
        registry.addViewController("/admin/adresy/{id}/update").setViewName("admin/adresyUpdate");

        registry.addViewController("user/rachunki").setViewName("user/rachunki");
    }
    @Controller
    public class DashboardController {

        @RequestMapping
                ("/main"
                )
        public String defaultAfterLogin
                (HttpServletRequest request) {
            if
            (request.isUserInRole
                    ("ADMIN")) {
                return "redirect:/main_admin";
            } else if
            (request.isUserInRole
                            ("USER")) {
                return "redirect:/main_user";
            } else {
                return "redirect:/index";
            }
        }

        @RequestMapping("/main_admin")
        public String showPage(Model model) {
            List<Bloki> listBloki = blokiDAO.list();
            model.addAttribute("listBloki", listBloki);
            return "admin/main_admin";
        }

        @RequestMapping(value = {"/main_user"})
        public String showUserPage(Model model) {
            return "user/main_user";
        }

        @RequestMapping(value = {"/admin/bloki"})
        public String showBlokiTable(Model model) {
            List<Bloki> listBloki = blokiDAO.list();
            model.addAttribute("listBloki", listBloki);
            return "admin/bloki";
        }

        @GetMapping(value = {"admin/bloki/create"})
        public String showBlokCreateForm(Model model) {
            Bloki blok = new Bloki();
            model.addAttribute("blok", blok);
            return "admin/blokiCreate";
        }

        @PostMapping(value = {"admin/bloki/create"})
        public String saveCreatedBlok(@ModelAttribute("blok") Bloki blok) {
            try{
                blokiDAO.save(blok);
            } catch (EmptyResultDataAccessException ex) {
                throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Given Adres_id does not exist");
            } catch (ArithmeticException ex) {
                throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Given Adres_id already used");
            }
            return "redirect:/admin/bloki";
        }

        @GetMapping(value = {"admin/bloki/{id}/update"})
        public ModelAndView showUpdateBlokForm(@PathVariable(name="id") int id) {
            ModelAndView mav = new ModelAndView("admin/blokiUpdate");
            Bloki blok = blokiDAO.get(id);
            mav.addObject("blok", blok);

            return mav;
        }

        @PostMapping(value= {"admin/bloki/{id}/update"})
        public String updateBlok(@ModelAttribute("blok") Bloki blok) {
            try{
                blokiDAO.update(blok);
            } catch (EmptyResultDataAccessException ex) {
                throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Given Adres_id does not exist");
            }
            catch (ArithmeticException ex) {
                throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Given Adres_id already used");
            }
            return "redirect:/admin/bloki";
        }
        @RequestMapping(value = {"admin/bloki/{id}/delete"})
        public String deleteBlok(@PathVariable(name="id") int id){
            blokiDAO.delete(id);
            return "redirect:/admin/bloki";
        }

        @RequestMapping(value = {"/admin/adresy"})
        public String showAdresyTable(Model model) {
            List<Adresy> listAdresy = adresyDAO.list();
            model.addAttribute("listAdresy", listAdresy);
            return "admin/adresy";
        }

        @GetMapping(value = {"admin/adresy/create"})
        public String showAdresCreateForm(Model model) {
            Adresy adres = new Adresy();
            model.addAttribute("adres", adres);
            return "admin/adresyCreate";
        }

        @PostMapping(value = {"admin/adresy/create"})
        public String saveCreatedAdres(@ModelAttribute("adres") Adresy adres) {
            adresyDAO.save(adres);

            return "redirect:/admin/adresy";
        }

        @GetMapping(value = {"admin/adresy/{id}/update"})
        public ModelAndView showUpdateAdresForm(@PathVariable(name="id") int id) {
            ModelAndView mav = new ModelAndView("admin/adresyUpdate");
            Adresy adres = adresyDAO.get(id);
            mav.addObject("adres", adres);

            return mav;
        }

        @PostMapping(value= {"admin/adresy/{id}/update"})
        public String updateAdres(@ModelAttribute("adres") Adresy adres) {
            try{
                adresyDAO.update(adres);
            } catch (EmptyResultDataAccessException ex) {
                throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Given Adres_id does not exist");
            }
            catch (ArithmeticException ex) {
                throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Given Adres_id already used");
            }
            return "redirect:/admin/adresy";
        }
        @RequestMapping(value = {"admin/adresy/{id}/delete"})
        public String deleteAdres(@PathVariable(name="id") int id){
            adresyDAO.delete(id);
            return "redirect:/admin/adresy";
        }

        @GetMapping(value = {"/user/rachunki"})
        public String getRachunkiList(Model model, Principal principal) {
            List<Rachunki> listRachunki = rachunkiDAO.getList(principal.getName());
            model.addAttribute("listRachunki", listRachunki);
            return "/user/rachunki";
        }

/*        @ResponseBody
        public String currentUser(){
            Authentication user = (Authentication) SecurityContextHolder.getContext().getAuthentication().getCredentials();
            System.out.println(user);
            String u = user.toString();
            return(u);
        }*/



    }

}