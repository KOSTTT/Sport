USE [20.101-09-PublicTransport]
GO
--Сформировать в отдельную таблицу о рейсах, не вышедших вовремя в рейс, с указанием даты и причины;
SELECT 
[Номер рейса] = [FlightID],
[Дата] = C.[Date],
[Причина] = C.CauseDescription
  FROM [Flight] AS F
  JOIN [Change] AS C ON C.ChangeID = F.IDChange
GO


