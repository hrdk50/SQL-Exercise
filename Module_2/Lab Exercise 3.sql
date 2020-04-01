---------------------------------------------------------------------
-- LAB 02
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 1
-- 
-- Write a script to create a table to store the Competitor data.
---------------------------------------------------------------------

CREATE TABLE DirectMarketing.Competitor
(
	CompetitorId INT NOT NULL PRIMARY KEY IDENTITY (1, 1),
	CompetitorName varchar(30) NOT NULL,
	[CompetitorAddress] varchar(max) NOT NULL,
	CompetitorDate datetime NOT NULL,
	StrengthOfCompetition	varchar(8) NULL,
	CompetitorComments varchar(max) NULL
);

DROP TABLE DirectMarketing.Competitor;

---------------------------------------------------------------------
-- Task 2
-- 
-- Write a script to create a table to store the TVAdvertisement data.
---------------------------------------------------------------------

CREATE TABLE DirectMarketing.TVAdvertisement
(
	TVAdvertisementId INT NOT NULL PRIMARY KEY IDENTITY (1, 1),
	TVAdvertisementStation varchar(20) NOT NULL,
	TVAdvertisementCity varchar(30) NOT NULL,
	CostPerTVAdvertisement float NOT NULL,
	TotalCostOfAllTVAdvertisements float NOT NULL,
	NumberOfTVAdvertisements varchar(30) NULL,
	TVAdvertisementDate datetime NOT NULL,
	TVAdvertisementTime	int NOT NULL
);

DROP TABLE DirectMarketing.TVAdvertisement;


---------------------------------------------------------------------
-- Task 3
-- 
-- Write a script to create a table to store the CampaignResponse data.
--
-- Change the column nullability to be appropriate for the data.
---------------------------------------------------------------------

CREATE TABLE DirectMarketing.CampaignResponse
(
	CampaignResponseId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	CampaignResponseDate datetime NOT NULL, 
	CampaignResponseRelevantProspect int NOT NULL,
	CampaignResponse varchar(10) NOT NULL,
	MoneyInvestedOnCampaignResponse float NOT NULL,
	CampaignResponseProfit float NOT NULL
);

DROP TABLE DirectMarketing.CampaignResponse;

