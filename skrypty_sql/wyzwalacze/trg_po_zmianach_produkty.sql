CREATE OR REPLACE TRIGGER trg_po_zmianach_produkty
AFTER INSERT OR UPDATE OR DELETE ON produkty
FOR EACH ROW
DECLARE
    v_typ_logu    logi_systemowe.typ_logu%TYPE;
    v_szczegoly_logu   logi_systemowe.szczegoly_logu%TYPE;
    v_produkt_id  logi_systemowe.produkt_id%TYPE;
BEGIN
    -- Rozpoznanie typu operacji i przypisanie odpowiednich wartości
    IF INSERTING THEN
        v_typ_logu    := 'INSERT';
        v_szczegoly_logu := 'Dodano nowy produkt do tabeli produkty.';
        v_produkt_id  := :NEW.produkt_id;
        
    ELSIF UPDATING THEN
        v_typ_logu    := 'UPDATE';
        v_szczegoly_logu := 'Zaktualizowano dane produktu o ID: ' || :NEW.produkt_id;
        v_produkt_id  := :NEW.produkt_id;
        
    ELSIF DELETING THEN
        v_typ_logu    := 'DELETE';
        v_szczegoly_logu := 'Usunięto produkt z tabeli produkty.';
        v_produkt_id  := :OLD.produkt_id;
    END IF;

    -- Wywołanie procedury logującej
   p_logowanie_zdarzen(
        p_typ_logu     => v_typ_logu,
        p_szczegoly    => v_szczegoly_logu,
        p_uzytkownik_id => NULL,
        p_produkt_id   => v_produkt_id,
        p_zamowienie_id => NULL  
    );

EXCEPTION
    WHEN OTHERS THEN
        -- Logowanie błędu do tabeli logów z poziomem 'ERROR'
        p_logowanie_zdarzen(
            p_typ_logu    => 'ERROR',
            p_szczegoly => 'Błąd podczas próby logowania zmian w tabeli produkty: ' || SQLERRM,
            p_produkt_id  => NULL,
            p_zamowienie_id => NULL,
            p_uzytkownik_id => NULL

        );
END trg_po_zmianach_produkty;
/
