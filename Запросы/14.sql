USE [20.101-09-PublicTransport]
GO
--��������� ������� �� ����� ���������� ������ �� ������������ ��������;
SELECT [������ �� ����� �� 3 ���������] = COUNT(*)/2
  FROM [Flight] AS F
  JOIN [Routes] AS R ON F.IDRoute = R.RoutesID
  Join [Schedule] AS S ON S.RouteID = R.RoutesID
  WHERE F.IDRoute = 3 AND  MONTH(S.Date) = MONTH(getdate()) AND YEAR(S.Date) = YEAR(getdate())

GO


