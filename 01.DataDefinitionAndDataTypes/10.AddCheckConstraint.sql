ALTER TABLE Users
ADD CONSTRAINT CH_Password CHECK(LEN(Password) >= 5)