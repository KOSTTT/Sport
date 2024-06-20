USE [20.101-09-PublicTransport]
GO
--Изменение статуса пользователей своей группы;
UPDATE [dbo].[Groups] 
   SET [IDGroupStatus] = 4
 WHERE [Groups].GroupsID=1
GO


