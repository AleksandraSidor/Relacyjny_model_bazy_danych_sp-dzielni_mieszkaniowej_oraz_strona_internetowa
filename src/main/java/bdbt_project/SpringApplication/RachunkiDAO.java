package bdbt_project.SpringApplication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RachunkiDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public RachunkiDAO(JdbcTemplate jdbcTemplate) {
        super();
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Rachunki> listAll() {
        String sql = "SELECT * FROM ADRESY ORDER BY ADRES_ID";

        List<Rachunki> listRachunki = jdbcTemplate.query(sql,
                BeanPropertyRowMapper.newInstance(Rachunki.class));

        return listRachunki;
    }


    public List<Rachunki> getList(int id) {
        String sql = String.format(
                "SELECT m.numer_lokalu, o.data_wystawienia_rachunku,\n" +
                "       (z.ilosc_zuzycia * md.cena_za_jednostke) as kwota_do_zaplaty,\n" +
                "       o.za_okres_od, o.za_okres_do, md.nazwa as medium, o.CZY_OPLACONY\n" +
                "FROM oplaty o, mieszkania m, zuzycia z, media md, mieszkancy mi, OSOBY os\n" +
                "WHERE os.OSOBA_ID=%d\n" +
                "  AND os.OSOBA_ID=mi.OSOBA_ID\n" +
                "  AND mi.MIESZKANIE_ID=m.MIESZKANIE_ID\n" +
                "  AND o.mieszkanie_id=m.mieszkanie_id\n" +
                "  AND z.oplaty_id=o.oplaty_id\n" +
                "  AND z.medium_id=md.medium_id", id);

        List<Rachunki> listRachunki = jdbcTemplate.query(sql,
                BeanPropertyRowMapper.newInstance(Rachunki.class));
        return listRachunki;
    }

}
