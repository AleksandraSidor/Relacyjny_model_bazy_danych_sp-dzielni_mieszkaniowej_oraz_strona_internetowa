package bdbt_project.SpringApplication;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertFalse;

public class RachunkiMediaDAOTest {

    private RachunkiMediaDAO dao;

    @BeforeEach
    void setUp() throws Exception {
        DriverManagerDataSource datasource = new DriverManagerDataSource();
        datasource.setUrl("jdbc:oracle:thin:@localhost:1521:orcl");
        datasource.setUsername("OLA");
        datasource.setPassword("princess1");
        datasource.setDriverClassName("oracle.jdbc.OracleDriver");


        dao = new RachunkiMediaDAO(new JdbcTemplate(datasource));

    }

    @Test
    void testGetList() {
        List<RachunkiMedia> listRachunkiMedia = dao.getList("user1");
        for (RachunkiMedia rachunek : listRachunkiMedia) {
            System.out.println(rachunek);
        }
        assertFalse(listRachunkiMedia.isEmpty());
    }


}
