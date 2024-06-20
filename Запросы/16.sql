USE [20.101-09-PublicTransport]
GO
--�� ������������ ���� ��� ���� ������� ��������� 
--������ ���������� � ���������� ���������, 
--������������� ������ �������;
DECLARE @CurrentDate DATE = '2023-01-09'

SELECT 
      [�������] = R.[RouteNumber],
	  [���������� ���������] = (SELECT COUNT(DISTINCT EmployeeID)/2 FROM [Schedule] AS S
								WHERE S.Date = @CurrentDate 
								AND S.RouteID = R.RoutesID)
  FROM [Routes] AS R
GO


