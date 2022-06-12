package bdbt_project.SpringApplication;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertFalse;

public class RachunkiDAOTest {

    private RachunkiDAO dao;

    @BeforeEach
    void setUp() throws Exception {
        DriverManagerDataSource datasource = new DriverManagerDataSource();
        datasource.setUrl("jdbc:oracle:thin:@localhost:1521:orcl");
        datasource.setUsername("OLA");
        datasource.setPassword("princess1");
        datasource.setDriverClassName("oracle.jdbc.OracleDriver");


        dao = new RachunkiDAO(new JdbcTemplate(datasource));

    }

    @Test
    void testGetList() {
        List<Rachunki> listRachunki = dao.getList(1);
        for (Rachunki rachunek : listRachunki) {
            System.out.println(rachunek);
        }
        assertFalse(listRachunki.isEmpty());
    }


}
