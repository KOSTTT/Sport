USE [20.101-09-PublicTransport]
GO
--Вывод полной информации о маршрутах, принадлежащих выбранному перевозчику;
SELECT 
      [Перевозчик] = C.[Name] + ' ' + C.[Surname],
	  [Номер маршрута] = R.RouteNumber,
	  [Общее время движения по маршруту] = R.TravelTime,
	  [Путь следования] = P.StartingArea + '-' + P.EndingArea,
	  [Вид транспорта] = T.TypesOfTransportName
  FROM [Carrier] AS C
  JOIN [Routes] AS R ON R.IDCarrier = C.CarrierID
  JOIN [Path] AS P ON P.PathID = R.IDPath
  JOIN [Flight] AS F ON F.IDRoute = R.RoutesID
  JOIN [TypesOfTransport] AS T ON T.TypesOfTransportID = F.IDTypesOfTransport
  WHERE C.CarrierID = 1

GO


