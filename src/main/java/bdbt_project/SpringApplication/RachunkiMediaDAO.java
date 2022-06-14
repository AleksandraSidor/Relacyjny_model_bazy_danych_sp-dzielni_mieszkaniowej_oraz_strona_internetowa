package bdbt_project.SpringApplication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RachunkiMediaDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public RachunkiMediaDAO(JdbcTemplate jdbcTemplate) {
        super();
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<RachunkiMedia> listAll() {
        String sql = "SELECT * FROM ADRESY ORDER BY ADRES_ID";

        List<RachunkiMedia> listRachunkiMedia = jdbcTemplate.query(sql,
                BeanPropertyRowMapper.newInstance(RachunkiMedia.class));

        return listRachunkiMedia;
    }


    public List<RachunkiMedia> getList(String username) {

        String sql = String.format(
                "SELECT o.oplaty_id, m.numer_lokalu, o.data_wystawienia_rachunku,\n" +
                        "       (z.ilosc_zuzycia * md.cena_za_jednostke) as kwota_do_zaplaty,\n" +
                        "       o.za_okres_od, o.za_okres_do, md.nazwa as medium, o.CZY_OPLACONY\n" +
                        "FROM oplaty o, mieszkania m, zuzycia z, media md, mieszkancy mi, OSOBY os\n" +
                        "WHERE os.USERNAME='%s'\n" +
                        "  AND os.OSOBA_ID=mi.OSOBA_ID\n" +
                        "  AND mi.MIESZKANIE_ID=m.MIESZKANIE_ID\n" +
                        "  AND o.mieszkanie_id=m.mieszkanie_id\n" +
                        "  AND z.oplaty_id=o.oplaty_id\n" +
                        "  AND z.medium_id=md.medium_id", username);

        List<RachunkiMedia> listRachunkiMedia = jdbcTemplate.query(sql,
                BeanPropertyRowMapper.newInstance(RachunkiMedia.class));
        return listRachunkiMedia;
    }

    public void update(int oplaty_id, String username) throws EmptyResultDataAccessException {

        String sql = String.format("SELECT m.mieszkanie_id FROM oplaty o, mieszkania m, zuzycia z, mieszkancy mi, OSOBY os\n" +
                "    WHERE os.USERNAME='%s'\n" +
                "        AND z.OPLATY_ID=%d\n" +
                "        AND z.OPLATY_ID=o.OPLATY_ID\n" +
                "        AND o.MIESZKANIE_ID=m.MIESZKANIE_ID\n" +
                "        AND mi.MIESZKANIE_ID=m.MIESZKANIE_ID\n" +
                "        AND mi.OSOBA_ID = os.OSOBA_ID\n" +
                "        AND o.mieszkanie_id=m.mieszkanie_id\n" +
                "        AND o.MIESZKANIE_ID=m.MIESZKANIE_ID " +
                "        ORDER BY z.oplaty_id", username, oplaty_id);



        String numer_lokalu = jdbcTemplate.queryForObject(sql, String.class);


        String sql2 = String.format("UPDATE Oplaty SET CZY_OPLACONY='T' " +
                "WHERE oplaty_id=%d", oplaty_id);

        jdbcTemplate.execute(sql2);
    }

}
