package bdbt_project.SpringApplication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
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
        String sql = String.format("SELECT p.pracownik_id, p.imie, p.drugie_imie, p.nazwisko, p.pesel, p.data_urodzenia, p.numer_telefonu, p.plec, p.numer_konta, p.data_zatrudnienia, p.data_zwolnienia, b.rodzaj_pracownika_biurowego, a.ulica, a.numer_domu, a.numer_lokalu, a.miasto, a.kod_pocztowy \n" +
                "FROM pracownicy p, pracownicy_biurowi b, adresy a\n" +
                "WHERE p.adres_id = a.adres_id\n" +
                "AND p.pracownik_id=b.pracownik_id");

        List<Pracownicy_biurowi> listaPracownicy_biurowi = jdbcTemplate.query(sql,
                BeanPropertyRowMapper.newInstance(Pracownicy_biurowi.class));
        return listaPracownicy_biurowi;
    }
    /* Insert – wstawianie nowego wiersza do bazy */
    public void save(Pracownicy_biurowi pracownicy_biurowi) {
    }
    /* Read – odczytywanie danych z bazy */
    public Pracownicy_biurowi get(int id) {
        return null;
    }
    /* Update – aktualizacja danych */
    public void update(Pracownicy_biurowi pracownicy_biurowi) {
    }
    /* Delete – wybrany rekord z danym id */
    public void delete(int id) {
    }

}
