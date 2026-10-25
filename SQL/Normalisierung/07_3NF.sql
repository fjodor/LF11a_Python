CREATE TABLE Ort_3NF (
	PLZ TEXT PRIMARY KEY,
	Ort TEXT NOT NULL
);

CREATE TABLE Bestellung_3NF (
    BestellNr INTEGER PRIMARY KEY,
    Datum DATE,
    KundenName TEXT,
    PLZ TEXT,
    FOREIGN KEY (PLZ)
        REFERENCES Ort_3NF(PLZ)
);

INSERT INTO Ort_3NF (
    PLZ,
    Ort
)
VALUES
(
    '10115',
    'Berlin'
),
(
    '20095',
    'Hamburg'
);

INSERT INTO Bestellung_3NF (
    BestellNr,
    Datum,
    KundenName,
    PLZ
)
VALUES
(
    1001,
    '2026-10-01',
    'Müller GmbH',
    '10115'
),
(
    1002,
    '2026-10-02',
    'Schulze AG',
    '20095'
);

CREATE TABLE Bestellposition_3NF (
    BestellNr INTEGER,
    Artikel TEXT,
    Preis REAL,
    PRIMARY KEY (BestellNr, Artikel),
    FOREIGN KEY (BestellNr)
        REFERENCES Bestellung_3NF(BestellNr)
);

INSERT INTO Bestellposition_3NF (
    BestellNr,
    Artikel,
    Preis
)
VALUES
(
    1001,
    'Server',
    5000
),
(
    1001,
    'Switch',
    500
),
(
    1002,
    'Kabel',
    50
);

-- Kontrolle

SELECT * FROM Ort_3NF;
SELECT * FROM Bestellung_3NF;
SELECT * FROM Bestellposition_3NF;

SELECT
    b.BestellNr,
    b.Datum,
    b.KundenName,
    o.PLZ,
    o.Ort,
    p.Artikel,
    p.Preis
FROM Bestellung_3NF AS b
JOIN Ort_3NF AS o
    ON b.PLZ = o.PLZ
JOIN Bestellposition_3NF AS p
    USING (BestellNr);

-- Änderungen schreiben klicken

-- Jetzt besser:

UPDATE Ort_3NF
	SET Ort = 'Berlin-Mitte'
	WHERE PLZ = '10115';
	
SELECT * FROM Ort_3NF;


-- Änderungen rückgängig machen klicken
	
-- Aufgabe: MwStSatz in Bestellposition_2NF einfügen
-- Wovon hängt MwStSatz ab?
-- Neue Bestellung anlegen: weiterer Server
-- MwSt-Satz für Server wird geändert: KI-Förderungsgesetz senkt MwSt nur für Server auf 15%
-- Änderungsanomalie zeigen
-- Lösung in 3NF erstellen; Tipp: neue Tabelle anlegen

