

CREATE OR REPLACE PROCEDURE p_usun_produkt (
    p_produkt_id IN produkty.produkt_id%TYPE
)
IS
    v_prod_istnieje         NUMBER;
    v_jest_w_zamowieniu     NUMBER;
    v_jest_na_stan_magazynuie     NUMBER;
    
    ex_prod_w_zamowieniu    EXCEPTION;
    ex_prod_na_stan_magazynie    EXCEPTION;

    PRAGMA EXCEPTION_INIT(ex_prod_w_zamowieniu, -20002);
    PRAGMA EXCEPTION_INIT(ex_prod_na_stan_magazynie, -20003);
BEGIN
    -- 1. Walidacja: czy produkt w ogóle istnieje
    SELECT 1 
    INTO v_prod_istnieje
    FROM produkty
    WHERE produkt_id = p_produkt_id;
    
    -- 2. Walidacja: czy produkt występuje w zamówieniach
    SELECT 
        CASE WHEN EXISTS (
            SELECT 1 
            FROM szczegoly_zamowien
            WHERE produkt_id = p_produkt_id 
              AND ROWNUM = 1
        )
        THEN 1 
        ELSE 0 
        END
    INTO v_jest_w_zamowieniu
    FROM dual;
    
    -- 3. Walidacja: czy produkt znajduje się na stanie stan_magazynuowym (ilość > 0)
    SELECT 
        CASE WHEN EXISTS (
            SELECT 1 
            FROM stan_magazynu 
            WHERE produkt_id = p_produkt_id 
              AND ilosc > 0
        )
        THEN 1 
        ELSE 0 
        END
    INTO v_jest_na_stan_magazynuie
    FROM dual;
    
    -- Sprawdzenie flag i rzucenie wyjątków biznesowych
    IF v_jest_w_zamowieniu = 1 THEN
        RAISE ex_prod_w_zamowieniu;
    END IF;
    
    IF v_jest_na_stan_magazynuie = 1 THEN
        RAISE ex_prod_na_stan_magazynie;
    END IF;
    
    -- Właściwe usunięcie produktu, jeśli sprawdzone walidacje
    DELETE FROM produkty
    WHERE produkt_id = p_produkt_id;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_logowanie_zdarzen(p_typ_logu => 'ERROR', p_szczegoly => 'Próba usunięcia ID produktu, który nie istnieje: ' || p_produkt_id || '; ' || sqlerrm);
        RAISE_APPLICATION_ERROR(-20001, 'Podane ID produktu nie istnieje.'); 
        
    WHEN ex_prod_w_zamowieniu THEN 
        p_logowanie_zdarzen(p_typ_logu => 'ERROR', p_szczegoly => 'Próba usunięcia produktu o ID: ' || p_produkt_id || ' który jest powiązany z zamówieniami: ' || sqlerrm);
        RAISE_APPLICATION_ERROR(-20002, 'Nie możesz usunąć produktu o ID: ' || p_produkt_id || ' który znajduje się w zamówieniach.');
        
    WHEN ex_prod_na_stan_magazynie THEN 
        p_logowanie_zdarzen(p_typ_logu => 'ERROR', p_szczegoly => 'Próba usunięcia produktu o ID: ' || p_produkt_id || ' który jest na stanie stan_magazynuowym (> 0): ' || sqlerrm);
        RAISE_APPLICATION_ERROR(-20003, 'Nie możesz usunąć produktu o ID: ' || p_produkt_id || ' który znajduje się na stanie stan_magazynuowym.');
        
    WHEN OTHERS THEN 
        p_logowanie_zdarzen(p_typ_logu => 'ERROR', p_szczegoly => 'Nieoczekiwany błąd podczas usuwania produktu ID: ' || p_produkt_id || ': ' || sqlerrm);
        RAISE_APPLICATION_ERROR(-20008, 'Wystąpił błąd podczas usuwania produktu: ' || sqlerrm);

END p_usun_produkt;
/
