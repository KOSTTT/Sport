USE [20.101-09-PublicTransport]
GO
--��� ������ ���� ���������� ������������� ����������, ��������� ���������� � ���� ��������� ����� ���� ���������� � ������� ����������� ������ ��������;
SELECT 
      [��� ����������]= T.[TypesOfTransportName],
	  [����� ��������] = R.RouteNumber,
	  [����� ����� �������� �� ��������] = R.TravelTime,
	  [���� ����������] = P.StartingArea + '-' + P.EndingArea,
	  [����������] = C.Surname + ' ' + C.[Name] + ' ' + C.Patronymic

FROM [TypesOfTransport] AS T
JOIN [Flight] AS F ON T.TypesOfTransportID = F.IDTypesOfTransport
JOIN [Routes] AS R ON R.RoutesID = F.IDRoute
JOIN [Path] AS P ON P.PathID = R.IDPath
JOIN [Carrier] AS C ON R.IDCarrier = C.CarrierID
WHERE TypesOfTransportID = 2
ORDER BY R.RouteNumber ASC

GO


