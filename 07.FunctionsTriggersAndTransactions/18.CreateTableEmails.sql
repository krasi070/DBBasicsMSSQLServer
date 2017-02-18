CREATE TABLE NotificationEmails(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	Recipient int FOREIGN KEY REFERENCES Accounts(Id) NOT NULL,
	Subject varchar(255) NOT NULL,
	Body varchar(max) NOT NULL
)

CREATE TRIGGER tr_CreateEmailOnNewRecord ON Logs AFTER INSERT
AS
BEGIN
	DECLARE @Recipient int = (SELECT AccountId FROM inserted);
	DECLARE @OldSum money = (SELECT OldSum FROM inserted);
	DECLARE @NewSum money = (SELECT NewSum FROM inserted);

	INSERT INTO NotificationEmails(Recipient, Subject, Body) VALUES
	(@Recipient,
	'Balance change for account: ' + CONVERT(varchar, @Recipient),
	'On ' + CONVERT(varchar, GETDATE(), 120) + 
	' your balance was changed from ' + CONVERT(varchar, @OldSum) + 
	' to ' + CONVERT(varchar, @NewSum) + '.')
END