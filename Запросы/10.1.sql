USE [20.101-09-PublicTransport]
GO
--��������� ������� ������������� ����� ������;
UPDATE [Authorization] 
   SET [IDUserStatus] = 1
   FROM [Authorization] AS A
   JOIN [Groups] AS G ON G.GroupsID = A.IDGroup
 WHERE G.GroupsID=1
GO


