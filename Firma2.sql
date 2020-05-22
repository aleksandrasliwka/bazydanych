-- a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodając do niego kierunkowy dla Polski w nawiasie (+48) --
UPDATE ksiegowosc.pracownicy SET telefon = '(+48)' || telefon

--------------------------------------------------------------------------------------------------------------------
-- b) Zmodyfikuj atrybut telefonu tabeli pracownicy tak, aby numer oddzielony był myślnikami wg wzoru: ‘555-222-333’ 
-- dla numeru nie zawierającego (+48) --
UPDATE ksiegowosc.pracownicy KP SET telefon = SUBSTRING(telefon, 1, 3)
|| '-'|| SUBSTRING(telefon, 3, 3)|| '-'||SUBSTRING(telefon, 6, 3) 

-- dla numeru po modyfikacji (+48) --
UPDATE ksiegowosc.pracownicy KP SET telefon = SUBSTRING(telefon, 1, 8)
|| '-'|| SUBSTRING(telefon, 9, 3)|| '-'||SUBSTRING(telefon, 12, 3) 

--------------------------------------------------------------------------------------------------------------------
-- c) Wyświetl dane pracownika, którego nazwisko jest najdłuższe, używając dużych liter --
SELECT UPPER(nazwisko) AS najdłuższe_drukowanymi FROM ksiegowosc.pracownicy KP
WHERE LENGTH(nazwisko) = (SELECT MAX(LENGTH(nazwisko)) FROM ksiegowosc.pracownicy KP )

--------------------------------------------------------------------------------------------------------------------
-- d) Wyświetl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5 --
SELECT KP.*, MD5('kwota') AS md5_pensja 
FROM ksiegowosc.wynagrodzenie KW, ksiegowosc.pracownicy KP
WHERE KW.id_pracownika = KP.id_pracownika 

--------------------------------------------------------------------------------------------------------------------
-- f) Wyświetl pracowników, ich pensje oraz premie. Wykorzystaj złączenie lewostronne. --
SELECT  KP.* , PENSJA.kwota AS pensja, PREMIA.kwota AS premia
FROM ksiegowosc.pracownicy KP
LEFT JOIN ksiegowosc.wynagrodzenie KW
ON KW.id_pracownika = KP.id_pracownika 
LEFT JOIN ksiegowosc.pensja PENSJA
ON KW.id_pensji = PENSJA.id_pensji  
LEFT JOIN ksiegowosc.premia PREMIA
ON KW.id_premii = PREMIA.id_premii 

--------------------------------------------------------------------------------------------------------------------
-- g) wygeneruj raport (zapytanie), które zwróciw wyniki treść wg poniższego szablonu: --
	-- Pracownik Jan Nowak, w dniu 7.08.2017 otrzymał pensję całkowitą na kwotę 7540 zł, -- 
	-- gdzie wynagrodzenie zasadnicze wynosiło: 5000 zł, premia: 2000 zł, nadgodziny: 540 zł -- 

SELECT CONCAT('Pracownik ', KP.imie, ' ', KP.nazwisko,' w dniu ', KG.data, ' otrzymał pensję całkowitą na kwotę ', 
			  (PENSJA.kwota + PREMIA.kwota),', gdzie wynagrodzenie zasadnicze wynosiło: ', PENSJA.kwota, ', premia: ',
			  PREMIA.kwota, ', nadgodziny: ',(liczba_godzin - 160 )) AS raport
FROM ksiegowosc.pracownicy KP, ksiegowosc.godziny KG, ksiegowosc.premia PREMIA, ksiegowosc.pensja PENSJA, ksiegowosc.wynagrodzenie KW
WHERE KW.id_pracownika = KP.id_pracownika
AND KW.id_godziny = KG.id_godziny
AND KW.id_pensji = PENSJA.id_pensji
AND KW.id_premii = PREMIA.id_premii

--------------------------------------------------------------------------------------------------------------------


