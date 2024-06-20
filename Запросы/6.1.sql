USE [20.101-09-PublicTransport]
GO
--����� ���������� � ��������� ����� � ���������, ����� �������� � �����������, ����� �������� � ���������� ����� �� ��������� ���������.
SELECT 
[����� �����] = F.[FlightID],
[���������] = S.StopsName,
[������� ���������� � ��������] = RS.RouteOrder,
[����� �������� �� ���������� ���������] = RS.ArrivalTimeFromPreviousStop,
[���������� �� ���������� ���������] = RS.DistanceFromPreviousStop
  FROM [Flight] AS F
  JOIN [Routes] AS R ON F.IDRoute = R.RoutesID	
  JOIN [RouteStops] AS RS ON RS.RouteID = R.RoutesID
  JOIN [Stops] AS S ON S.StopsID = RS.StopID
  WHERE F.FlightID = 1

GO


