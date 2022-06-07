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
public class BlokiDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public BlokiDAO(JdbcTemplate jdbcTemplate) {
        super();
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Bloki> list() {
        String sql = "SELECT * FROM BLOKI ORDER BY BLOK_ID";

        List<Bloki> listBloki = jdbcTemplate.query(sql,
                BeanPropertyRowMapper.newInstance(Bloki.class));

        return listBloki;
    }

    public void save(Bloki blok) throws EmptyResultDataAccessException, ArithmeticException {

        validate_adres_id(blok);


        blok.setSpoldzielnia_mieszkaniowa_id(1);
        SimpleJdbcInsert insertActor = new SimpleJdbcInsert(jdbcTemplate);

        insertActor.withTableName("BLOKI").usingColumns("liczba_pieter", "liczba_lokali", "rok_powstania",
                "winda", "liczba_klatek", "spoldzielnia_mieszkaniowa_id", "adres_id");

        BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(blok);
        insertActor.execute(param);

    }

    public Bloki get(int id) {
        String sql = String.format("SELECT * FROM BLOKI WHERE Blok_id = %d", id);
        Bloki blok = jdbcTemplate.queryForObject(sql,
                BeanPropertyRowMapper.newInstance(Bloki.class));
        return blok;
    }

    public void update(Bloki blok) throws EmptyResultDataAccessException, ArithmeticException {

        validate_adres_id(blok);
        blok.setSpoldzielnia_mieszkaniowa_id(1);


        String sql = "UPDATE BLOKI SET liczba_pieter=:liczba_pieter, liczba_lokali=:liczba_lokali," +
                " rok_powstania=:rok_powstania, winda=:winda, liczba_klatek=:liczba_klatek," +
                " spoldzielnia_mieszkaniowa_id=:spoldzielnia_mieszkaniowa_id, adres_id=:adres_id " +
                "WHERE blok_id=:blok_id";

        BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(blok);
        NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(jdbcTemplate);
        template.update(sql, param);
    }

    public void delete(int id) {
        String sql = "DELETE FROM BLOKI WHERE blok_id = ?";
        jdbcTemplate.update(sql, id);
    }

    /**
     * Helper function for validating adres_id before saving blok to the database.
     * @param blok
     */
    private void validate_adres_id(Bloki blok) throws EmptyResultDataAccessException, ArithmeticException {
        String sqlTest1 = String.format("SELECT ulica FROM ADRESY WHERE Adres_id=%d", blok.getAdres_id());
        String ulica = jdbcTemplate.queryForObject(sqlTest1, String.class);

        String sqlTest2 = String.format("SELECT blok_id FROM BLOKI WHERE Adres_id=%d", blok.getAdres_id());
        try {
            Integer blokID = jdbcTemplate.queryForObject(sqlTest2, Integer.class);

            if (blokID != null && blokID != blok.getBlok_id()) {
                // blok z danym adresem juz istnieje i cos z tym trzeba robic, na razie rzucam jakikolwiek wyjatek
                throw new ArithmeticException();
            }
        }
        catch (EmptyResultDataAccessException ignored) {
            // Jesli zbior wynikow jest pusty (mamy wyjatek) to znaczy ze zaden blok nie jest przypisany do tego adresu (jest wolny) -> czyli dobrze nic nie robimy
        }
    }
}
