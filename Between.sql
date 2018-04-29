--Sýralama Ýþlemleri

use Northwind;
SELECT*
FROM Employees;
------------------------------------------------------------------------------------

SELECT *
FROM Employees
WHERE EmployeeID >= 2
      AND EmployeeID <= 8
ORDER BY FirstName ASC; -- Ascending (Artan Sýrada)
---

SELECT FirstName,
       LastName,
       BirthDate
FROM Employees
ORDER BY BirthDate; --Eðer ASC ifadesini belirtmezsek default olarak bu þekilde sýralama yapacaktýr.BirtDate sütununa göre artan sýrada sýralama yapar...
---


SELECT FirstName , LastName , BirthDate , HireDate
FROM Employees
ORDER BY LastName DESC; --Descending (Azalan Sýralama)
---


SELECT FirstName , LastName , BirthDate , HireDate , Title , TitleOfCourtesy
FROM Employees
ORDER BY 6 , -- ünvana göre küçükten büyüðe doðru sýrala
5 DESC , -- ünvanlar ayný ise Görev(Title) alanýna göre büyükten küçüðe sýrala
3 ASC; -- Görev ayný ise Doðum Tarihi (BirtDate) alanýna göre küçükten büyüðe doðru sýrala

---


SELECT TitleOfCourtesy AS FirstName , LastName , YEAR(GETDATE()) - YEAR(BirthDate) AS Yaþ
FROM Employees
ORDER BY Yaþ DESC;



--BETWEEN - AND KULLANIMI : Aralýk bildirmek için kullanýlan anahtar kelimedir...

--ÖRNEK1
--1.Yol

SELECT FirstName , LastName , YEAR(BirthDate) AS [Doðum Yýlý]
FROM Employees
WHERE YEAR(BirthDate) >= 1952
      AND
      YEAR(BirthDate) <= 1960
ORDER BY 3 ASC;

--2.Yol

SELECT FirstName , LastName , YEAR(BirthDate) AS [Doðum Yýlý]
FROM Employees
WHERE YEAR(BirthDate) BETWEEN 1952 AND 1960
ORDER BY 3 DESC;

---
---1.Yol


SELECT FirstName , LastName
FROM Employees
WHERE FirstName >= 'Janet'
      AND
      FirstName <= 'Robert'
ORDER BY FirstName;

---2.Yol


SELECT FirstName , LastName
FROM Employees
WHERE FirstName BETWEEN 'Janet' AND 'Robert'
ORDER BY FirstName;

--NOT: Order By ifadesi bir sorguda en sonda olmalýdýr...


--------------------------------IN kullanýmý 

--1.Yol


SELECT *
FROM Employees
WHERE TitleOfCourtesy = 'Mr.'
      OR
      TitleOfCourtesy = 'Dr.'
ORDER BY 5 DESC;

--2.Yol


SELECT *
FROM Employees
WHERE TitleOfCourtesy IN ( 'Mr.' , 'Dr.'
                         );


--1950,1955,1960 yýllarýnda doðanlarýn listelenmesi...


SELECT *
FROM Employees
WHERE YEAR(BirthDate) IN ( 1950 , 1955 , 1960
                         ); 

--------------------------------------TOP Kullanýmý:---------------------------------


SELECT *
FROM Employees; --Toplam kayýt sayýsý:9

SELECT TOP 3 *
FROM Employees
ORDER BY FirstName;

--Çalýþma Sýrasý
--select * from employess							1
--select * from employess order by FirstName		2
--select TOP 3 * from employess order by FirstName  3


---

SELECT TOP 25 PERCENT FirstName , LastName , YEAR(GETDATE()) - YEAR(BirthDate) AS Age
FROM Employees
ORDER BY Age DESC;