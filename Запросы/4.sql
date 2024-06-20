USE [20.101-09-PublicTransport]
GO
--����� ������ ���������� � �������� (���� ����������, ���������);
SELECT 
[����� ��������] = R.[RouteNumber],
[���� ����������] = P.StartingArea + '-' + P.EndingArea,
[����������] = C.Surname + ' ' + C.[Name],
[���������] = S.StopsName,
[����������] = '������: ' + CAST(L.Width AS nvarchar) + '. �������: ' + CAST(L.Longitude AS nvarchar) 
FROM [Routes] AS R
JOIN [Path] AS P ON P.PathID = R.IDPath
JOIN [Carrier] AS C ON R.IDCarrier = C.CarrierID
JOIN [RouteStops] AS RS ON RS.RouteID = r.RoutesID
JOIN [Stops] AS S ON S.StopsID = RS.StopID
JOIN [Location] AS L ON L.LocationID = S.IDLocation
WHERE R.RoutesID = 1
GO


