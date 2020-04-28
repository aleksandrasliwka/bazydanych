CREATE SCHEMA dentysta

-- TABELA PRACOWNICY --
CREATE TABLE dentysta.pracownicy(
	IdPracownika VARCHAR(5) PRIMARY KEY UNIQUE NOT NULL,
	ImieLekarza VARCHAR(20), 
	NazwiskoLekarza VARCHAR(50)
);

-- TABELA PACJENCI--
CREATE TABLE dentysta.pacjenci(
	IdPacjenta VARCHAR(5) PRIMARY KEY UNIQUE NOT NULL,
	ImiePacjenta VARCHAR(50), 
	NazwiskoPacjenta VARCHAR(50)
);

-- TABELA ZABIEGI--
CREATE TABLE dentysta.zabiegi(
	IdZabiegu VARCHAR(4) PRIMARY KEY UNIQUE NOT NULL,
	NazwaZabiegu VARCHAR(25)
);

-- TABELA WIZYTY--
CREATE TABLE dentysta.wizyty(
	IdWizyty serial unique PRIMARY KEY NOT NULL,
	IdPracownika VARCHAR(5) REFERENCES dentysta.pracownicy(IDPracownika),
	IdPacjenta VARCHAR(5) REFERENCES dentysta.pacjenci(IDPacjenta),
	DataWizyty DATE,
	GodzinaWizyty TIME,
	IdZabiegu VARCHAR(4) REFERENCES dentysta.zabiegi(IDZabiegu)
);

INSERT INTO dentysta.pracownicy VALUES('S1011', 'Maria', 'Nowak');
INSERT INTO dentysta.pracownicy VALUES('S1024', 'Jan', 'Kowalski');
INSERT INTO dentysta.pracownicy VALUES('S1045', 'Anna', 'Jabłońska');
INSERT INTO dentysta.pracownicy VALUES('S1034', 'Marek', 'Potocki');

INSERT INTO dentysta.pacjenci VALUES('P100', 'Anna', 'Jeleń');
INSERT INTO dentysta.pacjenci VALUES('P105', 'Jarosław', 'Nicpoń');
INSERT INTO dentysta.pacjenci VALUES('P108', 'Joanna', 'Nosek');
INSERT INTO dentysta.pacjenci VALUES('P120', 'Jan', 'Kałuża');
INSERT INTO dentysta.pacjenci VALUES('P130', 'Jerzy', 'Lis');
INSERT INTO dentysta.pacjenci VALUES('P123', 'Olga', 'Nowacka');

INSERT INTO dentysta.zabiegi VALUES('Z500', 'Borowanie');
INSERT INTO dentysta.zabiegi VALUES('Z496', 'Lakowanie');
INSERT INTO dentysta.zabiegi VALUES('Z503', 'Usuwanie kamienia');

INSERT INTO dentysta.wizyty VALUES('1', 'S1011', 'P100', '12.03.2020', '10:00', 'Z500');
INSERT INTO dentysta.wizyty VALUES('2', 'S1011', 'P105', '12.03.2020', '13:00', 'Z496');
INSERT INTO dentysta.wizyty VALUES('3', 'S1011', 'P108', '14.03.2020', '10:00', 'Z500');
INSERT INTO dentysta.wizyty VALUES('4', 'S1024', 'P108', '16.03.2020', '17:00', 'Z503');
INSERT INTO dentysta.wizyty VALUES('5', 'S1045', 'P120', '18.03.2020', '09:00', 'Z500');
INSERT INTO dentysta.wizyty VALUES('6', 'S1034', 'P130', '20.03.2020', '08:00', 'Z496');
INSERT INTO dentysta.wizyty VALUES('7', 'S1034', 'P123', '12.03.2020', '15:00', 'Z503');

