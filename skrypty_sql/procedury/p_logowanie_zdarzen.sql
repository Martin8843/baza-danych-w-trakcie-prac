CREATE OR REPLACE PROCEDURE p_logowanie_zdarzen (
    p_typ_logu      IN logi_systemowe.typ_logu%TYPE,
    p_szczegoly     IN logi_systemowe.szczegoly_logu%TYPE,
    p_uzytkownik_id IN logi_systemowe.uzytkownik_id%TYPE DEFAULT NULL,
    p_produkt_id    IN logi_systemowe.produkt_id%TYPE DEFAULT NULL,
    p_zamowienie_id IN logi_systemowe.zamowienie_id%TYPE DEFAULT NULL
)
AS
    PRAGMA AUTONOMOUS_TRANSACTION; -- Transakcja niezależna (zapisuje błąd nawet przy ROLLBACK)
BEGIN
    INSERT INTO logi_systemowe (
        typ_logu, 
        szczegoly_logu, 
        uzytkownik_id, 
        produkt_id, 
        zamowienie_id
    ) 
    VALUES (
        p_typ_logu, 
        p_szczegoly, 
        p_uzytkownik_id, 
        p_produkt_id, 
        p_zamowienie_id
    );
    
    COMMIT;
      
EXCEPTION
    WHEN OTHERS THEN
        -- W razie problemów z samym logowaniem nie wywalamy głównego błędu aplikacji
        NULL; 
END p_logowanie_zdarzen;
/
