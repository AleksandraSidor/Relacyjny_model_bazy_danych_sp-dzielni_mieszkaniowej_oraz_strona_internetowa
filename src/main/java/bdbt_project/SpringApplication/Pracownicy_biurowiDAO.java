package bdbt_project.SpringApplication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class Pracownicy_biurowiDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Pracownicy_biurowiDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Pracownicy_biurowi> list(){
        String sql = String.format("SELECT p.pracownik_id, p.imie, p.drugie_imie, p.nazwisko, p.pesel, p.data_urodzenia, p.numer_telefonu, p.plec, p.numer_konta, p.data_zatrudnienia, p.data_zwolnienia, a.ulica, a.numer_domu, a.numer_lokalu, a.miasto, a.kod_pocztowy \n" +
                "FROM pracownicy p, adresy a\n" +
                "WHERE p.adres_id = a.adres_id");

        List<Pracownicy_biurowi> listPracownicy_biurowi = jdbcTemplate.query(sql,
                BeanPropertyRowMapper.newInstance(Pracownicy_biurowi.class));
        return listPracownicy_biurowi;
    }

    public void save(Pracownicy_biurowi pracownicy_biurowi, Adresy adresy) {
        pracownicy_biurowi.setSpoldzielnia_mieszkaniowa_id(1);
        SimpleJdbcInsert insertActor = new SimpleJdbcInsert(jdbcTemplate);

        insertActor.withTableName("ADRESY").usingColumns("ulica", "numer_domu", "numer_lokalu",
                "miasto", "kod_pocztowy");

        BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(adresy);
        insertActor.execute(param);

        String sql = String.format("SELECT adres_id FROM adresy WHERE ulica='%1$s' " +
                "AND numer_domu='%2$s' " +
                "AND numer_lokalu='%3$s' " +
                "AND miasto='%4$s'", pracownicy_biurowi.getUlica(), pracownicy_biurowi.getNumer_domu(), pracownicy_biurowi.getNumer_lokalu(), pracownicy_biurowi.getMiasto());

        Integer id = jdbcTemplate.queryForObject(sql, Integer.class);
        pracownicy_biurowi.setAdres_id(id);

        SimpleJdbcInsert insertActor2 = new SimpleJdbcInsert(jdbcTemplate);

        insertActor2.withTableName("Pracownicy").usingColumns("imie", "drugie_imie", "nazwisko",
                "pesel", "data_urodzenia", "numer_telefonu", "plec", "numer_konta", "data_zatrudnienia", "data_zwolnienia",
                "spoldzielnia_mieszkaniowa_id", "adres_id");

        BeanPropertySqlParameterSource param2 = new BeanPropertySqlParameterSource(pracownicy_biurowi);
        insertActor2.execute(param2);

    }

    /* Read – odczytywanie danych z bazy */
    public Pracownicy_biurowi get(int id) {
        Object[] args = {id};
        String sql = "SELECT * FROM pracownicy WHERE pracownik_id = " + args[0];
        Pracownicy_biurowi pracownicy_biurowi = jdbcTemplate.queryForObject(sql,
                BeanPropertyRowMapper.newInstance(Pracownicy_biurowi.class));
        return pracownicy_biurowi;
    }



    public void update(Pracownicy_biurowi pracownicy_biurowi) {

        pracownicy_biurowi.setSpoldzielnia_mieszkaniowa_id(1);
        String sql = "UPDATE pracownicy SET imie=:imie, drugie_imie=:drugie_imie, nazwisko=:nazwisko, pesel=:pesel, " +
                "data_urodzenia=:data_urodzenia, numer_telefonu=:numer_telefonu, plec=:plec, numer_konta=:numer_konta, " +
                "data_zatrudnienia=:data_zatrudnienia, data_zwolnienia=:TO_DATE('data_zwolnienia', 'YYYY-MM-DD HH24:MI:SS'), spoldzielnia_mieszkaniowa_id=:spoldzielnia_mieszkaniowa_id, adres_id=:adres_id " +
                "WHERE pracownik_id=:pracownik_id";

        BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(pracownicy_biurowi);
        NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(jdbcTemplate);
        template.update(sql, param);
    }

    public void delete(int id) {
        String sql = "DELETE FROM pracownicy WHERE pracownik_id= ?";
        jdbcTemplate.update(sql, id);
    }

}
