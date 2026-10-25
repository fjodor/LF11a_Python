ALTER TABLE Bestellung_2NF
	ADD COLUMN PLZ TEXT;

SELECT * FROM Bestellung_2NF;
	
UPDATE Bestellung_2NF
	SET PLZ = '10115'
	WHERE BestellNr = 1001;

UPDATE Bestellung_2NF
	SET PLZ = '20095'
	WHERE BestellNr = 1002;

SELECT * FROM Bestellung_2NF;

-- Wovon hängt der Ort ab?

INSERT INTO Bestellung_2NF (
	BestellNr,
	Datum,
	KundenName,
	KundenOrt,
	PLZ
)
VALUES (
	1003,
	'2026-10-04',
	'Meier AG',
	'Berlin',
	'10115'
);

SELECT * FROM Bestellung_2NF;

-- Änderungen schreiben

UPDATE Bestellung_2NF
	SET KundenOrt = 'Bärlin'
	WHERE BestellNr = 1001;

SELECT * FROM Bestellung_2NF;

-- Welche Anomalie?

-- Änderungen rückgängig machen
