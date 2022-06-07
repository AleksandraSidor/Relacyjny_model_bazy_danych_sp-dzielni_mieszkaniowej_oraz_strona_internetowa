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
import java.util.List;

@Configuration
public class AppController implements WebMvcConfigurer {

    @Autowired
    private BlokiDAO dao;


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
            List<Bloki> listBloki = dao.list();
            model.addAttribute("listBloki", listBloki);
            return "admin/main_admin";
        }

        @RequestMapping(value = {"/main_user"})
        public String showUserPage(Model model) {
            return "user/main_user";
        }

        @RequestMapping(value = {"/admin/bloki"})
        public String showBlokiTable(Model model) {
            List<Bloki> listBloki = dao.list();
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
                dao.save(blok);
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
            Bloki blok = dao.get(id);
            mav.addObject("blok", blok);

            return mav;
        }

        @PostMapping(value= {"admin/bloki/{id}/update"})
        public String updateBlok(@ModelAttribute("blok") Bloki blok) {
            try{
                dao.update(blok);
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
            dao.delete(id);
            return "redirect:/admin/bloki";
        }

    }
}