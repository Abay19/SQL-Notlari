--S�ralama ��lemleri

use Northwind;
SELECT*
FROM Employees;
------------------------------------------------------------------------------------

SELECT *
FROM Employees
WHERE EmployeeID >= 2
      AND EmployeeID <= 8
ORDER BY FirstName ASC; -- Ascending (Artan S�rada)
---

SELECT FirstName,
       LastName,
       BirthDate
FROM Employees
ORDER BY BirthDate; --E�er ASC ifadesini belirtmezsek default olarak bu �ekilde s�ralama yapacakt�r.BirtDate s�tununa g�re artan s�rada s�ralama yapar...
---


SELECT FirstName , LastName , BirthDate , HireDate
FROM Employees
ORDER BY LastName DESC; --Descending (Azalan S�ralama)
---


SELECT FirstName , LastName , BirthDate , HireDate , Title , TitleOfCourtesy
FROM Employees
ORDER BY 6 , -- �nvana g�re k���kten b�y��e do�ru s�rala
5 DESC , -- �nvanlar ayn� ise G�rev(Title) alan�na g�re b�y�kten k����e s�rala
3 ASC; -- G�rev ayn� ise Do�um Tarihi (BirtDate) alan�na g�re k���kten b�y��e do�ru s�rala

---


SELECT TitleOfCourtesy AS FirstName , LastName , YEAR(GETDATE()) - YEAR(BirthDate) AS Ya�
FROM Employees
ORDER BY Ya� DESC;



--BETWEEN - AND KULLANIMI : Aral�k bildirmek i�in kullan�lan anahtar kelimedir...

--�RNEK1
--1.Yol

SELECT FirstName , LastName , YEAR(BirthDate) AS [Do�um Y�l�]
FROM Employees
WHERE YEAR(BirthDate) >= 1952
      AND
      YEAR(BirthDate) <= 1960
ORDER BY 3 ASC;

--2.Yol

SELECT FirstName , LastName , YEAR(BirthDate) AS [Do�um Y�l�]
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

--NOT: Order By ifadesi bir sorguda en sonda olmal�d�r...


--------------------------------IN kullan�m� 

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


--1950,1955,1960 y�llar�nda do�anlar�n listelenmesi...


SELECT *
FROM Employees
WHERE YEAR(BirthDate) IN ( 1950 , 1955 , 1960
                         ); 

--------------------------------------TOP Kullan�m�:---------------------------------


SELECT *
FROM Employees; --Toplam kay�t say�s�:9

SELECT TOP 3 *
FROM Employees
ORDER BY FirstName;

--�al��ma S�ras�
--select * from employess							1
--select * from employess order by FirstName		2
--select TOP 3 * from employess order by FirstName  3


---

SELECT TOP 25 PERCENT FirstName , LastName , YEAR(GETDATE()) - YEAR(BirthDate) AS Age
FROM Employees
ORDER BY Age DESC;