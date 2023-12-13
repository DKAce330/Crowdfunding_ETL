-- Ensuring a clean start by removing existing tables
DROP TABLE IF EXISTS Campaign;
DROP TABLE IF EXISTS Subcategory;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Contacts;

-- Definition of the Contacts table
CREATE TABLE Contacts (
    ContactID INT NOT NULL PRIMARY KEY,
    FirstName VARCHAR(150) NOT NULL,
    LastName VARCHAR(150) NOT NULL,
    Email VARCHAR(150) NOT NULL,
    COMMENT 'Stores contact information including first and last names, and email addresses.'
);

-- Definition of the Category table
CREATE TABLE Category (
    CategoryID VARCHAR(150) NOT NULL PRIMARY KEY,
    CategoryName VARCHAR(150) NOT NULL,
    COMMENT 'Holds different categories identified by CategoryID and name.'
);

-- Definition of the Subcategory table
CREATE TABLE Subcategory (
    SubcategoryID VARCHAR(150) NOT NULL PRIMARY KEY,
    SubcategoryName VARCHAR(150) NOT NULL,
    COMMENT 'Contains subcategories related to the main categories.'
);

-- Definition of the Campaign table
CREATE TABLE Campaign (
    CampaignID INT NOT NULL PRIMARY KEY,
    ContactID INT NOT NULL REFERENCES Contacts(ContactID),
    CompanyName VARCHAR(300) NOT NULL,
    Description VARCHAR(300) NOT NULL,
    Goal DOUBLE NOT NULL,
    Pledged DOUBLE NOT NULL,
    Outcome VARCHAR(300) NOT NULL,
    BackersCount INT NOT NULL,
    Country VARCHAR(300) NOT NULL,
    Currency VARCHAR(300) NOT NULL,
    LaunchedDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    CategoryID VARCHAR(300) NOT NULL REFERENCES Category(CategoryID),
    SubcategoryID VARCHAR(300) NOT NULL REFERENCES Subcategory(SubcategoryID),
    COMMENT 'Details of each campaign including links to contact, category, and subcategory.'
);

-- Queries to view data in each table
SELECT * FROM Contacts;
SELECT * FROM Category;
SELECT * FROM Subcategory;
SELECT * FROM Campaign;
