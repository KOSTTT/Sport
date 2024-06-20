USE [20.101-09-PublicTransport]
GO
--¬ычислить сколько за мес€ц совершенно рейсов по определЄнному маршруту;
SELECT [–ейсов за мес€ц по 3 маршуруту] = COUNT(*)/2
  FROM [Flight] AS F
  JOIN [Routes] AS R ON F.IDRoute = R.RoutesID
  Join [Schedule] AS S ON S.RouteID = R.RoutesID
  WHERE F.IDRoute = 3 AND  MONTH(S.Date) = MONTH(getdate()) AND YEAR(S.Date) = YEAR(getdate())

GO


