USE [20.101-09-PublicTransport]
GO
--�� ������ ������ �� ����� ��������� ���������� ����, 
--������������ ������ ��������� � �����������.
SELECT 
	  [��������] = Em.[Name] + ' ' + Em.[Surname],
	  [���������] = P.Post,
	  [���������� ����] = (SELECT COUNT(DISTINCT Date) FROM [Schedule] AS S
							JOIN [Employees] AS E ON E.EmployeesID = S.EmployeeID
							WHERE MONTH(S.[Date]) = MONTH(getdate()) 
							AND YEAR(S.[Date]) = YEAR(getdate()) 
							AND E.EmployeesID = Em.EmployeesID)
  FROM [Employees] AS Em
  JOIN [Posts] AS P ON P.PostsID = Em.IDPost

GO