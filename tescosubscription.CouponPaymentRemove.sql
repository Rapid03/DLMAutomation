USE [TescoSubscription]
GO
IF OBJECT_ID(N'[tescosubscription].[CouponPaymentRemove]', N'P') IS NOT NULL
BEGIN
    DROP PROCEDURE [tescosubscription].[CouponPaymentRemove]
    
    IF OBJECT_ID(N'[tescosubscription].[CouponPaymentRemove]', N'P') IS NULL
    BEGIN
        PRINT 'SUCCESS - Procedure [tescosubscription].[CouponPaymentRemove] dropped.'
    END
    ELSE
    BEGIN
        RAISERROR(
            'FAIL - Procedure [tescosubscription].[CouponPaymentRemove] not dropped.',
            16,
            1
        )
    END
END

GO

CREATE PROCEDURE [tescosubscription].[CouponPaymentRemove]
(
@CustomerId BIGINT,
@Token  NVARCHAR(200)
)AS

/*
	Author:			Robin
	Date created:	20/03/2014
	Purpose:		Applies Coupon Details in Payment Table	
	Behaviour:		How does this procedure actually work
	Usage:			
	Called by:		<DeliverySaver Website>	

    --Modifications History--
 	Changed On   Changed By  Defect  Changes  Change Description 

*/
BEGIN
DECLARE
	
	 @errorDescription	NVARCHAR(2048)
	,@error				INT
	,@errorProcedure    SYSNAME
	,@errorLine	        INT
	,@Delimiter       NVARCHAR(1)
	,@String          NVARCHAR(44)

SET  @Delimiter = ','

BEGIN TRY
BEGIN TRANSACTION  

		;WITH CouponRemove AS
			  (SELECT CustomerPaymentID,Customerid,PaymentModeID
			   FROM  [Tescosubscription].[CustomerPayment] WITH (NOLOCK)
			   WHERE CustomerID = @CustomerID 
			   AND CAST(PaymentToken AS VARBINARY(90)) IN (SELECT CAST([Item] AS VARBINARY(90)) FROM [dbo].[ConvertListToTable] (@Token,@Delimiter))
     		   AND Isactive = 1 and IsFirstPaymentdue=1)
  
		DELETE CouponRemove    

COMMIT TRANSACTION  
END TRY

BEGIN CATCH

         SELECT @errorProcedure       = Routine_Schema  + '.' + Routine_Name
              , @error                = ERROR_NUMBER()
              , @errorDescription     = ERROR_MESSAGE()
              , @errorLine            = ERROR_LINE()
         FROM  INFORMATION_SCHEMA.ROUTINES
         WHERE Routine_Type = 'PROCEDURE' and Routine_Name = OBJECT_NAME(@@PROCID)

         ROLLBACK TRANSACTION  

         RAISERROR('[Procedure:%s Line:%i Error:%i] %s',16,1,@errorProcedure,@errorLine,@error,@errorDescription)
END CATCH

END

GO

--Grant execute permissions as required by any calling application.
GRANT EXECUTE ON [tescosubscription].[CouponPaymentRemove] TO [SubsUser]
GO

IF OBJECT_ID(N'[tescosubscription].[CouponPaymentRemove]', N'P') IS NOT NULL
BEGIN
    PRINT 'SUCCESS - Procedure [tescosubscription].[CouponPaymentRemove] created.'
END
ELSE
BEGIN
    RAISERROR(
        'FAIL - Procedure [tescosubscription].[CouponPaymentRemove] not created.',
        16,
        1
    )
END
GO

