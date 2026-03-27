# HR-Analyse — IBM Mitarbeiterdaten

## Projektbeschreibung
Analyse von 1.470 IBM-Mitarbeiterdaten zur Identifikation
von Fluktuationsrisiken und Handlungsempfehlungen für die HR-Abteilung.

## Datensatz
- **Quelle**: Kaggle — IBM HR Analytics Attrition Dataset
- **Umfang**: 1.470 Mitarbeiter, 35 Merkmale

## Verwendete Technologien
- PostgreSQL 16
- pgAdmin 4

## Wichtigste Erkenntnisse

| Faktor | Ergebnis |
|---|---|
| Gesamte Fluktuationsrate | 16.12% |
| Risikoreichste Abteilung | Sales (20.63%) |
| Einfluss von Überstunden | 30.53% vs 10.44% |
| Risikoreichste Jobrolle | Sales Representative (39.76%) |
| Einfluss von Dienstreisen | 24.91% vs 8.00% |

## Profil des typischen Abgängers
- **Alter**: 33.6 Jahre
- **Gehalt**: 4.787 $/Monat
- **Betriebszugehörigkeit**: 5.1 Jahre
- **Jobzufriedenheit**: 2.5 / 4

## Handlungsempfehlungen
1. Überstunden reduzieren — stärkster Einflussfaktor
2. Gehälter im Sales-Bereich überprüfen
3. Retentionsprogramme für unter 35-Jährige einführen
4. Dienstreisen besser vergüten oder reduzieren

## SQL-Abfragen
Alle Abfragen sind in `analyse_rh.sql` dokumentiert.

## Autor
**Wilfried Fozing ** — angehender Data Analyst
