USE [Test]
GO

UPDATE Service
SET MainImagePath = SUBSTRING(MainImagePath, LEN(' ������ ������ �������\') + 1, LEN(MainImagePath))
WHERE MainImagePath LIKE ' ������ ������ �������\%';

GO


