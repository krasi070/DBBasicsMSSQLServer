ALTER TABLE Users
ADD CONSTRAINT DEF_LastLoginTime DEFAULT GETDATE() FOR LastLoginTime