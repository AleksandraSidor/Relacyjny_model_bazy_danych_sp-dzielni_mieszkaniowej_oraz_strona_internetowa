
CREATE SEQUENCE Firmy_uslugowe_Seq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Adresy_Seq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Zarzady_spoldzielni_Seq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Pracownicy_Seq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Wynagrodzenia_Seq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Bloki_Seq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Mieszkania_Seq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Osoby_Seq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Oplaty_Seq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Media_Seq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Spoldzielnie_mieszkaniowe_Seq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

-- Create tables section -------------------------------------------------

-- Table Spoldzielnie_mieszkaniowe

CREATE TABLE Spoldzielnie_mieszkaniowe(
  Spoldzielnia_mieszkaniowa_ID Integer NOT NULL,
  Nazwa Varchar2(50 ) NOT NULL,
  Numer_telefonu Varchar2(12 ) NOT NULL,
  Email Varchar2(40 ) NOT NULL,
  Strona_internetowa Varchar2(40 ),
  Data_zalozenia Date NOT NULL,
  Adres_ID Integer NOT NULL
)
/

-- Create indexes for table Spoldzielnie_mieszkaniowe

CREATE INDEX IX_Ma_siedzibe_pod_adresem ON Spoldzielnie_mieszkaniowe (Adres_ID)
/

-- Add keys for table Spoldzielnie_mieszkaniowe

ALTER TABLE Spoldzielnie_mieszkaniowe ADD CONSTRAINT Spoldzielnia_mieszkaniowa_PK PRIMARY KEY (Spoldzielnia_mieszkaniowa_ID)
/

-- Table Zarzady_spoldzielni

CREATE TABLE Zarzady_spoldzielni(
  Zarzad_spoldzielni_ID Integer NOT NULL,
  Data_zawiazania Date NOT NULL,
  Data_rozwiazania Date,
  Spoldzielnia_mieszkaniowa_ID Integer NOT NULL,
  CONSTRAINT Data_rozwiazania_C CHECK (Data_rozwiazania > Data_zawiazania)
)
/

-- Create indexes for table Zarzady_spoldzielni

CREATE INDEX IX_Jest_zarzadzana_przez ON Zarzady_spoldzielni (Spoldzielnia_mieszkaniowa_ID)
/

-- Add keys for table Zarzady_spoldzielni

ALTER TABLE Zarzady_spoldzielni ADD CONSTRAINT Zarzad_spoldzielni_PK PRIMARY KEY (Zarzad_spoldzielni_ID)
/

-- Table Bloki

CREATE TABLE Bloki(
  Blok_ID Integer NOT NULL,
  Liczba_pieter Integer NOT NULL
        CONSTRAINT ValidValuesLiczba_pieter CHECK ((Liczba_pieter >= 1)),
  Liczba_lokali Integer NOT NULL,
  Rok_powstania Integer NOT NULL,
  Winda Integer NOT NULL
        CONSTRAINT Winda_C CHECK ((Winda >= 0)),
  Liczba_klatek Integer,
  Spoldzielnia_mieszkaniowa_ID Integer NOT NULL,
  Adres_ID Integer NOT NULL
)
/

-- Create indexes for table Bloki

CREATE INDEX IX_Administruje ON Bloki (Spoldzielnia_mieszkaniowa_ID)
/

CREATE INDEX IX_Znajduje_sie_pod_adresem ON Bloki (Adres_ID)
/

-- Add keys for table Bloki

ALTER TABLE Bloki ADD CONSTRAINT Blok_PK PRIMARY KEY (Blok_ID)
/

-- Table Mieszkania

CREATE TABLE Mieszkania(
  Mieszkanie_ID Integer NOT NULL,
  Numer_lokalu Varchar2(4 ) NOT NULL,
  Pietro Integer NOT NULL,
  Klatka Integer NOT NULL
        CONSTRAINT Klatka_C CHECK ((Klatka >= 1)),
  Powierzchnia Number(6,2) NOT NULL
        CONSTRAINT Powierzchnia_C CHECK ((Powierzchnia > 0)),
  Liczba_pomieszczen Integer NOT NULL
        CONSTRAINT Liczba_pomieszczen_C CHECK ((Liczba_pomieszczen > 0)),
  Liczba_lazienek Integer
        CONSTRAINT Liczba_lazienek_C CHECK ((Liczba_lazienek >= 0)),
  Liczba_balkonow Integer
        CONSTRAINT Liczba_balkonow_C CHECK ((Liczba_balkonow >= 0)),
  Opis Varchar2(400 ),
  Blok_ID Integer NOT NULL
)
/

-- Create indexes for table Mieszkania

CREATE INDEX IX_Posiada ON Mieszkania (Blok_ID)
/

-- Add keys for table Mieszkania

ALTER TABLE Mieszkania ADD CONSTRAINT Lokal_PK PRIMARY KEY (Mieszkanie_ID)
/

-- Table Pracownicy

CREATE TABLE Pracownicy(
  Pracownik_ID Integer NOT NULL,
  Imie Varchar2(20 ) NOT NULL,
  Drugie_imie Varchar2(20 ),
  Nazwisko Varchar2(30 ) NOT NULL,
  PESEL Char(11 )
        CONSTRAINT PESEL_Pracownicy_C CHECK (PESEL NOT LIKE '%[^0-9]%'),
  Data_urodzenia Date NOT NULL,
  Numer_telefonu Varchar2(12 ) NOT NULL,
  Plec Char(1 ) NOT NULL
        CONSTRAINT Plec_pracownika_C CHECK (Plec IN ('K', 'M')),
  Numer_konta Char(24 ),
  Data_zatrudnienia Date NOT NULL,
  Data_zwolnienia Date,
  Spoldzielnia_mieszkaniowa_ID Integer NOT NULL,
  Adres_ID Integer NOT NULL,
  CONSTRAINT Data_zwolnienia_C CHECK ((Data_zwolnienia > Data_zatrudnienia))
)
/

-- Create indexes for table Pracownicy

CREATE INDEX IX_Zatrudnia ON Pracownicy (Spoldzielnia_mieszkaniowa_ID)
/

CREATE INDEX IX_Posiada_adres ON Pracownicy (Adres_ID)
/

-- Add keys for table Pracownicy

ALTER TABLE Pracownicy ADD CONSTRAINT Pracownik_PK PRIMARY KEY (Pracownik_ID)
/

-- Table Pracownicy_biurowi

CREATE TABLE Pracownicy_biurowi(
  Pracownik_ID Integer NOT NULL,
  Email_sluzbowy Varchar2(40 ) NOT NULL,
  Rodzaj_pracownika_biurowego Varchar2(20 ) NOT NULL
        CONSTRAINT Rodzaj_pracownika_biurowego_C CHECK (Rodzaj_pracownika_biurowego IN ('sekretarka', 'ksiegowy', 'dyrektor', 'prezes')),
  Numer_biurka Varchar2(4 )
)
/

-- Add keys for table Pracownicy_biurowi

ALTER TABLE Pracownicy_biurowi ADD CONSTRAINT Pracownik_biurowy_PK PRIMARY KEY (Pracownik_ID)
/

-- Table Pracownicy_terenowi

CREATE TABLE Pracownicy_terenowi(
  Pracownik_ID Integer NOT NULL,
  Rodzaj_pracownika_terenowego Varchar2(20 ) NOT NULL
        CONSTRAINT Rodzaj_pracownika_terenowego_C CHECK (Rodzaj_pracownika_terenowego IN ('dozorca', 'sprzataczka', 'hydraulik', 'elektryk')),
  Czy_praca_zmianowa Char(1 ) NOT NULL
        CONSTRAINT Czy_praca_zmianowa_C CHECK (Czy_praca_zmianowa IN ('T', 'N'))
)
/

-- Add keys for table Pracownicy_terenowi

ALTER TABLE Pracownicy_terenowi ADD CONSTRAINT Pracownik_terenowy_PK PRIMARY KEY (Pracownik_ID)
/

-- Table Firmy_uslugowe

CREATE TABLE Firmy_uslugowe(
  Firma_uslugowa_ID Integer NOT NULL,
  Nazwa Varchar2(30 ) NOT NULL,
  Rodzaj_uslugi Varchar2(40 ) NOT NULL,
  NIP Char(10 ) NOT NULL
        CONSTRAINT NIP_C CHECK (NIP NOT LIKE '%[^0-9]%'),
  Numer_telefonu Varchar2(12 ) NOT NULL,
  Email Varchar2(40 ) NOT NULL,
  Strona_internetowa Varchar2(40 ),
  Adres_ID Integer NOT NULL,
  Spoldzielnia_mieszkaniowa_ID Integer NOT NULL
)
/

-- Create indexes for table Firmy_uslugowe

CREATE INDEX IX_Zleca_wykonanie_uslugi ON Firmy_uslugowe (Spoldzielnia_mieszkaniowa_ID)
/

CREATE INDEX IX_Jest_pod_adresem ON Firmy_uslugowe (Adres_ID)
/

-- Add keys for table Firmy_uslugowe

ALTER TABLE Firmy_uslugowe ADD CONSTRAINT Firma_uslugowa_PK PRIMARY KEY (Firma_uslugowa_ID)
/

ALTER TABLE Firmy_uslugowe ADD CONSTRAINT NIP UNIQUE (NIP)
/

-- Table Czlonkowie_zarzadu

CREATE TABLE Czlonkowie_zarzadu(
  Zarzad_spoldzielni_ID Integer NOT NULL,
  Pracownik_ID Integer NOT NULL
)
/

-- Table Nadzory_blokow

CREATE TABLE Nadzory_blokow(
  Blok_ID Integer NOT NULL,
  Pracownik_ID Integer NOT NULL
)
/

-- Table Adresy

CREATE TABLE Adresy(
  Adres_ID Integer NOT NULL,
  Ulica Varchar2(56 ) NOT NULL,
  Numer_domu Varchar2(5 ) NOT NULL,
  Numer_lokalu Varchar2(5 ),
  Miasto Varchar2(30 ) NOT NULL,
  Kod_pocztowy Varchar2(6 ) NOT NULL
)
/

-- Add keys for table Adresy

ALTER TABLE Adresy ADD CONSTRAINT PK_Adresy PRIMARY KEY (Adres_ID)
/

-- Table and Columns comments section

COMMENT ON COLUMN Adresy.Adres_ID IS 'Unikatowy identyfikator adresu.'
/
COMMENT ON COLUMN Adresy.Ulica IS 'Nazwa ulicy.'
/
COMMENT ON COLUMN Adresy.Numer_domu IS 'Numer domu.'
/
COMMENT ON COLUMN Adresy.Numer_lokalu IS 'Numer lokalu.'
/
COMMENT ON COLUMN Adresy.Miasto IS 'Nazwa miejscowości.'
/
COMMENT ON COLUMN Adresy.Kod_pocztowy IS 'Kod pocztowy.'
/

-- Table Osoby

CREATE TABLE Osoby(
  Osoba_ID Integer NOT NULL,
  Imie Varchar2(20 ) NOT NULL,
  Drugie_imie Varchar2(20 ),
  Nazwisko Varchar2(30 ) NOT NULL,
  PESEL Char(11 )
        CONSTRAINT PESEL_Osoby_C CHECK (PESEL NOT LIKE '%[^0-9]%'),
  Data_urodzenia Date NOT NULL,
  Numer_telefonu Varchar2(12 ),
  Plec Char(1 ) NOT NULL
        CONSTRAINT Osoba_plec_C CHECK (Plec IN ('K', 'M'))
        CONSTRAINT Plec_C CHECK (Plec IN ('K', 'M'))
)
/

-- Add keys for table Osoby

ALTER TABLE Osoby ADD CONSTRAINT PK_Osoby PRIMARY KEY (Osoba_ID)
/

-- Table and Columns comments section

COMMENT ON TABLE Osoby IS 'Encja reprezentująca osobę. Zawiera podstawowe dane personalne konkretnej osoby.'
/

-- Table Uslugi

CREATE TABLE Uslugi(
  Cena_uslugi Number(7,2) NOT NULL,
  Data_zawarcia_umowy Date NOT NULL,
  Data_rozwiazania_umowy Date,
  Firma_uslugowa_ID Integer NOT NULL,
  Blok_ID Integer NOT NULL,
  CONSTRAINT Data_rozwiazania_umowy_C CHECK ((Data_rozwiazania_umowy > Data_zawarcia_umowy))
)
/

-- Add keys for table Uslugi

ALTER TABLE Uslugi ADD CONSTRAINT PK_Uslugi PRIMARY KEY (Firma_uslugowa_ID,Blok_ID)
/

-- Table Media

CREATE TABLE Media(
  Medium_ID Integer NOT NULL,
  Nazwa Varchar2(15 ) NOT NULL,
  Cena_za_jednostke Number(6,2) NOT NULL
)
/

-- Add keys for table Media

ALTER TABLE Media ADD CONSTRAINT PK_Media PRIMARY KEY (Medium_ID)
/

-- Table and Columns comments section

COMMENT ON COLUMN Media.Medium_ID IS 'Unikatowy klucz identyfikujący medium.'
/
COMMENT ON COLUMN Media.Nazwa IS 'Nazwa danego medium (np. woda, gaz, prąd, ogrzewanie).'
/
COMMENT ON COLUMN Media.Cena_za_jednostke IS 'Cena za jednostkę danego medium (np. za litr, za kilowatogodzinę itp).'
/

-- Table Czynsze

CREATE TABLE Czynsze(
  Oplaty_ID Integer NOT NULL,
  Wysokosc_czynszu Number(7,2) NOT NULL,
  Oplata_dodatkowa Number(7,2),
  Mieszkanie_ID Integer NOT NULL
)
/

-- Create indexes for table Czynsze

CREATE INDEX IX_Ma_czynsz ON Czynsze (Mieszkanie_ID)
/

-- Add keys for table Czynsze

ALTER TABLE Czynsze ADD CONSTRAINT PK_Czynsze PRIMARY KEY (Oplaty_ID)
/

-- Table and Columns comments section

COMMENT ON COLUMN Czynsze.Wysokosc_czynszu IS 'Wysokość czynszu.'
/

-- Table Wlasciciele

CREATE TABLE Wlasciciele(
  Osoba_id Integer NOT NULL,
  Mieszkanie_ID Integer NOT NULL,
  Data_nabycia_mieszkania Date NOT NULL,
  Data_zbycia_mieszkania Date,
  Adres_ID Integer,
  CONSTRAINT Data_zbycia_mieszkania_C CHECK (Data_zbycia_mieszkania > Data_nabycia_mieszkania)
)
/

-- Create indexes for table Wlasciciele

CREATE INDEX IX_Ma_adres ON Wlasciciele (Adres_ID)
/

-- Add keys for table Wlasciciele

ALTER TABLE Wlasciciele ADD CONSTRAINT PK_Wlasciciele PRIMARY KEY (Osoba_id,Mieszkanie_ID)
/

-- Table Oplaty

CREATE TABLE Oplaty(
  Oplaty_ID Integer NOT NULL,
  Data_wystawienia_rachunku Date NOT NULL,
  Nr_rachunku Integer NOT NULL,
  Za_okres_od Date NOT NULL,
  Za_okres_do Date NOT NULL,
  Czy_oplacony Char(1 ) NOT NULL
        CONSTRAINT Czy_oplacony_C CHECK (Czy_oplacony IN ('T', 'N')),
  Mieszkanie_ID Integer NOT NULL,
  CONSTRAINT Za_okres_do_C CHECK ((Za_okres_do > Za_okres_od))
)
/

-- Create indexes for table Oplaty

CREATE INDEX IX_Ma_oplaty ON Oplaty (Mieszkanie_ID)
/

-- Add keys for table Oplaty

ALTER TABLE Oplaty ADD CONSTRAINT PK_Oplaty PRIMARY KEY (Oplaty_ID)
/

ALTER TABLE Oplaty ADD CONSTRAINT Nr_rachunku UNIQUE (Nr_rachunku)
/

-- Table Mieszkancy

CREATE TABLE Mieszkancy(
  Osoba_id Integer NOT NULL,
  Mieszkanie_ID Integer NOT NULL,
  Data_zamieszkania Date NOT NULL,
  Data_wyprowadzki Date,
  CONSTRAINT Data_wyprowadzki_C CHECK (Data_wyprowadzki > Data_zamieszkania)
)
/

-- Add keys for table Mieszkancy

ALTER TABLE Mieszkancy ADD CONSTRAINT PK_Mieszkancy PRIMARY KEY (Osoba_id,Mieszkanie_ID)
/

-- Table Zuzycia

CREATE TABLE Zuzycia(
  Medium_ID Integer NOT NULL,
  Oplaty_ID Integer NOT NULL,
  Ilosc_zuzycia Number(10,2) NOT NULL,
  Mieszkanie_ID Integer NOT NULL
)
/

-- Create indexes for table Zuzycia

CREATE INDEX IX_Generuje_zuzycia ON Zuzycia (Mieszkanie_ID)
/

-- Add keys for table Zuzycia

ALTER TABLE Zuzycia ADD CONSTRAINT PK_Zuzycia PRIMARY KEY (Medium_ID,Oplaty_ID)
/

-- Table Wynagrodzenia

CREATE TABLE Wynagrodzenia(
  Wynagrodzenie_ID Integer NOT NULL,
  Data_wyplaty Date NOT NULL,
  Za_miesiac Varchar2(2 ) NOT NULL,
  Wysokosc_wynagrodzenia Number(7,2) NOT NULL,
  Dodatek_do_wynagrodzenia Number(7,2),
  Pracownik_ID Integer NOT NULL
)
/

-- Create indexes for table Wynagrodzenia

CREATE INDEX IX_Ma_wynagrodzenie ON Wynagrodzenia (Pracownik_ID)
/

-- Add keys for table Wynagrodzenia

ALTER TABLE Wynagrodzenia ADD CONSTRAINT PK_Wynagrodzenia PRIMARY KEY (Wynagrodzenie_ID)
/

-- Trigger for sequence Spoldzielnie_mieszkaniowe_Seq for column Spoldzielnia_mieszkaniowa_ID in table Spoldzielnie_mieszkaniowe ---------
CREATE OR REPLACE TRIGGER ts_Spoldzielnie_mieszkaniowe_Spoldzielnie_mieszkaniowe_Seq BEFORE INSERT
ON Spoldzielnie_mieszkaniowe FOR EACH ROW
BEGIN
  :new.Spoldzielnia_mieszkaniowa_ID := Spoldzielnie_mieszkaniowe_Seq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Spoldzielnie_mieszkaniowe_Spoldzielnie_mieszkaniowe_Seq AFTER UPDATE OF Spoldzielnia_mieszkaniowa_ID
ON Spoldzielnie_mieszkaniowe FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Spoldzielnia_mieszkaniowa_ID in table Spoldzielnie_mieszkaniowe as it uses sequence.');
END;
/

-- Trigger for sequence Zarzady_spoldzielni_Seq for column Zarzad_spoldzielni_ID in table Zarzady_spoldzielni ---------
CREATE OR REPLACE TRIGGER ts_Zarzady_spoldzielni_Zarzady_spoldzielni_Seq BEFORE INSERT
ON Zarzady_spoldzielni FOR EACH ROW
BEGIN
  :new.Zarzad_spoldzielni_ID := Zarzady_spoldzielni_Seq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Zarzady_spoldzielni_Zarzady_spoldzielni_Seq AFTER UPDATE OF Zarzad_spoldzielni_ID
ON Zarzady_spoldzielni FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Zarzad_spoldzielni_ID in table Zarzady_spoldzielni as it uses sequence.');
END;
/

-- Trigger for sequence Bloki_Seq for column Blok_ID in table Bloki ---------
CREATE OR REPLACE TRIGGER ts_Bloki_Bloki_Seq BEFORE INSERT
ON Bloki FOR EACH ROW
BEGIN
  :new.Blok_ID := Bloki_Seq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Bloki_Bloki_Seq AFTER UPDATE OF Blok_ID
ON Bloki FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Blok_ID in table Bloki as it uses sequence.');
END;
/

-- Trigger for sequence Mieszkania_Seq for column Mieszkanie_ID in table Mieszkania ---------
CREATE OR REPLACE TRIGGER ts_Mieszkania_Mieszkania_Seq BEFORE INSERT
ON Mieszkania FOR EACH ROW
BEGIN
  :new.Mieszkanie_ID := Mieszkania_Seq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Mieszkania_Mieszkania_Seq AFTER UPDATE OF Mieszkanie_ID
ON Mieszkania FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Mieszkanie_ID in table Mieszkania as it uses sequence.');
END;
/

-- Trigger for sequence Pracownicy_Seq for column Pracownik_ID in table Pracownicy ---------
CREATE OR REPLACE TRIGGER ts_Pracownicy_Pracownicy_Seq BEFORE INSERT
ON Pracownicy FOR EACH ROW
BEGIN
  :new.Pracownik_ID := Pracownicy_Seq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Pracownicy_Pracownicy_Seq AFTER UPDATE OF Pracownik_ID
ON Pracownicy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Pracownik_ID in table Pracownicy as it uses sequence.');
END;
/

-- Trigger for sequence Firmy_uslugowe_Seq for column Firma_uslugowa_ID in table Firmy_uslugowe ---------
CREATE OR REPLACE TRIGGER ts_Firmy_uslugowe_Firmy_uslugowe_Seq BEFORE INSERT
ON Firmy_uslugowe FOR EACH ROW
BEGIN
  :new.Firma_uslugowa_ID := Firmy_uslugowe_Seq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Firmy_uslugowe_Firmy_uslugowe_Seq AFTER UPDATE OF Firma_uslugowa_ID
ON Firmy_uslugowe FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Firma_uslugowa_ID in table Firmy_uslugowe as it uses sequence.');
END;
/

-- Trigger for sequence Adresy_Seq for column Adres_ID in table Adresy ---------
CREATE OR REPLACE TRIGGER ts_Adresy_Adresy_Seq BEFORE INSERT
ON Adresy FOR EACH ROW
BEGIN
  :new.Adres_ID := Adresy_Seq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Adresy_Adresy_Seq AFTER UPDATE OF Adres_ID
ON Adresy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Adres_ID in table Adresy as it uses sequence.');
END;
/

-- Trigger for sequence Osoby_Seq for column Osoba_ID in table Osoby ---------
CREATE OR REPLACE TRIGGER ts_Osoby_Osoby_Seq BEFORE INSERT
ON Osoby FOR EACH ROW
BEGIN
  :new.Osoba_ID := Osoby_Seq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Osoby_Osoby_Seq AFTER UPDATE OF Osoba_ID
ON Osoby FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Osoba_ID in table Osoby as it uses sequence.');
END;
/

-- Trigger for sequence Media_Seq for column Medium_ID in table Media ---------
CREATE OR REPLACE TRIGGER ts_Media_Media_Seq BEFORE INSERT
ON Media FOR EACH ROW
BEGIN
  :new.Medium_ID := Media_Seq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Media_Media_Seq AFTER UPDATE OF Medium_ID
ON Media FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Medium_ID in table Media as it uses sequence.');
END;
/

-- Trigger for sequence Oplaty_Seq for column Oplaty_ID in table Oplaty ---------
CREATE OR REPLACE TRIGGER ts_Oplaty_Oplaty_Seq BEFORE INSERT
ON Oplaty FOR EACH ROW
BEGIN
  :new.Oplaty_ID := Oplaty_Seq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Oplaty_Oplaty_Seq AFTER UPDATE OF Oplaty_ID
ON Oplaty FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Oplaty_ID in table Oplaty as it uses sequence.');
END;
/

-- Trigger for sequence Wynagrodzenia_Seq for column Wynagrodzenie_ID in table Wynagrodzenia ---------
CREATE OR REPLACE TRIGGER ts_Wynagrodzenia_Wynagrodzenia_Seq BEFORE INSERT
ON Wynagrodzenia FOR EACH ROW
BEGIN
  :new.Wynagrodzenie_ID := Wynagrodzenia_Seq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Wynagrodzenia_Wynagrodzenia_Seq AFTER UPDATE OF Wynagrodzenie_ID
ON Wynagrodzenia FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Wynagrodzenie_ID in table Wynagrodzenia as it uses sequence.');
END;
/


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE Zarzady_spoldzielni ADD CONSTRAINT Jest_zarzadzana_przez FOREIGN KEY (Spoldzielnia_mieszkaniowa_ID) REFERENCES Spoldzielnie_mieszkaniowe (Spoldzielnia_mieszkaniowa_ID) ON DELETE CASCADE
/



ALTER TABLE Bloki ADD CONSTRAINT Administruje FOREIGN KEY (Spoldzielnia_mieszkaniowa_ID) REFERENCES Spoldzielnie_mieszkaniowe (Spoldzielnia_mieszkaniowa_ID) ON DELETE CASCADE
/



ALTER TABLE Mieszkania ADD CONSTRAINT Posiada FOREIGN KEY (Blok_ID) REFERENCES Bloki (Blok_ID) ON DELETE CASCADE
/



ALTER TABLE Bloki ADD CONSTRAINT Znajduje_sie_pod_adresem FOREIGN KEY (Adres_ID) REFERENCES Adresy (Adres_ID) ON DELETE CASCADE
/



ALTER TABLE Firmy_uslugowe ADD CONSTRAINT Zleca_wykonanie_uslugi FOREIGN KEY (Spoldzielnia_mieszkaniowa_ID) REFERENCES Spoldzielnie_mieszkaniowe (Spoldzielnia_mieszkaniowa_ID) ON DELETE CASCADE
/



ALTER TABLE Uslugi ADD CONSTRAINT Firma_wykonuje_uslugi FOREIGN KEY (Firma_uslugowa_ID) REFERENCES Firmy_uslugowe (Firma_uslugowa_ID) ON DELETE CASCADE
/



ALTER TABLE Uslugi ADD CONSTRAINT Usluga_jest_wykonywana_w_bloku FOREIGN KEY (Blok_ID) REFERENCES Bloki (Blok_ID) ON DELETE CASCADE
/



ALTER TABLE Zuzycia ADD CONSTRAINT Medium_jest_zuzywane FOREIGN KEY (Medium_ID) REFERENCES Media (Medium_ID) ON DELETE CASCADE
/



ALTER TABLE Mieszkancy ADD CONSTRAINT Jest_mieszkancem FOREIGN KEY (Osoba_id) REFERENCES Osoby (Osoba_ID) ON DELETE CASCADE
/



ALTER TABLE Wlasciciele ADD CONSTRAINT Jest_wlascicielem FOREIGN KEY (Osoba_id) REFERENCES Osoby (Osoba_ID) ON DELETE CASCADE
/



ALTER TABLE Oplaty ADD CONSTRAINT Ma_oplaty FOREIGN KEY (Mieszkanie_ID) REFERENCES Mieszkania (Mieszkanie_ID) ON DELETE CASCADE
/



ALTER TABLE Czynsze ADD CONSTRAINT Oplaty_za_czynsz FOREIGN KEY (Oplaty_ID) REFERENCES Oplaty (Oplaty_ID) ON DELETE CASCADE
/



ALTER TABLE Zuzycia ADD CONSTRAINT Generuje_zuzycia FOREIGN KEY (Mieszkanie_ID) REFERENCES Mieszkania (Mieszkanie_ID) ON DELETE CASCADE
/



ALTER TABLE Zuzycia ADD CONSTRAINT Oplaty_za_zuzycie FOREIGN KEY (Oplaty_ID) REFERENCES Oplaty (Oplaty_ID) ON DELETE CASCADE
/



ALTER TABLE Pracownicy ADD CONSTRAINT Zatrudnia FOREIGN KEY (Spoldzielnia_mieszkaniowa_ID) REFERENCES Spoldzielnie_mieszkaniowe (Spoldzielnia_mieszkaniowa_ID) ON DELETE CASCADE
/



ALTER TABLE Wlasciciele ADD CONSTRAINT Ma_adres FOREIGN KEY (Adres_ID) REFERENCES Adresy (Adres_ID) ON DELETE CASCADE
/



ALTER TABLE Spoldzielnie_mieszkaniowe ADD CONSTRAINT Ma_siedzibe_pod_adresem FOREIGN KEY (Adres_ID) REFERENCES Adresy (Adres_ID) ON DELETE CASCADE
/



ALTER TABLE Firmy_uslugowe ADD CONSTRAINT Jest_pod_adresem FOREIGN KEY (Adres_ID) REFERENCES Adresy (Adres_ID) ON DELETE CASCADE
/



ALTER TABLE Pracownicy ADD CONSTRAINT Posiada_adres FOREIGN KEY (Adres_ID) REFERENCES Adresy (Adres_ID) ON DELETE CASCADE
/



ALTER TABLE Wynagrodzenia ADD CONSTRAINT Ma_wynagrodzenie FOREIGN KEY (Pracownik_ID) REFERENCES Pracownicy (Pracownik_ID) ON DELETE CASCADE
/



ALTER TABLE Wlasciciele ADD CONSTRAINT Ma_wlascicieli FOREIGN KEY (Mieszkanie_ID) REFERENCES Mieszkania (Mieszkanie_ID) ON DELETE CASCADE
/



ALTER TABLE Mieszkancy ADD CONSTRAINT Ma_mieszkancow FOREIGN KEY (Mieszkanie_ID) REFERENCES Mieszkania (Mieszkanie_ID) ON DELETE CASCADE
/



ALTER TABLE Czynsze ADD CONSTRAINT Ma_czynsz FOREIGN KEY (Mieszkanie_ID) REFERENCES Mieszkania (Mieszkanie_ID) ON DELETE CASCADE
/





