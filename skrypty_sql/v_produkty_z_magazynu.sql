CREATE OR REPLACE VIEW v_produkty_z_magazynu AS
SELECT 
    p.produkt_id,
    p.nazwa_produktu,
    p.kategoria_id,
    p.data_waznosci,
    p.cena,
    s.ilosc AS ilosc_magazynowa
FROM produkty p
INNER JOIN stan_magazynu s ON p.produkt_id = s.produkt_id;

/*

SELECT *
FROM v_produkty_z_magazynu
WHERE kategoria_id = 1;