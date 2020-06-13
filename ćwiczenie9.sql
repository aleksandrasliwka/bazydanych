--zadanie 1 --
-- Napisz procedurê wypisuj¹c¹ do konsoli ci¹g Fibonacciego. 
-- Procedura musi przyjmowaæ jako argument wejœciowy liczbê n. 
-- Generowanie ci¹gu Fibonacciego musi zostaæ zaimplementowane jako osobna funkcja, wywo³ywana przez procedurê.

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
-- Napisz trigger DML, który po wprowadzeniu danych do tabeli Persons 
-- zmodyfikuje nazwisko tak, aby by³o napisane du¿ymi literami. 

CREATE TRIGGER UP_NAZWISKO ON AdventureWorks2017.Person.Person  
FOR UPDATE AS UPDATE AdventureWorks2017.Person.Person SET LastName=UPPER(LastName)

UPDATE AdventureWorks2017.Person.Person SET FirstName='Marek' WHERE BusinessEntityID = 273;

SELECT * FROM  AdventureWorks2017.Person.Person

-------------------------------------------------------------------------
-- zadanie 3
-- Przygotuj trigger ‘taxRateMonitoring’, 
-- który wyœwietli komunikat o b³êdzie, je¿eli nast¹pi zmiana wartoœci w polu ‘TaxRate’ o wiêcej ni¿ 30%.

CREATE TRIGGER taxRateMonitoring ON Sales.SalesTaxRate
AFTER UPDATE AS
BEGIN
	DECLARE @NOWYTAX FLOAT = (SELECT TaxRate FROM INSERTED);
	DECLARE @TAX FLOAT= (SELECT TaxRate FROM DELETED);
	DECLARE @PROCENT FLOAT = 0.3*@TAX;

	IF (@NOWYTAX >@TAX + @PROCENT) OR (@NOWYTAX < @TAX - @PROCENT)
		PRINT 'B£¥D: ZMIANA WARTOŒCI W POLU "TaxRate" PRZEKROCZY£A 30%'
		ROLLBACK;
	END
SELECT * FROM Sales.SalesTaxRate;
UPDATE Sales.SalesTaxRate SET TaxRate = '1' WHERE SalesTaxRateID = 5;
SELECT * FROM Sales.SalesTaxRate WHERE SalesTaxRateID = 5;
