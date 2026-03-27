-- ================================================
-- PROJEKT  : HR-Analyse — IBM Mitarbeiterdaten
-- AUTOR    : Wilfried Fozing
-- DATUM    : 2026
-- WERKZEUG : PostgreSQL
-- ================================================

-- FRAGE 1 : Gesamte Fluktuationsrate
SELECT ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS fluktuationsrate
FROM employees;
-- ERGEBNIS : 16.12% der Mitarbeiter haben das Unternehmen verlassen

-- FRAGE 2 : Fluktuationsrate nach Abteilung
SELECT Department, ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS fluktuationsrate
FROM employees
GROUP BY Department
ORDER BY fluktuationsrate DESC;
-- ERGEBNIS : Sales 20.63%, HR 19.05%, R&D 13.84%

-- FRAGE 3 : Überstunden und Fluktuation
SELECT OverTime, ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS fluktuationsrate
FROM employees
GROUP BY OverTime
ORDER BY fluktuationsrate DESC;
-- ERGEBNIS : Mit Überstunden 30.53% vs ohne 10.44% — 3x höher!

-- FRAGE 4 : Durchschnittsgehalt nach Abteilung
SELECT Department, ROUND(AVG(MonthlyIncome), 2) AS durchschnittsgehalt
FROM employees
GROUP BY Department
ORDER BY durchschnittsgehalt DESC;
-- ERGEBNIS : Sales 6.959$, HR 6.654$, R&D 6.281$

-- FRAGE 5 : Durchschnittsalter nach Fluktuationsstatus
SELECT Attrition, ROUND(AVG(Age), 2) AS durchschnittsalter
FROM employees
GROUP BY Attrition
ORDER BY durchschnittsalter DESC;
-- ERGEBNIS : Verbleibende 37.56 Jahre, Abgänger 33.61 Jahre

-- FRAGE 6 : Fluktuationsrate nach Jobrolle
SELECT JobRole, ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS fluktuationsrate
FROM employees
GROUP BY JobRole
ORDER BY fluktuationsrate DESC;
-- ERGEBNIS : Sales Representative 39.76%, Research Director nur 2.50%

-- FRAGE 7 : Jobzufriedenheit und Fluktuation
SELECT JobSatisfaction, ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS fluktuationsrate
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction ASC;
-- ERGEBNIS : Sehr unzufrieden 22.84% vs sehr zufrieden 11.33%

-- FRAGE 8 : Durchschnittsgehalt nach Bildungsniveau
SELECT Education, ROUND(AVG(MonthlyIncome), 2) AS durchschnittsgehalt
FROM employees
GROUP BY Education
ORDER BY Education ASC;
-- ERGEBNIS : Doktor 8.277$ vs ohne Hochschule 5.640$ — 46% mehr!

-- FRAGE 9 : Dienstreisen und Fluktuation
SELECT BusinessTravel, ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS fluktuationsrate
FROM employees
GROUP BY BusinessTravel
ORDER BY fluktuationsrate ASC;
-- ERGEBNIS : Häufige Reisen 24.91% vs keine Reisen 8.00% — 3x höher!

-- FRAGE 10 : Profil des typischen Abgängers
SELECT 
    ROUND(AVG(Age), 1)            AS durchschnittsalter,
    ROUND(AVG(MonthlyIncome), 0)  AS durchschnittsgehalt,
    ROUND(AVG(YearsAtCompany), 1) AS jahre_im_unternehmen,
    ROUND(AVG(DistanceFromHome), 1) AS entfernung_wohnort,
    ROUND(AVG(JobSatisfaction), 1) AS durchschnittszufriedenheit
FROM employees
WHERE Attrition = 'Yes';
-- ERGEBNIS : 33.6 Jahre, 4.787$, 5.1 Jahre, 10.6 km, 2.5/4 Zufriedenheit
