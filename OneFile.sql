USE [TescoSubscription]
GO

/*******************************************************************************************  
********************************************************************************************  
** TYPE           : CREATE TABLE  
** NAME           : TABLE [Coupon].[Campaign]   
** AUTHOR         : INFOSYS TECHNOLOGIES LIMITED  
** DESCRIPTION    : THIS SCRIPT WILL CREATE TABLE [Coupon].[Campaign]
** DATE WRITTEN   : 06/03/2013                     
** ARGUMENT(S)    : NONE
** RETURN VALUE(S): NONE
*******************************************************************************************  
*******************************************************************************************/
/*
	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'[Coupon].[Campaign]',N'U') IS NULL
	BEGIN

	CREATE TABLE [Coupon].[Campaign](
		[CampaignID] [BIGINT] IDENTITY(1,1) NOT NULL,
		[CampaignCode] [NVARCHAR](25) NOT NULL,
		[DescriptionShort] [NVARCHAR](200) NULL,
		[DescriptionLong] [NVARCHAR](300) NULL,
		[Amount] [MONEY] NOT NULL,
		[IsActive] [BIT] NOT NULL,
		[CampaignTypeId] [INT] NOT NULL,	
		[UTCCreatedDateTime] [SMALLDATETIME] NOT NULL,
		[UTCUpdatedDateTime] [SMALLDATETIME] NOT NULL,
	 CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED 
	(
		[CampaignId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
	 CONSTRAINT [UQ_CampaignCode] UNIQUE NONCLUSTERED 
	(
		[CampaignCode] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]


	ALTER TABLE [Coupon].[Campaign] ADD  CONSTRAINT [DF_Campaign_IsActive]  DEFAULT ((0)) FOR [IsActive]


	ALTER TABLE [Coupon].[Campaign] ADD  CONSTRAINT [DF_CampaignTypeID]  DEFAULT ((1)) FOR [CampaignTypeID]


	ALTER TABLE [Coupon].[Campaign] ADD  CONSTRAINT [DF_CAMPAIGN_UTCCREATEDEDATETIME]  DEFAULT (GETUTCDATE()) FOR [UTCCreatedDateTime]


	ALTER TABLE [Coupon].[Campaign] ADD  CONSTRAINT [DF_CAMPAIGN_UTCUPDATEDDATETIME]  DEFAULT (GETUTCDATE()) FOR [UTCUpdatedDateTime]


	IF OBJECT_ID(N'[Coupon].[Campaign]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [Coupon].[Campaign] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table[Coupon].[Campaign] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[Campaign] already exists.'
	END
GO

--------------- ADD column [UsageTypeID] ------------------------

IF NOT EXISTS(SELECT 1 FROM information_schema.columns      
				WHERE TABLE_SCHEMA      = 'Coupon'
				AND TABLE_NAME			= 'Campaign'
				AND COLUMN_NAME         = 'UsageTypeID') 
BEGIN     
	ALTER TABLE [Coupon].[Campaign] ADD UsageTypeID tinyint  NOT NULL CONSTRAINT DF_UsageTypeID DEFAULT (1)
		PRINT 'Column Coupon.Campaign.UsageTypeID added'
END
ELSE
        PRINT 'Column Coupon.Campaign.UsageTypeID already exists'
GO

--------------- ADD column [IsMutuallyExclusive] ------------------------

IF NOT EXISTS(SELECT 1 FROM information_schema.columns      
				WHERE TABLE_SCHEMA      = 'Coupon'
				AND TABLE_NAME			= 'Campaign'
				AND COLUMN_NAME         = 'IsMutuallyExclusive') 
BEGIN     
	ALTER TABLE [Coupon].[Campaign] ADD IsMutuallyExclusive BIT  NOT NULL CONSTRAINT DF_IsMutuallyExclusive DEFAULT (0)
		PRINT 'Column Coupon.Campaign.IsMutuallyExclusive added'
END
ELSE
        PRINT 'Column Coupon.Campaign.IsMutuallyExclusive already exists'
GO
USE [TescoSubscription]
GO

/*******************************************************************************************  
********************************************************************************************  
** TYPE           : CREATE TABLE  
** NAME           : TABLE [Coupon].[CampaignAttributeReference]   
** AUTHOR         : INFOSYS TECHNOLOGIES LIMITED  
** DESCRIPTION    : THIS SCRIPT WILL CREATE TABLE [Coupon].[CampaignAttributeReference]
** DATE WRITTEN   : 06/03/2013                     
** ARGUMENT(S)    : NONE
** RETURN VALUE(S): NONE
*******************************************************************************************  
*******************************************************************************************/
/*
	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'[Coupon].[CampaignAttributeReference]',N'U') IS NULL
	BEGIN

	CREATE TABLE [Coupon].[CampaignAttributeReference](
		[AttributeID] [SMALLINT] NOT NULL,
		[Description] [NVARCHAR](250) NULL,
		[UTCCreatedDateTime] [SMALLDATETIME] NOT NULL,
		[UTCUpdateDDateTime] [SMALLDATETIME] NOT NULL,
	 CONSTRAINT [PK_CampaignAttributeReference] PRIMARY KEY CLUSTERED 
	(
		[AttributeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]


	ALTER TABLE [Coupon].[CampaignAttributeReference] ADD  CONSTRAINT [DF_CampaignAttributeReference_UTCCreatedDateTime]  DEFAULT (GETUTCDATE()) FOR [UTCCreatedDateTime]


	ALTER TABLE [Coupon].[CampaignAttributeReference] ADD  CONSTRAINT [DF_CampaignAttributeReference_UTCUpdatedDateTime]  DEFAULT (GETUTCDATE()) FOR [UTCupdatedDateTime]

	IF OBJECT_ID(N'[Coupon].[CampaignAttributeReference]',N'U') IS NOT NULL
				BEGIN
					PRINT 'SUCCESS - Table [Coupon].[CampaignAttributeReference] created.'
				END
			ELSE
				BEGIN
					RAISERROR('FAIL - Table[Coupon].[CampaignAttributeReference] not created.',16,1)
				END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CampaignAttributeReference] already exists.'
	END
GO



USE [TescoSubscription]
GO
/*******************************************************************************************  
********************************************************************************************  
** TYPE           : CREATE TABLE  
** NAME           : TABLE [Coupon].[CampaignAttributes]  
** AUTHOR         : INFOSYS TECHNOLOGIES LIMITED  
** DESCRIPTION    : THIS SCRIPT WILL CREATE TABLE [Coupon].[CampaignAttributes]
** DATE WRITTEN   : 06/03/2013                     
** ARGUMENT(S)    : NONE
** RETURN VALUE(S): NONE
*******************************************************************************************  
*******************************************************************************************/
/*
	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF OBJECT_ID(N'[Coupon].[CampaignAttributes]',N'U') IS NULL
	BEGIN

	CREATE TABLE [Coupon].[CampaignAttributes](
		[CampaignID] [BIGINT] NOT NULL,
		[AttributeID] [SMALLINT] NOT NULL,
		[AttributeValue] [NVARCHAR](50) NOT NULL,
		[UTCCreatedDateTime] [SMALLDATETIME] NOT NULL,
		[UTCUpdatedDateTime] [SMALLDATETIME] NOT NULL,
	 CONSTRAINT [PK_CampaignAttributes] PRIMARY KEY CLUSTERED 
	(
		[CampaignID] ASC,
		[AttributeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]


	ALTER TABLE [Coupon].[CampaignAttributes] ADD  CONSTRAINT [DF_CampaignAttributes_UTCCreatedDateTime]  DEFAULT (GETUTCDATE()) FOR [UTCcreatedDateTime]


	ALTER TABLE [Coupon].[CampaignAttributes] ADD  CONSTRAINT [DF_CampaignAttributes_UTCUpdatedDateTime]  DEFAULT (GETUTCDATE()) FOR [UTCUpdatedDateTime]

	IF OBJECT_ID(N'[Coupon].[CampaignAttributes]',N'U') IS NOT NULL
				BEGIN
					PRINT 'SUCCESS - Table [Coupon].[CampaignAttributes] created.'
				END
			ELSE
				BEGIN
					RAISERROR('FAIL - Table [Coupon].[CampaignAttributes] not created.',16,1)
				END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CampaignAttributes] already exists.'
	END
GO



﻿USE [TescoSubscription]
GO

/*

	Author:			Robin
	Date created:	14-Jan-2014
	Table Type:		Reference
	Table Size:		Estimated > 100 rows
	Purpose:		Holds reference data for Campaign discount Type
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>
	

*/
IF OBJECT_ID(N'[Coupon].[CampaignDiscountType]',N'U') IS NULL
	BEGIN
CREATE TABLE [Coupon].[CampaignDiscountType](
	[CampaignID] [bigint] NOT NULL,
	[DiscountTypeID] [tinyint] NOT NULL,
	[DiscountValue] [decimal](6, 2) NOT NULL,
    [UTCCreatedDateTime] [datetime] NOT NULL,
	[UTCUpdatedDateTime] [datetime] NOT NULL,
CONSTRAINT [PK_CampaignDiscountType_CampaignID_DiscountTypeID] PRIMARY KEY CLUSTERED 
(
	[CampaignID] ASC,
	[DiscountTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [Coupon].[CampaignDiscountType] ADD  CONSTRAINT [DF_CampaignDiscountType_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

ALTER TABLE [Coupon].[CampaignDiscountType] ADD  CONSTRAINT [DF_CampaignDiscountType_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

BEGIN
				PRINT 'SUCCESS - Table [Coupon].[CampaignDiscountType] created.'
	 END


		IF OBJECT_ID(N'[Coupon].[CampaignDiscountType]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [Coupon].[CampaignDiscountType] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [Coupon].[CampaignDiscountType] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CampaignDiscountType] already exists.'
	END
GO


﻿USE [TescoSubscription]
GO

/*

	Author:			Robin
	Date created:	14-Jan-2014
	Table Type:		Reference
	Table Size:		Estimated > 100 rows
	Purpose:		Holds data for Campaign Plan Details
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>
	

*/
IF OBJECT_ID(N'[Coupon].[CampaignPlanDetails]',N'U') IS NULL
	BEGIN

CREATE TABLE [Coupon].[CampaignPlanDetails](
	[CampaignID] [bigint] NOT NULL,
	[SubscriptionPlanID] [int] NOT NULL,
    [UTCCreatedDateTime] [datetime] NOT NULL,
	[UTCUpdatedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_CampaignPlanDetails_CampaignID_SubscriptionPlanID] PRIMARY KEY CLUSTERED 
(
	[CampaignID] ASC,
	[SubscriptionPlanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [Coupon].[CampaignPlanDetails] ADD  CONSTRAINT [DF_CampaignPlanDetails_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

ALTER TABLE [Coupon].[CampaignPlanDetails] ADD  CONSTRAINT [DF_CampaignPlanDetails_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

BEGIN
				PRINT 'SUCCESS - Table [Coupon].[CampaignPlanDetails] created.'
	 END


		IF OBJECT_ID(N'[Coupon].[CampaignPlanDetails]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [Coupon].[CampaignPlanDetails] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [Coupon].[CampaignPlanDetails] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CampaignPlanDetails] already exists.'
	END
GO



USE [TescoSubscription]
GO

/*******************************************************************************************  
********************************************************************************************  
** TYPE           : CREATE TABLE  
** NAME           : TABLE [Coupon].[CampaignTypeMaster]   
** AUTHOR         : INFOSYS TECHNOLOGIES LIMITED  
** DESCRIPTION    : THIS SCRIPT WILL CREATE TABLE [Coupon].[CampaignTypeMaster] 
** DATE WRITTEN   : 06/03/2013                     
** ARGUMENT(S)    : NONE
** RETURN VALUE(S): NONE
*******************************************************************************************  
*******************************************************************************************/
/*
	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF OBJECT_ID(N'[Coupon].[CampaignTypeMaster]',N'U') IS NULL
	BEGIN


	CREATE TABLE [Coupon].[CampaignTypeMaster](
		[CampaignTypeID] [INT] IDENTITY(1,1) NOT NULL,
		[CampaignTypeName] [NVARCHAR](50) NOT NULL,
		[Description] [NVARCHAR](200) NULL,
		[IsActive] [BIT] NOT NULL,
		[UTCCreatedDateTime] [SMALLDATETIME] NOT NULL,
		[UTCUpdatedDateTime] [SMALLDATETIME] NOT NULL,
	 CONSTRAINT [PK_CampaignTypeMaster] PRIMARY KEY CLUSTERED 
	(
		[CampaignTypeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]


	ALTER TABLE [Coupon].[CampaignTypeMaster] ADD  CONSTRAINT [DF_CampaignTypeMaster_IsActive]  DEFAULT ((0)) FOR [IsActive]


	ALTER TABLE [Coupon].[CampaignTypeMaster] ADD  CONSTRAINT [DF_CampaignTypeMaster_UTCCreatedDateTime]  DEFAULT (GETUTCDATE()) FOR [UTCCreatedDateTime]


	ALTER TABLE [Coupon].[CampaignTypeMaster] ADD  CONSTRAINT [DF_CampaignTypeMaster_UTCUpdatedDateTime]  DEFAULT (GETUTCDATE()) FOR [UTCUpdatedDateTime]

	IF OBJECT_ID(N'[Coupon].[CampaignTypeMaster]',N'U') IS NOT NULL
				BEGIN
					PRINT 'SUCCESS - Table [Coupon].[CampaignTypeMaster] created.'
				END
			ELSE
				BEGIN
					RAISERROR('FAIL - Table [Coupon].[CampaignTypeMaster] not created.',16,1)
				END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CampaignTypeMaster] already exists.'
	END
GO




USE TescoSubscription
Go
/*

	Author:			Manjunathan Raman
	Date created:	01-Oct-2012
	Table Type:		Reference
	Table Size:		
	Purpose:		To Store the Coupons
	Usage:			Refered by Website for getting Coupon details
	Archiving:		

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	10-June-2013	Abhishek						Adding Column for CampaignID, and foreign key constraint
	23-Jul-2013		Navdeep_Singh					Removing foreign key constraint as part of TFS check in standard
*/
IF OBJECT_ID(N'[Coupon].[Coupon]',N'U') IS NULL
	BEGIN

		CREATE TABLE [Coupon].[Coupon](
			[CouponID] [bigint] IDENTITY(1,1) NOT NULL,
			[CouponCode] [nvarchar](25) NOT NULL,
			[DescriptionShort] [nvarchar](200) NULL,
			[DescriptionLong] [nvarchar](300) NULL,
			[Amount] [money] NOT NULL,
			[RedeemCount] [int] NOT NULL,
			[IsActive] [bit] NOT NULL,
			[UTCCreatedeDateTime] [smalldatetime] NOT NULL,
			[UTCUpdatedDateTime] [smalldatetime] NOT NULL,
			[CampaignID] [bigint] NULL,
		 CONSTRAINT [PK_Coupon] PRIMARY KEY CLUSTERED 
		(
			[CouponID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
		 CONSTRAINT [UQ_Coupon_CouponCode] UNIQUE NONCLUSTERED 
		(
			[CouponCode] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
		) ON [PRIMARY]
		

		ALTER TABLE [Coupon].[Coupon] ADD  CONSTRAINT [DF_Coupon_RedeemCount]  DEFAULT ((0)) FOR [RedeemCount]

		ALTER TABLE [Coupon].[Coupon] ADD  CONSTRAINT [DF_Coupon_IsActive]  DEFAULT ((0)) FOR [IsActive]

		ALTER TABLE [Coupon].[Coupon] ADD  CONSTRAINT [DF_Coupon_UTCCreatedeDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedeDateTime]

		ALTER TABLE [Coupon].[Coupon] ADD  CONSTRAINT [DF_Coupon_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]	
	

		IF OBJECT_ID(N'[Coupon].[Coupon]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [Coupon].[Coupon] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [Coupon].[Coupon] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[Coupon] already exists.'
		IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Coupon' AND TABLE_SCHEMA = 'Coupon'  AND  COLUMN_NAME = 'CampaignID')
		BEGIN			
			ALTER TABLE [Coupon].[Coupon] ADD [CampaignID] [bigint]  NULL;			
			
			IF EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Coupon' AND TABLE_SCHEMA = 'Coupon'  AND  COLUMN_NAME = 'CampaignID')
			BEGIN				
				PRINT 'SUCCESS - Column [CampaignID] added in Table [Coupon].[Coupon].'
			END
			ELSE
			BEGIN
				RAISERROR('FAIL - Column [CampaignID] not added in Table [Coupon].[Coupon].',16,1)
			END
		END
		ELSE
		BEGIN
			PRINT 'EXISTS - Column [CampaignID] already exists in Table [Coupon].[Coupon].'
		END	
	END

GO/*

	Author:			Manjunathan Raman
	Date created:	01-Oct-2012
	Table Type:		Reference
	Table Size:		
	Purpose:		To store Coupon Attributes
	Usage:			Coupon Details reference
	Fillfactor:		
	Archiving:		

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
IF OBJECT_ID(N'[Coupon].[CouponAttributes]',N'U') IS NULL
	BEGIN

		CREATE TABLE [Coupon].[CouponAttributes](
			[CouponID] BIGINT NOT NULL,
			[AttributeID] [smallint] NOT NULL,
			[AttributeValue] [nvarchar](50) NOT NULL,
			[UTCCreatedDateTime] [smalldatetime] NOT NULL,
			[UTCUpdatedDateTime] [smalldatetime] NOT NULL,
		 CONSTRAINT [PK_CouponAttributes] PRIMARY KEY CLUSTERED 
		(
			[CouponID] ASC,
			[AttributeID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
		) ON [PRIMARY]
		

		ALTER TABLE [Coupon].[CouponAttributes] ADD  CONSTRAINT [DF_CouponAttributes_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

		ALTER TABLE [Coupon].[CouponAttributes] ADD  CONSTRAINT [DF_CouponAttributes_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

		IF OBJECT_ID(N'[Coupon].[CouponAttributes]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [Coupon].[CouponAttributes] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [Coupon].[CouponAttributes] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CouponAttributes] already exists.'
	END
GO
/*

	Author:			Manjunathan Raman
	Date created:	01-Oct-2012
	Table Type:		Reference
	Table Size:		
	Purpose:		Internal table
	Usage:			Not used by system, and it is for Developer purpose
	Fillfactor:		
	Archiving:		N/A

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
IF OBJECT_ID(N'[Coupon].[CouponAttributesReference]',N'U') IS NULL
	BEGIN

		CREATE TABLE [Coupon].[CouponAttributesReference](
			[AttributeID] [smallint] NOT NULL,
			[Description] [nvarchar](250) NULL,
			[UTCCreatedDateTime] [smalldatetime] NOT NULL,
			[UTCUpdatedDateTime] [smalldatetime] NOT NULL,
		 CONSTRAINT [PK_CouponAttributesReference] PRIMARY KEY CLUSTERED 
		(
			[AttributeID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
		) ON [PRIMARY]
		

		ALTER TABLE [Coupon].[CouponAttributesReference] ADD  CONSTRAINT [DF_CouponAttributesReference_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

		ALTER TABLE [Coupon].[CouponAttributesReference] ADD  CONSTRAINT [DF_CouponAttributesReference_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

		IF OBJECT_ID(N'[Coupon].[CouponAttributesReference]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [Coupon].[CouponAttributesReference] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [Coupon].[CouponAttributesReference] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CouponAttributesReference] already exists.'
	END
GO
USE [TescoSubscription]
GO

/*******************************************************************************************  
********************************************************************************************  
** TYPE           : CREATE TABLE  
** NAME           : TABLE [Coupon].[CouponCustomerMap] 
** AUTHOR         : INFOSYS TECHNOLOGIES LIMITED  
** DESCRIPTION    : THIS SCRIPT WILL CREATE TABLE [Coupon].[CouponCustomerMap]
** DATE WRITTEN   : 06/03/2013                     
** ARGUMENT(S)    : NONE
** RETURN VALUE(S): NONE
*******************************************************************************************  
*******************************************************************************************/
/*
	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'[Coupon].[CouponCustomerMap]',N'U') IS NULL
	BEGIN


	CREATE TABLE [Coupon].[CouponCustomerMap](
		[CouponID] [BIGINT] NOT NULL,
		[CustomerID] [BIGINT] NOT NULL,
		[UTCCreatedDateTime] [SMALLDATETIME] NOT NULL,
		[UTCUpdatedDateTime] [SMALLDATETIME] NOT NULL
	 CONSTRAINT [PK_CouponCustomerMap] PRIMARY KEY CLUSTERED 
	(
		[CouponID] ASC,
		[CustomerID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]

	ALTER TABLE [Coupon].[CouponCustomerMap] ADD  CONSTRAINT [DF_CouponCustomerMap_UTCCreatedDateTime]  DEFAULT (GETUTCDATE()) FOR [UTCCreatedDateTime]

	ALTER TABLE [Coupon].[CouponCustomerMap] ADD  CONSTRAINT [DF_CouponCustomerMap_UTCUpdatedDateTime]  DEFAULT (GETUTCDATE()) FOR [UTCUpdatedDateTime]


	IF OBJECT_ID(N'[Coupon].[CouponCustomerMap]',N'U') IS NOT NULL
				BEGIN
					PRINT 'SUCCESS - Table [Coupon].[CouponCustomerMap] created.'
				END
			ELSE
				BEGIN
					RAISERROR('FAIL - Table [Coupon].[CouponCustomerMap] not created.',16,1)
				END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CouponCustomerMap] already exists.'
	END
GO

/*

	Author:			Manjunathan Raman
	Date created:	01-Oct-2012
	Table Type:		Transactional
	Table Size:		
	Purpose:		To store Valid redemption details
	Usage:			While customer claims data is entered in this table
	Archiving:		

	--Modifications History--
	Changed On		Changed By		Defect Ref		                   Change Description
	14 April 2014    Robin           BI replication Purpose             Ro_No Column Added

*/
IF OBJECT_ID(N'[Coupon].[CouponRedemption]',N'U') IS NULL
	BEGIN

		CREATE TABLE [Coupon].[CouponRedemption](
			[CouponCode] [nvarchar](25) NOT NULL,
			[CustomerID] [bigint] NOT NULL,
			[UTCCreatedDateTime] [smalldatetime] NOT NULL,
			[UTCUpdatedDateTime] [smalldatetime] NOT NULL
		) ON [PRIMARY]
		

		ALTER TABLE [Coupon].[CouponRedemption] ADD  CONSTRAINT [DF_CouponRedemption_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

		ALTER TABLE [Coupon].[CouponRedemption] ADD  CONSTRAINT [DF_CouponRedemption_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

		IF OBJECT_ID(N'[Coupon].[CouponRedemption]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [Coupon].[CouponRedemption] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [Coupon].[CouponRedemption] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CouponRedemption] already exists.'
	END
GO

----------------------------- Add Column [Ro_no]-----------------------------------------------------
IF NOT EXISTS(SELECT 1 FROM information_schema.columns      
                           WHERE TABLE_SCHEMA   = 'Coupon'
                           AND TABLE_NAME       = 'CouponRedemption'
                           AND COLUMN_NAME      = 'Ro_No') 
BEGIN  
	ALTER TABLE [Coupon].[CouponRedemption] 
	ADD Ro_No BIGINT IDENTITY(1,1) NOT NULL 
    
    
    ALTER TABLE [Coupon].[CouponRedemption] 
    ADD CONSTRAINT PK_Coupon_CouponRedemption_Ro_No PRIMARY KEY NONCLUSTERED (Ro_No)
     
END
    PRINT 'Column Coupon.CouponRedemption.Ro_No and PK_Coupon_CouponRedemption_Ro_No added to Column Coupon.CouponRedemption.Ro_No'USE [TescoSubscription]

GO

/*

	Author:			Robin
	Date created:	14-Jan-2014
	Table Type:		Reference
	Table Size:		Estimated < 100 rows
	Purpose:		Holds reference data for Coupon Usage Type
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>
	

*/
IF OBJECT_ID(N'[Coupon].[CouponUsageType]',N'U') IS NULL
	BEGIN
CREATE TABLE [Coupon].[CouponUsageType](
	[UsageTypeID] [tinyint] NOT NULL,
	[UsageName] [nvarchar](80) NOT NULL,
	[UTCCreatedDateTime] [datetime] NOT NULL,
	[UTCUpdatedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_CouponUsageType] PRIMARY KEY CLUSTERED 
(
	[UsageTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
    

ALTER TABLE [Coupon].[CouponUsageType] ADD  CONSTRAINT [DF_CouponUsageType_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

ALTER TABLE [Coupon].[CouponUsageType] ADD  CONSTRAINT [DF_CouponUsageType_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]
     BEGIN
				PRINT 'SUCCESS - Table [Coupon].[CouponUsageType] created.'
	 END


		IF OBJECT_ID(N'[Coupon].[CouponUsageType]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [Coupon].[CouponUsageType] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [Coupon].[CouponUsageType] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CouponUsageType] already exists.'
	END
GO


USE [TescoSubscription]
GO

/*

	Author:			Robin
	Date created:	14-Jan-2014
	Table Type:		Reference
	Table Size:		Estimated < 100 rows
	Purpose:		Holds reference data for Campaign discount Type
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>
	

*/
IF OBJECT_ID(N'[Coupon].[DiscountTypeMaster]',N'U') IS NULL
	BEGIN
CREATE TABLE [Coupon].[DiscountTypeMaster](
	[DiscountTypeId] [tinyint] NOT NULL,
	[DiscountName] [nvarchar](80) NOT NULL,
    [UTCCreatedDateTime] [datetime] NOT NULL,
	[UTCUpdatedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_CouponDiscountType] PRIMARY KEY CLUSTERED 
(
	[DiscountTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [Coupon].[DiscountTypeMaster] ADD  CONSTRAINT [DF_DiscountTypeMaster_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

ALTER TABLE [Coupon].[DiscountTypeMaster] ADD  CONSTRAINT [DF_DiscountTypeMaster_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

BEGIN
				PRINT 'SUCCESS - Table [Coupon].[DiscountTypeMaster] created.'
	 END


		IF OBJECT_ID(N'[Coupon].[DiscountTypeMaster]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [Coupon].[DiscountTypeMaster] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [Coupon].[DiscountTypeMaster] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[DiscountTypeMaster] already exists.'
	END
GO


USE [TescoSubscription]
GO

/*

	Author:			Robin
	Date created:	14-April-2014
	Table Type:		Reference
	Table Size:		Estimated > 100 rows
	Purpose:		Holds Coupon Payment Remaining Data
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	02 June 2014    Robin                            Added composite primary key
	

*/
IF OBJECT_ID(N'[tescosubscription].[CustomerPaymentRemainingDetail]',N'U') IS NULL
	BEGIN
CREATE TABLE [tescosubscription].[CustomerPaymentRemainingDetail](
	[CustomerSubscriptionId] [bigint] NOT NULL,
	[PaymentRemainingAmount] [money] NOT NULL,
	[UTCCreatedDateTime] [datetime] NOT NULL CONSTRAINT [DF_CustomerPaymentRemainingDetail_UTCCreatedDateTime]  DEFAULT (getutcdate()),
	[UTCUpdatedDateTime] [datetime] NOT NULL CONSTRAINT [DF_CustomerPaymentRemainingDetail_UTCUpdatedDateTime]  DEFAULT (getutcdate())
) ON [PRIMARY]


BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[CustomerPaymentRemainingDetail] created.'
	 END


		IF OBJECT_ID(N'[tescosubscription].[CustomerPaymentRemainingDetail]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[CustomerPaymentRemainingDetail] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[CustomerPaymentRemainingDetail] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[CustomerPaymentRemainingDetail] already exists.'
	END
GO


--------------Add Primary Key to Subscriptionplan and DOW-------------------------------------
IF EXISTS(SELECT 1 FROM information_schema.columns      
				WHERE TABLE_SCHEMA      = 'tescosubscription'
				AND TABLE_NAME			= 'CustomerPaymentRemainingDetail'
				AND COLUMN_NAME         = 'CustomerSubscriptionID'
                ) 
BEGIN     
	
ALTER TABLE [tescosubscription].[CustomerPaymentRemainingDetail]
ADD CONSTRAINT PK_CustomerPaymentRemainingDetail_CustomerSubscriptionID_PaymentRemainingAmount PRIMARY KEY (CustomerSubscriptionID,PaymentRemainingAmount)

PRINT 'PK_CustomerPaymentRemainingDetail_CustomerSubscriptionID_PaymentRemainingAmount'
END


 USE [TescoSubscription]
GO

/*******************************************************************************************  
********************************************************************************************  
** TYPE           : CREATE TABLE  
** NAME           : TABLE [Coupon].[Campaign]   
** AUTHOR         : INFOSYS TECHNOLOGIES LIMITED  
** DESCRIPTION    : THIS SCRIPT WILL CREATE TABLE [Coupon].[Campaign]
** DATE WRITTEN   : 06/03/2013                     
** ARGUMENT(S)    : NONE
** RETURN VALUE(S): NONE
*******************************************************************************************  
*******************************************************************************************/
/*
	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'[Coupon].[Campaign]',N'U') IS NULL
	BEGIN

	CREATE TABLE [Coupon].[Campaign](
		[CampaignID] [BIGINT] IDENTITY(1,1) NOT NULL,
		[CampaignCode] [NVARCHAR](25) NOT NULL,
		[DescriptionShort] [NVARCHAR](200) NULL,
		[DescriptionLong] [NVARCHAR](300) NULL,
		[Amount] [MONEY] NOT NULL,
		[IsActive] [BIT] NOT NULL,
		[CampaignTypeId] [INT] NOT NULL,	
		[UTCCreatedDateTime] [SMALLDATETIME] NOT NULL,
		[UTCUpdatedDateTime] [SMALLDATETIME] NOT NULL,
	 CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED 
	(
		[CampaignId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
	 CONSTRAINT [UQ_CampaignCode] UNIQUE NONCLUSTERED 
	(
		[CampaignCode] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]


	ALTER TABLE [Coupon].[Campaign] ADD  CONSTRAINT [DF_Campaign_IsActive]  DEFAULT ((0)) FOR [IsActive]


	ALTER TABLE [Coupon].[Campaign] ADD  CONSTRAINT [DF_CampaignTypeID]  DEFAULT ((1)) FOR [CampaignTypeID]


	ALTER TABLE [Coupon].[Campaign] ADD  CONSTRAINT [DF_CAMPAIGN_UTCCREATEDEDATETIME]  DEFAULT (GETUTCDATE()) FOR [UTCCreatedDateTime]


	ALTER TABLE [Coupon].[Campaign] ADD  CONSTRAINT [DF_CAMPAIGN_UTCUPDATEDDATETIME]  DEFAULT (GETUTCDATE()) FOR [UTCUpdatedDateTime]


	IF OBJECT_ID(N'[Coupon].[Campaign]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [Coupon].[Campaign] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table[Coupon].[Campaign] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[Campaign] already exists.'
	END
GO

--------------- ADD column [UsageTypeID] ------------------------

IF NOT EXISTS(SELECT 1 FROM information_schema.columns      
				WHERE TABLE_SCHEMA      = 'Coupon'
				AND TABLE_NAME			= 'Campaign'
				AND COLUMN_NAME         = 'UsageTypeID') 
BEGIN     
	ALTER TABLE [Coupon].[Campaign] ADD UsageTypeID tinyint  NOT NULL CONSTRAINT DF_UsageTypeID DEFAULT (1)
		PRINT 'Column Coupon.Campaign.UsageTypeID added'
END
ELSE
        PRINT 'Column Coupon.Campaign.UsageTypeID already exists'
GO

--------------- ADD column [IsMutuallyExclusive] ------------------------

IF NOT EXISTS(SELECT 1 FROM information_schema.columns      
				WHERE TABLE_SCHEMA      = 'Coupon'
				AND TABLE_NAME			= 'Campaign'
				AND COLUMN_NAME         = 'IsMutuallyExclusive') 
BEGIN     
	ALTER TABLE [Coupon].[Campaign] ADD IsMutuallyExclusive BIT  NOT NULL CONSTRAINT DF_IsMutuallyExclusive DEFAULT (0)
		PRINT 'Column Coupon.Campaign.IsMutuallyExclusive added'
END
ELSE
        PRINT 'Column Coupon.Campaign.IsMutuallyExclusive already exists'
GO
USE [TescoSubscription]
GO

/*******************************************************************************************  
********************************************************************************************  
** TYPE           : CREATE TABLE  
** NAME           : TABLE [Coupon].[CampaignAttributeReference]   
** AUTHOR         : INFOSYS TECHNOLOGIES LIMITED  
** DESCRIPTION    : THIS SCRIPT WILL CREATE TABLE [Coupon].[CampaignAttributeReference]
** DATE WRITTEN   : 06/03/2013                     
** ARGUMENT(S)    : NONE
** RETURN VALUE(S): NONE
*******************************************************************************************  
*******************************************************************************************/
/*
	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'[Coupon].[CampaignAttributeReference]',N'U') IS NULL
	BEGIN

	CREATE TABLE [Coupon].[CampaignAttributeReference](
		[AttributeID] [SMALLINT] NOT NULL,
		[Description] [NVARCHAR](250) NULL,
		[UTCCreatedDateTime] [SMALLDATETIME] NOT NULL,
		[UTCUpdateDDateTime] [SMALLDATETIME] NOT NULL,
	 CONSTRAINT [PK_CampaignAttributeReference] PRIMARY KEY CLUSTERED 
	(
		[AttributeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]


	ALTER TABLE [Coupon].[CampaignAttributeReference] ADD  CONSTRAINT [DF_CampaignAttributeReference_UTCCreatedDateTime]  DEFAULT (GETUTCDATE()) FOR [UTCCreatedDateTime]


	ALTER TABLE [Coupon].[CampaignAttributeReference] ADD  CONSTRAINT [DF_CampaignAttributeReference_UTCUpdatedDateTime]  DEFAULT (GETUTCDATE()) FOR [UTCupdatedDateTime]

	IF OBJECT_ID(N'[Coupon].[CampaignAttributeReference]',N'U') IS NOT NULL
				BEGIN
					PRINT 'SUCCESS - Table [Coupon].[CampaignAttributeReference] created.'
				END
			ELSE
				BEGIN
					RAISERROR('FAIL - Table[Coupon].[CampaignAttributeReference] not created.',16,1)
				END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CampaignAttributeReference] already exists.'
	END
GO



USE [TescoSubscription]
GO
/*******************************************************************************************  
********************************************************************************************  
** TYPE           : CREATE TABLE  
** NAME           : TABLE [Coupon].[CampaignAttributes]  
** AUTHOR         : INFOSYS TECHNOLOGIES LIMITED  
** DESCRIPTION    : THIS SCRIPT WILL CREATE TABLE [Coupon].[CampaignAttributes]
** DATE WRITTEN   : 06/03/2013                     
** ARGUMENT(S)    : NONE
** RETURN VALUE(S): NONE
*******************************************************************************************  
*******************************************************************************************/
/*
	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF OBJECT_ID(N'[Coupon].[CampaignAttributes]',N'U') IS NULL
	BEGIN

	CREATE TABLE [Coupon].[CampaignAttributes](
		[CampaignID] [BIGINT] NOT NULL,
		[AttributeID] [SMALLINT] NOT NULL,
		[AttributeValue] [NVARCHAR](50) NOT NULL,
		[UTCCreatedDateTime] [SMALLDATETIME] NOT NULL,
		[UTCUpdatedDateTime] [SMALLDATETIME] NOT NULL,
	 CONSTRAINT [PK_CampaignAttributes] PRIMARY KEY CLUSTERED 
	(
		[CampaignID] ASC,
		[AttributeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]


	ALTER TABLE [Coupon].[CampaignAttributes] ADD  CONSTRAINT [DF_CampaignAttributes_UTCCreatedDateTime]  DEFAULT (GETUTCDATE()) FOR [UTCcreatedDateTime]


	ALTER TABLE [Coupon].[CampaignAttributes] ADD  CONSTRAINT [DF_CampaignAttributes_UTCUpdatedDateTime]  DEFAULT (GETUTCDATE()) FOR [UTCUpdatedDateTime]

	IF OBJECT_ID(N'[Coupon].[CampaignAttributes]',N'U') IS NOT NULL
				BEGIN
					PRINT 'SUCCESS - Table [Coupon].[CampaignAttributes] created.'
				END
			ELSE
				BEGIN
					RAISERROR('FAIL - Table [Coupon].[CampaignAttributes] not created.',16,1)
				END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CampaignAttributes] already exists.'
	END
GO



﻿USE [TescoSubscription]
GO

/*

	Author:			Robin
	Date created:	14-Jan-2014
	Table Type:		Reference
	Table Size:		Estimated > 100 rows
	Purpose:		Holds reference data for Campaign discount Type
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>
	

*/
IF OBJECT_ID(N'[Coupon].[CampaignDiscountType]',N'U') IS NULL
	BEGIN
CREATE TABLE [Coupon].[CampaignDiscountType](
	[CampaignID] [bigint] NOT NULL,
	[DiscountTypeID] [tinyint] NOT NULL,
	[DiscountValue] [decimal](6, 2) NOT NULL,
    [UTCCreatedDateTime] [datetime] NOT NULL,
	[UTCUpdatedDateTime] [datetime] NOT NULL,
CONSTRAINT [PK_CampaignDiscountType_CampaignID_DiscountTypeID] PRIMARY KEY CLUSTERED 
(
	[CampaignID] ASC,
	[DiscountTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [Coupon].[CampaignDiscountType] ADD  CONSTRAINT [DF_CampaignDiscountType_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

ALTER TABLE [Coupon].[CampaignDiscountType] ADD  CONSTRAINT [DF_CampaignDiscountType_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

BEGIN
				PRINT 'SUCCESS - Table [Coupon].[CampaignDiscountType] created.'
	 END


		IF OBJECT_ID(N'[Coupon].[CampaignDiscountType]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [Coupon].[CampaignDiscountType] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [Coupon].[CampaignDiscountType] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CampaignDiscountType] already exists.'
	END
GO


﻿USE [TescoSubscription]
GO

/*

	Author:			Robin
	Date created:	14-Jan-2014
	Table Type:		Reference
	Table Size:		Estimated > 100 rows
	Purpose:		Holds data for Campaign Plan Details
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>
	

*/
IF OBJECT_ID(N'[Coupon].[CampaignPlanDetails]',N'U') IS NULL
	BEGIN

CREATE TABLE [Coupon].[CampaignPlanDetails](
	[CampaignID] [bigint] NOT NULL,
	[SubscriptionPlanID] [int] NOT NULL,
    [UTCCreatedDateTime] [datetime] NOT NULL,
	[UTCUpdatedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_CampaignPlanDetails_CampaignID_SubscriptionPlanID] PRIMARY KEY CLUSTERED 
(
	[CampaignID] ASC,
	[SubscriptionPlanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [Coupon].[CampaignPlanDetails] ADD  CONSTRAINT [DF_CampaignPlanDetails_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

ALTER TABLE [Coupon].[CampaignPlanDetails] ADD  CONSTRAINT [DF_CampaignPlanDetails_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

BEGIN
				PRINT 'SUCCESS - Table [Coupon].[CampaignPlanDetails] created.'
	 END


		IF OBJECT_ID(N'[Coupon].[CampaignPlanDetails]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [Coupon].[CampaignPlanDetails] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [Coupon].[CampaignPlanDetails] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CampaignPlanDetails] already exists.'
	END
GO



USE [TescoSubscription]
GO

/*******************************************************************************************  
********************************************************************************************  
** TYPE           : CREATE TABLE  
** NAME           : TABLE [Coupon].[CampaignTypeMaster]   
** AUTHOR         : INFOSYS TECHNOLOGIES LIMITED  
** DESCRIPTION    : THIS SCRIPT WILL CREATE TABLE [Coupon].[CampaignTypeMaster] 
** DATE WRITTEN   : 06/03/2013                     
** ARGUMENT(S)    : NONE
** RETURN VALUE(S): NONE
*******************************************************************************************  
*******************************************************************************************/
/*
	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF OBJECT_ID(N'[Coupon].[CampaignTypeMaster]',N'U') IS NULL
	BEGIN


	CREATE TABLE [Coupon].[CampaignTypeMaster](
		[CampaignTypeID] [INT] IDENTITY(1,1) NOT NULL,
		[CampaignTypeName] [NVARCHAR](50) NOT NULL,
		[Description] [NVARCHAR](200) NULL,
		[IsActive] [BIT] NOT NULL,
		[UTCCreatedDateTime] [SMALLDATETIME] NOT NULL,
		[UTCUpdatedDateTime] [SMALLDATETIME] NOT NULL,
	 CONSTRAINT [PK_CampaignTypeMaster] PRIMARY KEY CLUSTERED 
	(
		[CampaignTypeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]


	ALTER TABLE [Coupon].[CampaignTypeMaster] ADD  CONSTRAINT [DF_CampaignTypeMaster_IsActive]  DEFAULT ((0)) FOR [IsActive]


	ALTER TABLE [Coupon].[CampaignTypeMaster] ADD  CONSTRAINT [DF_CampaignTypeMaster_UTCCreatedDateTime]  DEFAULT (GETUTCDATE()) FOR [UTCCreatedDateTime]


	ALTER TABLE [Coupon].[CampaignTypeMaster] ADD  CONSTRAINT [DF_CampaignTypeMaster_UTCUpdatedDateTime]  DEFAULT (GETUTCDATE()) FOR [UTCUpdatedDateTime]

	IF OBJECT_ID(N'[Coupon].[CampaignTypeMaster]',N'U') IS NOT NULL
				BEGIN
					PRINT 'SUCCESS - Table [Coupon].[CampaignTypeMaster] created.'
				END
			ELSE
				BEGIN
					RAISERROR('FAIL - Table [Coupon].[CampaignTypeMaster] not created.',16,1)
				END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CampaignTypeMaster] already exists.'
	END
GO




USE TescoSubscription
Go
/*

	Author:			Manjunathan Raman
	Date created:	01-Oct-2012
	Table Type:		Reference
	Table Size:		
	Purpose:		To Store the Coupons
	Usage:			Refered by Website for getting Coupon details
	Archiving:		

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	10-June-2013	Abhishek						Adding Column for CampaignID, and foreign key constraint
	23-Jul-2013		Navdeep_Singh					Removing foreign key constraint as part of TFS check in standard
*/
IF OBJECT_ID(N'[Coupon].[Coupon]',N'U') IS NULL
	BEGIN

		CREATE TABLE [Coupon].[Coupon](
			[CouponID] [bigint] IDENTITY(1,1) NOT NULL,
			[CouponCode] [nvarchar](25) NOT NULL,
			[DescriptionShort] [nvarchar](200) NULL,
			[DescriptionLong] [nvarchar](300) NULL,
			[Amount] [money] NOT NULL,
			[RedeemCount] [int] NOT NULL,
			[IsActive] [bit] NOT NULL,
			[UTCCreatedeDateTime] [smalldatetime] NOT NULL,
			[UTCUpdatedDateTime] [smalldatetime] NOT NULL,
			[CampaignID] [bigint] NULL,
		 CONSTRAINT [PK_Coupon] PRIMARY KEY CLUSTERED 
		(
			[CouponID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
		 CONSTRAINT [UQ_Coupon_CouponCode] UNIQUE NONCLUSTERED 
		(
			[CouponCode] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
		) ON [PRIMARY]
		

		ALTER TABLE [Coupon].[Coupon] ADD  CONSTRAINT [DF_Coupon_RedeemCount]  DEFAULT ((0)) FOR [RedeemCount]

		ALTER TABLE [Coupon].[Coupon] ADD  CONSTRAINT [DF_Coupon_IsActive]  DEFAULT ((0)) FOR [IsActive]

		ALTER TABLE [Coupon].[Coupon] ADD  CONSTRAINT [DF_Coupon_UTCCreatedeDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedeDateTime]

		ALTER TABLE [Coupon].[Coupon] ADD  CONSTRAINT [DF_Coupon_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]	
	

		IF OBJECT_ID(N'[Coupon].[Coupon]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [Coupon].[Coupon] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [Coupon].[Coupon] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[Coupon] already exists.'
		IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Coupon' AND TABLE_SCHEMA = 'Coupon'  AND  COLUMN_NAME = 'CampaignID')
		BEGIN			
			ALTER TABLE [Coupon].[Coupon] ADD [CampaignID] [bigint]  NULL;			
			
			IF EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Coupon' AND TABLE_SCHEMA = 'Coupon'  AND  COLUMN_NAME = 'CampaignID')
			BEGIN				
				PRINT 'SUCCESS - Column [CampaignID] added in Table [Coupon].[Coupon].'
			END
			ELSE
			BEGIN
				RAISERROR('FAIL - Column [CampaignID] not added in Table [Coupon].[Coupon].',16,1)
			END
		END
		ELSE
		BEGIN
			PRINT 'EXISTS - Column [CampaignID] already exists in Table [Coupon].[Coupon].'
		END	
	END

GO/*

	Author:			Manjunathan Raman
	Date created:	01-Oct-2012
	Table Type:		Reference
	Table Size:		
	Purpose:		To store Coupon Attributes
	Usage:			Coupon Details reference
	Fillfactor:		
	Archiving:		

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
IF OBJECT_ID(N'[Coupon].[CouponAttributes]',N'U') IS NULL
	BEGIN

		CREATE TABLE [Coupon].[CouponAttributes](
			[CouponID] BIGINT NOT NULL,
			[AttributeID] [smallint] NOT NULL,
			[AttributeValue] [nvarchar](50) NOT NULL,
			[UTCCreatedDateTime] [smalldatetime] NOT NULL,
			[UTCUpdatedDateTime] [smalldatetime] NOT NULL,
		 CONSTRAINT [PK_CouponAttributes] PRIMARY KEY CLUSTERED 
		(
			[CouponID] ASC,
			[AttributeID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
		) ON [PRIMARY]
		

		ALTER TABLE [Coupon].[CouponAttributes] ADD  CONSTRAINT [DF_CouponAttributes_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

		ALTER TABLE [Coupon].[CouponAttributes] ADD  CONSTRAINT [DF_CouponAttributes_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

		IF OBJECT_ID(N'[Coupon].[CouponAttributes]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [Coupon].[CouponAttributes] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [Coupon].[CouponAttributes] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CouponAttributes] already exists.'
	END
GO
/*

	Author:			Manjunathan Raman
	Date created:	01-Oct-2012
	Table Type:		Reference
	Table Size:		
	Purpose:		Internal table
	Usage:			Not used by system, and it is for Developer purpose
	Fillfactor:		
	Archiving:		N/A

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
IF OBJECT_ID(N'[Coupon].[CouponAttributesReference]',N'U') IS NULL
	BEGIN

		CREATE TABLE [Coupon].[CouponAttributesReference](
			[AttributeID] [smallint] NOT NULL,
			[Description] [nvarchar](250) NULL,
			[UTCCreatedDateTime] [smalldatetime] NOT NULL,
			[UTCUpdatedDateTime] [smalldatetime] NOT NULL,
		 CONSTRAINT [PK_CouponAttributesReference] PRIMARY KEY CLUSTERED 
		(
			[AttributeID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
		) ON [PRIMARY]
		

		ALTER TABLE [Coupon].[CouponAttributesReference] ADD  CONSTRAINT [DF_CouponAttributesReference_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

		ALTER TABLE [Coupon].[CouponAttributesReference] ADD  CONSTRAINT [DF_CouponAttributesReference_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

		IF OBJECT_ID(N'[Coupon].[CouponAttributesReference]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [Coupon].[CouponAttributesReference] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [Coupon].[CouponAttributesReference] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CouponAttributesReference] already exists.'
	END
GO
USE [TescoSubscription]
GO

/*******************************************************************************************  
********************************************************************************************  
** TYPE           : CREATE TABLE  
** NAME           : TABLE [Coupon].[CouponCustomerMap] 
** AUTHOR         : INFOSYS TECHNOLOGIES LIMITED  
** DESCRIPTION    : THIS SCRIPT WILL CREATE TABLE [Coupon].[CouponCustomerMap]
** DATE WRITTEN   : 06/03/2013                     
** ARGUMENT(S)    : NONE
** RETURN VALUE(S): NONE
*******************************************************************************************  
*******************************************************************************************/
/*
	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'[Coupon].[CouponCustomerMap]',N'U') IS NULL
	BEGIN


	CREATE TABLE [Coupon].[CouponCustomerMap](
		[CouponID] [BIGINT] NOT NULL,
		[CustomerID] [BIGINT] NOT NULL,
		[UTCCreatedDateTime] [SMALLDATETIME] NOT NULL,
		[UTCUpdatedDateTime] [SMALLDATETIME] NOT NULL
	 CONSTRAINT [PK_CouponCustomerMap] PRIMARY KEY CLUSTERED 
	(
		[CouponID] ASC,
		[CustomerID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]

	ALTER TABLE [Coupon].[CouponCustomerMap] ADD  CONSTRAINT [DF_CouponCustomerMap_UTCCreatedDateTime]  DEFAULT (GETUTCDATE()) FOR [UTCCreatedDateTime]

	ALTER TABLE [Coupon].[CouponCustomerMap] ADD  CONSTRAINT [DF_CouponCustomerMap_UTCUpdatedDateTime]  DEFAULT (GETUTCDATE()) FOR [UTCUpdatedDateTime]


	IF OBJECT_ID(N'[Coupon].[CouponCustomerMap]',N'U') IS NOT NULL
				BEGIN
					PRINT 'SUCCESS - Table [Coupon].[CouponCustomerMap] created.'
				END
			ELSE
				BEGIN
					RAISERROR('FAIL - Table [Coupon].[CouponCustomerMap] not created.',16,1)
				END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CouponCustomerMap] already exists.'
	END
GO

/*

	Author:			Manjunathan Raman
	Date created:	01-Oct-2012
	Table Type:		Transactional
	Table Size:		
	Purpose:		To store Valid redemption details
	Usage:			While customer claims data is entered in this table
	Archiving:		

	--Modifications History--
	Changed On		Changed By		Defect Ref		                   Change Description
	14 April 2014    Robin           BI replication Purpose             Ro_No Column Added

*/
IF OBJECT_ID(N'[Coupon].[CouponRedemption]',N'U') IS NULL
	BEGIN

		CREATE TABLE [Coupon].[CouponRedemption](
			[CouponCode] [nvarchar](25) NOT NULL,
			[CustomerID] [bigint] NOT NULL,
			[UTCCreatedDateTime] [smalldatetime] NOT NULL,
			[UTCUpdatedDateTime] [smalldatetime] NOT NULL
		) ON [PRIMARY]
		

		ALTER TABLE [Coupon].[CouponRedemption] ADD  CONSTRAINT [DF_CouponRedemption_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

		ALTER TABLE [Coupon].[CouponRedemption] ADD  CONSTRAINT [DF_CouponRedemption_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

		IF OBJECT_ID(N'[Coupon].[CouponRedemption]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [Coupon].[CouponRedemption] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [Coupon].[CouponRedemption] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CouponRedemption] already exists.'
	END
GO

----------------------------- Add Column [Ro_no]-----------------------------------------------------
IF NOT EXISTS(SELECT 1 FROM information_schema.columns      
                           WHERE TABLE_SCHEMA   = 'Coupon'
                           AND TABLE_NAME       = 'CouponRedemption'
                           AND COLUMN_NAME      = 'Ro_No') 
BEGIN  
	ALTER TABLE [Coupon].[CouponRedemption] 
	ADD Ro_No BIGINT IDENTITY(1,1) NOT NULL 
    
    
    ALTER TABLE [Coupon].[CouponRedemption] 
    ADD CONSTRAINT PK_Coupon_CouponRedemption_Ro_No PRIMARY KEY NONCLUSTERED (Ro_No)
     
END
    PRINT 'Column Coupon.CouponRedemption.Ro_No and PK_Coupon_CouponRedemption_Ro_No added to Column Coupon.CouponRedemption.Ro_No'USE [TescoSubscription]

GO

/*

	Author:			Robin
	Date created:	14-Jan-2014
	Table Type:		Reference
	Table Size:		Estimated < 100 rows
	Purpose:		Holds reference data for Coupon Usage Type
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>
	

*/
IF OBJECT_ID(N'[Coupon].[CouponUsageType]',N'U') IS NULL
	BEGIN
CREATE TABLE [Coupon].[CouponUsageType](
	[UsageTypeID] [tinyint] NOT NULL,
	[UsageName] [nvarchar](80) NOT NULL,
	[UTCCreatedDateTime] [datetime] NOT NULL,
	[UTCUpdatedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_CouponUsageType] PRIMARY KEY CLUSTERED 
(
	[UsageTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
    

ALTER TABLE [Coupon].[CouponUsageType] ADD  CONSTRAINT [DF_CouponUsageType_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

ALTER TABLE [Coupon].[CouponUsageType] ADD  CONSTRAINT [DF_CouponUsageType_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]
     BEGIN
				PRINT 'SUCCESS - Table [Coupon].[CouponUsageType] created.'
	 END


		IF OBJECT_ID(N'[Coupon].[CouponUsageType]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [Coupon].[CouponUsageType] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [Coupon].[CouponUsageType] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[CouponUsageType] already exists.'
	END
GO


USE [TescoSubscription]
GO

/*

	Author:			Robin
	Date created:	14-Jan-2014
	Table Type:		Reference
	Table Size:		Estimated < 100 rows
	Purpose:		Holds reference data for Campaign discount Type
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>
	

*/
IF OBJECT_ID(N'[Coupon].[DiscountTypeMaster]',N'U') IS NULL
	BEGIN
CREATE TABLE [Coupon].[DiscountTypeMaster](
	[DiscountTypeId] [tinyint] NOT NULL,
	[DiscountName] [nvarchar](80) NOT NULL,
    [UTCCreatedDateTime] [datetime] NOT NULL,
	[UTCUpdatedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_CouponDiscountType] PRIMARY KEY CLUSTERED 
(
	[DiscountTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [Coupon].[DiscountTypeMaster] ADD  CONSTRAINT [DF_DiscountTypeMaster_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

ALTER TABLE [Coupon].[DiscountTypeMaster] ADD  CONSTRAINT [DF_DiscountTypeMaster_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

BEGIN
				PRINT 'SUCCESS - Table [Coupon].[DiscountTypeMaster] created.'
	 END


		IF OBJECT_ID(N'[Coupon].[DiscountTypeMaster]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [Coupon].[DiscountTypeMaster] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [Coupon].[DiscountTypeMaster] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [Coupon].[DiscountTypeMaster] already exists.'
	END
GO


USE [TescoSubscription]
GO

/*

	Author:			Robin
	Date created:	14-April-2014
	Table Type:		Reference
	Table Size:		Estimated > 100 rows
	Purpose:		Holds Coupon Payment Remaining Data
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	02 June 2014    Robin                            Added composite primary key
	

*/
IF OBJECT_ID(N'[tescosubscription].[CustomerPaymentRemainingDetail]',N'U') IS NULL
	BEGIN
CREATE TABLE [tescosubscription].[CustomerPaymentRemainingDetail](
	[CustomerSubscriptionId] [bigint] NOT NULL,
	[PaymentRemainingAmount] [money] NOT NULL,
	[UTCCreatedDateTime] [datetime] NOT NULL CONSTRAINT [DF_CustomerPaymentRemainingDetail_UTCCreatedDateTime]  DEFAULT (getutcdate()),
	[UTCUpdatedDateTime] [datetime] NOT NULL CONSTRAINT [DF_CustomerPaymentRemainingDetail_UTCUpdatedDateTime]  DEFAULT (getutcdate())
) ON [PRIMARY]


BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[CustomerPaymentRemainingDetail] created.'
	 END


		IF OBJECT_ID(N'[tescosubscription].[CustomerPaymentRemainingDetail]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[CustomerPaymentRemainingDetail] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[CustomerPaymentRemainingDetail] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[CustomerPaymentRemainingDetail] already exists.'
	END
GO


--------------Add Primary Key to Subscriptionplan and DOW-------------------------------------
IF EXISTS(SELECT 1 FROM information_schema.columns      
				WHERE TABLE_SCHEMA      = 'tescosubscription'
				AND TABLE_NAME			= 'CustomerPaymentRemainingDetail'
				AND COLUMN_NAME         = 'CustomerSubscriptionID'
                ) 
BEGIN     
	
ALTER TABLE [tescosubscription].[CustomerPaymentRemainingDetail]
ADD CONSTRAINT PK_CustomerPaymentRemainingDetail_CustomerSubscriptionID_PaymentRemainingAmount PRIMARY KEY (CustomerSubscriptionID,PaymentRemainingAmount)

PRINT 'PK_CustomerPaymentRemainingDetail_CustomerSubscriptionID_PaymentRemainingAmount'
END


 USE [TescoSubscription]
GO

/*******************************************************************************************  
********************************************************************************************  
** TYPE           : CREATE TABLE  
** NAME           : TABLE [Coupon].[Campaign]   
** AUTHOR         : INFOSYS TECHNOLOGIES LIMITED  
** DESCRIPTION    :/*

	Author:			Saritha K
	Date created:	27-Jul-2011
	Table Type:		Reference
	Table Size:		Estimate < 100 Records
	Purpose:		Create Lookup Table for Business 
	Fillfactor:		<Default 90% for Transactional, 100% for Reference>
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
IF OBJECT_ID(N'[tescosubscription].[BusinessMaster]',N'U') IS NULL
	BEGIN

		CREATE TABLE [tescosubscription].[BusinessMaster](
			[BusinessID] [tinyint] NOT NULL,
			[BusinessName] [varchar](30) NOT NULL,
			[UTCCreatedDateTime] [datetime] NOT NULL,
			[UTCUpdatedDateTime] [datetime] NOT NULL,
		 CONSTRAINT [PK_BusinessMaster] PRIMARY KEY CLUSTERED 
		(
			[BusinessID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
		) ON [PRIMARY]
		

		ALTER TABLE [tescosubscription].[BusinessMaster] ADD  CONSTRAINT [DF_BusinessMaster_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

		ALTER TABLE [tescosubscription].[BusinessMaster] ADD  CONSTRAINT [DF_BusinessMaster_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

		IF OBJECT_ID(N'[tescosubscription].[BusinessMaster]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[BusinessMaster] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[BusinessMaster] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[BusinessMaster] already exists.'
	END
GO
/*

	Author:			Rajendra Singh
	Date created:	27-Jul-2011
	Table Type:		Reference
	Table Size:		Estimated < 100 rows
	Purpose:		Holds reference data for channels
	Fillfactor:		<Default 90% for Transactional, 100% for Reference>
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>
	19 Sep 2011		Saritha K						DataType for ChannelName is changed to varchar(20)

*/
IF OBJECT_ID(N'[tescosubscription].[ChannelMaster]',N'U') IS NULL
	BEGIN

		CREATE TABLE [tescosubscription].[ChannelMaster](
			[ChannelID] [tinyint] NOT NULL,
			[ChannelName] [varchar](20) NOT NULL,
			[UTCCreatedDateTime] [datetime] NOT NULL,
			[UTCUpdatedDateTime] [datetime] NOT NULL,
		 CONSTRAINT [PK_ChannelMaster] PRIMARY KEY CLUSTERED 
		(
			[ChannelID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
		) ON [PRIMARY]
		

		ALTER TABLE [tescosubscription].[ChannelMaster] ADD  CONSTRAINT [DF_ChannelMaster_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

		ALTER TABLE [tescosubscription].[ChannelMaster] ADD  CONSTRAINT [DF_ChannelMaster_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

		IF OBJECT_ID(N'[tescosubscription].[ChannelMaster]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[ChannelMaster] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[ChannelMaster] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[ChannelMaster] already exists.'
	END
GO

/*

	Author:			Robin John
	Date created:	14-08-2013
	
	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>
         
*/



IF OBJECT_ID(N'[tescosubscription].[ConfigurationSettings]',N'U') IS NULL
BEGIN

	CREATE TABLE [tescosubscription].[ConfigurationSettings](
	[SettingName] [varchar](255) NOT NULL,
	[SettingValue] [varchar](255) NOT NULL,
	[UTCCreatedDateTime] [datetime] NOT NULL CONSTRAINT [DF_PersonalizedSavingsConfig_UTCCreatedDateTime]  DEFAULT (getutcdate()),
	[UTCUpdatedDateTime] [datetime] NOT NULL CONSTRAINT [DF_PersonalizedSavingsConfig_UTCUpdatedDateTime]  DEFAULT (getutcdate()),
 CONSTRAINT [PK_SettingName] PRIMARY KEY CLUSTERED
(
	[SettingName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
	

IF OBJECT_ID(N'[tescosubscription].[ConfigurationSettings]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[ConfigurationSettings] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[ConfigurationSettings] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[ConfigurationSettings] already exists.'
	END
GO
/*

	Author:			Saritha Kommineni
	Date created:	27-Jul-2011
	Table Type:		Reference
	Table Size:		Estimated < 100 rows
	Purpose:		Create Lookup Table for country currency
	Fillfactor:		<Default 90% for Transactional, 100% for Reference>
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
IF OBJECT_ID(N'[tescosubscription].[CountryCurrencyMap]',N'U') IS NULL
	BEGIN

		CREATE TABLE [tescosubscription].[CountryCurrencyMap](
			[CountryCurrencyID] [tinyint] NOT NULL,
			[CountryCode] [char](2) NOT NULL,
			[CountryCurrency] [char](3) NOT NULL,
			[CurrencyDesc] [varchar](30) NULL,
			[UTCCreatedDateTime] [datetime] NOT NULL,
			[UTCUpdatedDateTime] [datetime] NOT NULL,
		 CONSTRAINT [PK_CountryMaster] PRIMARY KEY CLUSTERED 
		(
			[CountryCurrencyID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
		 CONSTRAINT [UK_CountryMaster] UNIQUE NONCLUSTERED 
		(
			[CountryCode] ASC,
			[CountryCurrency] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
		) ON [PRIMARY]
		

		ALTER TABLE [tescosubscription].[CountryCurrencyMap] ADD  CONSTRAINT [DF_CountryCurrencyMap_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

		ALTER TABLE [tescosubscription].[CountryCurrencyMap] ADD  CONSTRAINT [DF_CountryCurrencyMap_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

		IF OBJECT_ID(N'[tescosubscription].[CountryCurrencyMap]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[CountryCurrencyMap] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[CountryCurrencyMap] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[CountryCurrencyMap] already exists.'
	END
GO
/*

	Author:			Rajendra Singh
	Date created:	27-Jul-2011
	Table Type:		Transactional
	Purpose:		saves payment details of customers
	Fillfactor:		<Default 90% for Transactional, 100% for Reference>
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	25 Aug 2011		Manjunathan						Made Is Active default as 0

*/
IF OBJECT_ID(N'[tescosubscription].[CustomerPayment]',N'U') IS NULL
	BEGIN

		CREATE TABLE [tescosubscription].[CustomerPayment](
			[CustomerPaymentID] [bigint] IDENTITY(1,1) NOT NULL,
			[CustomerID] [bigint] NOT NULL,
			[PaymentModeID] [tinyint] NOT NULL,
			[PaymentToken] [nvarchar](44) NOT NULL,
			[IsActive] [bit] NOT NULL,
			[IsFirstPaymentDue] [bit] NOT NULL,
			[UTCCreatedDateTime] [datetime] NOT NULL,
			[UTCUpdatedDateTime] [datetime] NOT NULL,
		 CONSTRAINT [PK_CustomerPayment] PRIMARY KEY CLUSTERED 
		(
			[CustomerPaymentID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
		) ON [PRIMARY]
		

		ALTER TABLE [tescosubscription].[CustomerPayment] ADD  CONSTRAINT [DF_CustomerPayment_IsActive]  DEFAULT ((0)) FOR [IsActive]

		ALTER TABLE [tescosubscription].[CustomerPayment] ADD  CONSTRAINT [DF_CustomerPayment_IsFirstPaymentDue]  DEFAULT ((1)) FOR [IsFirstPaymentDue]

		ALTER TABLE [tescosubscription].[CustomerPayment] ADD  CONSTRAINT [DF_CustomerPayment_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

		ALTER TABLE [tescosubscription].[CustomerPayment] ADD  CONSTRAINT [DF_CustomerPayment_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

		IF OBJECT_ID(N'[tescosubscription].[CustomerPayment]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[CustomerPayment] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[CustomerPayment] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[CustomerPayment] already exists.'
	END
GO
/*

	Author:			Rajendra Singh
	Date created:	27-Jul-2011
	Table Type:		Transactional
	Purpose:		Holds Payment History of customers
	Fillfactor:		<Default 90% for Transactional, 100% for Reference>
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>
    25 Aug 2011		Saritha							Added new column IsEmailSent
    06 JAn 2012     saritha							added new column PackageExecutionHistoryID
    14 Apr 2014     Robin                           added a new column IsPreAuth
       
*/
IF OBJECT_ID(N'[tescosubscription].[CustomerPaymentHistory]',N'U') IS NULL
	BEGIN

		CREATE TABLE [tescosubscription].[CustomerPaymentHistory](
			[CustomerPaymentHistoryID] [bigint] IDENTITY(1,1) NOT NULL,
			[CustomerPaymentID] [bigint] NOT NULL,
			[CustomerSubscriptionID] [bigint] NOT NULL,
			[PaymentDate] [datetime] NOT NULL,
			[PaymentAmount] [smallmoney] NOT NULL,
			[ChannelID] [tinyint] NOT NULL,
            [PackageExecutionHistoryID] [BIGINT] NULL,
			[IsEmailSent] [bit] NOT NULL CONSTRAINT [DF_CustomerPaymentHistory_IsEmailSent] DEFAULT ((0)), 
			[UTCCreatedDateTime] [datetime] NOT NULL,
			[UTCUpdatedDateTime] [datetime] NOT NULL,
		 CONSTRAINT [PK_CustomerPaymentHistory] PRIMARY KEY CLUSTERED 
		(
			[CustomerPaymentHistoryID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
		) ON [PRIMARY]
		

		ALTER TABLE [tescosubscription].[CustomerPaymentHistory] ADD  CONSTRAINT [DF_CustomerPaymentHistory_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

		ALTER TABLE [tescosubscription].[CustomerPaymentHistory] ADD  CONSTRAINT [DF_CustomerPaymentHistory_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]



		IF OBJECT_ID(N'[tescosubscription].[CustomerPaymentHistory]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[CustomerPaymentHistory] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[CustomerPaymentHistory] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[CustomerPaymentHistory] already exists.'
	END
GO


--------------- ADD column PackageExecutionHistoryID ------------------------

IF NOT EXISTS(SELECT 1 FROM information_schema.columns      
				WHERE TABLE_SCHEMA      = 'tescosubscription'
				AND TABLE_NAME			= 'CustomerPaymentHistory'
				AND COLUMN_NAME         = 'PackageExecutionHistoryID') 
BEGIN     
	ALTER TABLE [tescosubscription].[CustomerPaymentHistory] ADD PackageExecutionHistoryID BIGINT  NULL 
		PRINT 'Column tescosubscription.CustomerPaymentHistory.PackageExecutionHistoryID added'
END
GO

---------------Drop Columns PaymentStatusID and Remarks ----------------- 

-- DROP Column PaymentStatusID 

-- Drop COnstarint if exists

IF EXISTS(SELECT 1 FROM sys.foreign_keys WHERE object_id =OBJECT_ID(N'[tescosubscription].[FK_CustomerPaymentHistory_StatusMaster]') 
	 AND parent_object_id = OBJECT_ID(N'[tescosubscription].[CustomerPaymentHistory]'))
	BEGIN

		ALTER TABLE [tescosubscription].[CustomerPaymentHistory] DROP CONSTRAINT [FK_CustomerPaymentHistory_StatusMaster]

    End

GO
IF  EXISTS(SELECT 1 FROM  information_schema.columns      
				WHERE table_schema      = 'tescosubscription'
				AND table_name          = 'CustomerPaymentHistory'
				AND column_name         = 'PaymentStatusID') 
BEGIN     
	ALTER TABLE  [tescosubscription].[CustomerPaymentHistory] DROP COLUMN [PaymentStatusID] 
		PRINT 'Column [PaymentStatusID] dropped'
END
GO


-- DROP column [Remarks]

IF  EXISTS(SELECT 1 FROM  information_schema.columns      
				WHERE table_schema      = 'tescosubscription'
				AND table_name          = 'CustomerPaymentHistory'
				AND column_name         = 'Remarks') 
BEGIN     
	ALTER TABLE  [tescosubscription].[CustomerPaymentHistory] DROP COLUMN [Remarks] 
		PRINT 'Column [Remarks] dropped'
END
GO

--------------- ADD column [IsPreAuth] ------------------------


IF NOT EXISTS(SELECT 1 FROM information_schema.columns      
                           WHERE TABLE_SCHEMA   = 'TescoSubscription'
                           AND TABLE_NAME       = 'CustomerPaymentHistory'
                           AND COLUMN_NAME      = 'IsPreAuth') 
BEGIN  
	ALTER TABLE [TescoSubscription].[CustomerPaymentHistory] 
	ADD IsPreAuth BIT NOT NULL CONSTRAINT [DF_CustomerPaymentHistory_IsPreAuth] DEFAULT ((0)) 
    PRINT 'Column TescoSubscription.CustomerPaymentHistory.IsPreAuth added'
END

GO


/*

	Author:			Saritha K
	Date created:	06-Jan-2012
	Table Type:		Transactional
	Table Size:		
	
	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of change
*/

IF OBJECT_ID(N'[tescosubscription].[CustomerPaymentHistoryResponse]',N'U') IS NULL
	BEGIN
CREATE TABLE [tescosubscription].[CustomerPaymentHistoryResponse](
	[CustomerPaymentHistoryResponseID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerPaymentHistoryID] [bigint] NOT NULL,
	[PaymentStatusID] [tinyint] NOT NULL,
	[Remarks] [varchar](100) NULL,
	[UTCCreatedDateTime] [datetime] NOT NULL CONSTRAINT [DF_CustomerPaymentHistoryResponse_UTCCreatedDateTime]  DEFAULT (getutcdate()),
 CONSTRAINT [PK_CustomerPaymentHistoryResponse] PRIMARY KEY CLUSTERED 
(
	[CustomerPaymentHistoryResponseID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


IF OBJECT_ID(N'[tescosubscription].[CustomerPaymentHistoryResponse]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[CustomerPaymentHistoryResponse] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[CustomerPaymentHistoryResponse] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[CustomerPaymentHistoryResponse] already exists.'
	END
GO

/*

	Author:			Rajendra Singh
	Date created:	27-Jul-2011
	Table Type:		Transactional
	Purpose:		Holds customers subscription details 
	Usage:			<How will this table be utilised>
	Fillfactor:		<Default 90% for Transactional, 100% for Reference>
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>
    25 Aug 2011		Saritha							Added new column EmailSentRenewalDate
    09 May 2013     Robin                           Added 2 new coloumns


*/
IF OBJECT_ID(N'[tescosubscription].[CustomerSubscription]',N'U') IS NULL
	BEGIN

		CREATE TABLE [tescosubscription].[CustomerSubscription](
			[CustomerSubscriptionID] [bigint] IDENTITY(1,1) NOT NULL,
			[CustomerID] [bigint] NOT NULL,
			[SubscriptionPlanID] [int] NOT NULL,
			[CustomerPlanStartDate] [datetime] NOT NULL,
			[CustomerPlanEndDate] [datetime] NOT NULL,
			[NextRenewalDate] [datetime] NOT NULL,
			[SubscriptionStatus] [tinyint] NOT NULL,
			[PaymentProcessStatus] [tinyint] NOT NULL,
			[RenewalReferenceDate] [datetime] NOT NULL,
			[EmailSentRenewalDate] DATETIME NOT NULL CONSTRAINT [DF_CustomerSubscription_EmailSentRenewalDate]  DEFAULT (((1)/(1))/(1900)), 
			[UTCCreatedDateTime] [datetime] NOT NULL,
			[UTCUpdatedDateTime] [datetime] NOT NULL,
		 CONSTRAINT [PK_CustomerSubscription] PRIMARY KEY CLUSTERED 
		(
			[CustomerSubscriptionID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
		) ON [PRIMARY]
		

		ALTER TABLE [tescosubscription].[CustomerSubscription] ADD  CONSTRAINT [DF_CustomerSubscription_PaymentProcessStatus]  DEFAULT ((6)) FOR [PaymentProcessStatus]

		ALTER TABLE [tescosubscription].[CustomerSubscription] ADD  CONSTRAINT [DF_CustomerSubscription_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

		ALTER TABLE [tescosubscription].[CustomerSubscription] ADD  CONSTRAINT [DF_CustomerSubscription_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

		IF OBJECT_ID(N'[tescosubscription].[CustomerSubscription]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[CustomerSubscription] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[CustomerSubscription] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[CustomerSubscription] already exists.'
	END
GO


--------------- ADD column [SwitchTo] ------------------------

IF NOT EXISTS(SELECT 1 FROM information_schema.columns      
				WHERE TABLE_SCHEMA      = 'tescosubscription'
				AND TABLE_NAME			= 'CustomerSubscription'
				AND COLUMN_NAME         = 'SwitchTo') 
BEGIN 
    
	ALTER TABLE [tescosubscription].[CustomerSubscription] ADD SwitchTo INT NULL
		PRINT 'Column tescosubscription.CustomerSubscription.SwitchTo added'
END
GO


--------------- ADD column [SwitchCustomerSubscriptionID] ------------------------

IF NOT EXISTS(SELECT 1 FROM information_schema.columns      
				WHERE TABLE_SCHEMA      = 'tescosubscription'
				AND TABLE_NAME			= 'CustomerSubscription'
				AND COLUMN_NAME         = 'SwitchCustomerSubscriptionID') 

BEGIN
  
     ALTER TABLE [tescosubscription].[CustomerSubscription] ADD SwitchCustomerSubscriptionID BIGINT NULL
		PRINT 'Column tescosubscription.CustomerSubscription.SwitchCustomerSubscriptionID added'
END
GO


--------------- ADD column [NextPaymentDate] ------------------------

IF NOT EXISTS(SELECT 1 FROM information_schema.columns      
				WHERE TABLE_SCHEMA      = 'tescosubscription'
				AND TABLE_NAME			= 'CustomerSubscription'
				AND COLUMN_NAME         = 'NextPaymentDate') 
BEGIN 
    
	ALTER TABLE [tescosubscription].[CustomerSubscription] ADD NextPaymentDate DATETIME NULL
		PRINT 'Column tescosubscription.CustomerSubscription.NextPaymentDate added'
END
GO


/*

	Author:			Saminathan
	Date created:	27-Jul-2011
	Table Type:		Transactional
	Table Size:		
	Purpose:		Create Lookup Table for subscriptionMaster 
	Fillfactor:		<Default 90% for Transactional, 100% for Reference>
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
IF OBJECT_ID(N'[tescosubscription].[CustomerSubscriptionHistory]',N'U') IS NULL
	BEGIN

CREATE TABLE [tescosubscription].[CustomerSubscriptionHistory](
      [SubscriptionHistoryID]	[bigint] IDENTITY(1,1) NOT NULL,
      [CustomerSubscriptionID]  [bigint] NOT NULL,
      [SubscriptionStatus]      [tinyint] NOT NULL,
      [UTCCreatedDateTime] [datetime] NOT NULL CONSTRAINT [DF_CustomerSubscriptionHistory_UTCCreatedDateTime]  DEFAULT (getutcdate()),
      [Remarks]                 [varchar](400)  NULL,
 CONSTRAINT [PK_SubscriptionHistoryID] PRIMARY KEY CLUSTERED 
(
      [SubscriptionHistoryID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

IF OBJECT_ID(N'[tescosubscription].[CustomerSubscriptionHistory]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[CustomerSubscriptionHistory] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[CustomerSubscriptionHistory] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[CustomerSubscriptionHistory] already exists.'
	END
GO

/*

	Author:			Robin John
	Date created:	07-Jan-2012
	
	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>
     15 JAN 2013     Robin                          New table
	 17 Jan 2013     Robin                          Changed the data type to int  
*/



IF OBJECT_ID(N'[tescosubscription].[CustomerSubscriptionSwitchHistory]',N'U') IS NULL
BEGIN

CREATE TABLE [tescosubscription].[CustomerSubscriptionSwitchHistory] (
	[CustomerSubscriptionID] [bigint] NOT NULL,
	[SwitchTo] [INT] NULL,
    [SwitchStatus] [Tinyint] NOT NULL,
    [SwitchOrigin] [Varchar] (200) NULL,
    [UTCRequestedDateTime] [datetime] NOT NULL CONSTRAINT [DF_CustomerSubscriptionSwitchHistory_UTCRequestedDateTime]  DEFAULT (getutcdate())
         )

 
IF OBJECT_ID(N'[tescosubscription].[CustomerSubscriptionSwitchHistory]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[CustomerSubscriptionSwitchHistory] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[CustomerSubscriptionSwitchHistory] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[CustomerSubscriptionSwitchHistory] already exists.'
	END
GO


/*

	Author:			Saritha Kommineni
	Date created:	22-Aug-2011
	Table Type:		Reference
	Table Size:		Estimated < 100 rows
	Purpose:		Create Lookup Table for PackageMaster 
	Fillfactor:		<Default 90% for Transactional, 100% for Reference>
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
IF OBJECT_ID(N'[tescosubscription].[PackageErrorLog]',N'U') IS NULL
	BEGIN

CREATE TABLE [tescosubscription].[PackageErrorLog](
			 [PackageErrorLogID]  BIGINT IDENTITY(1,1) NOT NULL,
			 [PackageExecutionHistoryID]     BIGINT  NOT NULL,
			 [ErrorID]          BIGINT ,			
             [ErrorDescription] NVARCHAR(2048) NOT NULL,
             [ErrorDateTime] DATETIME,
CONSTRAINT [PK_PackageErrorLog] PRIMARY KEY CLUSTERED 
(
      [PackageErrorLogID] DESC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


IF OBJECT_ID(N'[tescosubscription].[PackageErrorLog]',N'U') IS NOT NULL
		BEGIN
			PRINT 'SUCCESS - Table [tescosubscription].[PackageErrorLog] created.'
		END
	ELSE
		BEGIN
			RAISERROR('FAIL - Table [tescosubscription].[PackageErrorLog] not created.',16,1)
		END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[PackageErrorLog] already exists.'
	END
GO
/*

	Author:			Saritha Kommineni
	Date created:	22-Aug-2011
	Table Type:		Reference
	Table Size:		Estimated < 100 rows
	Purpose:		Create Lookup Table for PackageMaster 
	Fillfactor:		<Default 90% for Transactional, 100% for Reference>
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
IF OBJECT_ID(N'[tescosubscription].[PackageExecutionHistory]',N'U') IS NULL
	BEGIN

		CREATE TABLE [tescosubscription].[PackageExecutionHistory]
                  (
                  [PackageExecutionHistoryID]	 BIGINT IDENTITY(1,1) NOT NULL,
                  [PackageID]		 SMALLINT NOT NULL,
                  [PackageStartTime] DATETIME NOT NULL,
                  [PackageEndTime]   DATETIME NULL,
                  [statusID]         TINYINT NOT NULL DEFAULT (12),
CONSTRAINT [PK_PackageExecutionHistory] PRIMARY KEY CLUSTERED 
(
     [PackageExecutionHistoryID] DESC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

IF OBJECT_ID(N'[tescosubscription].[PackageExecutionHistory]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[PackageExecutionHistory] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[PackageExecutionHistory] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[PackageExecutionHistory] already exists.'
	END
GO
/*

	Author:			Saritha Kommineni
	Date created:	22-Aug-2011
	Table Type:		Reference
	Table Size:		Estimated < 100 rows
	Purpose:		Create Lookup Table for PackageMaster 
	Fillfactor:		<Default 90% for Transactional, 100% for Reference>
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
IF OBJECT_ID(N'[tescosubscription].[PackageMaster]',N'U') IS NULL
	BEGIN

		 CREATE TABLE [tescosubscription].[PackageMaster]
              (
              [PackageID] SMALLINT NOT NULL,
              [PackageName] VARCHAR(100) NOT NULL,
              [PackageDescription] [varchar](250) NULL, 
              [UTCCreatedDateTime] DATETIME NOT NULL CONSTRAINT [DF_PackageMaster_UTCCreatedDateTime]  DEFAULT (getutcdate()),
	          [UTCUpdatedDateTime] DATETIME NOT NULL CONSTRAINT [DF_PackageMaster_UTCUpdatedDateTime]  DEFAULT (getutcdate()),
		 CONSTRAINT [PK_PackageMaster] PRIMARY KEY CLUSTERED 
              (
			  [PackageID] DESC
		 )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
		 ) ON [PRIMARY]

  IF OBJECT_ID(N'[tescosubscription].[PackageMaster]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[PackageMaster] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[PackageMaster] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[PackageMaster] already exists.'
	END
GO
/*

	Author:			Saritha Kommineni
	Date created:	23-Aug-2011
	Table Type:		Transactional
	Purpose:		To hold payment logs
	Fillfactor:		<Default 90% for Transactional, 100% for Reference>
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
IF OBJECT_ID(N'[tescosubscription].[packageTransactionLog]',N'U') IS NOT NULL
	BEGIN

		DROP TABLE [tescosubscription].[packageTransactionLog]
      
	END

IF OBJECT_ID(N'[tescosubscription].[packageTransactionLog]',N'U') IS NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[packageTransactionLog] dropped.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[packageTransactionLog] not dropped.',16,1)
			END

GO

/*

	Author:			Robin John
	Date created:	29-11-2012
	
	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>
         
*/



IF OBJECT_ID(N'[tescosubscription].[PaymentInstallment]',N'U') IS NULL
BEGIN
CREATE TABLE [tescosubscription].[PaymentInstallment](
	[PaymentInstallmentID] [tinyint] NOT NULL,
	[PaymentInstallmentName] [varchar](100)  NOT NULL,
	[InstallmentTenure] [tinyint] NULL,
	[UTCCreatedDateTime] [datetime] NOT NULL CONSTRAINT [DF_PaymentInstallment_UTCCreatedDateTime]  DEFAULT (getutcdate()),
	[UTCUpdatedDateTime] [datetime] NOT NULL CONSTRAINT [DF_PaymentInstallment_UTCUpdatedDateTime]  DEFAULT (getutcdate()),
 CONSTRAINT [PK_PaymentInstallment] PRIMARY KEY CLUSTERED 
(
	[PaymentInstallmentID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


IF OBJECT_ID(N'[tescosubscription].[PaymentInstallment]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[PaymentInstallment] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[PaymentInstallment] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[PaymentInstallment] already exists.'
	END
GO/*

	Author:			Rajendra Singh
	Date created:	27-Jul-2011
	Table Type:		Reference
	Purpose:		Holds different modes of payments
	Fillfactor:		<Default 90% for Transactional, 100% for Reference>
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
IF OBJECT_ID(N'[tescosubscription].[PaymentModeMaster]',N'U') IS NULL
	BEGIN

		CREATE TABLE [tescosubscription].[PaymentModeMaster](
			[PaymentModeID] [tinyint] NOT NULL,
			[PaymentModeName] [varchar](50) NOT NULL,
			[UTCCreatedDateTime] [datetime] NOT NULL,
			[UTCUpdatedDateTime] [datetime] NOT NULL,
		 CONSTRAINT [PK_PaymentModeMaster] PRIMARY KEY CLUSTERED 
		(
			[PaymentModeID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
		) ON [PRIMARY]
		

		ALTER TABLE [tescosubscription].[PaymentModeMaster] ADD  CONSTRAINT [DF_PaymentModeMaster_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

		ALTER TABLE [tescosubscription].[PaymentModeMaster] ADD  CONSTRAINT [DF_PaymentModeMaster_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

		IF OBJECT_ID(N'[tescosubscription].[PaymentModeMaster]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[PaymentModeMaster] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[PaymentModeMaster] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[PaymentModeMaster] already exists.'
	END
GO
/*

	Author:			Rajendra Singh
	Date created:	27-Jul-2011
	Table Type:		Reference
	Purpose:		Holds reference data for different status
	Fillfactor:		<Default 90% for Transactional, 100% for Reference>
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
IF OBJECT_ID(N'[tescosubscription].[StatusMaster]',N'U') IS NULL
	BEGIN

		CREATE TABLE [tescosubscription].[StatusMaster](
			[StatusId] [tinyint] NOT NULL,
			[StatusCode] [tinyint] NOT NULL,
			[StatusName] [varchar](20) NOT NULL,
			[StatusType] [varchar](50) NOT NULL,
			[UTCCreatedDateTime] [datetime] NOT NULL,
			[UTCUpdatedDateTime] [datetime] NOT NULL,
		 CONSTRAINT [PK_StatusMaster] PRIMARY KEY CLUSTERED 
		(
			[StatusId] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
		) ON [PRIMARY]
		

		ALTER TABLE [tescosubscription].[StatusMaster] ADD  CONSTRAINT [DF_StatusMaster_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

		ALTER TABLE [tescosubscription].[StatusMaster] ADD  CONSTRAINT [DF_StatusMaster_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

		IF OBJECT_ID(N'[tescosubscription].[StatusMaster]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[StatusMaster] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[StatusMaster] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[StatusMaster] already exists.'
	END
GO
/*

	Author:			Saritha Kommineni
	Date created:	27-Jul-2011
	Table Type:		Reference
	Table Size:		Estimated < 100 rows
	Purpose:		Create Lookup Table for subscriptionMaster 
	Fillfactor:		<Default 90% for Transactional, 100% for Reference>
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>

*/
IF OBJECT_ID(N'[tescosubscription].[SubscriptionMaster]',N'U') IS NULL
	BEGIN

		CREATE TABLE [tescosubscription].[SubscriptionMaster](
			[SubscriptionID] [tinyint] NOT NULL,
			[SubscriptionName] [varchar](30) NOT NULL,
			[UTCCreatedDateTime] [datetime] NOT NULL,
			[UTCUpdatedDateTime] [datetime] NOT NULL,
		 CONSTRAINT [PK_subscription.SubscriptionMaster] PRIMARY KEY CLUSTERED 
		(
			[SubscriptionID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
		) ON [PRIMARY]
		

		ALTER TABLE [tescosubscription].[SubscriptionMaster] ADD  CONSTRAINT [DF_SubscriptionMaster_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

		ALTER TABLE [tescosubscription].[SubscriptionMaster] ADD  CONSTRAINT [DF_SubscriptionMaster_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

		IF OBJECT_ID(N'[tescosubscription].[SubscriptionMaster]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[SubscriptionMaster] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[SubscriptionMaster] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[SubscriptionMaster] already exists.'
	END
GO
/*

	Author:			Saritha K
	Date created:	27-Jul-2011
	Table Type:		Reference
	Table Size:		Estimated <5000
	Purpose:		To hold subscription plans
	Fillfactor:		<Default 90% for Transactional, 100% for Reference>
	Archiving:		<Archiving requirements>

	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>
	
    01 Aug 2011		Saritha kommineni				[PlanName] data type length changed to [varchar](30) 
    03 Aug 2011		Saritha K						BasketValue datatype changed to SmallMoney
    04 Aug 2011		Saritha K						Removed uniuqe constraint on sort order column
    05 Aug 2011		Saritha K						Reverted back above unique constraint changes
    17 Aug 2011		Saritha K						Modified [SortOrder] datatype from tinyint to smallint
    17 Aug 2011		Saritha K						removed default value for PlanMaxUsage column
    29 Nov 2012     Robin						    Added [IsSlotRestricted] and [PaymentInstallmentID] columns
	17 jun 2013     Robin                           Changed the data type to 50 for plan name
*/


IF OBJECT_ID(N'[tescosubscription].[SubscriptionPlan]',N'U') IS NULL
	BEGIN

		CREATE TABLE [tescosubscription].[SubscriptionPlan](
			[SubscriptionPlanID] [int] IDENTITY(1,1) NOT NULL,
			[CountryCurrencyID] [tinyint] NOT NULL,
			[BusinessID] [tinyint] NOT NULL,
			[SubscriptionID] [tinyint] NOT NULL,
			[PlanName] [varchar](30) NOT NULL,
			[PlanDescription] [varchar](255) NOT NULL,
			[SortOrder] [smallint] NOT NULL,
			[PlanTenure] [int] NOT NULL,
			[PlanEffectiveStartDate] [datetime] NOT NULL,
			[PlanEffectiveEndDate] [datetime] NOT NULL,
			[PlanAmount] [smallmoney] NOT NULL,
			[TermConditions] [varchar](500) NULL,
			[IsActive] [bit] NOT NULL,
			[RecurringMonths] [tinyint] NOT NULL,
			[PlanMaxUsage] [smallint] NOT NULL,
			[BasketValue] SMALLMONEY NOT NULL,
			[FreePeriod] [tinyint] NOT NULL,
            [IsSlotRestricted] [bit] NOT NULL CONSTRAINT [DF_SubscriptionPlan_IsSlotRestricted]  DEFAULT ((0)),
			[PaymentInstallmentID] [tinyint] NOT NULL CONSTRAINT [DF_SubscriptionPlan_PaymentInstallmentID]  DEFAULT ((1)),
			[UTCCreatedDateTime] [datetime] NOT NULL,
			[UTCUpdatedDateTime] [datetime] NOT NULL,
		  CONSTRAINT [PK_SubscriptionPlan] PRIMARY KEY CLUSTERED 
		(
			[SubscriptionPlanID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
		 CONSTRAINT [UK_SubscriptionPlan_SortOrder] UNIQUE NONCLUSTERED 
		(
			[SortOrder] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
		) ON [PRIMARY]
		
		ALTER TABLE [tescosubscription].[SubscriptionPlan] ADD  CONSTRAINT [DF_SubscriptionPlan_IsActive]  DEFAULT ((1)) FOR [IsActive]

		ALTER TABLE [tescosubscription].[SubscriptionPlan] ADD  CONSTRAINT [DF_SubscriptionPlan_UTCCreatedDateTime]  DEFAULT (getutcdate()) FOR [UTCCreatedDateTime]

		ALTER TABLE [tescosubscription].[SubscriptionPlan] ADD  CONSTRAINT [DF_SubscriptionPlan_UTCUpdatedDateTime]  DEFAULT (getutcdate()) FOR [UTCUpdatedDateTime]

		IF OBJECT_ID(N'[tescosubscription].[SubscriptionPlan]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[SubscriptionPlan] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[SubscriptionPlan] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[SubscriptionPlan] already exists.'
	END
GO



--------------- ADD column [IsSlotRestricted] ------------------------

IF NOT EXISTS(SELECT 1 FROM information_schema.columns      
				WHERE TABLE_SCHEMA      = 'tescosubscription'
				AND TABLE_NAME			= 'SubscriptionPlan'
				AND COLUMN_NAME         = 'IsSlotRestricted') 
BEGIN     
	ALTER TABLE [tescosubscription].[SubscriptionPlan] ADD IsSlotRestricted BIT  NOT NULL CONSTRAINT [DF_SubscriptionPlan_IsSlotRestricted]  DEFAULT ((0))
		PRINT 'Column tescosubscription.SubscriptionPlan.IsSlotRestricted added'
END
GO



--------------- ADD column [PaymentInstallmentID] ------------------------

IF NOT EXISTS(SELECT 1 FROM information_schema.columns      
				WHERE TABLE_SCHEMA      = 'tescosubscription'
				AND TABLE_NAME			= 'SubscriptionPlan'
				AND COLUMN_NAME         = 'PaymentInstallmentID') 
BEGIN     
	ALTER TABLE [tescosubscription].[SubscriptionPlan] ADD PaymentInstallmentID TINYINT NOT NULL CONSTRAINT [DF_SubscriptionPlan_PaymentInstallmentID]  DEFAULT ((1)) 
		PRINT 'Column tescosubscription.SubscriptionPlan.PaymentInstallmentID added'
END
GO

--------------Alter column [PlanName]-------------------------------------
IF EXISTS(SELECT 1 FROM information_schema.columns      
				WHERE TABLE_SCHEMA      = 'tescosubscription'
				AND TABLE_NAME			= 'SubscriptionPlan'
				AND COLUMN_NAME         = 'PlanName'
                AND CHARACTER_OCTET_LENGTH = 30) 
BEGIN     
	
ALTER TABLE [tescosubscription].[SubscriptionPlan]
ALTER COLUMN [PlanName] VARCHAR(50) NOT NULL

PRINT 'Column tescosubscription.SubscriptionPlan.PlanName altered'
END
/*

	Author:			Robin John
	Date created:	29-11-2012
	
	--Modifications History--
	Changed On		Changed By		Defect Ref		Change Description
	<dd Mmm YYYY>	<Dev Name>		<TFS no.>		<Summary of changes>
         
*/



IF OBJECT_ID(N'[tescosubscription].[SubscriptionPlanSlot]',N'U') IS NULL
BEGIN

	CREATE TABLE [tescosubscription].[SubscriptionPlanSlot](
		[SubscriptionPlanID] [int] NOT NULL,
		[DOW] [tinyint] NOT NULL
	) ON [PRIMARY]

	

IF OBJECT_ID(N'[tescosubscription].[SubscriptionPlanSlot]',N'U') IS NOT NULL
			BEGIN
				PRINT 'SUCCESS - Table [tescosubscription].[SubscriptionPlanSlot] created.'
			END
		ELSE
			BEGIN
				RAISERROR('FAIL - Table [tescosubscription].[SubscriptionPlanSlot] not created.',16,1)
			END
	END
ELSE
	BEGIN
		PRINT 'EXISTS - Table [tescosubscription].[SubscriptionPlanSlot] already exists.'
	END
GO


--------------Add Primary Key to Subscriptionplan and DOW-------------------------------------
IF EXISTS(SELECT 1 FROM information_schema.columns      
				WHERE TABLE_SCHEMA      = 'tescosubscription'
				AND TABLE_NAME			= 'SubscriptionPlanSlot'
				AND COLUMN_NAME         = 'SubscriptionPlanID'
                ) 
BEGIN     
	
ALTER TABLE [tescosubscription].[SubscriptionPlanSlot]
ADD CONSTRAINT PK_SubscriptionPlanSlot_SubscriptionPlanID_DOW PRIMARY KEY (SubscriptionPlanID,DOW)

PRINT 'PK_SubscriptionPlanSlot_SubscriptionPlanID_DOW Created'
END