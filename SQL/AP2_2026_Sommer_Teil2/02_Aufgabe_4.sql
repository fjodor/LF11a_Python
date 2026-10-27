SELECT TB_ID, TB_GebDat
FROM Tierbestand;

-- Datumsformat?

SELECT
    TB_GebDat,
    strftime('%Y', TB_GebDat)
FROM Tierbestand;

SELECT tk.TK_Kategorie,
	COUNT(tb.TB_ID) AS AnzahlTiere,
	/* MAX(tzi.MaxGewicht) AS SchwerstesTier,
	MAX(DATEDIFF(YEAR, tb.TB_GebDat, NOW())) AS ÄltestesTier,
	AVG(DATEDIFF(YEAR, tb.TB_GebDat, NOW())) AS DurchschnittAlter */  -- geht nicht in Sqlite
    MAX(
        CAST(strftime('%Y', 'now') AS INTEGER)
        - CAST(strftime('%Y', tb.TB_GebDat) AS INTEGER)
    ) AS ÄltestesTier,
    AVG(
        CAST(strftime('%Y', 'now') AS INTEGER)
        - CAST(strftime('%Y', tb.TB_GebDat) AS INTEGER)
    ) AS DurchschnittAlter

FROM
	Tierkategorie tk
LEFT JOIN
	Tierbestand tb ON tk.TK_ID = tb.TB_TKID
	AND tb.TB_SchlachtDat IS NULL
LEFT JOIN (
	SELECT TZI_TBID, MAX(TZI_Gewicht) AS MaxGewicht
	FROM TierZusatzInfo
	GROUP BY TZI_TBID) tzi
	ON tb.TB_ID = tzi.TZI_TBID
GROUP BY
	tk.TK_Kategorie;