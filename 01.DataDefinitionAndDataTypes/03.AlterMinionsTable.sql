USE Minions

ALTER TABLE Minions
ADD TownId int FOREIGN KEY REFERENCES Towns(Id)