-----------------------------------------------------------------
-- Skrypt zasilający (Dane Testowe)
-- Opis: Zawiera komplet spójnych danych testowych (kategorie, 
-- użytkownicy, adresy, produkty, stan magazynu, zamówienia, płatności).

-----------------------------------------------------------------


INSERT INTO kategorie_produktow (nazwa_kategorii, opis_kategorii) VALUES ('Lek Bez Recepty (OTC)', 'Leki wydawane bez przepisu lekarza');
INSERT INTO kategorie_produktow (nazwa_kategorii, opis_kategorii) VALUES ('Lek na Receptę (Rp)', 'Leki wymagające recepty ');
INSERT INTO kategorie_produktow (nazwa_kategorii, opis_kategorii) VALUES ('Suplementy', 'Witaminy, minerały i preparaty wspomagające');
INSERT INTO kategorie_produktow (nazwa_kategorii, opis_kategorii) VALUES ('Dermokosmetyki', 'Specjalistyczne kosmetyki apteczne');
INSERT INTO kategorie_produktow (nazwa_kategorii, opis_kategorii) VALUES ('Artykuły Higieniczne', 'Produkty codziennej higieny i czystości');
INSERT INTO kategorie_produktow (nazwa_kategorii, opis_kategorii) VALUES ('Sprzęt Medyczny', 'Urządzenia pomiarowe i akcesoria medyczne');
INSERT INTO kategorie_produktow (nazwa_kategorii, opis_kategorii) VALUES ('Zdrowie Dziecka', 'Produkty i żywność przeznaczona dla dzieci');
INSERT INTO kategorie_produktow (nazwa_kategorii, opis_kategorii) VALUES ('Zioła i Herbaty', 'Naturalne zioła suszone i napary');
INSERT INTO kategorie_produktow (nazwa_kategorii, opis_kategorii) VALUES ('Opatrunki', 'Plastry, bandaże i środki do dezynfekcji');
INSERT INTO kategorie_produktow (nazwa_kategorii, opis_kategorii) VALUES ('Zdrowie Stomatologiczne', 'Produkty do higieny jamy ustnej');

COMMIT;

INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Jan', 'Kowalski', 'jan.kowalski@example.com', '501100200', 'hash_pass_1', 'AKTYWNY', 'CLIENT');
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Anna', 'Nowak', 'anna.nowak@example.com', '502200300', 'hash_pass_2', 'AKTYWNY', 'CLIENT');
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Piotr', 'Wiśniewski', 'piotr.wisniewski@example.com', '503300400', 'hash_pass_3', 'AKTYWNY', 'CLIENT');
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Katarzyna', 'Wójcik', 'katarzyna.wojcik@example.com', '504400500', 'hash_pass_4', 'AKTYWNY', 'CLIENT');
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Tomasz', 'Kowalczyk', 'tomasz.kowalczyk@example.com', '505500600', 'hash_pass_5', 'AKTYWNY', 'STAFF');
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Magdalena', 'Kamińska', 'magdalena.kaminska@example.com', '506600700', 'hash_pass_6', 'AKTYWNY', 'CLIENT');
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Michał', 'Lewandowski', 'michal.lewandowski@example.com', '507700800', 'hash_pass_7', 'AKTYWNY', 'CLIENT');
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Agnieszka', 'Zielińska', 'agnieszka.zielinska@example.com', '508800900', 'hash_pass_8', 'AKTYWNY', 'CLIENT');
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Krzysztof', 'Szymański', 'krzysztof.szymanski@example.com', '509900100', 'hash_pass_9', 'AKTYWNY', 'ADMIN');
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Barbara', 'Woźniak', 'barbara.wozniak@example.com', '510111222', 'hash_pass_10', 'AKTYWNY', 'CLIENT');
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Łukasz', 'Dąbrowski', 'lukasz.dabrowski@example.com', '511222333', 'hash_pass_11', 'AKTYWNY', 'CLIENT');
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Ewa', 'Kozłowska', 'ewa.kozlowska@example.com', '512333444', 'hash_pass_12', 'AKTYWNY', 'CLIENT');
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Marcin', 'Jankowski', 'marcin.jankowski@example.com', '513444555', 'hash_pass_13', 'AKTYWNY', 'STAFF');
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Joanna', 'Mazur', 'joanna.mazur@example.com', '514555666', 'hash_pass_14', 'AKTYWNY', 'CLIENT');
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Paweł', 'Wojciechowski', 'pawel.wojciechowski@example.com', '515666777', 'hash_pass_15', 'AKTYWNY', 'CLIENT');
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Aleksandra', 'Kwiatkowska', 'aleksandra.kwiatkowska@example.com', '516777888', 'hash_pass_16', 'AKTYWNY', 'CLIENT');
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Mateusz', 'Krawczyk', 'mateusz.krawczyk@example.com', '517888999', 'hash_pass_17', 'AKTYWNY', 'CLIENT');
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Monika', 'Kaczmarek', 'monika.kaczmarek@example.com', '518999000', 'hash_pass_18', 'AKTYWNY', 'CLIENT');
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Jakub', 'Piotrowski', 'jakub.piotrowski@example.com', '519000111', 'hash_pass_19', 'AKTYWNY', 'CLIENT');
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon, haslo, status_konta, rola) VALUES ('Natalia', 'Grabowska', 'natalia.grabowska@example.com', '520111333', 'hash_pass_20', 'AKTYWNY', 'CLIENT');
COMMIT;

INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (1, 'Polska', 'Poznań', '60-101', 'Półwiejska', '12');
INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (2, 'Polska', 'Warszawa', '00-001', 'Marszałkowska', '45');
INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (3, 'Polska', 'Kraków', '30-002', 'Floriańska', '8');
INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (4, 'Polska', 'Wrocław', '50-003', 'Świdnicka', '15');
INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (5, 'Polska', 'Poznań', '61-701', 'Głogowska', '120');
INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (6, 'Polska', 'Gdańsk', '80-004', 'Długa', '33');
INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (7, 'Polska', 'Łódź', '90-005', 'Piotrkowska', '100');
INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (8, 'Polska', 'Poznań', '60-302', 'Bukowska', '55');
INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (9, 'Polska', 'Poznań', '61-896', 'Św. Marcin', '25');
INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (10, 'Polska', 'Poznań', '61-131', 'Ratajczaka', '14');
INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (11, 'Polska', 'Szczecin', '70-006', 'Aleja Wojska Polskiego', '10');
INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (12, 'Polska', 'Lublin', '20-007', 'Krakowskie Przedmieście', '22');
INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (13, 'Polska', 'Katowice', '40-008', 'Mariacka', '3');
INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (14, 'Polska', 'Białystok', '15-009', 'Lipowa', '7');
INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (15, 'Polska', 'Gdynia', '81-010', 'Świętojańska', '50');
INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (16, 'Polska', 'Poznań', '60-681', 'Os. Bolesława Chrobrego', '5');
INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (17, 'Polska', 'Poznań', '61-245', 'Os. Orła Białego', '18');
INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (18, 'Polska', 'Poznań', '60-456', 'Dąbrowskiego', '88');
INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (19, 'Polska', 'Poznań', '61-312', 'Zamenhofa', '42');
INSERT INTO adresy (uzytkownik_id, kraj, miasto, kod_pocztowy, ulica, numer_domu) VALUES (20, 'Polska', 'Poznań', '60-801', 'Jeżycka', '9');
COMMIT;



INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Apap 500mg', 'Lek przeciwbólowy i przeciwgorączkowy', TO_DATE('2028-06-30','YYYY-MM-DD'), 15.99, 'DOSTEPNY', 0, 1, '5900000000011', 'tabletki', '500mg', 8);

INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Ibuprom 200mg', 'Lek przeciwzapalny', TO_DATE('2027-12-31','YYYY-MM-DD'), 12.50, 'DOSTEPNY', 0, 1, '5900000000028', 'tabletki', '200mg', 8);

INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Amoksycylina 1g', 'Antybiotyk szerokospektralny', TO_DATE('2026-10-15','YYYY-MM-DD'), 45.00, 'DOSTEPNY', 1, 2, '5900000000035', 'ampułki', '1g', 8);

INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Witamina C 1000', 'Suplement diety wspomagający odporność', TO_DATE('2028-01-31','YYYY-MM-DD'), 25.00, 'DOSTEPNY', 0, 3, '5900000000042', 'tabletki', '1000mg', 23);

INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Krem nawilżający do twarzy', 'Hipoalergiczny krem dermokosmetyczny', TO_DATE('2027-05-20','YYYY-MM-DD'), 59.99, 'DOSTEPNY', 0, 4, '5900000000059', 'maść', '50ml', 23);

INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Chusteczki higieniczne', 'Miękkie chusteczki 3-warstwowe', NULL, 6.50, 'DOSTEPNY', 0, 5, '5900000000066', 'tabletki', '10szt', 23);

INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Ciśnieniemierz elektroniczny', 'Automatyczny ciśnieniemierz naramienny', NULL, 129.99, 'DOSTEPNY', 0, 6, '5900000000073', 'tabletki', '1szt', 23);

INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Krople żołądkowe', 'Tradycyjny produkt leczniczy roślinny', TO_DATE('2028-03-10','YYYY-MM-DD'), 9.99, 'DOSTEPNY', 0, 1, '5900000000080', 'krople', '35g', 8);

INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Syrop na kaszel mokry', 'Lek wykrztuśny dla dorosłych i dzieci', TO_DATE('2027-09-30','YYYY-MM-DD'), 21.00, 'DOSTEPNY', 0, 1, '5900000000097', 'syrop', '200ml', 8);

INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Plastry z opatrunkiem', 'Elastyczne plastry wodoodporne', TO_DATE('2030-01-01','YYYY-MM-DD'), 8.99, 'DOSTEPNY', 0, 9, '5900000000103', 'tabletki', '20szt', 23);

INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Pasta do zębów wrażliwych', 'Pasta wzmacniająca szkliwo', TO_DATE('2028-08-14','YYYY-MM-DD'), 18.50, 'DOSTEPNY', 0, 10, '5900000000110', 'maść', '75ml', 23);

INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Magnez B6 Forte', 'Suplement diety uzupełniający niedobory', TO_DATE('2028-11-30','YYYY-MM-DD'), 29.99, 'DOSTEPNY', 0, 3, '5900000000127', 'tabletki', '60szt', 23);

INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Maść rozgrzewająca', 'Maść z kamforą i mentolem', TO_DATE('2027-04-12','YYYY-MM-DD'), 16.00, 'DOSTEPNY', 0, 4, '5900000000134', 'maść', '100g', 23);

INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Termometr elektroniczny', 'Szybki pomiar temperatury', NULL, 35.00, 'DOSTEPNY', 0, 6, '5900000000141', 'tabletki', '1szt', 23);

INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Krople do oczu nawilżające', 'Łagodzenie objawów suchego oka', TO_DATE('2027-07-25','YYYY-MM-DD'), 24.50, 'DOSTEPNY', 0, 1, '5900000000158', 'krople', '10ml', 8);

INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Kaszkad miodowa dla dzieci', 'Zdrowy posiłek dla maluchów', TO_DATE('2027-02-10','YYYY-MM-DD'), 14.00, 'DOSTEPNY', 0, 7, '5900000000165', 'tabletki', '250g', 5);

INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Herbata z czarnego bzu', 'Ziołowa herbata ekspresowa', TO_DATE('2028-09-01','YYYY-MM-DD'), 8.00, 'DOSTEPNY', 0, 8, '5900000000172', 'tabletki', '20toreb', 23);

INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Bandaż elastyczny', 'Bandaż podtrzymujący z zapinką', NULL, 5.00, 'DOSTEPNY', 0, 9, '5900000000189', 'tabletki', '4mx5cm', 23);

INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Gardimax Medica', 'Lek na ból gardła o smaku cytrynowym', TO_DATE('2027-10-10','YYYY-MM-DD'), 19.50, 'DOSTEPNY', 0, 1, '5900000000196', 'tabletki', '30past', 8);

INSERT INTO produkty (nazwa_produktu, opis_produktu, data_waznosci, cena, status_dostepnosci, wymagana_recepta, kategoria_id, kod_EAN, postac, dawka, stawka_vat) 
VALUES ('Insulina aspart', 'Roztwór do wstrzykiwań', TO_DATE('2026-12-01','YYYY-MM-DD'), 110.00, 'DOSTEPNY', 1, 2, '5900000000202', 'ampułki', '100u/ml', 8);
COMMIT;

INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (1, 150);
INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (2, 200);
INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (3, 45);
INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (4, 300);
INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (5, 80);
INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (6, 500);
INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (7, 25);
INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (8, 90);
INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (9, 120);
INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (10, 400);
INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (11, 220);
INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (12, 180);
INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (13, 75);
INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (14, 30);
INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (15, 110);
INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (16, 60);
INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (17, 140);
INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (18, 250);
INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (19, 95);
INSERT INTO stan_magazynu (produkt_id, ilosc) VALUES (20, 50);
COMMIT;


INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (1, 'ZAKOŃCZONE', 43.98, 'Szybka dostawa');
INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (2, 'OPŁACONE', 45.00, NULL);
INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (3, 'NOWE', 25.00, 'Proszę o ostrożne pakowanie');
INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (4, 'WYSŁANE', 129.99, NULL);
INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (6, 'ZAKOŃCZONE', 59.99, NULL);
INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (7, 'ANULOWANE', 21.00, 'Klient zrezygnował');
INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (8, 'OPŁACONE', 18.50, NULL);
INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (10, 'NOWE', 35.00, NULL);
INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (11, 'ZAKOŃCZONE', 110.00, 'Odbiór osobisty');
INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (12, 'WYSŁANE', 29.99, NULL);
INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (13, 'OPŁACONE', 15.99, NULL);
INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (14, 'NOWE', 12.50, NULL);
INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (15, 'ZAKOŃCZONE', 24.50, NULL);
INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (16, 'WYSŁANE', 16.00, NULL);
INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (17, 'OPŁACONE', 8.99, NULL);
INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (18, 'NOWE', 14.00, NULL);
INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (19, 'ZAKOŃCZONE', 19.50, NULL);
INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (20, 'OPŁACONE', 9.99, NULL);
INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (1, 'NOWE', 50.00, NULL);
INSERT INTO zamowienia (uzytkownik_id, status_zamowienia, kwota_calkowita, uwagi) VALUES (2, 'ZAKOŃCZONE', 35.00, NULL);
COMMIT;


INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (1, 1, 1, 15.99, 15.99);
INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (1, 2, 2, 13.99, 27.99);
INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (2, 3, 1, 45.00, 45.00);
INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (3, 4, 1, 25.00, 25.00);
INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (4, 7, 1, 129.99, 129.99);
INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (5, 5, 1, 59.99, 59.99);
INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (6, 9, 1, 21.00, 21.00);
INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (7, 11, 1, 18.50, 18.50);
INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (8, 14, 1, 35.00, 35.00);
INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (9, 20, 1, 110.00, 110.00);
INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (10, 12, 1, 29.99, 29.99);
INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (11, 1, 1, 15.99, 15.99);
INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (12, 2, 1, 12.50, 12.50);
INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (13, 15, 1, 24.50, 24.50);
INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (14, 13, 1, 16.00, 16.00);
INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (15, 10, 1, 8.99, 8.99);
INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (16, 16, 1, 14.00, 14.00);
INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (17, 19, 1, 19.50, 19.50);
INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (18, 8, 1, 9.99, 9.99);
INSERT INTO szczegoly_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa, suma_pozycji) VALUES (19, 4, 2, 25.00, 50.00);
COMMIT;


INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (1, 'OPŁACONA', 'BLIK');
INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (2, 'OPŁACONA', 'KARTA');
INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (3, 'OCZEKUJĄCA', 'PRZELEW');
INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (4, 'OPŁACONA', 'BLIK');
INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (5, 'OPŁACONA', 'GOTÓWKA');
INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (6, 'ANULOWANA', 'PRZELEW');
INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (7, 'OPŁACONA', 'BLIK');
INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (8, 'OCZEKUJĄCA', 'KARTA');
INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (9, 'OPŁACONA', 'PRZELEW');
INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (10, 'OPŁACONA', 'BLIK');
INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (11, 'OPŁACONA', 'GOTÓWKA');
INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (12, 'OCZEKUJĄCA', 'BLIK');
INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (13, 'OPŁACONA', 'KARTA');
INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (14, 'OPŁACONA', 'BLIK');
INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (15, 'OPŁACONA', 'PRZELEW');
INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (16, 'OCZEKUJĄCA', 'BLIK');
INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (17, 'OPŁACONA', 'KARTA');
INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (18, 'OPŁACONA', 'GOTÓWKA');
INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (19, 'OCZEKUJĄCA', 'PRZELEW');
INSERT INTO platnosci (zamowienie_id, status_platnosci, metoda_platnosci) VALUES (20, 'OPŁACONA', 'BLIK');
COMMIT;