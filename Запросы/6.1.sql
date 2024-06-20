USE [20.101-09-PublicTransport]
GO
--Вывод информации о выбранном рейсе – остановку, время прибытия и отправления, время движения и пройденную длину от начальной остановки.
SELECT 
[Номер рейса] = F.[FlightID],
[Остановка] = S.StopsName,
[Порядок следования в маршруте] = RS.RouteOrder,
[Время прибытия от предыдущей остановки] = RS.ArrivalTimeFromPreviousStop,
[Расстояние от предыдущей остановки] = RS.DistanceFromPreviousStop
  FROM [Flight] AS F
  JOIN [Routes] AS R ON F.IDRoute = R.RoutesID	
  JOIN [RouteStops] AS RS ON RS.RouteID = R.RoutesID
  JOIN [Stops] AS S ON S.StopsID = RS.StopID
  WHERE F.FlightID = 1

GO


