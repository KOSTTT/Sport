USE [20.101-09-PublicTransport]
GO
--Вывод маршрутов, которые не вышли в рейс по расписанию, с указанием причины;
SELECT 
[Номер маршрута] = R.[RouteNumber],
[Причина] = C.CauseDescription
  FROM [Routes] AS R
  JOIN [Flight] AS F ON F.IDRoute = R.RoutesID
  JOIN [Change] AS C ON F.IDChange = C.ChangeID

GO


