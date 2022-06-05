package bdbt_project.SpringApplication;

public class Bloki {
    private int blok_id;
    private int liczba_pieter;
    private int liczba_lokali;
    private int rok_powstania;
    private int winda;
    private int liczba_klatek;
    private int spoldzielnia_mieszkaniowa_id;
    private int adres_id;

    public Bloki() {
    }

    public Bloki(int blok_id, int liczba_pieter, int liczba_lokali, int rok_powstania, int winda, int liczba_klatek, int spoldzielnia_mieszkaniowa_id, int adres_id) {
       // super();
        this.blok_id = blok_id;
        this.liczba_pieter = liczba_pieter;
        this.liczba_lokali = liczba_lokali;
        this.rok_powstania = rok_powstania;
        this.winda = winda;
        this.liczba_klatek = liczba_klatek;
        this.spoldzielnia_mieszkaniowa_id = spoldzielnia_mieszkaniowa_id;
        this.adres_id = adres_id;
    }


    public int getBlok_id() {
        return blok_id;
    }

    public void setBlok_id(int blok_id) {
        this.blok_id = blok_id;
    }

    public int getLiczba_pieter() {
        return liczba_pieter;
    }

    public void setLiczba_pieter(int liczba_pieter) {
        this.liczba_pieter = liczba_pieter;
    }

    public int getLiczba_lokali() {
        return liczba_lokali;
    }

    public void setLiczba_lokali(int liczba_lokali) {
        this.liczba_lokali = liczba_lokali;
    }

    public int getRok_powstania() {
        return rok_powstania;
    }

    public void setRok_powstania(int rok_powstania) {
        this.rok_powstania = rok_powstania;
    }

    public int getWinda() {
        return winda;
    }

    public void setWinda(int winda) {
        this.winda = winda;
    }

    public int getLiczba_klatek() {
        return liczba_klatek;
    }

    public void setLiczba_klatek(int liczba_klatek) {
        this.liczba_klatek = liczba_klatek;
    }

    public int getSpoldzielnia_mieszkaniowa_id() {
        return spoldzielnia_mieszkaniowa_id;
    }

    public void setSpoldzielnia_mieszkaniowa_id(int spoldzielnia_mieszkaniowa_id) {
        this.spoldzielnia_mieszkaniowa_id = spoldzielnia_mieszkaniowa_id;
    }

    public int getAdres_id() {
        return adres_id;
    }

    public void setAdres_id(int adres_id) {
        this.adres_id = adres_id;
    }

    @Override
    public String toString() {
        return "Bloki[" +
                "blok_id=" + blok_id +
                ", liczba_pieter=" + liczba_pieter +
                ", liczba_lokali=" + liczba_lokali +
                ", rok_powstania=" + rok_powstania +
                ", winda=" + winda +
                ", liczba_klatek=" + liczba_klatek +
                ", spoldzielnia_mieszkaniowa_id=" + spoldzielnia_mieszkaniowa_id +
                ", adres_id=" + adres_id +
                ']';
    }
}
