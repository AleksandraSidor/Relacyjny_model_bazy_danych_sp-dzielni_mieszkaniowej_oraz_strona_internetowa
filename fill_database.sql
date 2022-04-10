-- Insert Adresy

INSERT INTO "BLACHOTRAPEZ"."Adresy" ("Ulica", "Numer_domu", "Miasto", "Kod_pocztowy") 
VALUES ('Jana Pawła II', '142', 'Wrocław', '09-823');

INSERT INTO "BLACHOTRAPEZ"."Adresy" ("Ulica", "Numer_domu", "Miasto", "Kod_pocztowy")
 VALUES ('Krakowska', '1A', 'Wrocław', '01-112');

INSERT INTO "BLACHOTRAPEZ"."Adresy" ("Ulica", "Numer_domu", "Miasto", "Kod_pocztowy") 
VALUES ('Krakowska', '1B', 'Wrocław', '01-112');

INSERT INTO "BLACHOTRAPEZ"."Adresy" ("Ulica", "Numer_domu", "Miasto", "Kod_pocztowy")
 VALUES ('Krakowska', '2', 'Wrocław', '01-112');

INSERT INTO "BLACHOTRAPEZ"."Adresy" ("Ulica", "Numer_domu", "Miasto", "Kod_pocztowy")
 VALUES ('Krakowska', '3', 'Wrocław', '01-112');

INSERT INTO "BLACHOTRAPEZ"."Adresy" ("Ulica", "Numer_domu", "Numer_lokalu", "Miasto", "Kod_pocztowy")
 VALUES ('Małego Pułku', '11A', '14', 'Wrocław', '02-213');
 
INSERT INTO "BLACHOTRAPEZ"."Adresy" ("Ulica", "Numer_domu", "Numer_lokalu", "Miasto", "Kod_pocztowy")
 VALUES ('Małego Pułku', '11A', '23', 'Wrocław', '02-213');

INSERT INTO "BLACHOTRAPEZ"."Adresy" ("Ulica", "Numer_domu", "Miasto", "Kod_pocztowy")
 VALUES ('Bohaterów', '10', 'Wrocław', '02-555');

INSERT INTO "BLACHOTRAPEZ"."Adresy" ("Ulica", "Numer_domu", "Miasto", "Kod_pocztowy")
 VALUES ('Fabryczna', '1', 'Bełchatów', '91-111');

INSERT INTO "BLACHOTRAPEZ"."Adresy" ("Ulica", "Numer_domu", "Miasto", "Kod_pocztowy")
 VALUES ('Szkolna', '18', 'Wrocław', '02-987');



-- Insert Spoldzielnie_mieszkaniowe

INSERT INTO "BLACHOTRAPEZ"."Spoldzielnie_mieszkaniowe" ("Nazwa", "Numer_telefonu", "Email", "Strona_internetowa", "Data_zalozenia", "Adres_ID")
 VALUES ('Spółdzielnia Mieszkaniowa Zacisze', '+48818582461', 'zacisze.spoldzielnia@gmail.com', 'www.spoldzielnia-zacisze.pl', 
 TO_DATE('2002-07-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1');

-- Insert Bloki

INSERT INTO "BLACHOTRAPEZ"."Bloki" ("Liczba_pieter", "Liczba_lokali", "Rok_powstania", "Winda", "Liczba_klatek", "Spoldzielnia_mieszkaniowa_ID", "Adres_ID")
 VALUES ('4', '72', '2011', '4', '4', '1', '2');
INSERT INTO "BLACHOTRAPEZ"."Bloki" ("Liczba_pieter", "Liczba_lokali", "Rok_powstania", "Winda", "Liczba_klatek", "Spoldzielnia_mieszkaniowa_ID", "Adres_ID")
 VALUES ('6', '96', '2011', '4', '4', '1', '3');
INSERT INTO "BLACHOTRAPEZ"."Bloki" ("Liczba_pieter", "Liczba_lokali", "Rok_powstania", "Winda", "Liczba_klatek", "Spoldzielnia_mieszkaniowa_ID", "Adres_ID")
 VALUES ('4', '70', '2012', '4', '4', '1', '4');
INSERT INTO "BLACHOTRAPEZ"."Bloki" ("Liczba_pieter", "Liczba_lokali", "Rok_powstania", "Winda", "Liczba_klatek", "Spoldzielnia_mieszkaniowa_ID", "Adres_ID")
 VALUES ('4', '51', '2012', '3', '3', '1', '5');


-- Insert Mieszkania

INSERT INTO "BLACHOTRAPEZ"."Mieszkania" ("Numer_lokalu", "Pietro", "Klatka", "Powierzchnia", "Liczba_pomieszczen",
 "Liczba_lazienek", "Liczba_balkonow", "Opis", "Blok_ID")
 VALUES ('44', '3', '2', '98,22', '5', '2', '2', 'Z widokiem na park.', '1');

INSERT INTO "BLACHOTRAPEZ"."Mieszkania" ("Numer_lokalu", "Pietro", "Klatka", "Powierzchnia", "Liczba_pomieszczen",
 "Liczba_lazienek", "Liczba_balkonow", "Blok_ID")
 VALUES ('45', '3', '2', '71,41', '4', '1', '1', '1');

 INSERT INTO "BLACHOTRAPEZ"."Mieszkania" ("Numer_lokalu", "Pietro", "Klatka", "Powierzchnia", "Liczba_pomieszczen",
 "Liczba_lazienek", "Liczba_balkonow", "Blok_ID")
 VALUES ('46A', '3', '2', '44,91', '2', '1', '1', '1');

 INSERT INTO "BLACHOTRAPEZ"."Mieszkania" ("Numer_lokalu", "Pietro", "Klatka", "Powierzchnia", "Liczba_pomieszczen",
 "Liczba_lazienek", "Liczba_balkonow", "Blok_ID")
 VALUES ('1A', '1', '1', '71,07', '3', '1', '2', '2');

 INSERT INTO "BLACHOTRAPEZ"."Mieszkania" ("Numer_lokalu", "Pietro", "Klatka", "Powierzchnia", "Liczba_pomieszczen",
 "Liczba_lazienek", "Liczba_balkonow", "Blok_ID")
 VALUES ('1B', '1', '1', '41,03', '2', '1', '1', '2');

  INSERT INTO "BLACHOTRAPEZ"."Mieszkania" ("Numer_lokalu", "Pietro", "Klatka", "Powierzchnia", "Liczba_pomieszczen",
 "Liczba_lazienek", "Liczba_balkonow", "Opis", "Blok_ID")
 VALUES ('69', '4', '4', '122,32', '6', '2', '1', 'Przestronne.', '3');

 -- Insert Osoby

INSERT INTO "BLACHOTRAPEZ"."Osoby" ("Imie", "Drugie_imie", "Nazwisko", PESEL, "Data_urodzenia", "Plec") 
 VALUES ('Monika', 'Żaneta', 'Grzyb', '8877223423', TO_DATE('2014-09-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'K');

INSERT INTO "BLACHOTRAPEZ"."Osoby" ("Imie", "Nazwisko", PESEL, "Data_urodzenia", "Numer_telefonu", "Plec") 
 VALUES ('Janusz', 'Mars', '91123145678', TO_DATE('1991-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '811514321', 'M');

INSERT INTO "BLACHOTRAPEZ"."Osoby" ("Imie", "Drugie_imie", "Nazwisko", "Data_urodzenia", "Numer_telefonu", "Plec") 
 VALUES ('Beata', 'Joanna', 'Kwaśna', TO_DATE('1971-11-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '41231234', 'K');

INSERT INTO "BLACHOTRAPEZ"."Osoby" ("Imie", "Nazwisko", PESEL, "Data_urodzenia", "Plec") 
 VALUES ('Michał', 'Przegięty', '70101102211', TO_DATE('1970-10-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'M');

INSERT INTO "BLACHOTRAPEZ"."Osoby" ("Imie", "Drugie_imie", "Nazwisko", "Data_urodzenia", "Numer_telefonu", "Plec") 
 VALUES ('Pierre', 'Emeric', 'Aubameyang', TO_DATE('1989-06-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '711654321', 'M');

INSERT INTO "BLACHOTRAPEZ"."Osoby" ("Imie", "Nazwisko", "Data_urodzenia", "Plec") 
 VALUES ('Britney', 'Spears', TO_DATE('1981-12-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'K');

 -- Insert Wlasciciele

 INSERT INTO "BLACHOTRAPEZ"."Wlascicele" ("Osoba_id", "Mieszkanie_ID", "Data_nabycia_mieszkania") VALUES ('2', '1', TO_DATE('2014-01-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

 INSERT INTO "BLACHOTRAPEZ"."Wlascicele" ("Osoba_id", "Mieszkanie_ID", "Data_nabycia_mieszkania") VALUES ('3', '2', TO_DATE('2016-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

 INSERT INTO "BLACHOTRAPEZ"."Wlascicele" ("Osoba_id", "Mieszkanie_ID", "Data_nabycia_mieszkania") VALUES ('4', '2', TO_DATE('2016-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

 INSERT INTO "BLACHOTRAPEZ"."Wlascicele" ("Osoba_id", "Mieszkanie_ID", "Data_nabycia_mieszkania") VALUES ('6', '6', TO_DATE('2016-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Insert Mieszkancy

INSERT INTO "BLACHOTRAPEZ"."Mieszkancy" ("Osoba_id", "Mieszkanie_ID", "Data_zamieszkania") VALUES ('1', '1', TO_DATE('2014-02-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO "BLACHOTRAPEZ"."Mieszkancy" ("Osoba_id", "Mieszkanie_ID", "Data_zamieszkania") VALUES ('2', '1', TO_DATE('2014-02-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO "BLACHOTRAPEZ"."Mieszkancy" ("Osoba_id", "Mieszkanie_ID", "Data_zamieszkania") VALUES ('3', '2', TO_DATE('2016-06-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO "BLACHOTRAPEZ"."Mieszkancy" ("Osoba_id", "Mieszkanie_ID", "Data_zamieszkania") VALUES ('4', '2', TO_DATE('2016-06-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO "BLACHOTRAPEZ"."Mieszkancy" ("Osoba_id", "Mieszkanie_ID", "Data_zamieszkania") VALUES ('5', '6', TO_DATE('2020-07-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO "BLACHOTRAPEZ"."Mieszkancy" ("Osoba_id", "Mieszkanie_ID", "Data_zamieszkania") VALUES ('6', '6', TO_DATE('2020-07-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Czynsze

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-03-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '0000123124512',
  '900,00', TO_DATE('2022-02-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'N', '1');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '123115123',
  '900,00', TO_DATE('2022-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '1');

  INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '123114181',
  '900,00', TO_DATE('2021-12-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '1');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-03-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '12356751123',
  '800,00', TO_DATE('2022-02-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '2');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '968534213',
  '800,00', TO_DATE('2022-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '2');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '8564534123',
  '800,00', TO_DATE('2021-12-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '2');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-03-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '2143264862',
  '1300,00', TO_DATE('2022-02-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'N', '6');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '9854342342',
  '1300,00', TO_DATE('2022-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '6');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '874634217',
  '1300,00', TO_DATE('2021-12-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '6');

-- Media Prad

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-03-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '8753462542',
  '210,00', TO_DATE('2022-02-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '1');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1243648',
  '189,83', TO_DATE('2022-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '1');

  INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '975864364235',
  '202,21', TO_DATE('2021-12-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '1');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-03-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '145264869',
  '170,52', TO_DATE('2022-02-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '2');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '9656342',
  '168,91', TO_DATE('2022-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '2');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '124263859680',
  '210,65', TO_DATE('2021-12-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '2');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-03-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '0978653424',
  '241,91', TO_DATE('2022-02-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '6');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1432466897',
  '191,56', TO_DATE('2022-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '6');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '9089854324',
  '240,11', TO_DATE('2021-12-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '6');

-- Media Gaz

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-03-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '87564632',
  '123,54', TO_DATE('2022-02-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '1');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '087965343',
  '131,21', TO_DATE('2022-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '1');

  INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1235286',
  '121,31', TO_DATE('2021-12-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '1');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-03-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '89653424',
  '170,12', TO_DATE('2022-02-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '2');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '245362458',
  '154,76', TO_DATE('2022-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '2');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '873625124',
  '112,12', TO_DATE('2021-12-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '2');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-03-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '24513247469',
  '151,21', TO_DATE('2022-02-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '6');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '6795463634',
  '180,12', TO_DATE('2022-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '6');

INSERT INTO "BLACHOTRAPEZ"."Oplaty" ("Data_wystawienia_rachunku", "Nr_rachunku", "Kwota_do_zaplaty", "Za_okres_od", "Za_okres_do", "Czy_oplacony", "Mieszkanie_ID")
 VALUES (TO_DATE('2022-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '845845656',
  '200,01', TO_DATE('2021-12-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'T', '6');

-- INSERT Pracownicy

INSERT INTO "BLACHOTRAPEZ"."Pracownicy" ("Imie", "Drugie_imie", "Nazwisko", PESEL, "Data_urodzenia", "Numer_telefonu", "Plec", "Numer_konta", "Data_zatrudnienia", "Spoldzielnia_mieszkaniowa_ID", "Adres_ID")
 VALUES ('Andrzej', 'Maria', 'Komar', '70121211223', TO_DATE('1970-12-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
  '543123123', 'M', '685676341148791569100405', TO_DATE('2014-08-01 22:59:53', 'YYYY-MM-DD HH24:MI:SS'), '1', '6');

INSERT INTO "BLACHOTRAPEZ"."Pracownicy" ("Imie", "Nazwisko", PESEL, "Data_urodzenia", "Numer_telefonu", "Plec", "Numer_konta", "Data_zatrudnienia", "Spoldzielnia_mieszkaniowa_ID", "Adres_ID")
 VALUES ('Marzena', 'Komar', '81121211223', TO_DATE('1981-12-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
  '987654321', 'K', '685676341148791569100405', TO_DATE('2018-10-01 22:59:53', 'YYYY-MM-DD HH24:MI:SS'), '1', '6');

INSERT INTO "BLACHOTRAPEZ"."Pracownicy" ("Imie", "Nazwisko", PESEL, "Data_urodzenia", "Numer_telefonu", "Plec", "Numer_konta", "Data_zatrudnienia", "Spoldzielnia_mieszkaniowa_ID", "Adres_ID")
 VALUES ('Agata', 'Bąk', '88010544112', TO_DATE('1988-01-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
  '421234456', 'K', '969362028491556308326614', TO_DATE('2014-01-01 22:59:53', 'YYYY-MM-DD HH24:MI:SS'), '1', '7');  

INSERT INTO "BLACHOTRAPEZ"."Pracownicy" ("Imie", "Nazwisko", PESEL, "Data_urodzenia", "Numer_telefonu", "Plec", "Numer_konta", "Data_zatrudnienia", "Spoldzielnia_mieszkaniowa_ID", "Adres_ID")
 VALUES ('Paweł', 'Krawczyk', '65040912345', TO_DATE('1965-04-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
  '900800700', 'M', '459015729155365510709658', TO_DATE('2005-01-01 22:59:53', 'YYYY-MM-DD HH24:MI:SS'), '1', '8');  

-- INSERT Wynagrodzenia

INSERT INTO "BLACHOTRAPEZ"."Wynagrodzenia" ("Data_wyplaty", "Za_miesiac", "Wysokosc_wynagrodzenia", "Pracownik_ID")
 VALUES (TO_DATE('2022-02-10 23:11:14', 'YYYY-MM-DD HH24:MI:SS'), '01', '5000', '1');

INSERT INTO "BLACHOTRAPEZ"."Wynagrodzenia" ("Data_wyplaty", "Za_miesiac", "Wysokosc_wynagrodzenia", "Dodatek_do_wynagrodzenia", "Pracownik_ID")
 VALUES (TO_DATE('2022-02-10 23:11:14', 'YYYY-MM-DD HH24:MI:SS'), '01', '7200', '600', '2');

INSERT INTO "BLACHOTRAPEZ"."Wynagrodzenia" ("Data_wyplaty", "Za_miesiac", "Wysokosc_wynagrodzenia", "Pracownik_ID")
 VALUES (TO_DATE('2022-02-10 23:11:14', 'YYYY-MM-DD HH24:MI:SS'), '01', '4500', '3');

INSERT INTO "BLACHOTRAPEZ"."Wynagrodzenia" ("Data_wyplaty", "Za_miesiac", "Wysokosc_wynagrodzenia", "Dodatek_do_wynagrodzenia", "Pracownik_ID")
 VALUES (TO_DATE('2022-02-10 23:11:14', 'YYYY-MM-DD HH24:MI:SS'), '01', '11000', '1500', '4');

-- INSERT Pracownicy_biurowi

INSERT INTO "BLACHOTRAPEZ"."Pracownicy_biurowi" ("Pracownik_ID", "Email_sluzbowy", "Rodzaj_pracownika_biurowego", "Numer_biurka")
 VALUES ('2', 'marzena.bak@spoldzielnia.pl', 'dyrektor', '4');

INSERT INTO "BLACHOTRAPEZ"."Pracownicy_biurowi" ("Pracownik_ID", "Email_sluzbowy", "Rodzaj_pracownika_biurowego", "Numer_biurka")
 VALUES ('4', 'pawel.krawczy@spoldzielnia.pl', 'prezes', '21');

 -- INSERT Pracownicy_terenowi

INSERT INTO "BLACHOTRAPEZ"."Pracownicy_terenowi" ("Pracownik_ID", "Rodzaj_pracownika_terenowego", "Czy_praca_zmianowa")
 VALUES ('1', 'dozorca', 'T');

INSERT INTO "BLACHOTRAPEZ"."Pracownicy_terenowi" ("Pracownik_ID", "Rodzaj_pracownika_terenowego", "Czy_praca_zmianowa")
 VALUES ('3', 'hydraulik', 'N');


-- INSERT Czlonkowie_zarzadu

INSERT INTO "BLACHOTRAPEZ"."Czlonkowie_zarzadu" ("Zarzad_spoldzielni_ID", "Pracownik_ID") VALUES ('1', '4');

-- INSERT Zarzady_spoldzielni

INSERT INTO "BLACHOTRAPEZ"."Zarzady_spoldzielni" ("Zarzad_spoldzielni_ID", "Data_zawiazania", "Spoldzielnia_mieszkaniowa_ID")
 VALUES ('1', TO_DATE('2005-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1');

-- INSERT Nadzory_blokow

INSERT INTO "BLACHOTRAPEZ"."Nadzory_blokow" ("Blok_ID", "Pracownik_ID") VALUES ('1', '3');

-- INSERT Firmy_uslugowe

INSERT INTO "BLACHOTRAPEZ"."Firmy_uslugowe" ("Nazwa", "Rodzaj_uslugi", NIP, "Numer_telefonu", "Email", "Strona_internetowa", "Spoldzielnia_mieszkaniowa_ID", "Adres_ID")
 VALUES ('Energol', 'Dostawca prądu', '3259002139', '654738291', 'kontakt@energol.pl', 'www.energol.pl', '1', '9');

INSERT INTO "BLACHOTRAPEZ"."Firmy_uslugowe" ("Nazwa", "Rodzaj_uslugi", NIP, "Numer_telefonu", "Email", "Spoldzielnia_mieszkaniowa_ID", "Adres_ID")
 VALUES ('Śmieciex', 'Wywóz śmieci', '1868219359', '420543123', 'wywoz@smieciex.com', '1', '10');

-- INSERT Uslugi

INSERT INTO "BLACHOTRAPEZ"."Uslugi" ("Cena_uslugi", "Data_zawarcia_umowy", "Data_rozwiazania_umowy", "Uslugi_zewnetrzne_ID", "Blok_ID")
 VALUES ('3000', TO_DATE('2022-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-31 23:46:02', 'YYYY-MM-DD HH24:MI:SS'), '2', '1');

INSERT INTO "BLACHOTRAPEZ"."Uslugi" ("Cena_uslugi", "Data_zawarcia_umowy", "Data_rozwiazania_umowy", "Uslugi_zewnetrzne_ID", "Blok_ID")
 VALUES ('3000', TO_DATE('2022-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '2', '2');

INSERT INTO "BLACHOTRAPEZ"."Uslugi" ("Cena_uslugi", "Data_zawarcia_umowy", "Data_rozwiazania_umowy", "Uslugi_zewnetrzne_ID", "Blok_ID")
 VALUES ('3000', TO_DATE('2022-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '2', '3');

INSERT INTO "BLACHOTRAPEZ"."Uslugi" ("Cena_uslugi", "Data_zawarcia_umowy", "Data_rozwiazania_umowy", "Uslugi_zewnetrzne_ID", "Blok_ID")
 VALUES ('10000', TO_DATE('2022-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', '1');

INSERT INTO "BLACHOTRAPEZ"."Uslugi" ("Cena_uslugi", "Data_zawarcia_umowy", "Data_rozwiazania_umowy", "Uslugi_zewnetrzne_ID", "Blok_ID")
 VALUES ('10000', TO_DATE('2021-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-04-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', '2');

INSERT INTO "BLACHOTRAPEZ"."Uslugi" ("Cena_uslugi", "Data_zawarcia_umowy", "Data_rozwiazania_umowy", "Uslugi_zewnetrzne_ID", "Blok_ID")
 VALUES ('20000', TO_DATE('2021-07-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-07-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', '3');


