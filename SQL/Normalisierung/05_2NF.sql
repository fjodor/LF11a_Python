CREATE TABLE Bestellung_2NF (
    BestellNr INTEGER PRIMARY KEY,
	Datum DATE, 
    KundenName TEXT,
    KundenOrt TEXT
);

CREATE TABLE Bestellposition_2NF (
    BestellNr INTEGER,
    Artikel TEXT,
    Preis REAL,
    PRIMARY KEY (BestellNr, Artikel),
    FOREIGN KEY (BestellNr)
        REFERENCES Bestellung_2NF(BestellNr)
);

INSERT INTO Bestellung_2NF (
    BestellNr,
    Datum,
    KundenName,
    KundenOrt
)
VALUES
(
    1001,
    '2026-10-01',
    'Müller GmbH',
    'Berlin'
),
(
    1002,
    '2026-10-02',
    'Schulze AG',
    'Hamburg'
);

INSERT INTO Bestellposition_2NF (
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

SELECT * FROM Bestellung_2NF;
SELECT * FROM Bestellposition_2NF;

-- Alle Infos: JOIN

SELECT * FROM Bestellung_2NF as b
	JOIN Bestellposition_2NF as p
		ON b.BestellNr = p.BestellNr;
		
-- BestellNr nur 1x anzeigen

SELECT * FROM Bestellung_2NF as b
	JOIN Bestellposition_2NF as p
		USING (BestellNr);

-- Änderungen schreiben klicken!