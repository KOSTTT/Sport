USE [20.101-09-PublicTransport]
GO
--����� ������ ���������� � ���������, ������������� ���������� �����������;
SELECT 
      [����������] = C.[Name] + ' ' + C.[Surname],
	  [����� ��������] = R.RouteNumber,
	  [����� ����� �������� �� ��������] = R.TravelTime,
	  [���� ����������] = P.StartingArea + '-' + P.EndingArea,
	  [��� ����������] = T.TypesOfTransportName
  FROM [Carrier] AS C
  JOIN [Routes] AS R ON R.IDCarrier = C.CarrierID
  JOIN [Path] AS P ON P.PathID = R.IDPath
  JOIN [Flight] AS F ON F.IDRoute = R.RoutesID
  JOIN [TypesOfTransport] AS T ON T.TypesOfTransportID = F.IDTypesOfTransport
  WHERE C.CarrierID = 1

GO


