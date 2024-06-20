USE [20.101-09-PublicTransport]
GO
--На определенную дату для всех номеров маршрутов 
--выдать информацию о количестве автобусов, 
--обслуживающих каждый маршрут;
DECLARE @CurrentDate DATE = '2023-01-09'

SELECT 
      [Маршрут] = R.[RouteNumber],
	  [Количество автобусов] = (SELECT COUNT(DISTINCT EmployeeID)/2 FROM [Schedule] AS S
								WHERE S.Date = @CurrentDate 
								AND S.RouteID = R.RoutesID)
  FROM [Routes] AS R
GO


