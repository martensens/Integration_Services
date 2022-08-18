USE ConetiCate;
DECLARE @TypeNumber int, @TypeName varchar(100), @TypeDesc varchar(100)
if (SELECT OBJECT_ID
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'dbo.Customer')) > 0  
	BEGIN
		SET @TypeNumber = (SELECT OBJECT_ID
					FROM sys.objects
					WHERE object_id = OBJECT_ID(N'dbo.Customer'))
		SET @TypeName = (SELECT name
					FROM sys.objects
					WHERE object_id = OBJECT_ID(N'dbo.Customer'))
		SET @TypeDesc = (SELECT type_desc
					FROM sys.objects
					WHERE object_id = OBJECT_ID(N'dbo.Customer'))
		DELETE FROM dbo.Customer;
        DROP Table dbo.Customer;
		INSERT INTO dbo.logDatei VALUES (@TypeNumber, @TypeName, @TypeDesc, 'delete', GETDATE())		
	END;

CREATE Table Customer
(
	id int
	, vorName varchar(100)
	, nachName varchar(100)
	, Beruf varchar(100)
    , Art varchar(1)
);

Insert into Customer Values 
(1, 'Martin','Stiller','Consultant','M'),
(2, 'Kerstin','Pfennigsdorf','Vermittlerin','F'),
(3, 'Neele','Schubert','Azubi','F'),
(4, 'Nadin','Fröhlich','Pharmassistentin','F'),
(5, 'Felix','Neureuter','Skilehrer','M');

if (SELECT OBJECT_ID
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'dbo.Customer')) > 0  
	BEGIN
		SET @TypeNumber = (SELECT OBJECT_ID
					FROM sys.objects
					WHERE object_id = OBJECT_ID(N'dbo.Customer'))
		SET @TypeName = (SELECT name
					FROM sys.objects
					WHERE object_id = OBJECT_ID(N'dbo.Customer'))
		SET @TypeDesc = (SELECT type_desc
					FROM sys.objects
					WHERE object_id = OBJECT_ID(N'dbo.Customer'))
		DELETE FROM dbo.Customer;
		INSERT INTO dbo.logDatei VALUES (@TypeNumber, @TypeName, @TypeDesc, 'create', GETDATE())	
	END




