IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'vcf')
CREATE USER [vcf] FOR LOGIN [vcf] WITH DEFAULT_SCHEMA=[dbo]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[SecureQuestion] [varchar](50) NULL,
	[SecureAnswer] [varchar](50) NULL,
	[Role] [tinyint] NOT NULL,
	[Photo] [varchar](100) NULL,
	[RegDate] [datetime] NOT NULL CONSTRAINT [DF_User_RegDate]  DEFAULT (getdate()),
	[RealName] [varchar](50) NOT NULL,
	[Sex] [bit] NULL,
	[Age] [tinyint] NULL,
	[Tel] [varchar](15) NULL,
	[Email] [varchar](50) NOT NULL,
	[Address] [varchar](100) NULL,
	[Comment] [text] NULL,
	[BankAccount] [varchar](50) NOT NULL CONSTRAINT [DF_User_BankAccount]  DEFAULT (getdate()+rand((1))),
	[IdentityCard] [varchar](50) NOT NULL CONSTRAINT [DF_User_IdentityCard]  DEFAULT (getdate()+rand((1))),
	[Position] [varchar](100) NULL CONSTRAINT [DF_User_Position]  DEFAULT (NULL),
	[FatherUserID] [int] NULL CONSTRAINT [DF_User_FatherUserID]  DEFAULT ((0)),
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_User_BankAccountUnique] UNIQUE NONCLUSTERED 
(
	[BankAccount] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_User_IDCardUnique] UNIQUE NONCLUSTERED 
(
	[IdentityCard] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_User_UserName_Unique] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[City]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[City](
	[CityID] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Provience] [varchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTopNSystemUserWhereRealNameStartWith]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		ning
-- Create date: <Create Date,,>
-- Description:	根据用户名 得到前count个SystemUser（包括Manager和Beneficiary）
-- 该函数用于UserChooserControl
-- =============================================
CREATE PROCEDURE [dbo].[GetTopNSystemUserWhereRealNameStartWith]
	(
	@RealName varchar(50),
	@Count int 
    )
AS
BEGIN 
	SELECT TOP (@Count) *
	FROM [User]
	WHERE (RealName LIKE @RealName + ''%'') AND (Role = ''1'' OR
      Role = ''2'')
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Donation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Donation](
	[DonationID] [int] IDENTITY(1,1) NOT NULL,
	[DonationUserID] [int] NOT NULL,
	[BankAccount] [varchar](50) NOT NULL,
	[Money] [money] NOT NULL,
	[DonationDate] [datetime] NOT NULL CONSTRAINT [DF_Donation_DonationDate]  DEFAULT (getdate()),
	[ProjectID] [int] NOT NULL,
 CONSTRAINT [PK_Donation] PRIMARY KEY CLUSTERED 
(
	[DonationID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Project]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Project](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Discription] [text] NOT NULL,
	[ManagerID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_Project_CreateDate]  DEFAULT (getdate()),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Project_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Distribution]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Distribution](
	[DistributionID] [int] IDENTITY(1,1) NOT NULL,
	[FromUserID] [int] NOT NULL,
	[ToUserID] [int] NOT NULL,
	[DistributionType] [tinyint] NOT NULL,
	[Purpose] [text] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[DistributionDate] [datetime] NOT NULL CONSTRAINT [DF_Distribution_DistributionDate]  DEFAULT (getdate()),
	[Money] [money] NOT NULL,
	[FeecbackStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_Distribution] PRIMARY KEY CLUSTERED 
(
	[DistributionID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRelationShip]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserRelationShip](
	[SuperiorUserID] [int] NOT NULL,
	[InferiorUserID] [int] NOT NULL,
 CONSTRAINT [PK_UserRelationShip] PRIMARY KEY CLUSTERED 
(
	[SuperiorUserID] ASC,
	[InferiorUserID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetFormatedUserByUserID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetFormatedUserByUserID]
(
	@UserID int
)
AS
	SET NOCOUNT ON;
SELECT UserID, UserName, Password, SecureQuestion, SecureAnswer,  Photo, 
      RegDate, RealName, Age, Tel, Email, Address, Comment, BankAccount, 
      IdentityCard, Position, FatherUserID, 
      (CASE WHEN Sex = ''true'' THEN ''男'' ELSE ''女'' END) AS ''Sex'', 
      (CASE WHEN Role = ''0'' THEN ''系统管理员'' WHEN Role = ''1'' THEN ''管理员'' WHEN Role
       = ''2'' THEN ''接收者'' WHEN Role = ''3'' THEN ''捐款人'' END) AS ''Role''
FROM [User]
WHERE (UserID = @UserID)' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_FormatedUser]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_FormatedUser]
AS
SELECT     dbo.[User].UserID, dbo.[User].UserName, dbo.[User].Photo, dbo.[User].RegDate, dbo.[User].RealName, dbo.[User].Age, dbo.[User].Tel, 
                      dbo.[User].Email, dbo.[User].Address, dbo.[User].Comment, dbo.[User].BankAccount, dbo.[User].IdentityCard, dbo.[User].Position, 
                      dbo.[User].FatherUserID, (CASE WHEN dbo.[User].Sex = ''true'' THEN ''男'' ELSE ''女'' END) AS Sex, 
                      (CASE WHEN dbo.[User].Role = ''0'' THEN ''系统管理员'' WHEN dbo.[User].Role = ''1'' THEN ''管理员'' WHEN dbo.[User].Role = ''2'' THEN ''接收者'' WHEN dbo.[User].Role
                       = ''3'' THEN ''捐款人'' END) AS Role, User_1.UserName AS FatherUserName, User_1.RealName AS FatherRealName
FROM         dbo.[User] INNER JOIN
                      dbo.[User] AS User_1 ON dbo.[User].FatherUserID = User_1.UserID
' 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[22] 4[39] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "User"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 195
            End
            DisplayFlags = 280
            TopColumn = 15
         End
         Begin Table = "User_1"
            Begin Extent = 
               Top = 6
               Left = 233
               Bottom = 121
               Right = 390
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 17
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'V_FormatedUser'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'V_FormatedUser'

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([FatherUserID])
REFERENCES [dbo].[User] ([UserID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Donation_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[Donation]'))
ALTER TABLE [dbo].[Donation]  WITH CHECK ADD  CONSTRAINT [FK_Donation_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Donation_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Donation]'))
ALTER TABLE [dbo].[Donation]  WITH CHECK ADD  CONSTRAINT [FK_Donation_User] FOREIGN KEY([DonationUserID])
REFERENCES [dbo].[User] ([UserID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Project_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Project]'))
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_User] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[User] ([UserID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Distribution_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[Distribution]'))
ALTER TABLE [dbo].[Distribution]  WITH CHECK ADD  CONSTRAINT [FK_Distribution_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Distribution_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Distribution]'))
ALTER TABLE [dbo].[Distribution]  WITH CHECK ADD  CONSTRAINT [FK_Distribution_User] FOREIGN KEY([FromUserID])
REFERENCES [dbo].[User] ([UserID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Distribution_User1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Distribution]'))
ALTER TABLE [dbo].[Distribution]  WITH CHECK ADD  CONSTRAINT [FK_Distribution_User1] FOREIGN KEY([ToUserID])
REFERENCES [dbo].[User] ([UserID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRelationShip_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRelationShip]'))
ALTER TABLE [dbo].[UserRelationShip]  WITH CHECK ADD  CONSTRAINT [FK_UserRelationShip_User] FOREIGN KEY([SuperiorUserID])
REFERENCES [dbo].[User] ([UserID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRelationShip_User1]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRelationShip]'))
ALTER TABLE [dbo].[UserRelationShip]  WITH CHECK ADD  CONSTRAINT [FK_UserRelationShip_User1] FOREIGN KEY([InferiorUserID])
REFERENCES [dbo].[User] ([UserID])
