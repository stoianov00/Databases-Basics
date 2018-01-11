USE Minions

ALTER TABLE Users
	ADD CONSTRAINT CK_Users_Password CHECK (LEN(Password) >= 5)