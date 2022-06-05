package bdbt_project.SpringApplication;

import bdbt_project.SpringApplication.Bloki;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BlokiDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public BlokiDAO(JdbcTemplate jdbcTemplate) {
//        super();
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Bloki> list() {
        String sql = "SELECT * FROM BLOKI";

        List<Bloki> listBloki = jdbcTemplate.query(sql,
                BeanPropertyRowMapper.newInstance(Bloki.class));
        return listBloki;
    }

    public void save(Bloki bloki) {

    }

    public Bloki get(int id) {
        return null;
    }

    public void update(Bloki bloki) {

    }

    public void delete(int id) {

    }
}
