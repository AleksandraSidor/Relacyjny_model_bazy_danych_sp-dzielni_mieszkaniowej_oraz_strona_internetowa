-- Pobranie danych adresowych wszystkich tych lokali zarządzanych przez spółdzielnię, które mają powierzchnię co najmniej 80 m2

SELECT a.ulica, a.numer_domu, m.numer_lokalu, a.miasto, a.kod_pocztowy
FROM mieszkania m, bloki b, adresy a
WHERE m.blok_id=b.blok_id
AND b.adres_id=a.adres_id
AND m.powierzchnia >= 80;


-- Pobranie danych o zaległych opłatach za media w bloku znajdującym się przy ulicy Krakowskiej 1A

SELECT m.numer_lokalu, o.data_wystawienia_rachunku,
(z.ilosc_zuzycia * md.cena_za_jednostke) as kwota_do_zaplaty,
o.za_okres_od, o.za_okres_do, md.nazwa as medium
FROM oplaty o, mieszkania m, bloki b, adresy a, zuzycia z, media md
WHERE o.mieszkanie_id=m.mieszkanie_id
AND m.blok_id=b.blok_id AND b.adres_id=a.adres_id
AND a.ulica='Krakowska' AND a.numer_domu='1A'
AND z.oplaty_id=o.oplaty_id
AND z.medium_id=md.medium_id
AND o.czy_oplacony='N';


-- Sprawdzenie ile lat przepracowali na stanowisku obecni pracownicy biura spółdzielni

SELECT p.imie, NVL(p.drugie_imie, '-') as drugie_imie,
p.nazwisko, pb.rodzaj_pracownika_biurowego,
(EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM p.data_zatrudnienia)) as lat_na_stanowisku
FROM pracownicy_biurowi pb, pracownicy p
WHERE pb.pracownik_id=p.pracownik_id
AND p.data_zwolnienia IS NULL
ORDER BY lat_na_stanowisku DESC;


-- Sprawdzenie daty zakupu mieszkania tych obecnych mieszkańców, którzy są również właścicielami swoich mieszkań

SELECT o.imie, o.nazwisko, o.data_urodzenia, w.data_nabycia_mieszkania
FROM mieszkancy m, wlasciciele w, osoby o
WHERE m.osoba_id=o.osoba_id
AND w.osoba_id=m.osoba_id
AND w.data_zbycia_mieszkania IS NULL
AND m.data_wyprowadzki IS NULL;

