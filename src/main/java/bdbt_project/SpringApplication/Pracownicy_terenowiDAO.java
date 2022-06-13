package bdbt_project.SpringApplication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class Pracownicy_terenowiDAO {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Pracownicy_terenowiDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Pracownicy_terenowi> list(){
        String sql = String.format("SELECT p.pracownik_id, p.imie, p.drugie_imie, p.nazwisko, p.pesel, p.data_urodzenia, p.numer_telefonu, p.plec, p.numer_konta, p.data_zatrudnienia, p.data_zwolnienia, t.rodzaj_pracownika_terenowego, a.ulica, a.numer_domu, a.numer_lokalu, a.miasto, a.kod_pocztowy \n" +
                "FROM pracownicy p, pracownicy_terenowi t, adresy a\n" +
                "WHERE p.adres_id = a.adres_id\n" +
                "AND p.pracownik_id=t.pracownik_id");

        List<Pracownicy_terenowi> listaPracownicy_terenowi = jdbcTemplate.query(sql,
                BeanPropertyRowMapper.newInstance(Pracownicy_terenowi.class));

        return null;
    }
    /* Insert – wstawianie nowego wiersza do bazy */
    public void save(Pracownicy_terenowi pracownicy_terenowi) {
    }

    public Pracownicy_terenowi get(int id) {
        return null;
    }

    public void update(Pracownicy_terenowi pracownicy_terenowi) {
    }

    public void delete(int id) {
    }
}
