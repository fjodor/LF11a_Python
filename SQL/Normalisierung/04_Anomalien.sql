SELECT * FROM Bestellung_1NF;

-- Wie lautet der Primärschlüssel?
-- Von welcher Spalte hängt der Preis ab?
-- Von welcher Spalte hängt der KundenName ab?
-- Von welcher Spalte hängt der KundenOrt ab?

-- Annahme: Müller GmbH zieht von Berlin nach Potsdam
-- Ein Kollege aktualisiert die Bestellung, an der er gerade arbeitet:

UPDATE Bestellung_1NF
	SET KundenOrt = 'Potsdam'
	WHERE BestellNr = 1001
		AND Artikel = 'Switch';

SELECT * FROM Bestellung_1NF;

-- Welche Anomalie?

-- Rückgängig machen

ROLLBACK;
SELECT * FROM Bestellung_1NF;


-- Annahme: Es soll ein neuer Kunde angelegt werden, der noch nichts bestellt hat
-- ABER Felder Datum, Artikel, Preis sollen nicht leer bleiben
-- Welche Anomalie?

-- Annahme: die letzte Bestellung eines Kunden wird gelöscht (z. B. weil er storniert hat)

DELETE FROM Bestellung_1NF
	WHERE BestellNr = 1002;
	
SELECT * FROM Bestellung_1NF;

-- Informationen über den Kunden sind verloren!
-- Welche Anomalie?

-- Rückgängig machen

ROLLBACK;
SELECT * FROM Bestellung_1NF;
