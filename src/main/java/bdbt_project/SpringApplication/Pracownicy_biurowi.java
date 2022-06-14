package bdbt_project.SpringApplication;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


public class Pracownicy_biurowi {

    private int pracownik_id;
    private String imie;
    private String drugie_imie;
    private String nazwisko;
    private String pesel;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date data_urodzenia;
    private String numer_telefonu;
    private String plec;
    private String numer_konta;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date data_zatrudnienia;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date data_zwolnienia;
    private String ulica;
    private String numer_domu;
    private String numer_lokalu;
    private String miasto;
    private String kod_pocztowy;

    private int spoldzielnia_mieszkaniowa_id;

    private int adres_id;

    public Pracownicy_biurowi() {
    }

    public Pracownicy_biurowi(int pracownik_id, String imie, String drugie_imie, String nazwisko, String pesel,
                              Date data_urodzenia, String numer_telefonu, String plec, String numer_konta,
                              Date data_zatrudnienia, Date data_zwolnienia, String ulica, String numer_domu,
                              String numer_lokalu, String miasto, String kod_pocztowy, int spoldzielnia_mieszkaniowa_id,
                              int adres_id) {
        this.pracownik_id = pracownik_id;
        this.imie = imie;
        this.drugie_imie = drugie_imie;
        this.nazwisko = nazwisko;
        this.pesel = pesel;
        this.data_urodzenia = data_urodzenia;
        this.numer_telefonu = numer_telefonu;
        this.plec = plec;
        this.numer_konta = numer_konta;
        this.data_zatrudnienia = data_zatrudnienia;
        this.data_zwolnienia = data_zwolnienia;
        this.ulica = ulica;
        this.numer_domu = numer_domu;
        this.numer_lokalu = numer_lokalu;
        this.miasto = miasto;
        this.kod_pocztowy = kod_pocztowy;
        this.spoldzielnia_mieszkaniowa_id = spoldzielnia_mieszkaniowa_id;
        this.adres_id = adres_id;
    }

    public int getPracownik_id() {
        return pracownik_id;
    }

    public void setPracownik_id(int pracownik_id) {
        this.pracownik_id = pracownik_id;
    }

    public String getImie() {
        return imie;
    }

    public void setImie(String imie) {
        this.imie = imie;
    }

    public String getDrugie_imie() {
        return drugie_imie;
    }

    public void setDrugie_imie(String drugie_imie) {
        this.drugie_imie = drugie_imie;
    }

    public String getNazwisko() {
        return nazwisko;
    }

    public void setNazwisko(String nazwisko) {
        this.nazwisko = nazwisko;
    }

    public String getPesel() {
        return pesel;
    }

    public void setPesel(String pesel) {
        this.pesel = pesel;
    }

    public String getNumer_telefonu() {
        return numer_telefonu;
    }

    public void setNumer_telefonu(String numer_telefonu) {
        this.numer_telefonu = numer_telefonu;
    }

    public String getPlec() {
        return plec;
    }

    public void setPlec(String plec) {
        this.plec = plec;
    }

    public String getNumer_konta() {
        return numer_konta;
    }

    public void setNumer_konta(String numer_konta) {
        this.numer_konta = numer_konta;
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

    public Date getData_urodzenia() {
        return data_urodzenia;
    }

    public void setData_urodzenia(Date data_urodzenia) {
        this.data_urodzenia = data_urodzenia;
    }

    public Date getData_zatrudnienia() {
        return data_zatrudnienia;
    }

    public void setData_zatrudnienia(Date data_zatrudnienia) {
        this.data_zatrudnienia = data_zatrudnienia;
    }

    public Date getData_zwolnienia() {
        return data_zwolnienia;
    }

    public void setData_zwolnienia(Date data_zwolnienia) {
        this.data_zwolnienia = data_zwolnienia;
    }

    @Override
    public String toString() {
        return "Pracownicy_biurowi{" +
                "pracownik_id=" + pracownik_id +
                ", imie='" + imie + '\'' +
                ", drugie_imie='" + drugie_imie + '\'' +
                ", nazwisko='" + nazwisko + '\'' +
                ", pesel='" + pesel + '\'' +
                ", data_urodzenia='" + data_urodzenia + '\'' +
                ", numer_telefonu=" + numer_telefonu +
                ", plec=" + plec +
                ", numer_konta='" + numer_konta + '\'' +
                ", data_zatrudnienia='" + data_zatrudnienia + '\'' +
                ", data_zwolnienia='" + data_zwolnienia + '\'' +
                ", ulica='" + ulica + '\'' +
                ", numer_domu='" + numer_domu + '\'' +
                ", numer_lokalu='" + numer_lokalu + '\'' +
                ", miasto='" + miasto + '\'' +
                ", kod_pocztowy='" + kod_pocztowy + '\'' +
                ", spoldzielnia_mieszkaniowa_id=" + spoldzielnia_mieszkaniowa_id +
                ", adres_id=" + adres_id +
                '}';
    }
}
