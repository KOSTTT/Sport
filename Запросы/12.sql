USE [20.101-09-PublicTransport]
GO
--Добавление рейса к заданному маршруту для выбранного перевозчика;
DECLARE @CurrentId INT = 1

INSERT INTO [dbo].[Flight]
           ([FlightID],[StartTime],[IDRoute],[IDTypesOfTransport])
     VALUES
           (16,'10:20:00',@CurrentId,1)
GO


