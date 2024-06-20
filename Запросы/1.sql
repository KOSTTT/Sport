USE [20.101-09-PublicTransport]
GO
--При выборе вида городского общественного транспорта, выводится информация о всех маршрутах этого вида транспорта в порядке возрастания номера маршрута;
SELECT 
      [Вид транспорта]= T.[TypesOfTransportName],
	  [Номер маршрута] = R.RouteNumber,
	  [Общее время движения по маршруту] = R.TravelTime,
	  [Путь следования] = P.StartingArea + '-' + P.EndingArea,
	  [Перевозчик] = C.Surname + ' ' + C.[Name] + ' ' + C.Patronymic

FROM [TypesOfTransport] AS T
JOIN [Flight] AS F ON T.TypesOfTransportID = F.IDTypesOfTransport
JOIN [Routes] AS R ON R.RoutesID = F.IDRoute
JOIN [Path] AS P ON P.PathID = R.IDPath
JOIN [Carrier] AS C ON R.IDCarrier = C.CarrierID
WHERE TypesOfTransportID = 2
ORDER BY R.RouteNumber ASC

GO


