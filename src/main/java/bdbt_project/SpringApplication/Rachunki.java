package bdbt_project.SpringApplication;

public class Rachunki {
    private String numer_lokalu;
    private String data_wystawienia_rachunku;
    private float kwota_do_zaplaty;
    private String za_okres_od;
    private String za_okres_do;
    private String medium;
    private String czy_oplacony;

    public Rachunki(String numer_lokalu, String data_wystawienia_rachunku, float kwota_do_zaplaty, String za_okres_od,
                    String za_okres_do, String medium, String czy_oplacony) {
        this.numer_lokalu = numer_lokalu;
        this.data_wystawienia_rachunku = data_wystawienia_rachunku;
        this.kwota_do_zaplaty = kwota_do_zaplaty;
        this.za_okres_od = za_okres_od;
        this.za_okres_do = za_okres_do;
        this.medium = medium;
        this.czy_oplacony = czy_oplacony;
    }

    public Rachunki() {
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

    public String getMedium() {
        return medium;
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

    public void setKwota_do_zaplaty(float kwota_do_zaplaty) {
        this.kwota_do_zaplaty = kwota_do_zaplaty;
    }

    public void setZa_okres_od(String za_okres_od) {
        this.za_okres_od = za_okres_od;
    }

    public void setZa_okres_do(String za_okres_do) {
        this.za_okres_do = za_okres_do;
    }

    public void setMedium(String medium) {
        this.medium = medium;
    }

    public void setCzy_oplacony(String czy_oplacony) {
        this.czy_oplacony = czy_oplacony;
    }

    @Override
    public String toString() {
        return "Rachunki{" +
                "numer_lokalu=" + numer_lokalu +
                ", data_wystawienia_rachunku='" + data_wystawienia_rachunku + '\'' +
                ", kwota_do_zaplaty=" + kwota_do_zaplaty +
                ", za_okres_od='" + za_okres_od + '\'' +
                ", za_okres_do='" + za_okres_do + '\'' +
                ", medium='" + medium + '\'' +
                ", czy_oplacony='" + czy_oplacony + '\'' +
                '}';
    }
}
