package bdbt_project.SpringApplication;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertFalse;

public class RachunkiCzynszeDAOTest {

    private RachunkiCzynszeDAO dao;

    @BeforeEach
    void setUp() throws Exception {
        DriverManagerDataSource datasource = new DriverManagerDataSource();
        datasource.setUrl("jdbc:oracle:thin:@localhost:1521:orcl1");
        datasource.setUsername("blachotrapez");
        datasource.setPassword("dupa1234");
        datasource.setDriverClassName("oracle.jdbc.OracleDriver");


        dao = new RachunkiCzynszeDAO(new JdbcTemplate(datasource));

    }

    @Test
    void testGetList() {
        List<RachunkiCzynsze> listRachunkiCzynsze = dao.getList("user1");
        for (RachunkiCzynsze rachunek : listRachunkiCzynsze) {
            System.out.println(rachunek);
        }
        assertFalse(listRachunkiCzynsze.isEmpty());
    }


}
