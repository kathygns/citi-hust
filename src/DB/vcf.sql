IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'vcf')
CREATE USER [vcf] FOR LOGIN [vcf] WITH DEFAULT_SCHEMA=[dbo]
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
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([FatherUserID])
REFERENCES [dbo].[User] ([UserID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRelationShip_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRelationShip]'))
ALTER TABLE [dbo].[UserRelationShip]  WITH CHECK ADD  CONSTRAINT [FK_UserRelationShip_User] FOREIGN KEY([SuperiorUserID])
REFERENCES [dbo].[User] ([UserID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRelationShip_User1]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRelationShip]'))
ALTER TABLE [dbo].[UserRelationShip]  WITH CHECK ADD  CONSTRAINT [FK_UserRelationShip_User1] FOREIGN KEY([InferiorUserID])
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
