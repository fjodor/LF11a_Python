/*
DB angelegt mit Tabelle Tierkategorie und ihren beiden Spalten
*/

INSERT INTO Tierkategorie (TK_ID, TK_Kategorie)
VALUES
	('1', 'Kühe'),
	('2', 'Schweine'),
	('3', 'Hühner');

CREATE TABLE Tierbestand (
    TB_ID           INTEGER PRIMARY KEY,
    TB_TKID         INTEGER,
    TB_ChipNr       TEXT NOT NULL,
    TB_GebDat       DATE NOT NULL,
    TB_SchlachtDat  DATE,

    FOREIGN KEY (TB_TKID)
        REFERENCES Tierkategorie (TK_ID)
);

INSERT INTO Tierbestand (TB_ID, TB_TKID, TB_ChipNr, TB_GebDat, TB_SchlachtDat)
VALUES
	('1001', '2', 'S03-333-567', '2022-01-03', NULL),
	('1002', '2', 'S03-343-566', '2022-01-05', NULL),
	('1003', '1', 'K77-899988', '2021-08-12', NULL),
	('1004', '2', 'S12-222-322', '2024-11-03', NULL);

CREATE TABLE TierZusatzInfo (
	TZI_ID			INTEGER PRIMARY KEY,
	TZI_TBID		INTEGER,
	TZI_ErfasstAm	DATE NOT NULL,
	TZI_Gewicht		INTEGER,
	TZI_Bemerkung	TEXT,
	
	FOREIGN KEY (TZI_TBID)
		REFERENCES Tierbestand (TB_ID)
);

INSERT INTO TierZusatzInfo (TZI_ID, TZI_TBID, TZI_ErfasstAm, TZI_Gewicht, TZI_Bemerkung)
VALUES
	('1', '1003', '2026-02-12', '334', 'ohne Befund'),
	('2', '1001', '2026-02-12', '655', 'ohne Befund'),
	('3', '1003', '2026-03-11', '342', 'schläfrig'),
	('4', '1003', '2026-04-12', '344', 'ohne Befund');

-- Archiv_Tierbestand anlegen

