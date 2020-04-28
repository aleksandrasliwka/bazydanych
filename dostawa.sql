CREATE SCHEMA dostawa

-- TABELA DOSTAWCY --
CREATE TABLE dostawa.dostawcy(
	IdDostawcy VARCHAR(3) PRIMARY KEY UNIQUE NOT NULL,
	Dostawca VARCHAR(40), 
	Miasto VARCHAR(20),
	KodPocztowy VARCHAR(6),
	Ulica VARCHAR(30),
	Numer VARCHAR(7)
);

-- TABELA PRODUKTY--
CREATE TABLE dostawa.produkty(
	IdProduktu VARCHAR(5) PRIMARY KEY UNIQUE NOT NULL,
	NazwaProduktu VARCHAR(30), 
	CenaNetto MONEY,
	CenaBrutto MONEY
);

-- TABELA ZAMOWIENIA--
CREATE TABLE dostawa.zamowienia(
	IdZamowienia VARCHAR(3) PRIMARY KEY UNIQUE NOT NULL,
	IdDostawcy VARCHAR(40) REFERENCES dostawa.dostawcy(IdDostawcy),
	IdProduktu VARCHAR(5) REFERENCES dostawa.produkty(IdProduktu)
);

INSERT INTO dostawa.dostawcy VALUES('MP', 'Makarony Polskie', 'Kraków', '31-435', 'Turystyczna', '40');
INSERT INTO dostawa.dostawcy VALUES('LM', 'Lubelski Makaron', 'Lublin', '04-242', 'Piłsudskiego', '332a');
INSERT INTO dostawa.dostawcy VALUES('PlP', 'Polskie Przetwory', 'Kraków', '31-342', 'Wojska Polskiego', '44a');
INSERT INTO dostawa.dostawcy VALUES('PP', 'Przetwory Pomidorowe', 'Tarnów', '30-243', 'Rolnicza', '22/4');
INSERT INTO dostawa.dostawcy VALUES('MS', 'Małopolskie Smaki', 'Nowy Targ', '35-434', 'Mickiewicza', '223/77');

INSERT INTO dostawa.produkty VALUES('M.N.', 'Makaron Nitki', '130,00', '150,00');
INSERT INTO dostawa.produkty VALUES('K.P.', 'Keczup pikantny', '200,00', '220,00');
INSERT INTO dostawa.produkty VALUES('S.P.', 'Sos pomidorowy', '89,00', '110,00');

INSERT INTO dostawa.zamowienia VALUES('Z1.', 'MP', 'M.N.');
INSERT INTO dostawa.zamowienia VALUES('Z2.', 'LM', 'M.N.');
INSERT INTO dostawa.zamowienia VALUES('Z3.', 'PlP', 'K.P.');
INSERT INTO dostawa.zamowienia VALUES('Z4.', 'PP', 'K.P.');
INSERT INTO dostawa.zamowienia VALUES('Z5.', 'PlP', 'S.P.');
INSERT INTO dostawa.zamowienia VALUES('Z6.', 'MS', 'S.P.');
