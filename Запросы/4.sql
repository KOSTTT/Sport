USE [20.101-09-PublicTransport]
GO
--Вывод полной информации о маршруте (путь следования, остановки);
SELECT 
[Номер маршрута] = R.[RouteNumber],
[Путь следования] = P.StartingArea + '-' + P.EndingArea,
[Перевозчик] = C.Surname + ' ' + C.[Name],
[Остановка] = S.StopsName,
[Координаты] = 'Ширина: ' + CAST(L.Width AS nvarchar) + '. Долгота: ' + CAST(L.Longitude AS nvarchar) 
FROM [Routes] AS R
JOIN [Path] AS P ON P.PathID = R.IDPath
JOIN [Carrier] AS C ON R.IDCarrier = C.CarrierID
JOIN [RouteStops] AS RS ON RS.RouteID = r.RoutesID
JOIN [Stops] AS S ON S.StopsID = RS.StopID
JOIN [Location] AS L ON L.LocationID = S.IDLocation
WHERE R.RoutesID = 1
GO


