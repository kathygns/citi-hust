
use VCF;
/*
清空
*/
delete from [dbo].[Project];
delete from [dbo].[User];

/*
插入默认的管理员.
*/
SET IDENTITY_INSERT [dbo].[User] ON
go

INSERT INTO [dbo].[User] (
[UserID],
[UserName],
 [Password],
 [SecureQuestion],
 [SecureAnswer],
 [Role],
 [Photo],
 [RealName],
 [Sex],
 [Age],
 [Tel],
 [Email],
 [Address],
 [Comment],
 [BankAccount],
 [IdentityCard],
 [Position],
 [FatherUserID]) VALUES (
'0',
'admin',
 pwdencrypt(33),
 'SecureQuestion',
 'SecureAnswer',
 0,
 'Photo',
 'RealName',
 'true',
 30,
 'Tel',
 'Email',
 'Address',
 'Comment',

 'admin',
 'admin',
 'Position',
 '0');

 
 /*插入-1*/
 INSERT INTO [dbo].[User] (
[UserID],
[UserName],
 [Password],
 [SecureQuestion],
 [SecureAnswer],
 [Role],
 [Photo],
 [RealName],
 [Sex],
 [Age],
 [Tel],
 [Email],
 [Address],
 [Comment],
 [Position],
 [FatherUserID]) VALUES (
'-1',
'0',
 '0',
 '0',
 '0',
 0,
 'Photo',
 '无意义',
 'true',
 30,
 'Tel',
 'Email',
 'Address',
 'Comment',

 'Position',
 '0');
