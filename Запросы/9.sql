USE [20.101-09-PublicTransport]
GO
--Добавление нового пользователя;
INSERT INTO [dbo].[Authorization]
           ([AuthorizationID],[Login],[Password],[IDGroup],[IDRole])
     VALUES
           (16,'log16','Passw0rd',1,3)
GO


