package bdbt_project.SpringApplication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdresyDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public AdresyDAO(JdbcTemplate jdbcTemplate) {
        super();
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Adresy> list() {
        String sql = "SELECT * FROM ADRESY ORDER BY ADRES_ID";

        List<Adresy> listAdresy = jdbcTemplate.query(sql,
                BeanPropertyRowMapper.newInstance(Adresy.class));

        return listAdresy;
    }

    public void save(Adresy adres) {
        
        SimpleJdbcInsert insertActor = new SimpleJdbcInsert(jdbcTemplate);

        insertActor.withTableName("Adresy").usingColumns("ulica", "numer_domu", "numer_lokalu",
                "miasto", "kod_pocztowy");

        BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(adres);
        insertActor.execute(param);

    }

    public Adresy get(int id) {
        String sql = String.format("SELECT * FROM Adresy WHERE adres_id = %d", id);
        Adresy adres = jdbcTemplate.queryForObject(sql,
                BeanPropertyRowMapper.newInstance(Adresy.class));
        return adres;
    }

    public void update(Adresy adres) throws EmptyResultDataAccessException, ArithmeticException {


        String sql = "UPDATE Adresy SET ulica=:ulica, numer_domu=:numer_domu," +
                " numer_lokalu=:numer_lokalu, miasto=:miasto, kod_pocztowy=:kod_pocztowy " +
                "WHERE adres_id=:adres_id";

        BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(adres);
        NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(jdbcTemplate);
        template.update(sql, param);
    }

    public void delete(int id) {
        String sql = "DELETE FROM Adresy WHERE adres_id = ?";
        jdbcTemplate.update(sql, id);
    }
    
}
