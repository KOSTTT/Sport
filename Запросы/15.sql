USE [20.101-09-PublicTransport]
GO
--������������ � ��������� ������� � ������, �� �������� ������� � ����, � ��������� ���� � �������;
SELECT 
[����� �����] = [FlightID],
[����] = C.[Date],
[�������] = C.CauseDescription
  FROM [Flight] AS F
  JOIN [Change] AS C ON C.ChangeID = F.IDChange
GO


