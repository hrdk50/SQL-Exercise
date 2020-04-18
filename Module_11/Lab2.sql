USE tempdb
GO

ALTER TRIGGER TR_CampaignBalance
ON CampaignBalance
AFTER UPDATE
AS BEGIN
SET NOCOUNT ON;

INSERT CampaignAudit 
(AuditTime, ModifyingUser, RemainingBalance)
SELECT SYSDATETIME(),
ORIGINAL_LOGIN(),
inserted.RemainingBalance
FROM deleted
INNER JOIN inserted
ON deleted.CampaignID = inserted.CampaignID 
WHERE ABS(deleted.RemainingBalance  - inserted.RemainingBalance) > 10000;
END;
GO


UPDATE Product
SET ListPrice = 5000
WHERE ProductID BETWEEN 51 and 60;
GO
SELECT * FROM ProductAudit
GO