-- zadanie 1 --
-- Przygotuj blok anonimowy, kt�ry:
--	-znajdzie �redni� stawk� wynagrodzenia pracownik�w,
--	-wy�wietli szczeg�ypracownik�w, kt�rych stawka wynagrodzenia jest ni�sza ni� �rednia. 

BEGIN
	SELECT AVG(Rate) AS �R_STAWKA FROM AdventureWorks2017.HumanResources.EmployeePayHistory HR_EPH;

	SELECT HR_E.*, HR_EPH.Rate FROM  AdventureWorks2017.HumanResources.Employee HR_E, AdventureWorks2017.HumanResources.EmployeePayHistory HR_EPH
	WHERE HR_EPH.BusinessEntityID = HR_E.BusinessEntityID AND HR_EPH.Rate < ( SELECT AVG(Rate) FROM AdventureWorks2017.HumanResources.EmployeePayHistory );
END;
--------------------------------------------------------------------------------------------------------------------------------
-- zadanie 2 --
-- Utw�rz funkcj�, kt�ra zwr�ci dat� wysy�ki okre�lonego zam�wienia.

CREATE FUNCTION DATA_WYSYLKI(@ID_ZAMOWIENIA INT)
RETURNS TABLE AS
RETURN(
	SELECT P_POH.ShipDate AS DATA_WYS FROM AdventureWorks2017.Purchasing.PurchaseOrderHeader P_POH WHERE P_POH.PurchaseOrderID = @ID_ZAMOWIENIA
);
SELECT * FROM DATA_WYSYLKI(192);
--------------------------------------------------------------------------------------------------------------------------------
-- zadanie 3 --
-- Utw�rz procedur� sk�adowan�, kt�ra jako parametr przyjmuj�nazw� produktu, a jako rezultatwy�wietlajego identyfikator, numer i dost�pno��.

CREATE PROCEDURE DANE @PRODUKT VARCHAR(30)
AS 
BEGIN
	SELECT PP.ProductID, PP.ProductNumber, PP.SafetyStockLevel FROM AdventureWorks2017.Production.Product PP WHERE PP.Name = @PRODUKT;
END;
EXEC DANE @PRODUKT = 'Bearing Ball';
--------------------------------------------------------------------------------------------------------------------------------
-- zadanie 4 --
-- Utw�rz funkcj�, kt�ra zwraca numer karty kredytowej dla konkretnego zam�wienia.

CREATE FUNCTION NUMER_KARTY(@ZAMOWIENIE INT)
RETURNS TABLE AS
RETURN(
	SELECT S_CC.CardNumber FROM AdventureWorks2017.Sales.CreditCard S_CC 
	INNER JOIN AdventureWorks2017.Sales.SalesOrderHeader S_SOH ON S_CC.CreditCardID = S_SOH.CreditCardID AND @ZAMOWIENIE = S_SOH.SalesOrderID);

SELECT * FROM NUMER_KARTY(43665);
--------------------------------------------------------------------------------------------------------------------------------
--zadanie 5 --
-- Utw�rz procedur� sk�adowan�, kt�ra jako parametry wej�ciowe przyjmujedwie liczby, num1i num2, a zwraca wynik ich dzielenia. 
-- Ponadto warto�� num1 powinna zawsze by� wi�ksza ni� warto�� num2. Je�eli warto�� num1jest mniejsza ni� num2,
-- wygeneruj komunikat o b��dzie �Niew�a�ciwie zdefiniowa�e� dane wej�ciowe�.


CREATE PROCEDURE DZIELENIE (@num1 FLOAT, @num2 FLOAT)
AS 
BEGIN

	DECLARE @WYNIK FLOAT;

	IF (@num1 > @num2)
		BEGIN 
			SELECT @WYNIK = @num1 / @num2;
			PRINT 'Wynik dzia�ania: ';
			PRINT @WYNIK
		END

	ELSE
		BEGIN
			PRINT 'Niewlasciwie zdefiniowane dane wejsciowe';
		END
END;

EXEC DZIELENIE @num1 = 5.0, @num2 = 2.5;
--------------------------------------------------------------------------------------------------------------------------------
