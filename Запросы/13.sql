USE [20.101-09-PublicTransport]
GO
--����� ���������, ������� �� ����� � ���� �� ����������, � ��������� �������;
SELECT 
[����� ��������] = R.[RouteNumber],
[�������] = C.CauseDescription
  FROM [Routes] AS R
  JOIN [Flight] AS F ON F.IDRoute = R.RoutesID
  JOIN [Change] AS C ON F.IDChange = C.ChangeID

GO


