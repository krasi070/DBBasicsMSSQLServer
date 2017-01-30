CREATE TABLE Users(
	Id bigint IDENTITY PRIMARY KEY NOT NULL,
	Username varchar(30) UNIQUE NOT NULL,
	Password varchar(26) NOT NULL,
	ProfilePicture varbinary(max),
	LastLoginTime datetime,
	IsDeleted bit NOT NULL 
)

INSERT INTO Users(Username, Password, ProfilePicture, LastLoginTime, IsDeleted) VALUES
('krasi070', 'bstpsswrd', NULL, '12-01-16 12:32', 0),
('shirdor', 'wowowowowo', NULL, '12-01-16 12:31', 0),
('ivan009', 'arrow', NULL, '12-01-16 12:30', 0),
('brainko', 'secret', NULL, '12-02-16 12:33', 1),
('martinatanasov', 'mmmmmmmm', NULL, '12-01-16 10:01', 0)