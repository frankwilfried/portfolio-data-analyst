# E-Commerce Analyse — Olist (Brasilien)

## Projektbeschreibung
Analyse eines brasilianischen E-Commerce-Datensatzes mit über 99.000 Bestellungen.
Ziel: Business-Insights durch SQL-Abfragen gewinnen.

## Datensatz
- **Quelle**: Kaggle — Brazilian E-Commerce (Olist)
- **Zeitraum**: 2016–2018
- **Umfang**: 99.441 Bestellungen, 96.096 Kunden

## Verwendete Technologien
- PostgreSQL 16
- pgAdmin 4

## Wichtigste Erkenntnisse
- Gesamtumsatz: **16.008.872 €**
- Durchschnittlicher Bestellwert: **154,10 €**
- Pünktliche Lieferungsrate: **89%**
- Beliebteste Zahlungsart: **Kreditkarte (74%)**
- Umsatzstärkste Kategorie: **Schönheit & Gesundheit (1,25 Mio. €)**

## SQL-Abfragen
| Frage | Datei |
|---|---|
| Gesamtanzahl Bestellungen | analyse.sql |
| Gesamtumsatz | analyse.sql |
| Zahlungsarten | analyse.sql |
| Monatlicher Umsatz | analyse.sql |
| Top 10 Kunden | analyse.sql |
| Pünktliche Lieferungsrate | analyse.sql |
| Top 10 Kategorien | analyse.sql |

## Datenbankschema
```
customers → orders → order_payments
                  → order_items → products
```

## Autor
**WILFRIED FOZING ** — angehender Data Analyst
Auf der Suche nach einer Werkstudentenstelle im Bereich Data Analytics
