
use VCF;
/*
���
*/
delete from [dbo].[Project];
delete from [dbo].[User];

/*
����Ĭ�ϵĹ���Ա.
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
 1,
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
