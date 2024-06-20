USE [20.101-09-PublicTransport]
GO
--����� ���������� � �������� (���������� � ��� ����������);
SELECT 
[�������] = R.[RouteNumber],
[����������] = C.[Name] + ' ' + C.Surname,
[��� ����������] = T.TypesOfTransportName
  FROM [Routes] AS R
  JOIN [Carrier] AS C ON C.CarrierID = R.IDCarrier
  JOIN [Flight] AS F ON F.IDRoute = R.RoutesID
  JOIN [TypesOfTransport] AS T ON T.TypesOfTransportID = F.IDTypesOfTransport

GO


