-- Creation of a test base...

CREATE DATABASE Bank;
USE Bank;

-- Создание таблицы Individuals
CREATE TABLE Individuals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    middleName VARCHAR(255),
    passport VARCHAR(20),
    inn VARCHAR(12),
    snils VARCHAR(11),
    driverLicense VARCHAR(20),
    additionalDocs TEXT,
    notes TEXT
);

-- Создание таблицы Loans
CREATE TABLE Loans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    individualId INT,
    amount DECIMAL(15,2),
    interestRate DECIMAL(5,2),
    term INT,
    conditions TEXT,
    notes TEXT,
    borrowerId INT,
    FOREIGN KEY (individualId) REFERENCES Individuals(id),
    FOREIGN KEY (borrowerId) REFERENCES Borrowers(id)
);

-- Создание таблицы OrganizationLoans
CREATE TABLE OrganizationLoans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    organizationId INT,
    individualId INT,
    amount DECIMAL(15,2),
    term INT,
    interestRate DECIMAL(5,2),
    conditions TEXT,
    notes TEXT,
    borrowerId INT,
    FOREIGN KEY (individualId) REFERENCES Individuals(id),
    FOREIGN KEY (borrowerId) REFERENCES Borrowers(id)
);

-- Создание таблицы Borrowers
CREATE TABLE Borrowers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    inn VARCHAR(12),
    entityType BOOLEAN,
    address TEXT,
    amount DECIMAL(15,2),
    conditions TEXT,
    legalNotes TEXT,
    contractList TEXT
);