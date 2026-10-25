/* PLaneten zählen */

SELECT COUNT(*) FROM planet;


/* Skywalker-Familie finden */

select a.name as character, b.name as planet
from people a
inner join planet b on a.planet_id=b.id
where a.name like '%Skywalker%';


/* Personen mit Heimatplanet */

SELECT
    pe.name AS Person,
    pl.name AS Planet
FROM people AS pe
JOIN planet AS pl
    ON pe.planet_id = pl.id;

/* Personen mit Größe, Gewicht und planet */

SELECT
    pe.name,
    pe.height,
    pe.mass,
    pl.name AS Planet,
    pl.population
FROM people AS pe
JOIN planet AS pl
    ON pe.planet_id = pl.id
ORDER BY pe.height DESC;

/* Anzahl bekannter Personen pro Planet */

SELECT
    pl.name AS Planet,
    COUNT(*) AS AnzahlPersonen
FROM planet AS pl
JOIN people AS pe
    ON pe.planet_id = pl.id
GROUP BY pl.id, pl.name
ORDER BY AnzahlPersonen DESC;

/* Durchschnittliche Körpergröße je Planet */

SELECT
    pl.name AS Planet,
    ROUND(AVG(pe.height), 1) AS Durchschnittsgroesse
FROM planet AS pl
JOIN people AS pe
    ON pe.planet_id = pl.id
GROUP BY pl.id, pl.name
ORDER BY Durchschnittsgroesse DESC;

-- Aufgabe: Anzahl Personen hinzufügen, aus denen Durchschnitt berechnet wurde

/* Durchschnittliches Gewicht je Planet */

SELECT
    pl.name AS Planet,
    ROUND(AVG(pe.mass), 1) AS Durchschnittsgewicht
FROM planet AS pl
JOIN people AS pe
    ON pe.planet_id = pl.id
GROUP BY pl.id, pl.name
ORDER BY Durchschnittsgewicht DESC;

-- Aufgabe: Anzahl Personen hinzufügen, aus denen Durchschnitt berechnet wurde

/* Mehr Aggregatfunktionen */

SELECT
    pl.name AS Planet,
    COUNT(*) AS Personen,
    MIN(pe.height) AS KleinstePerson,
    ROUND(AVG(pe.height), 1) AS Durchschnittsgroesse,
    MAX(pe.height) AS GroesstePerson
FROM planet AS pl
JOIN people AS pe
    ON pe.planet_id = pl.id
GROUP BY pl.id, pl.name
ORDER BY Personen DESC;

/* Kombination aus Personenwerten und Planetenbevölkerung */

SELECT
    pl.name AS Planet,
    pl.population,
    COUNT(pe.id) AS Personen,
    ROUND(AVG(pe.mass), 1) AS Durchschnittsgewicht
FROM planet AS pl
JOIN people AS pe
    ON pe.planet_id = pl.id
GROUP BY pl.id, pl.name, pl.population
ORDER BY pl.population DESC;

/* Planeten mit mindestens zwei Personen in der Datenbank */

SELECT
    pl.name AS Planet,
    COUNT(pe.id) AS Personen
FROM planet AS pl
JOIN people AS pe
    ON pe.planet_id = pl.id
GROUP BY pl.id, pl.name
HAVING COUNT(pe.id) >= 2;

/* Planeten ohne Personen in people finden */

SELECT
    pl.name,
    COUNT(pe.id) AS Personen
FROM planet AS pl
LEFT JOIN people AS pe
    ON pe.planet_id = pl.id
GROUP BY pl.id, pl.name
ORDER BY Personen;


SELECT
    pl.name AS Planet,
    COUNT(pe.id) AS Personen,
    MIN(pe.height) AS MinGroesse,
    ROUND(AVG(pe.height), 1) AS Durchschnitt,
    MAX(pe.height) AS MaxGroesse
FROM planet AS pl
JOIN people AS pe
    ON pe.planet_id = pl.id
GROUP BY pl.id, pl.name
ORDER BY Durchschnitt DESC;

-- Warum müssen die Nicht-Aggregatspalten in GROUP BY stehen? (Tipp: GROUP-BY-Zeile auskommentieren)
-- Was passiert bei INNER JOIN (=JOIN) bzw. LEFT JOIN? (Tipp: JOIN durch LEFT JOIN ersetzen, Ergebnisse vergleichen)
-- Warum ist COUNT(*) hier nicht unbedingt dasselbe wie COUNT(pe.id)? (Stichwort: LEFT JOIN.)
--		Tipp: Folgenden Code ausführen

SELECT
    pl.name,
    COUNT(*) AS CountStern,
    COUNT(pe.id) AS CountID
FROM planet pl
LEFT JOIN people pe
    ON pe.planet_id = pl.id
GROUP BY pl.id, pl.name;