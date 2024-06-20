USE [20.101-09-PublicTransport]
GO
DECLARE @CurrentId INT = 1
--Вывод  количества маршрутов, проходящих через заданную остановку, и информации о наличии на остановке павильона.
SELECT 
[Остановка] = S.[StopsName],
[Наличие павильона] = TP.ThePresenceOfAPavilionName,
[Количество маршрутов, проходящих через заданную остановку] = (SELECT COUNT(*) FROM [Stops] AS S
  JOIN [ThePresenceOfAPavilion] AS TP ON TP.ThePresenceOfAPavilionID = S.IDThePresenceOfAPavilion
  JOIN [RouteStops] AS RS ON RS.StopID = S.StopsID
  JOIN [Routes] AS R ON R.RoutesID = RS.RouteID
  WHERE S.StopsID = @CurrentId)

  FROM 
  Stops AS S
  JOIN [ThePresenceOfAPavilion] AS TP ON TP.ThePresenceOfAPavilionID = S.IDThePresenceOfAPavilion
  WHERE S.StopsID = @CurrentId
  

GO

