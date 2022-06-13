package bdbt_project.SpringApplication;

public class RachunkiCzynsze {
    private String numer_lokalu;
    private String data_wystawienia_rachunku;
    private String za_okres_od;
    private String za_okres_do;
    private float wysokosc_czynszu;
    private float oplaty_dodatkowe;
    private float kwota_do_zaplaty;
    private String czy_oplacony;

    public RachunkiCzynsze(String numer_lokalu, String data_wystawienia_rachunku, String za_okres_od,
                         String za_okres_do, String czy_oplacony, float wysokosc_czynszu,
                           float oplaty_dodatkowe) {
        this.numer_lokalu = numer_lokalu;
        this.data_wystawienia_rachunku = data_wystawienia_rachunku;
        this.za_okres_od = za_okres_od;
        this.za_okres_do = za_okres_do;
        this.wysokosc_czynszu = wysokosc_czynszu;
        this.oplaty_dodatkowe = oplaty_dodatkowe;
        this.kwota_do_zaplaty = wysokosc_czynszu + oplaty_dodatkowe;
        this.czy_oplacony = czy_oplacony;
    }

    public RachunkiCzynsze() {
    }

    public String getNumer_lokalu() {
        return numer_lokalu;
    }

    public String getData_wystawienia_rachunku() {
        return data_wystawienia_rachunku;
    }

    public float getKwota_do_zaplaty() {
        return kwota_do_zaplaty;
    }

    public String getZa_okres_od() {
        return za_okres_od;
    }

    public String getZa_okres_do() {
        return za_okres_do;
    }


    public String getCzy_oplacony() {
        return czy_oplacony;
    }

    public void setNumer_lokalu(String numer_lokalu) {
        this.numer_lokalu = numer_lokalu;
    }

    public void setData_wystawienia_rachunku(String data_wystawienia_rachunku) {
        this.data_wystawienia_rachunku = data_wystawienia_rachunku;
    }


    public void setZa_okres_od(String za_okres_od) {
        this.za_okres_od = za_okres_od;
    }

    public void setZa_okres_do(String za_okres_do) {
        this.za_okres_do = za_okres_do;
    }


    public void setCzy_oplacony(String czy_oplacony) {
        this.czy_oplacony = czy_oplacony;
    }

    public float getWysokosc_czynszu() {
        return wysokosc_czynszu;
    }

    public void setWysokosc_czynszu(float wysokosc_czynszu) {
        this.wysokosc_czynszu = wysokosc_czynszu;
    }

    public float getOplaty_dodatkowe() {
        return oplaty_dodatkowe;
    }

    public void setOplaty_dodatkowe(float oplaty_dodatkowe) {
        this.oplaty_dodatkowe = oplaty_dodatkowe;
    }

    public void setKwota_do_zaplaty(float kwota_do_zaplaty) {
        this.kwota_do_zaplaty = kwota_do_zaplaty;
    }

    @Override
    public String toString() {
        return "Rachunki{" +
                "numer_lokalu=" + numer_lokalu +
                ", data_wystawienia_rachunku='" + data_wystawienia_rachunku + '\'' +
                ", kwota_do_zaplaty=" + kwota_do_zaplaty +
                ", za_okres_od='" + za_okres_od + '\'' +
                ", za_okres_do='" + za_okres_do + '\'' +
                ", wysokosc_czynszu='" + wysokosc_czynszu + '\'' +
                ", oplaty_dodatkowe='" + oplaty_dodatkowe + '\'' +
                ", kwota_do_zaplaty='" + kwota_do_zaplaty + '\'' +
                ", czy_oplacony='" + czy_oplacony + '\'' +
                '}';
    }
}

