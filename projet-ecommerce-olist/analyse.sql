-- ================================================
-- PROJEKT  : E-Commerce Analyse - Olist (Brasilien)
-- AUTOR    :  WILFRIED FOZING 
-- DATUM    : 2026
-- WERKZEUG : PostgreSQL
-- ================================================

-- FRAGE 1 : Gesamtanzahl der Bestellungen
SELECT COUNT(*) AS gesamt_bestellungen
FROM orders;
-- ERGEBNIS : 99.441 Bestellungen

-- FRAGE 2 : Gesamtumsatz
SELECT ROUND(SUM(payment_value), 2) AS gesamtumsatz
FROM order_payments;
-- ERGEBNIS : 16.008.872 €

-- FRAGE 3 : Zahlungsarten und Häufigkeit
SELECT payment_type, COUNT(*) AS anzahl_nutzungen
FROM order_payments
GROUP BY payment_type
ORDER BY anzahl_nutzungen DESC;
-- ERGEBNIS : Kreditkarte dominiert mit 74% der Zahlungen

-- FRAGE 4 : Durchschnittlicher Bestellwert
SELECT ROUND(AVG(payment_value), 2) AS durchschnitt_bestellung
FROM order_payments;
-- ERGEBNIS : 154,10 €

-- FRAGE 5 : Bestellungen nach Status
SELECT order_status, COUNT(*) AS anzahl
FROM orders
GROUP BY order_status
ORDER BY anzahl DESC;
-- ERGEBNIS : 97% der Bestellungen wurden geliefert

-- FRAGE 6 : Top 10 meistverkaufte Produktkategorien
SELECT p.product_category_name, COUNT(*) AS anzahl_verkauft
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY anzahl_verkauft DESC
LIMIT 10;
-- ERGEBNIS : cama_mesa_banho führt mit 11.115 Verkäufen

-- FRAGE 7 : Monatlicher Umsatz
SELECT DATE_TRUNC('month', order_purchase_timestamp) AS monat,
       ROUND(SUM(payment_value), 2) AS monatsumsatz
FROM orders
INNER JOIN order_payments ON orders.order_id = order_payments.order_id
GROUP BY monat
ORDER BY monat;
-- ERGEBNIS : deutliches Wachstum in 2017-2018 erkennbar

-- FRAGE 8 : Top 10 Kunden nach Ausgaben
SELECT c.customer_unique_id, ROUND(SUM(op.payment_value), 2) AS gesamtausgaben
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_payments op ON o.order_id = op.order_id
GROUP BY c.customer_unique_id
ORDER BY gesamtausgaben DESC
LIMIT 10;
-- ERGEBNIS : Bester Kunde mit 13.664 € Gesamtausgaben

-- FRAGE 9 : Pünktliche Lieferungsrate
SELECT ROUND(100.0 * SUM(CASE WHEN order_delivered_customer_date <= order_estimated_delivery_date
                               THEN 1 ELSE 0 END) / COUNT(*), 2) AS puenktliche_lieferung_pct
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;
-- ERGEBNIS : 89% pünktlich geliefert

-- FRAGE 10 : Top 10 Kategorien nach Umsatz
SELECT product_category_name, ROUND(SUM(price), 2) AS umsatz
FROM products
INNER JOIN order_items ON order_items.product_id = products.product_id
GROUP BY product_category_name
ORDER BY umsatz DESC
LIMIT 10;
-- ERGEBNIS : beleza_saude führt mit 1,25 Mio. €
