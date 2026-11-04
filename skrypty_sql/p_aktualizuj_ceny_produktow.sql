-- Tworzymy typ tablicy dla ID produktów jako NUMBER

--CREATE OR REPLACE TYPE produkt_id_nt AS TABLE OF NUMBER;

-- Tworzymy typ tablicy dla nowych cen

--CREATE OR REPLACE TYPE cena_nt AS TABLE OF NUMBER;



CREATE OR REPLACE PROCEDURE p_aktualizuj_ceny_produktow (
    p_produkty_id IN produkt_id_nt, 
    p_nowe_ceny   IN cena_nt
)
IS
    v_licznik           NUMBER;
    v_brakujace_id      VARCHAR2(1000);

    ex_blad_rozmiar     EXCEPTION;
    ex_ujemna_cena      EXCEPTION;
    ex_brak_produktow   EXCEPTION; 

    PRAGMA EXCEPTION_INIT(ex_blad_rozmiar, -20001);
    PRAGMA EXCEPTION_INIT(ex_ujemna_cena, -20002);
    PRAGMA EXCEPTION_INIT(ex_brak_produktow, -20003);

BEGIN
    -- Walidacja 1: Sprawdzanie, czy tablice mają ten sam rozmiar
    IF p_produkty_id.COUNT != p_nowe_ceny.COUNT THEN
        RAISE ex_blad_rozmiar;
    END IF;
     
    -- Walidacja 2: Sprawdzanie, czy cena nie jest ujemna
    FOR i IN p_produkty_id.FIRST .. p_produkty_id.LAST LOOP
        IF p_nowe_ceny(i) < 0 THEN
            RAISE ex_ujemna_cena;
        END IF;
    END LOOP;

    -- Walidacja 3: Sprawdzanie w pętli, czy przekazane produkty (NUMBER) w ogóle istnieją
    FOR i IN p_produkty_id.FIRST .. p_produkty_id.LAST LOOP
        SELECT 
            CASE WHEN EXISTS(SELECT 1 FROM produkty WHERE produkt_id = p_produkty_id(i))
            THEN 1 
            ELSE 0 
            END
        INTO v_licznik
        FROM dual;
        
        -- Zbieranie brakujących ID do komunikatu logu
        IF v_licznik = 0 THEN
            v_brakujace_id := v_brakujace_id || TO_CHAR(p_produkty_id(i)) || ', ';    
        END IF;
    END LOOP;
    
    -- Logowanie do tabeli logów informacji o brakujących produktach
    IF v_brakujace_id IS NOT NULL THEN
        v_brakujace_id := RTRIM(v_brakujace_id, ', ');
        p_logowanie_zdarzen(
            p_typ_logu => 'ERROR', 
            p_szczegoly => 'Aktualizacja cen pominięta dla brakujących ID: ' || v_brakujace_id
        );  
        RAISE ex_brak_produktow; -- Rzucamy wyjątek, który przejmie sekcja EXCEPTION
    END IF;

    -- Masowa aktualizacja cen istniejących produktów (FORALL ze zbieraniem wyjątków)
    FORALL i IN p_produkty_id.FIRST .. p_produkty_id.LAST SAVE EXCEPTIONS
    UPDATE produkty
    SET cena = p_nowe_ceny(i)  
    WHERE produkt_id = p_produkty_id(i);
      
EXCEPTION
    WHEN ex_blad_rozmiar THEN
        p_logowanie_zdarzen(p_typ_logu => 'ERROR', p_szczegoly => 'Rozmiary tablic ID i cen nie są takie same. | ' || sqlerrm);    
        RAISE_APPLICATION_ERROR(-20001, 'Liczba produktów i cen nie jest taka sama.');
        
    WHEN ex_ujemna_cena THEN
        p_logowanie_zdarzen(p_typ_logu => 'ERROR', p_szczegoly => 'Przekazano cenę mniejszą od zera. | ' || sqlerrm);    
        RAISE_APPLICATION_ERROR(-20002, 'Uwaga! Przekazujesz cenę, która jest mniejsza od zera.');
        
    WHEN ex_brak_produktow THEN
        RAISE_APPLICATION_ERROR(-20004, 'Aktualizacja przerwana! Następujące ID produktów nie istnieją w bazie: ' || v_brakujace_id);
        
    WHEN OTHERS THEN
        -- Precyzyjne logowanie błędów masowych z kolekcji SQL%BULK_EXCEPTIONS
        FOR i IN 1 .. SQL%BULK_EXCEPTIONS.COUNT LOOP
            p_logowanie_zdarzen(
                p_typ_logu => 'ERROR', 
                p_szczegoly => 'Błąd aktualizacji ceny dla ID: ' || TO_CHAR(p_produkty_id(SQL%BULK_EXCEPTIONS(i).ERROR_INDEX)) || 
                               ' | Treść błędu: ' || SQLERRM(SQL%BULK_EXCEPTIONS(i).ERROR_CODE)
            );
        END LOOP;
                     
        RAISE_APPLICATION_ERROR(-20008, 'Niektóre produkty nie zostały zaktualizowane. Szczegóły w tabeli logów.');
END p_aktualizuj_ceny_produktow;
/

-- wywołanie procedury za pomcą konstruktora i zmienną tablicową

--wywolanie
/*DECLARE
    -- Używamy konstruktora typu do inicjalizacji tablic
    v_produkty_id   produkt_id_nt := produkt_id_nt(333, 202);  -- Przykładowe ID produktów
    v_nowe_ceny     cena_nt       := cena_nt(16, 13);   -- Przykładowe ceny

BEGIN
    -- Wywołanie procedury z tablicami
    p_aktualizuj_ceny_produktow(v_produkty_id, v_nowe_ceny);
END;
*/
