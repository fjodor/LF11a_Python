SELECT * FROM band_members;

SELECT * FROM band_instruments;

/* 
Mick nur in band_members
Keith nur in band_instruments
*/

-- LEFT JOIN

SELECT
	m.name,
	m.band,
	i.plays
FROM band_members AS m
LEFT JOIN band_instruments AS i
	ON m.name = i.name;

-- RIGHT JOIN

SELECT
	i.name,
	m.band,
	i.plays
FROM band_members AS m
RIGHT JOIN band_instruments AS i
	ON i.name = m.name;

-- Aufgabe: Gleiches Ergebnis erhalten, aber mit LEFT JOIN

SELECT
	i.name,
	m.band,
	i.plays
FROM band_instruments AS i
LEFT JOIN band_members AS m
	ON i.name = m.name;
	
-- INNER JOIN

SELECT
	i.name,
	m.band,
	i.plays
FROM band_instruments AS i
INNER JOIN band_members AS m
	ON i.name = m.name;

-- FULL JOIN
-- SQLite bietet kein FULL OUTER JOIN ...

SELECT
	m.name,
	m.band,
	i.plays
FROM band_members AS m
FULL JOIN band_instruments AS i
	ON i.name = m.name;

-- Nachbau FULL OUTER JOIN mit zwei JOINs und UNION

SELECT
    m.name,
    m.band,
    i.plays
FROM band_members AS m
LEFT JOIN band_instruments AS i
    ON m.name = i.name

UNION

SELECT
    m.name,
    m.band,
    i.plays
FROM band_instruments AS i
LEFT JOIN band_members AS m
    ON i.name = m.name;

-- Besser:

SELECT
    COALESCE(m.name, i.name) AS name,
    m.band,
    i.plays
FROM band_members AS m
FULL JOIN band_instruments AS i
    ON m.name = i.name;

-- COALESCE() nimmt den ersten Nicht-NULL-Wert
