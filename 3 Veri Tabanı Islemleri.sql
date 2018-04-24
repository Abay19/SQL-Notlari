-- Veritabanı işlemleri 

-- C(reate) R(ead) U(pdate) D(elete)
  
-- 1) INSERT: Bir veritabanındaki tablolardan birine yeni kayıt eklemek için kullanacağımız komuttur.

/*
	Insert Into <tablo_adı>(<sütun_isimleri>) Values (<sütun_degerleri>)
*/



INSERT INTO Cities( CityName , [CreatedDate]
                       )
VALUES ( 'İstanbul' , 'Kategori Açıklaması'
       );

SELECT *
FROM Cities;



-- Aşağıdaki Insert işlemi başarısız olacaktır, çünkü Categories tablosunda NULL geçilemeyen CategoryName sütunu için bir değer atamadık. 
--Bir tablonun NULL değer içermeyen sütunlarına Insert işlemi sırasında mutlaka değer atamalıyız. (Eğer Identity özelliğinde bir sütun varsa 
--(otomatik artan), bu sütunun değeri sistem tarafından atanacağı için Insert işleminde bu sütunu belirtmemize gerek yok)



INSERT INTO Categories ( Description
                       )
VALUES ( 'Yeni Açıklama'
       );

-- Cannot insert the value NULL into column 'CategoryName', table 'Northwind.dbo.Categories'; column does not allow nulls. INSERT fails.
-- The statement has been terminated.


-- Tablo içerisinde boş geçilebilen colonların listelenmesi
-- 1 Boş geçilebilir
-- 0 Boş geçilemez

SELECT s.name AS colName , s.Isnullable
FROM [sys].[tables] AS t INNER JOIN [sys].[syscolumns] AS s ON t.object_id = s.id
WHERE t.name = 'Employees'
      AND
      s.Isnullable = 1;


-- Eğer bir tablodaki sütunların hepsine veri gireceksek tablo adından sonra sütun adlarını açıktan belirtmemize gerek yok, direkt Values 
--ile sütunların içereği değerleri atayabiliriz. Ancak dikkat etmemiz gereken sütunların verilerini girerken, tablonun yapısına uygun olacak
-- şekilde girmeliyiz. (Yani, CompanyName sütunu Phone sütunundan önce olduğu için Values kısmında ilk belirteceğimiz değer CompanyName sütununa 
--ait olmalı aksi durumda sütunların veri tipleri uyumluysa veriler yanlış sütunlara girilir.)


INSERT INTO Shippers
VALUES ( 'MNG Kargo' , '+90(212) 444 0 555'
       );

SELECT *
FROM Shippers;


-- Eğer sütun isimlerini belirtirsek verileri de o belirttiğimiz sırada girmeliyiz.
INSERT INTO Shippers ( Phone , CompanyName
                     )
VALUES ( '(503) 555-9831' , 'Aras Kargo'
       );

SELECT *
FROM Shippers;


-- Customers tablosuna 'Bilge Adam' şirketini ekleyiniz.



INSERT INTO Customers ( CustomerID , CompanyName
                      )
VALUES ( 'BLGDM' , 'Bilge Adam'
       );

SELECT *
FROM Customers; 
 
-- Customers tablosundaki CustomerID sütununun tipi nchar(5)'tir. Yani, bu sütun Identity olarak belirtilemez, dolayısıyla bu tabloya bir  kayıt girerken CustomerID sütununa da kendimiz veri girmeliyiz.


-- 2) Update: Bir tablodaki kayıtları güncellemek için kullanılır. Dikkat edilmesi gereken hangi kaydı güncelleyeceğimizi açıktan belirtmek
--AKSI HALDE TÜM KAYITLAR GÜNCELLENEBILIR.



SELECT *
INTO Calisanlar
FROM Employees;-- Employees tablosundaki tüm veriler yeni bir tabloya (Calisanlar tablosu) kopyalandı. Bu işlem yapılırken
-- Into'dan sonra belirteceğimiz ismin o veritabanı altında bulunmayan bir isim olması gerekir. (Bulk Insert: Toplu Insert işlemi)


SELECT *
FROM Calisanlar;



/*
	Update <tablo_adı>
	Set <sütun_adı> = <yeni_deger>,
		<sütun_adı> = <yeni_deger>, ...
*/


UPDATE Calisanlar
       SET LastName = 'Vuranok' , FirstName = 'Murat'; -- Calisanlar tablosundaki bütün kayıtların soyadı bilgisi değiştirilecektir. Çünkü güncelleme işlemini yaparken 
--hangi kayıt üzerinde güncelleme yapacağımızı belirtmedik. (ıstenmeyen bir durum)

SELECT *
FROM Calisanlar;


DROP TABLE Calisanlar;  -- Calisanlar tablosunu database'den sildik

SELECT *
INTO Calisanlar
FROM Employees;


-- Sadece ID değeri 1  olan kaydın bilgileri değiştirildi. Bir kayıt güncellenirken en güzel yol güncelleme işlemini ID 
--üzerinden yapmaktır, eğer FirstName üzerinden yapılsaydı bu sefer aynı ada sahip olanların hepsi güncellenecekti. Tekillik sağlanması için ID 
--üzerinden işlem yapılmalıdır.

UPDATE Calisanlar
       SET FirstName = 'Murat'
WHERE EmployeeID = 1;


SELECT *
FROM Calisanlar;