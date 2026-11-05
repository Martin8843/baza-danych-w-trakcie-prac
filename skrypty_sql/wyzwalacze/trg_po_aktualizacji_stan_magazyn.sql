CREATE OR REPLACE TRIGGER trg_po_aktualizacji_stan_magazynu
AFTER UPDATE OF ilosc ON stan_magazynu
FOR EACH ROW
BEGIN
    -- Bezpośredni update tabeli produkty dla zmienionego produktu
    UPDATE produkty
    SET status_dostepnosci = CASE 
        WHEN :NEW.ilosc >= 100 THEN 'Dostępny'
        WHEN :NEW.ilosc = 0   THEN 'Niedostępny'
        ELSE                      
		'Mała ilość'
    END
    WHERE produkt_id = :NEW.produkt_id;
END trg_po_aktualizacji_stan_magazyn;
/
