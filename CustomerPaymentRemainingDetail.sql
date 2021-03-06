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


 