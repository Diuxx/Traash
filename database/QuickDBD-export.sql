-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/uWvzoX
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE `Traash` (
    `TraashID` string  NOT NULL ,
    `Name` string  NOT NULL ,
    `ParsedName` string  NOT NULL ,
    `link` string  NOT NULL ,
    `Description` string  NULL ,
    `UserID` string  NOT NULL ,
    `childID` string  NOT NULL ,
    `private` boolean  NOT NULL ,
    `CreatedAt` date  NOT NULL ,
    `UpdatedAt` date  NOT NULL ,
    PRIMARY KEY (
        `TraashID`
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
    `TraashID` string  NOT NULL ,
    `Line` int  NOT NULL ,
    `text` string  NULL ,
    `CreatedAt` date  NOT NULL ,
    `UpdatedAt` date  NOT NULL ,
    PRIMARY KEY (
        `CommentID`
    )
);

CREATE TABLE `TraashLanguAssoc` (
    `TrashID` string  NOT NULL ,
    `LanguageID` string  NOT NULL 
);

ALTER TABLE `Traash` ADD CONSTRAINT `fk_Traash_UserID` FOREIGN KEY(`UserID`)
REFERENCES `User` (`UserID`);

ALTER TABLE `Comment` ADD CONSTRAINT `fk_Comment_UserID` FOREIGN KEY(`UserID`)
REFERENCES `User` (`UserID`);

ALTER TABLE `Comment` ADD CONSTRAINT `fk_Comment_TraashID` FOREIGN KEY(`TraashID`)
REFERENCES `Traash` (`TraashID`);

ALTER TABLE `TraashLanguAssoc` ADD CONSTRAINT `fk_TraashLanguAssoc_TrashID` FOREIGN KEY(`TrashID`)
REFERENCES `Traash` (`TraashID`);

ALTER TABLE `TraashLanguAssoc` ADD CONSTRAINT `fk_TraashLanguAssoc_LanguageID` FOREIGN KEY(`LanguageID`)
REFERENCES `Language` (`LanguageID`);

