-- CREATING DATABASE
CREATE DATABASE BankingSystem;
USE BankingSystem;

-- CREATING TABLES
 
 -- Customers Table 
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(100),
  Address VARCHAR(255),
  Phone VARCHAR(15),
  Email VARCHAR(50)
);

SELECT * FROM Customers;

-- Branches Table
CREATE TABLE Branches (
  BranchID INT PRIMARY KEY AUTO_INCREMENT,
  BranchName VARCHAR(100),
  BranchAddress VARCHAR(255)
);

SELECT * FROM Branches;

--  Accounts Table
CREATE TABLE Accounts (
  AccountID INT PRIMARY KEY AUTO_INCREMENT,
  CustomerID INT,
  BranchID INT,
  AccountType VARCHAR(50),  -- e.g., 'Checking', 'Savings'
  Balance DECIMAL(15, 2) DEFAULT 0.00,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

-- Transactions Table

CREATE TABLE Transactions (
  TransactionID INT PRIMARY KEY AUTO_INCREMENT,
  AccountID INT,
  TransactionType VARCHAR(20), -- e.g., 'Deposit', 'Withdrawal'
  Amount DECIMAL(15, 2),
  TransactionDate DATE,
  FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

 -- Loans Table
 
 CREATE TABLE Loans (
  LoanID INT PRIMARY KEY AUTO_INCREMENT,
  CustomerID INT,
  LoanAmount DECIMAL(15, 2),
  InterestRate DECIMAL(4, 2),
  LoanDate DATE,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

SELECT * FROM Loans;

--  Inserting the Sample Data

INSERT INTO Customers (Name, Address, Phone, Email) 
VALUES ('Alice Johnson', '123 Maple St', '555-0101', 'alice@example.com');
SELECT * FROM Customers;

INSERT INTO Branches (BranchName, BranchAddress) 
VALUES ('Downtown', '456 Oak St');
SELECT * FROM Branches;

INSERT INTO Accounts (CustomerID, BranchID, AccountType, Balance)
VALUES (1, 1, 'Savings', 1000.00);
SELECT * FROM Accounts;

