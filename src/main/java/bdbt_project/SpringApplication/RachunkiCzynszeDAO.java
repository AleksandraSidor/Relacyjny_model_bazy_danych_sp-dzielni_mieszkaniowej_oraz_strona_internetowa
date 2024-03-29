package bdbt_project.SpringApplication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RachunkiCzynszeDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public RachunkiCzynszeDAO(JdbcTemplate jdbcTemplate) {
        super();
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<RachunkiCzynsze> listAll() {
        String sql = "SELECT * FROM ADRESY ORDER BY ADRES_ID";

        List<RachunkiCzynsze> listRachunkiCzynsze = jdbcTemplate.query(sql,
                BeanPropertyRowMapper.newInstance(RachunkiCzynsze.class));

        return listRachunkiCzynsze;
    }


    public List<RachunkiCzynsze> getList(String username) {

        String sql = String.format(
                "SELECT m.numer_lokalu, o.data_wystawienia_rachunku,\n" +
                        "       cz.WYSOKOSC_CZYNSZU, NVL(cz.OPLATA_DODATKOWA, 0),\n" +
                        "       cz.WYSOKOSC_CZYNSZU + NVL(cz.OPLATA_DODATKOWA, 0) as kwota_do_zaplaty,\n" +
                        "       o.za_okres_od, o.za_okres_do, o.CZY_OPLACONY\n" +
                        "FROM oplaty o, mieszkania m, czynsze cz, mieszkancy mi, OSOBY os\n" +
                        "WHERE os.USERNAME='%s'\n" +
                        "  AND os.OSOBA_ID=mi.OSOBA_ID\n" +
                        "  AND mi.MIESZKANIE_ID=m.MIESZKANIE_ID\n" +
                        "  AND o.mieszkanie_id=m.mieszkanie_id\n" +
                        "  AND cz.oplaty_id=o.oplaty_id", username);

        List<RachunkiCzynsze> listRachunkiCzynsze = jdbcTemplate.query(sql,
                BeanPropertyRowMapper.newInstance(RachunkiCzynsze.class));
        return listRachunkiCzynsze;
    }

}
