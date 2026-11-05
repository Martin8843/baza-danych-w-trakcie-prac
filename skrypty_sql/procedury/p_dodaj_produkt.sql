-- wywyołanie procedury
-- w wywołaniu podaje tylko to co jest zmienne, jeśli produkt jet tabletką
-- to nie trzeba go przekazywać w paramterze p_postać bo jest domyślnie wpisany DEFAULT
/*
BEGIN
    p_dodaj_produkt (  
        p_nazwa         => 'Paracetamol 800mg',
        p_data_waznosci => TO_DATE('2028-12-31', 'YYYY-MM-DD'),
        p_cena          => 23.99,
        p_kod_ean       => '503305400',
        p_status        => 'DOSTEPNY',
        p_recepta       => 0,
        p_kategoria_id  => 1,
        p_dawka         => '800mg'
       -- p_postac      =>
       -- p_dawka       =>
       -- p_stawka_vat  =>
    );
    COMMIT;
END;

*/



CREATE OR REPLACE PROCEDURE p_dodaj_produkt (
    p_nazwa         IN produkty.nazwa_produktu%TYPE,
    p_opis          IN produkty.opis_produktu%TYPE DEFAULT 'Brak opisu',
    p_data_waznosci IN produkty.data_waznosci%TYPE DEFAULT NULL,
    p_cena          IN produkty.cena%TYPE,
    p_kod_ean       IN produkty.kod_ean%TYPE,
    p_status        IN produkty.status_dostepnosci%TYPE DEFAULT 'DOSTEPNY',
    p_recepta       IN produkty.wymagana_recepta%TYPE DEFAULT 0,
    p_kategoria_id  IN produkty.kategoria_id%TYPE,
    p_postac        IN produkty.postac%TYPE DEFAULT 'tabletki',
    p_dawka         IN produkty.dawka%TYPE DEFAULT NULL,       
    p_stawka_vat    IN produkty.stawka_vat%TYPE DEFAULT 8
) 
IS
    v_kat_istnieje           NUMBER;
    v_czy_inny_asortyment    NUMBER;
    
    wyj_brak_daty_waznosci   EXCEPTION;
    wyj_data_podana      EXCEPTION;
    wyj_wymagana_recepta     EXCEPTION;
    wyj_ujemna_cena          EXCEPTION;
    wyj_n_wymagana_recepta   EXCEPTION;

    PRAGMA EXCEPTION_INIT(wyj_brak_daty_waznosci, -20002);
    PRAGMA EXCEPTION_INIT(wyj_data_podana, -20003);
    PRAGMA EXCEPTION_INIT(wyj_wymagana_recepta, -20004);
    PRAGMA EXCEPTION_INIT(wyj_ujemna_cena, -20005);
    PRAGMA EXCEPTION_INIT(wyj_n_wymagana_recepta, -20006);

BEGIN
    -- 1. Walidacja: czy kategoria istnieje
    SELECT 1 
    INTO v_kat_istnieje
    FROM kategorie_produktow
    WHERE kategoria_id = p_kategoria_id;
        
    -- 2. Walidacja: czy kategoria należy do sprzętu medycznego (np. ID = 6)
    SELECT 
        CASE WHEN EXISTS(SELECT 1 
            FROM kategorie_produktow 
            WHERE kategoria_id = p_kategoria_id 
              AND kategoria_id  IN (9, 6, 5))
        THEN 0 
        ELSE 1
        END
    INTO v_czy_inny_asortyment
    FROM dual;
        
    -- 3. Walidacja daty ważności 
    IF v_czy_inny_asortyment = 1 AND p_data_waznosci IS NULL THEN 
        RAISE wyj_brak_daty_waznosci;    
    ELSIF v_czy_inny_asortyment = 0 AND p_data_waznosci IS NOT NULL THEN
        RAISE wyj_data_podana;
    END IF;
    
    -- 4. Walidacja wymogu recepty (przykład: kategoria 2 wymaga recepty -> wymagana_recepta = 1)
    IF p_kategoria_id = 2 AND p_recepta = 0 THEN
        RAISE wyj_wymagana_recepta; 
    ELSIF p_kategoria_id <> 2 AND p_recepta = 1 THEN
        RAISE wyj_n_wymagana_recepta; 
    END IF;
    
    -- 5. Walidacja ceny (czy jest dodatnia)
    IF p_cena <= 0 THEN
        RAISE wyj_ujemna_cena;
    END IF;
        
    -- 6. Dodanie produktu do tabeli 'produkty'
    INSERT INTO produkty (
        nazwa_produktu, 
        opis_produktu, 
        data_waznosci, 
        cena, 
        status_dostepnosci, 
        wymagana_recepta, 
        kategoria_id,
        postac,
        dawka,
        stawka_vat,
        kod_ean
    )
    VALUES (
        p_nazwa, 
        p_opis, 
        p_data_waznosci, 
        p_cena, 
        p_status, 
        p_recepta, 
        p_kategoria_id,
        p_postac,
        p_dawka,
        p_stawka_vat,
        p_kod_ean
    );

EXCEPTION
    WHEN NO_DATA_FOUND THEN
         p_logowanie_zdarzen(p_typ_logu => 'ERROR', p_szczegoly => 'Podano nieznaną kategorię produktu - ID: ' || p_kategoria_id || ': ' || sqlerrm);
         RAISE_APPLICATION_ERROR(-20001, 'Podana kategoria produktu nie istnieje.'); 
         
    WHEN wyj_brak_daty_waznosci THEN 
         p_logowanie_zdarzen(p_typ_logu => 'ERROR', p_szczegoly => 'Nie podano wymaganej daty ważności, ' || sqlerrm);
         RAISE_APPLICATION_ERROR(-20002, 'Dla produktu o kategorii ID: ' || p_kategoria_id || ' wymagana jest data ważności.');
         
    WHEN wyj_data_podana THEN 
         p_logowanie_zdarzen(p_typ_logu => 'ERROR', p_szczegoly => 'Wprowadzono datę ważności, która nie jest wymagana dla kategorii ID: ' || p_kategoria_id || ': ' || sqlerrm);
         RAISE_APPLICATION_ERROR(-20003, 'Wprowadzasz kategorię, która nie wymaga daty ważności.');
         
    WHEN wyj_wymagana_recepta THEN
         p_logowanie_zdarzen(p_typ_logu => 'ERROR', p_szczegoly => 'Nie wprowadzono recepty dla kategorii ID: ' || p_kategoria_id || ': ' || sqlerrm);
         RAISE_APPLICATION_ERROR(-20004, 'Wprowadzasz kategorię, która wymaga recepty.');
         
    WHEN wyj_ujemna_cena THEN
         p_logowanie_zdarzen(p_typ_logu => 'ERROR', p_szczegoly => 'Podano nieprawidłową cenę, ' || sqlerrm);
         RAISE_APPLICATION_ERROR(-20005, 'Cena produktu musi być dodatnia!');
         
    WHEN wyj_n_wymagana_recepta THEN
         p_logowanie_zdarzen(p_typ_logu => 'ERROR', p_szczegoly => 'Podano niewymaganą receptę: ' || sqlerrm);
         RAISE_APPLICATION_ERROR(-20006, 'Recepta nie jest wymagana dla podanej kategorii, popraw status!');
         
    WHEN DUP_VAL_ON_INDEX THEN
         p_logowanie_zdarzen(p_typ_logu => 'ERROR', p_szczegoly => 'Próba dodania nazwy produktu, która już istnieje: ' || sqlerrm);
         RAISE_APPLICATION_ERROR(-20007, 'Nazwa produktu już istnieje.');

    WHEN OTHERS THEN 
         p_logowanie_zdarzen(p_typ_logu => 'ERROR', p_szczegoly => 'Inny błąd: ' || sqlerrm);
         RAISE_APPLICATION_ERROR(-20008, 'Wystąpił błąd podczas dodawania produktu: ' || sqlerrm);

END p_dodaj_produkt;
/
