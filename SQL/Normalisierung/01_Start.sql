-- Tabelle anlegen

CREATE TABLE KundenDB (
    BestellNr INTEGER PRIMARY KEY,
    Datum TEXT,
    KundenName TEXT,
    KundenOrt TEXT,
    Artikel TEXT,
    Preis TEXT
);

-- Tabelle befüllen

INSERT INTO KundenDB (
    BestellNr,
    Datum,
    KundenName,
    KundenOrt,
    Artikel,
    Preis
)
VALUES
(
    1001,
    '2026-10-01',
    'Müller GmbH',
    'Berlin',
    'Server, Switch',
    '5000, 500'
),
(
    1002,
    '2026-10-02',
    'Schulze AG',
    'Hamburg',
    'Kabel',
    '50'
);

-- Test

SELECT * FROM KundenDB