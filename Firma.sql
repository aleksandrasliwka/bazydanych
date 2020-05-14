-- dodanie schematu o nazwie ksiegowosc --
CREATE SCHEMA ksiegowosc;


-- tabela pracownicy --
CREATE TABLE ksiegowosc.pracownicy(
	id_pracownika SERIAL PRIMARY KEY UNIQUE NOT NULL,
	imie VARCHAR(20),
	nazwisko VARCHAR(40),
	adres VARCHAR(50),
	telefon VARCHAR(12));
	
COMMENT ON TABLE ksiegowosc.pracownicy IS 'Tabela z danymi pracowników firmy';



-- tabela godziny -- 
CREATE TABLE ksiegowosc.godziny(
	id_godziny VARCHAR(3) PRIMARY KEY UNIQUE NOT NULL,
	data DATE,
	liczba_godzin INT,
	id_pracownika SERIAL REFERENCES ksiegowosc.pracownicy(id_pracownika));

COMMENT ON TABLE ksiegowosc.godziny IS 'Tabela z ilością przepracowanych godzin przez pracowników firmy (standardowo -160h/miesiąc)';



-- tabela pensja --
CREATE TABLE ksiegowosc.pensja(
	id_pensji VARCHAR(3) PRIMARY KEY UNIQUE NOT NULL,
	stanowisko VARCHAR(30),
	kwota MONEY);
	
COMMENT ON TABLE ksiegowosc.pensja IS 'Tabela z poszczególnymi pensjami dla danego stanowiska';



-- tabela premia --
CREATE TABLE ksiegowosc.premia(
	id_premii VARCHAR(3) PRIMARY KEY UNIQUE NOT NULL,
	rodzaj VARCHAR(50), 
	kwota MONEY);

COMMENT ON TABLE ksiegowosc.premia IS 'Tabela z możliwymi do uzyskania premiami';



-- tabela wynagrodzenie --
CREATE TABLE ksiegowosc.wynagrodzenie(
	id_wynagrodzenia VARCHAR(3) PRIMARY KEY UNIQUE NOT NULL,
	data DATE,
	id_pracownika SERIAL REFERENCES ksiegowosc.pracownicy(id_pracownika),
	id_godziny VARCHAR(3) REFERENCES ksiegowosc.godziny(id_godziny),
	id_pensji VARCHAR(3) REFERENCES ksiegowosc.pensja(id_pensji),
	id_premii VARCHAR(3) REFERENCES ksiegowosc.premia(id_premii));

COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Tabela z zestawieniem wynagrodzeń dla każdego pracownika';



INSERT INTO ksiegowosc.pracownicy VALUES('1', 'Marek', 'Potocki', 'Długa 28', '829765989');
INSERT INTO ksiegowosc.pracownicy VALUES('2', 'Jan', 'Knap', 'Karmelicka 2', '413765989');
INSERT INTO ksiegowosc.pracownicy VALUES('3', 'Antoni', 'Adam', 'Krzywa 13', '312265960');
INSERT INTO ksiegowosc.pracownicy VALUES('4', 'Jerzy', 'Penar', 'Zdrojowa 2', '789456231');
INSERT INTO ksiegowosc.pracownicy VALUES('5', 'Michał', 'Zimka', '3 Maja 34', '891462896');
INSERT INTO ksiegowosc.pracownicy VALUES('6', 'Marian', 'Kowalski', 'Nadbrzeżna 67', '593812389');
INSERT INTO ksiegowosc.pracownicy VALUES('7', 'Patryk', 'Nowak', 'Podwale 45', '765989333');
INSERT INTO ksiegowosc.pracownicy VALUES('8', 'Szymon', 'Kałuża', 'Warszawska 90', '246712351');
INSERT INTO ksiegowosc.pracownicy VALUES('9', 'Klara', 'Pniak', 'Wiejska 9', '132765989');
INSERT INTO ksiegowosc.pracownicy VALUES('10', 'Wacław', 'Piasek', 'Rzeszowska 4', '765989111');

INSERT INTO ksiegowosc.godziny VALUES('g1', '13-02-2020', '160', '10');
INSERT INTO ksiegowosc.godziny VALUES('g2', '3-05-2020', '179', '9');
INSERT INTO ksiegowosc.godziny VALUES('g3', '1-03-2020', '150', '2');
INSERT INTO ksiegowosc.godziny VALUES('g4', '4-04-2020', '160', '3');
INSERT INTO ksiegowosc.godziny VALUES('g5', '23-02-2020', '160', '4');
INSERT INTO ksiegowosc.godziny VALUES('g6', '15-01-2020', '167', '1');
INSERT INTO ksiegowosc.godziny VALUES('g7', '22-03-2020', '170', '7');
INSERT INTO ksiegowosc.godziny VALUES('g8', '27-02-2020', '163', '5');
INSERT INTO ksiegowosc.godziny VALUES('g9', '11-03-2020', '190', '6');
INSERT INTO ksiegowosc.godziny VALUES('g10', '19-04-2020', '175', '8');

INSERT INTO ksiegowosc.pensja VALUES('p1', 'kierownik', '2500');
INSERT INTO ksiegowosc.pensja VALUES('p2', 'manager', '2100');
INSERT INTO ksiegowosc.pensja VALUES('p3', 'menadżer produktu', '1800');
INSERT INTO ksiegowosc.pensja VALUES('p4', 'informatyk', '4000');
INSERT INTO ksiegowosc.pensja VALUES('p5', 'kontroler finansowy', '3500');
INSERT INTO ksiegowosc.pensja VALUES('p6', 'dyrektor biura zarządu', '5000');
INSERT INTO ksiegowosc.pensja VALUES('p7', 'dostawca', '1600');
INSERT INTO ksiegowosc.pensja VALUES('p8', 'menadżer produktu', '2200');
INSERT INTO ksiegowosc.pensja VALUES('p9', 'księgowa', '2000');
INSERT INTO ksiegowosc.pensja VALUES('p10', 'sprzątaczka', '950');

INSERT INTO ksiegowosc.premia VALUES('b1', 'Premia regulaminowa', 500.00);
INSERT INTO ksiegowosc.premia VALUES('b2', 'Premia uznaniowa', 700.00);
INSERT INTO ksiegowosc.premia VALUES('b3', 'Premia zadaniowa', 400.00);
INSERT INTO ksiegowosc.premia VALUES('b4', 'Premia motywacyjna', 400.00);
INSERT INTO ksiegowosc.premia VALUES('b5', 'Premia indywidualna', 500.00);
INSERT INTO ksiegowosc.premia VALUES('b6', 'Premia świąteczna', 500.00);
INSERT INTO ksiegowosc.premia VALUES('b7', NULL, NULL);
INSERT INTO ksiegowosc.premia VALUES('b8', 'Premia zespołowa', 300.00);
INSERT INTO ksiegowosc.premia VALUES('b9', 'Premia kwartalna', 600.00);
INSERT INTO ksiegowosc.premia VALUES('b10', 'Premia dla najlepszego pracownika', 1000.00);

INSERT INTO ksiegowosc.wynagrodzenie VALUES('w1', '13-02-2020', '10', 'g1', 'p5', 'b7');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('w2', '3-05-2020', '9', 'g2', 'p4', 'b3');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('w3', '1-03-2020', '2', 'g3', 'p7', 'b4');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('w4', '4-04-2020', '6', 'g9', 'p1', 'b5');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('w5', '23-02-2020', '5', 'g8', 'p5', 'b7');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('w6', '15-01-2020', '1', 'g6', 'p2', 'b6');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('w7', '22-03-2020', '7', 'g7', 'p10', 'b8');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('w8', '27-02-2020', '4', 'g5', 'p8', 'b1');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('w9', '11-03-2020', '8', 'g10', 'p8', 'b9');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('w10', '19-04-2020', '3', 'g4', 'p8', 'b10');



-- a) wyświetlenie tylko id pracownika oraz jego nazwiska --
SELECT id_pracownika, nazwisko
FROM ksiegowosc.pracownicy KP

-- b) wyświetlenie id pracowników, których płaca jest większa niż 1000 --
SELECT id_pracownika
FROM ksiegowosc.wynagrodzenie KW, ksiegowosc.pensja PENSJA
WHERE PENSJA.id_pensji = KW.id_pensji AND PENSJA.kwota > '1000';

-- c) wyświetlenie id pracowników nieposiadających premii, których płaca jest większa niż 2000 --
SELECT id_pracownika
FROM ksiegowosc.wynagrodzenie KW, ksiegowosc.pensja PENSJA, ksiegowosc.premia PREMIA
WHERE PENSJA.id_pensji = KW.id_pensji  
AND PREMIA.id_premii = KW.id_premii 
AND PREMIA.kwota IS NULL AND PENSJA.kwota > '2000';

-- d) wyświetlenie pracowników, których pierwsza litera imienia zaczyna się na literę 'J' --
SELECT * FROM ksiegowosc.pracownicy
WHERE imie LIKE 'J%';

-- e) wyświetlenie pracowników, których nazwisko zawiera literę ‘n’ oraz imię kończy się na literę ‘a’--
SELECT * 
FROM ksiegowosc.pracownicy 
WHERE imie LIKE '%a' AND nazwisko LIKE '%n%';

-- f) wyświetlenie imienia i nazwiska pracowników oraz liczby ich nadgodzin, przyjmując, iż standardowy czas pracy to 160 h miesięcznie --
SELECT imie, nazwisko, (liczba_godzin - 160) AS nadgodziny
FROM ksiegowosc.pracownicy KP, ksiegowosc.godziny KG
WHERE KP.id_pracownika = KG.id_pracownika AND KG.liczba_godzin >160;

-- g) wyświetlenie imienia i nazwiska pracowników których pensja zawiera się w przedziale 1500 – 3000 PLN --
SELECT imie, nazwisko
FROM ksiegowosc.pracownicy KP, ksiegowosc.wynagrodzenie KW, ksiegowosc.pensja PENSJA
WHERE KP.id_pracownika = KW.id_pracownika AND PENSJA.id_pensji = KW.id_pensji 
AND PENSJA.kwota BETWEEN '1500' AND '3000';

-- h) wyświetlenie imienia i nazwiska pracowników, którzy pracowali w nadgodzinach i nie otrzymali premii --
SELECT imie, nazwisko 
FROM ksiegowosc.pracownicy KP, ksiegowosc.godziny KG, ksiegowosc.premia PREMIA, ksiegowosc.wynagrodzenie KW
WHERE KP.id_pracownika = KG.id_pracownika 
AND KG.id_godziny = KW.id_godziny 
AND PREMIA.id_premii = KW.id_premii
AND PREMIA.kwota IS NULL AND KG.liczba_godzin > 160;

-- i) uszeregowanie pracowników według pensji 
SELECT imie, nazwisko, kwota AS pensja 
FROM ksiegowosc.pracownicy KP, ksiegowosc.wynagrodzenie KW, ksiegowosc.pensja PENSJA
WHERE KP.id_pracownika = KW.id_pracownika AND  PENSJA.id_pensji = KW.id_pensji 
ORDER BY PENSJA.kwota;

-- j) uszeregowanie pracowników według pensji i premii malejąco --
SELECT imie, nazwisko, PENSJA.kwota AS pensja, PREMIA.kwota AS premia
FROM ksiegowosc.pracownicy KP, ksiegowosc.wynagrodzenie KW, ksiegowosc.pensja PENSJA, ksiegowosc.premia PREMIA
WHERE KW.id_pracownika = KP.id_pracownika 
AND PENSJA.id_pensji = KW.id_pensji  
AND PREMIA.id_premii = KW.id_premii 
ORDER BY PENSJA.kwota DESC, PREMIA.kwota DESC;

-- k) zliczenie i pogrupowanie pracowników według pola ‘stanowisko’
SELECT COUNT(stanowisko) AS liczba_stanowisko, stanowisko 
FROM ksiegowosc.pensja PENSJA
JOIN ksiegowosc.wynagrodzenie KW
ON PENSJA.id_pensji = KW.id_pensji 
GROUP BY(stanowisko);

-- l) policzenie średniej, minimalnej i maksymalnej płacy dla stanowiska ‘menadżer produktu’ --
SELECT AVG(kwota::money::numeric::float8) AS średnia_płaca, MIN(kwota), MAX(kwota) 
FROM ksiegowosc.pensja PENSJA
WHERE stanowisko LIKE 'menadżer produktu';

-- m) policzenie sumy wszystkich wynagrodzeń --
SELECT SUM(pensja.kwota)+SUM(premia.kwota) AS suma_wynagrodzeń 
FROM ksiegowosc.pensja PENSJA, ksiegowosc.premia PREMIA, ksiegowosc.wynagrodzenie KW
WHERE PENSJA.id_pensji = KW.id_pensji
AND PREMIA.id_premii = KW.id_premii;

-- n) policzenie sumy wynagrodzeń w ramach danego stanowiska --
SELECT stanowisko, 
SUM(pensja.kwota)+ SUM(premia.kwota) AS suma_wynagrodzeń_stanowisko 
FROM ksiegowosc.pensja PENSJA, ksiegowosc.premia PREMIA, ksiegowosc.wynagrodzenie KW
WHERE  PENSJA.id_pensji = KW.id_pensji
AND PREMIA.id_premii = KW.id_premii 
GROUP BY (stanowisko);

-- o) wyznaczenie liczby premii przyznanych dla pracowników danego stanowiska --
SELECT COUNT(rodzaj) AS liczba_premii, stanowisko
FROM ksiegowosc.premia PREMIA, ksiegowosc.wynagrodzenie KW, ksiegowosc.pensja PENSJA
WHERE PREMIA.id_premii = KW.id_premii
AND PENSJA.id_pensji = KW.id_pensji
GROUP BY (stanowisko);

-- p) usunięcie wszystkich pracowników mających pensję mniejszą niż 1200 zł --
DELETE FROM  ksiegowosc.wynagrodzenie KW    
USING ksiegowosc.pensja PENSJA
WHERE PENSJA.id_pensji = KW.id_pensji AND PENSJA.kwota < '1200' ;