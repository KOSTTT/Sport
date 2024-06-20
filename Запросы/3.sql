USE [20.101-09-PublicTransport]
GO
--Вывод  информации о расписании движения заданного маршрута транспорта маршрута (время прибытия и отправления, дни следования);
SELECT 
[Дни следования] = D.DaysName,
[Номер маршрута] = R.[RouteNumber],
[Время отправления] = F.StartTime

FROM [Routes] AS R
JOIN [Flight] AS F ON F.IDRoute = R.RoutesID
JOIN [DaysOfTravel] AS DT ON DT.RouteID = R.RoutesID
JOIN [Days] AS D ON D.DaysID = DT.DayID
WHERE R.RoutesID = 1

GO


