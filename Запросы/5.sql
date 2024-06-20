USE [20.101-09-PublicTransport]
GO
DECLARE @CurrentId INT = 1
--�����  ���������� ���������, ���������� ����� �������� ���������, � ���������� � ������� �� ��������� ���������.
SELECT 
[���������] = S.[StopsName],
[������� ���������] = TP.ThePresenceOfAPavilionName,
[���������� ���������, ���������� ����� �������� ���������] = (SELECT COUNT(*) FROM [Stops] AS S
  JOIN [ThePresenceOfAPavilion] AS TP ON TP.ThePresenceOfAPavilionID = S.IDThePresenceOfAPavilion
  JOIN [RouteStops] AS RS ON RS.StopID = S.StopsID
  JOIN [Routes] AS R ON R.RoutesID = RS.RouteID
  WHERE S.StopsID = @CurrentId)

  FROM 
  Stops AS S
  JOIN [ThePresenceOfAPavilion] AS TP ON TP.ThePresenceOfAPavilionID = S.IDThePresenceOfAPavilion
  WHERE S.StopsID = @CurrentId
  

GO

