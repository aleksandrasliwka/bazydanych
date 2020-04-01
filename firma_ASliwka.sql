-- TABELA PRACOWNICY --
CREATE TABLE pracownicy(
Id_pracownika serial unique PRIMARY KEY NOT NULL, 
Nazwisko VARCHAR(50),
Imie VARCHAR(50),
Adres VARCHAR(100),
Telefon VARCHAR(12)
);

-- TABELA GODZINY --
CREATE TABLE godziny(
id_godziny serial unique PRIMARY KEY NOT NULL,
Data DATE,
Liczba_godzin INT,
Id_pracownika serial unique NOT NULL
);

-- TABELA PENSJE --
CREATE TABLE pensje(
Id_pensji serial unique PRIMARY KEY NOT NULL,
Stanowisko VARCHAR(50), 
Kwota int, 
Id_premii serial unique NOT NULL
);

-- TABELA PREMIE --
CREATE TABLE premie(
Id_premii serial unique PRIMARY KEY NOT NULL,
Rodzaj VARCHAR(40),
Kwota int
);

ALTER TABLE premie
ADD FOREIGN KEY (Id_premii) REFERENCES pensje(Id_premii);

ALTER TABLE godziny
ADD FOREIGN KEY(Id_pracownika) REFERENCES pracownicy(Id_pracownika);

INSERT INTO pracownicy VALUES(1, 'Jan', 'Kowalski', 'Miodowa 12', '336734219');
INSERT INTO pracownicy VALUES(2, 'Mikołaj', 'Guzik', 'Piłudskiego 2', '876567349');
INSERT INTO pracownicy VALUES(3, 'Antoni', 'Krupa', 'Warszawska 76', '656734912');
INSERT INTO pracownicy VALUES(4, 'Stanisław', 'Motyl', 'Krzywa 92', '52567349');
INSERT INTO pracownicy VALUES(5, 'Klaudia', 'Nowak', 'Deszczowa 34', '732167349');
INSERT INTO pracownicy VALUES(6, 'Maria', 'Krzak', 'Ciemna 9', '86734911');
INSERT INTO pracownicy VALUES(7, 'Szymon', 'Krukar', 'Zdrojowa 17', '432667349');
INSERT INTO pracownicy VALUES(8, 'Anna', 'Zięba', 'Nadbrzeżna 153', '678323990');
INSERT INTO pracownicy VALUES(9, 'Piotr', 'Mazur', 'Cicha 27', '543212334');
INSERT INTO pracownicy VALUES(10, 'Barbara', 'Dracz', 'Leśna 82', '555567349');

INSERT INTO godziny VALUES(1, '2020-03-23', 34, 1);
INSERT INTO godziny VALUES(2, '2020-03-23', 30, 9);
INSERT INTO godziny VALUES(3, '2020-03-23', 30, 5);
INSERT INTO godziny VALUES(4, '2020-03-23', 54, 4);
INSERT INTO godziny VALUES(5, '2020-03-23', 28, 3);
INSERT INTO godziny VALUES(6, '2020-03-23', 31, 6);
INSERT INTO godziny VALUES(7, '2020-03-23', 40, 7);
INSERT INTO godziny VALUES(8, '2020-03-23', 37, 8);
INSERT INTO godziny VALUES(9, '2020-03-23', 41, 2);
INSERT INTO godziny VALUES(10, '2020-03-23', 39, 10);

INSERT INTO pensje VALUES(1, 'Dyrektor biura zarządu', 8000.00,3);
INSERT INTO pensje VALUES(2, 'Sekretarka', 2600.00, 6);
INSERT INTO pensje VALUES(3, 'Kierownik projektu marketingowego', 3500.00, 9);
INSERT INTO pensje VALUES(4, 'Księgowy', 2500.00, 2);
INSERT INTO pensje VALUES(5, 'Kierownik ds. logistyki', 3500.00, 8);
INSERT INTO pensje VALUES(6, 'Kontroler finansowy', 3500.00, 10);
INSERT INTO pensje VALUES(7,'Menedżer produktu', 3000.00, 5);
INSERT INTO pensje VALUES(8, 'Grafik komputerowy',4000.00, 7);
INSERT INTO pensje VALUES(9, 'Programista', 4500.00, 4);
INSERT INTO pensje VALUES(10, 'Asystent w dziale księgowości', 2300.00, 1);

INSERT INTO premie VALUES(1, 'Premia regulaminowa', 500.00);
INSERT INTO premie VALUES(2, 'Premia uznaniowa', 700.00);
INSERT INTO premie VALUES(3, 'Premia zadaniowa', 400.00);
INSERT INTO premie VALUES(4, 'Premia motywacyjna', 400.00);
INSERT INTO premie VALUES(5, 'Premia indywidualna', 500.00);
INSERT INTO premie VALUES(6, 'Premia świąteczna', 500.00);
INSERT INTO premie VALUES(7, 'Premia rozdzielcza', 500.00);
INSERT INTO premie VALUES(8, 'Premia zespołowa', 300.00);
INSERT INTO premie VALUES(9, 'Premia kwartalna', 600.00);
INSERT INTO premie VALUES(10, 'Premia dla najlepszego pracownika', 1000.00);



