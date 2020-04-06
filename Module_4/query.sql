USE Adventureworks
GO

sp_help 'DirectMarketing.Opportunity'

ALTER TABLE DirectMarketing.Opportunity
ALTER COLUMN OpportunityID int NOT NULL;
GO

ALTER TABLE DirectMarketing.Opportunity
ALTER COLUMN ProspectID int NOT NULL;
GO

ALTER TABLE DirectMarketing.Opportunity
ALTER COLUMN DateRaised datetime NOT NULL;
GO

ALTER TABLE DirectMarketing.Opportunity
ALTER COLUMN Likelihood tinyint NOT NULL;
GO

ALTER TABLE DirectMarketing.Opportunity
ALTER COLUMN Rating char(1) NOT NULL;
GO

ALTER TABLE DirectMarketing.Opportunity
ALTER COLUMN EstimatedClosingDate date NOT NULL;
GO

ALTER TABLE DirectMarketing.Opportunity
ALTER COLUMN EstimatedRevenue decimal(10,2) NOT NULL;
GO


ALTER TABLE DirectMarketing.Opportunity
ADD CONSTRAINT PK_Opportunity PRIMARY KEY CLUSTERED (OpportunityID, ProspectID);
GO


ALTER TABLE DirectMarketing.Opportunity
ADD CONSTRAINT FK_OpportunityProspect
FOREIGN KEY (ProspectID) REFERENCES DirectMarketing.Prospect(ProspectID); 
GO

 
ALTER TABLE DirectMarketing.Opportunity
ADD CONSTRAINT dfDateRaised
DEFAULT (SYSDATETIME()) FOR DateRaised; 
GO


sp_help 'DirectMarketing.Opportunity'

-- default --
ALTER TABLE DirectMarketing.Opportunity
ADD CONSTRAINT dfDateRaised
DEFAULT (SYSDATETIME()) FOR DateRaised; 
GO

-- primary key--
ALTER TABLE DirectMarketing.Opportunity
ADD CONSTRAINT PK_Opportunity 
PRIMARY KEY CLUSTERED (OpportunityID, ProspectID);
GO

-- foriegn key --
ALTER TABLE DirectMarketing.Opportunity
ADD CONSTRAINT FK_OpportunityProspect
FOREIGN KEY (ProspectID) REFERENCES DirectMarketing.Prospect(ProspectID); 
GO
