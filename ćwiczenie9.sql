--zadanie 1 --
-- Napisz procedur� wypisuj�c� do konsoli ci�g Fibonacciego. 
-- Procedura musi przyjmowa� jako argument wej�ciowy liczb� n. 
-- Generowanie ci�gu Fibonacciego musi zosta� zaimplementowane jako osobna funkcja, wywo�ywana przez procedur�.

CREATE FUNCTION CIAG_FIB (@LICZBA INT)
RETURNS @FIBONACCI TABLE (CIAG_FIBONACCIEGO INT)

BEGIN
	DECLARE @FIB INT = 0; 
	DECLARE @L1 INT = 1; 
	DECLARE @L2 INT = 1;	
	DECLARE @ILOSC INT = 1;

	WHILE @ILOSC <= @LICZBA
	BEGIN
		IF @ILOSC = 1 OR @ILOSC = 2 
			BEGIN 
				SET @FIB = 1;
				INSERT INTO @FIBONACCI SELECT @FIB;
			END;
		ELSE
			BEGIN
				SET @FIB = @L1 + @L2;
				SET @L1 = @L2;
				SET @L2 = @FIB;
				INSERT INTO @FIBONACCI SELECT @FIB;
			END;
		SET @ILOSC = @ILOSC + 1;
		END;
	RETURN;
END;
GO
CREATE PROCEDURE C_FIB @LICZBA INT
AS SELECT * FROM dbo.CIAG_FIB(@LICZBA);
EXEC C_FIB @LICZBA=13;

-------------------------------------------------------------------------
-- zadanie 2
-- Napisz trigger DML, kt�ry po wprowadzeniu danych do tabeli Persons 
-- zmodyfikuje nazwisko tak, aby by�o napisane du�ymi literami. 

CREATE TRIGGER UP_NAZWISKO ON AdventureWorks2017.Person.Person  
FOR UPDATE AS UPDATE AdventureWorks2017.Person.Person SET LastName=UPPER(LastName)

UPDATE AdventureWorks2017.Person.Person SET FirstName='Marek' WHERE BusinessEntityID = 273;

SELECT * FROM  AdventureWorks2017.Person.Person

-------------------------------------------------------------------------
-- zadanie 3
-- Przygotuj trigger �taxRateMonitoring�, 
-- kt�ry wy�wietli komunikat o b��dzie, je�eli nast�pi zmiana warto�ci w polu �TaxRate� o wi�cej ni� 30%.

CREATE TRIGGER taxRateMonitoring ON Sales.SalesTaxRate
AFTER UPDATE AS
BEGIN
	DECLARE @NOWYTAX FLOAT = (SELECT TaxRate FROM INSERTED);
	DECLARE @TAX FLOAT= (SELECT TaxRate FROM DELETED);
	DECLARE @PROCENT FLOAT = 0.3*@TAX;

	IF (@NOWYTAX >@TAX + @PROCENT) OR (@NOWYTAX < @TAX - @PROCENT)
		PRINT 'B��D: ZMIANA WARTO�CI W POLU "TaxRate" PRZEKROCZY�A 30%'
		ROLLBACK;
	END
SELECT * FROM Sales.SalesTaxRate;
UPDATE Sales.SalesTaxRate SET TaxRate = '1' WHERE SalesTaxRateID = 5;
SELECT * FROM Sales.SalesTaxRate WHERE SalesTaxRateID = 5;
