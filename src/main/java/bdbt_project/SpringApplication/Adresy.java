package bdbt_project.SpringApplication;

public class Adresy {
    private int adres_id;
    private String ulica;
    private String numer_domu;
    private String numer_lokalu;
    private String miasto;
    private String kod_pocztowy;

    public Adresy(int adres_id, String ulica, String numer_domu, String numer_lokalu, String miasto, String kod_pocztowy) {
        this.adres_id = adres_id;
        this.ulica = ulica;
        this.numer_domu = numer_domu;
        this.numer_lokalu = numer_lokalu;
        this.miasto = miasto;
        this.kod_pocztowy = kod_pocztowy;
    }

    public Adresy() {
    }

    public int getAdres_id() {
        return adres_id;
    }

    public void setAdres_id(int adres_id) {
        this.adres_id = adres_id;
    }

    public String getUlica() {
        return ulica;
    }

    public void setUlica(String ulica) {
        this.ulica = ulica;
    }

    public String getNumer_domu() {
        return numer_domu;
    }

    public void setNumer_domu(String numer_domu) {
        this.numer_domu = numer_domu;
    }

    public String getNumer_lokalu() {
        return numer_lokalu;
    }

    public void setNumer_lokalu(String numer_lokalu) {
        this.numer_lokalu = numer_lokalu;
    }

    public String getMiasto() {
        return miasto;
    }

    public void setMiasto(String miasto) {
        this.miasto = miasto;
    }

    public String getKod_pocztowy() {
        return kod_pocztowy;
    }

    public void setKod_pocztowy(String kod_pocztowy) {
        this.kod_pocztowy = kod_pocztowy;
    }
}
