SELECT * FROM KundenDB
	WHERE Artikel = "Kabel";

SELECT * FROM KundenDB
	WHERE Artikel = "Server";

-- So geht es doch

SELECT * FROM KundenDB
	WHERE Artikel LIKE "%Server%";

-- Aufgabe: Zeilen heraussuchen, in denen Switch vorkommt
