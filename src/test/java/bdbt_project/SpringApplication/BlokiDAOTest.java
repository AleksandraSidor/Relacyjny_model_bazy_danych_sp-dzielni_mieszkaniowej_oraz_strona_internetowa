package bdbt_project.SpringApplication;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class BlokiDAOTest {

    private BlokiDAO dao;

    @BeforeEach
    void setUp() throws Exception {
        DriverManagerDataSource datasource = new DriverManagerDataSource();
        datasource.setUrl("jdbc:oracle:thin:@localhost:1521:orcl");
        datasource.setUsername("OLA");
        datasource.setPassword("princess1");
        datasource.setDriverClassName("oracle.jdbc.OracleDriver");


        dao = new BlokiDAO(new JdbcTemplate(datasource));

    }

    @Test
    void testList() {
        List<Bloki> listBloki = dao.list();
        assertFalse(listBloki.isEmpty());
    }
    /**
     * Method BlokiDAO.save(blok) returns true if blok has valid adres_id and blok instance was saved successfully.
     */
    @Test
    void testSave() {
        Bloki blok = new Bloki(4,10,100,1999,4,1,2);
    }

    /**
     * Method BlokiDAO.save(blok) throws EmptyResultDataAccessException if blok has invalid adres_id.
     */
    @Test
    void testSaveWithInvalidAddress() {
        Bloki blok = new Bloki(4, 10, 100, 1999, 4, 1, 9999999);
        assertThrows(EmptyResultDataAccessException.class,
                () -> dao.save(blok));
    }

    @Test
    void testGet() {
        int id = 1;
        Bloki blok = dao.get(id);
        assertNotNull(blok);
    }

    @Test
    void testUpdate() {
        Bloki blok = dao.get(1);
        blok.setRok_powstania(2015);
        dao.update(blok);
    }

    @Test
    void testDelete() {
        int id = 4;
        dao.delete(id);
    }


}
