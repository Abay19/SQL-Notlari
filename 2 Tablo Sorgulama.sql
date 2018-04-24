-- NOT: Sorgularımızı yazarken küçük-büyük harfe dikkat etmemize gerek yok. (Eğer başlangıçta Server kurulurken bu ayar seçilmiş ise)

--DML-> Data Manipulation Language

USE Northwind; -- Northwind veritabanı üzerinde sorgulamalar yapacağımız için ya bu şekilde ya da sol üst köşedeki ComboBox'ı kullanarak veritabanımızı seçeriz.

-- TABLOLARI SORGULAMAK

-- Select <sütun_adları> From <tablo_adı> -- (sütun adları arasında virgül var)
-- Employees tablosundaki tüm kayıtları listeleyelim


SELECT *
FROM Employees;

-- Employees tablosundan, çalışanlara ait ad, soyad, görev ve doğum tarihi bilgilerini listeleyelim


SELECT FirstName , LastName , Title , BirthDate
FROM Employees; -- Seçmek istediğimiz sütunları aralarına virgül koyarak belirtiyoruz. 
-- Sütun isimlerinin Intellisense menüsü ile gelmesi için Select ifadesinden sonra From <tablo_adı> yazıp, daha sonra Select ile From arasına sütun isimlerini yazarsak, sütun isimleri bize listelenir.

-- Employees tablosunun sütunlarını sürükle bırak yardımı ile de ekleyebiliriz.


-- Employees tablosunun altındaki Columns klasörünü sürükleyip bırakırsak bütün sütunlar listelenir.

SELECT [EmployeeID] , [LastName] , [FirstName] , [Title] , [TitleOfCourtesy] , [BirthDate] , [HireDate] , [Address] , [City] , [Region] , [PostalCode] , [Country] , [HomePhone] , [Extension] , [Photo] , [Notes] , [ReportsTo] , [PhotoPath]
FROM Employees;


-- SÜTUNLARIN ISIMLENDIRILMESI
-- 1. Yol


SELECT FirstName Ad , LastName Soyad , Title Görev
FROM Employees;
-- Sorgu sonucu oluşacak olan sonuç kümesindeki (result set) sütun isimleri değiştirilecektir, tablodaki orijinal sütun isimlerinin değiştirilmesi gibi bir durum söz konusu değildir.

-- 2. Yol 

SELECT FirstName AS Ad , LastName AS Soyad , Title AS Görev
FROM Employees;


-- 3. Yol

SELECT Ad = FirstName , Soyad = LastName , Görev = Title
FROM Employees;

SELECT FirstName AS Ad , LastName AS Soyad , Görev = Title , BirthDate AS 'Doğum Tarihi' , [İşe Giriş Tarihi] = HireDate
FROM Employees;


-- TEKIL KAYITLARI LISTELEMEK

SELECT City
FROM Employees; -- Toplamda 9 Kayıt

-- Seattle     2
-- Tacoma      1
-- Kirkland    1 
-- Redmond     1
-- London      4 


SELECT DISTINCT
       City
FROM Employees;  -- Farklı olan şehirlerin (tekil değerler) listelenmesini sağlar.


SELECT FirstName , City
FROM Employees; -- Toplam 9 Kayıt


SELECT DISTINCT
       FirstName , City
FROM Employees;-- Üstteki ile aynı sonucu getirir, sebebi ise aynı ad ve şehir değerine sahip kayıtların olmamasıdır.Eğer FirstName = Steven, City = London olan başka bir kayıt daha girilirse tabloya, bu kayıtlardan sadece biri listelenecektir.

-- Metinleri Birleştirmek



SELECT Personel = TitleOfCourtesy+' '+FirstName+' '+LastName
FROM Employees;
  
-- + operatörü ile metinleri birleştirebiliriz. ' ' ile araya boşluk  ekliyoruz. Eğer as ısim demeseydik, tablomuzda sorguda yazdığımız gibi bütün bir sütun olmadığı için sütun başlığı olarak NoColumnName ifadesi yazacaktı.


SELECT CONCAT(TitleOfCourtesy , ' ' , FirstName , ' ' , LastName , ' ') AS Personel
FROM Employees;