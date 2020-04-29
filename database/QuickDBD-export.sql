-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/uWvzoX
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE `Trash` (
    `TrashID` string  NOT NULL ,
    `Name` string  NOT NULL ,
    `ParsedName` string  NOT NULL ,
    `LanguageID` string  NOT NULL ,
    `link` string  NOT NULL ,
    `UserID` string  NOT NULL ,
    `Description` string  NULL ,
    `CreatedAt` date  NOT NULL ,
    `UpdatedAt` date  NOT NULL ,
    PRIMARY KEY (
        `TrashID`
    )
);

CREATE TABLE `Language` (
    `LanguageID` string  NOT NULL ,
    `Name` string  NOT NULL ,
    PRIMARY KEY (
        `LanguageID`
    )
);

CREATE TABLE `User` (
    `UserID` string  NOT NULL ,
    `Name` string  NOT NULL ,
    PRIMARY KEY (
        `UserID`
    )
);

CREATE TABLE `Comment` (
    `CommentID` string  NOT NULL ,
    `UserID` string  NOT NULL ,
    `TrashID` string  NOT NULL ,
    `Line` int  NOT NULL ,
    `text` string  NULL ,
    `CreatedAt` date  NOT NULL ,
    `UpdatedAt` date  NOT NULL ,
    PRIMARY KEY (
        `CommentID`
    )
);

ALTER TABLE `Trash` ADD CONSTRAINT `fk_Trash_LanguageID` FOREIGN KEY(`LanguageID`)
REFERENCES `Language` (`LanguageID`);

ALTER TABLE `Trash` ADD CONSTRAINT `fk_Trash_UserID` FOREIGN KEY(`UserID`)
REFERENCES `User` (`UserID`);

ALTER TABLE `Comment` ADD CONSTRAINT `fk_Comment_UserID` FOREIGN KEY(`UserID`)
REFERENCES `User` (`UserID`);

ALTER TABLE `Comment` ADD CONSTRAINT `fk_Comment_TrashID` FOREIGN KEY(`TrashID`)
REFERENCES `Trash` (`TrashID`);

