USE [20.101-09-PublicTransport]
GO
--Вывод информации о маршруте (перевозчик и вид транспорта);
SELECT 
[Маршрут] = R.[RouteNumber],
[Перевозчик] = C.[Name] + ' ' + C.Surname,
[Вид транспорта] = T.TypesOfTransportName
  FROM [Routes] AS R
  JOIN [Carrier] AS C ON C.CarrierID = R.IDCarrier
  JOIN [Flight] AS F ON F.IDRoute = R.RoutesID
  JOIN [TypesOfTransport] AS T ON T.TypesOfTransportID = F.IDTypesOfTransport

GO


