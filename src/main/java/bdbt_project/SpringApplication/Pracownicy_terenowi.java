package bdbt_project.SpringApplication;

public class Pracownicy_terenowi {

    private int pracownik_id;
    private String imie;
    private String drugie_imie;
    private String nazwisko;
    private String pesel;
    private String data_urodzenia;
    private int numer_telefonu;
    private char plec;
    private String numer_konta;
    private String data_zatrudnienia;
    private String data_zwolnienia;
    private String rodzaj_pracownika_terenowego;
    private String ulica;
    private String numer_domu;
    private String numer_lokalu;
    private String miasto;
    private String kod_pocztowy;


    public Pracownicy_terenowi() {
    }

    public Pracownicy_terenowi(int pracownik_id, String imie, String drugie_imie, String nazwisko, String pesel, String data_urodzenia, int numer_telefonu, char plec, String numer_konta, String data_zatrudnienia, String data_zwolnienia, String rodzaj_pracownika_terenowego, String ulica, String numer_domu, String numer_lokalu, String miasto, String kod_pocztowy) {
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
        this.rodzaj_pracownika_terenowego = rodzaj_pracownika_terenowego;
        this.ulica = ulica;
        this.numer_domu = numer_domu;
        this.numer_lokalu = numer_lokalu;
        this.miasto = miasto;
        this.kod_pocztowy = kod_pocztowy;
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

    public String getData_urodzenia() {
        return data_urodzenia;
    }

    public void setData_urodzenia(String data_urodzenia) {
        this.data_urodzenia = data_urodzenia;
    }

    public int getNumer_telefonu() {
        return numer_telefonu;
    }

    public void setNumer_telefonu(int numer_telefonu) {
        this.numer_telefonu = numer_telefonu;
    }

    public char getPlec() {
        return plec;
    }

    public void setPlec(char plec) {
        this.plec = plec;
    }

    public String getNumer_konta() {
        return numer_konta;
    }

    public void setNumer_konta(String numer_konta) {
        this.numer_konta = numer_konta;
    }

    public String getData_zatrudnienia() {
        return data_zatrudnienia;
    }

    public void setData_zatrudnienia(String data_zatrudnienia) {
        this.data_zatrudnienia = data_zatrudnienia;
    }

    public String getData_zwolnienia() {
        return data_zwolnienia;
    }

    public void setData_zwolnienia(String data_zwolnienia) {
        this.data_zwolnienia = data_zwolnienia;
    }

    public String getRodzaj_pracownika_terenowego() {
        return rodzaj_pracownika_terenowego;
    }

    public void setRodzaj_pracownika_terenowego(String rodzaj_pracownika_terenowego) {
        this.rodzaj_pracownika_terenowego = rodzaj_pracownika_terenowego;
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

    @Override
    public String toString() {
        return "Pracownicy_terenowi{" +
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
                ", rodzaj_pracownika_terenowego='" + rodzaj_pracownika_terenowego + '\'' +
                ", ulica='" + ulica + '\'' +
                ", numer_domu='" + numer_domu + '\'' +
                ", numer_lokalu='" + numer_lokalu + '\'' +
                ", miasto='" + miasto + '\'' +
                ", kod_pocztowy='" + kod_pocztowy + '\'' +
                '}';
    }
}
