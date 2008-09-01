set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go


ALTER PROCEDURE [dbo].[Donate]
	
	@DonationUserID int,  
	@BankAccount varchar(50), 
	@Money money,
	@ProjectID int
	
AS
BEGIN


INSERT INTO [dbo].[Donation] ([DonationUserID],
 [BankAccount],
 [Money],
 [ProjectID]) VALUES (@DonationUserID,
 @BankAccount,
 @Money,
 @ProjectID);
 

/*@managerID ;*/
 declare @managerID integer;
 select @managerID= [ManagerID] FROM [dbo].[Project] where ([ProjectID] =@ProjectID)

INSERT INTO [dbo].[Distribution] (
 [FromUserID],
 [ToUserID],
 [DistributionType],
 [Purpose],
 [ProjectID],
 
 [Money],
 [FeedbackStatus]
 ) VALUES (
 @DonationUserID,
 @managerID,
 0,
 '¾è¿î',
 @ProjectID,
  @Money,
 2);



END

