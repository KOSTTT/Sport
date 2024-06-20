USE [20.101-09-PublicTransport]
GO
--�����  ���������� � ���������� �������� ��������� �������� ���������� �������� (����� �������� � �����������, ��� ����������);
SELECT 
[��� ����������] = D.DaysName,
[����� ��������] = R.[RouteNumber],
[����� �����������] = F.StartTime

FROM [Routes] AS R
JOIN [Flight] AS F ON F.IDRoute = R.RoutesID
JOIN [DaysOfTravel] AS DT ON DT.RouteID = R.RoutesID
JOIN [Days] AS D ON D.DaysID = DT.DayID
WHERE R.RoutesID = 1

GO


