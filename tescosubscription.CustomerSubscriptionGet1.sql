	IF OBJECT_ID(N'[tescosubscription].[CustomerSubscriptionGet1]',N'P') IS NOT NULL
		BEGIN

			DROP PROCEDURE [tescosubscription].[CustomerSubscriptionGet1]

			IF OBJECT_ID(N'[tescosubscription].[CustomerSubscriptionGet1]',N'P') IS NULL
				BEGIN
					PRINT 'SUCCESS - Procedure [tescosubscription].[CustomerSubscriptionGet1] dropped.'
				END
			ELSE
				BEGIN
					RAISERROR('FAIL - Procedure [tescosubscription].[CustomerSubscriptionGet1] not dropped.',16,1)
				END
		END
	GO
	

CREATE PROCEDURE [tescosubscription].[CustomerSubscriptionGet1]
	(@CustomerSubscriptionID BIGINT)
AS
/*
Author:		Robin
Create date: 10 - Feb - 2013
Purpose: To get the customer subscription
Called by:		DS

--Modifications History--
Changed On		Changed By		Defect Ref		Change Description
27 June 2013    RObin                           Versioned and added Logic for NextPaymentDate
*/

BEGIN	
	SET NOCOUNT ON;

	SELECT CS.[CustomerSubscriptionID]
      ,CS.[CustomerID]
      ,CS.[SubscriptionPlanID]
      ,CS.[CustomerPlanStartDate]
      ,CS.[CustomerPlanEndDate]
      ,CS.[NextRenewalDate]
      ,CS.[SubscriptionStatus]
      ,CS.[PaymentProcessStatus]
      ,CS.[RenewalReferenceDate]
      ,CS.[EmailSentRenewalDate]
      ,CS.[UTCCreatedDateTime]
      ,CS.[UTCUpdatedDateTime]
      ,CS.[SwitchCustomerSubscriptionID]
      ,CS.[SwitchTo]
      ,CS.[NextPaymentDate]
      ,CASE WHEN CS.NextPaymentDate IS NULL THEN 0 ELSE ISNULL(DATEDIFF(M,CS.NextPaymentDate,CS.NextRenewalDate)/IP.InstallmentTenure,0) END RemainingInstallments					
	FROM [TescoSubscription].[CustomerSubscription] CS(NOLOCK)
    INNER JOIN [Tescosubscription].[SubscriptionPlan] SP (NOLOCK)
    ON CS.SubscriptionPlanID = SP.SubscriptionPlanID
    INNER JOIN [Tescosubscription].[PaymentInstallment] IP (NOLOCK) 
    ON SP.PaymentInstallmentID = IP.PaymentInstallmentID
	WHERE CS.[CustomerSubscriptionID] = @CustomerSubscriptionID
END

GO

	--Grant execute permissions as required by any calling application.
	GRANT EXECUTE ON [tescosubscription].[CustomerSubscriptionGet1] TO [SubsUser]
	GO

	IF OBJECT_ID(N'[tescosubscription].[CustomerSubscriptionGet1]',N'P') IS NOT NULL
		BEGIN
			PRINT 'SUCCESS - Procedure [tescosubscription].[CustomerSubscriptionGet1] created.'
		END
	ELSE
		BEGIN
			RAISERROR('FAIL - Procedure [tescosubscription].[CustomerSubscriptionGet1] not created.',16,1)
		END
	GO
