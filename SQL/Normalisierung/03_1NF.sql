-- Tabelle in erster Normalform

CREATE TABLE Bestellung_1NF (
    BestellNr INTEGER,
    Datum TEXT,
    KundenName TEXT,
    KundenOrt TEXT,
    Artikel TEXT,
    Preis REAL
);

INSERT INTO Bestellung_1NF
VALUES
(
    1001,
    '2026-10-01',
    'Müller GmbH',
    'Berlin',
    'Server',
    5000
),
(
    1001,
    '2026-10-01',
    'Müller GmbH',
    'Berlin',
    'Switch',
    500
),
(
    1002,
    '2026-10-02',
    'Schulze AG',
    'Hamburg',
    'Kabel',
    50
);

-- Kontrolle

SELECT * FROM Bestellung_1NF;

-- Änderungen schreiben klicken!

-- Abfragen

SELECT * FROM Bestellung_1NF
	WHERE Artikel = "Server";

-- Aufgabe: Alle Zeilen, in denen Switch bestellt wurde


-- Aufgabe: Alle Zeilen der Bestellung Nr. 1001

