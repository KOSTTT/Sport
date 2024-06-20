USE [20.101-09-PublicTransport]
GO
--����� ��������� ������������� ��������� � ���� ����������, ����������� ����� ��������� ���������;
SELECT 
[���������] = [StopsName],
[����� ��������] = R.RouteNumber,
[����� ����� �������� �� ��������] = R.TravelTime,
[���� ����������] = P.StartingArea + '-' + P.EndingArea,
[����������] = C.Surname + ' ' + C.[Name],
[��� ����������, ����������� ����� �������]= T.[TypesOfTransportName]
FROM [Stops] AS S
JOIN [RouteStops] AS RS ON S.StopsID = RS.StopID
JOIN [Routes] AS R ON RS.RouteID = R.RoutesID
JOIN [Path] AS P ON P.PathID = R.IDPath
JOIN [Carrier] AS C ON C.CarrierID = R.IDCarrier
JOIN [Flight] AS F ON F.IDRoute = R.RoutesID
JOIN [TypesOfTransport] AS T ON T.TypesOfTransportID = F.IDTypesOfTransport
WHERE S.StopsID = 3

GO


