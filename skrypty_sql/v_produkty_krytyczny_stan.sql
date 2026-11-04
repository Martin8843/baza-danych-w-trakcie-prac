CREATE OR REPLACE VIEW v_produkty_krytyczny_stan AS
SELECT 
    p.produkt_id,
    p.nazwa_produktu,
    p.kategoria_id,
    s.ilosc AS aktualny_stan,
    p.cena,
    CASE 
        WHEN s.ilosc = 0 THEN 'BRAK W MAGAZYNIE'
        WHEN s.ilosc <= 5 THEN 'STAN NISKI - DO ZAMÓWIENIA'
        ELSE 'OK'
    END AS status_dostepnosci
FROM produkty p
INNER JOIN stan_magazynu s ON p.produkt_id = s.produkt_id
WHERE s.ilosc <= 5; -- Filtruje od razu produkty wymagające uwagi

