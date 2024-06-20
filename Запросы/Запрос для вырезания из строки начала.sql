USE [Test]
GO

UPDATE Service
SET MainImagePath = SUBSTRING(MainImagePath, LEN(' Услуги салона красоты\') + 1, LEN(MainImagePath))
WHERE MainImagePath LIKE ' Услуги салона красоты\%';

GO


