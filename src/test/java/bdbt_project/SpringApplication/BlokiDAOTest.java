package bdbt_project.SpringApplication;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import java.util.List;

public class BlokiDAOTest {

    private BlokiDAO dao;

    @BeforeEach
    void setUp() throws Exception {
        DriverManagerDataSource datasource = new DriverManagerDataSource();
        datasource.setUrl("jdbc:oracle:thin:@localhost:1521:ORCL1");
        datasource.setUsername("SYSTEM");
        datasource.setPassword("princess1");
        datasource.setDriverClassName("oracle.jdbc.OracleDriver");


        dao = new BlokiDAO(new JdbcTemplate(datasource));

    }

    @Test
    void testList() {
        List<Bloki> listBloki = dao.list();
        assertTrue(!listBloki.isEmpty());
    }

}
