-- Datenbank per Menü angelegt: Beatles_Stones.db
-- Tabelle band_members angelegt:
/*
CREATE TABLE band_members (
    name TEXT NOT NULL,
    band TEXT NOT NULL
);
*/

INSERT INTO band_members (name, band)
VALUES
	('Mick', 'Stones'),
	('John', 'Beatles'),
	('Paul', 'Beatles');

CREATE TABLE band_instruments (
	name TEXT NOT NULL,
	plays TEXT NOT NULL
);

INSERT INTO band_instruments (name, plays)
VALUES
	('John', 'guitar'),
	('Paul', 'bass'),
	('Keith', 'guitar');
