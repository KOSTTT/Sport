USE [20.101-09-PublicTransport]
GO
--Создание новой группы пользователей;
INSERT INTO [dbo].[Groups]
           ([GroupsID],[GroupsName],[IDCarrier],[IDGroupStatus])
     VALUES
           (6,'Шестая группа',1,1)
GO


