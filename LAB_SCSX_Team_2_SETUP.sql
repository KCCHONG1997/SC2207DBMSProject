-- 1. Create (or recreate) the database
DROP DATABASE IF EXISTS labSCSXTeam2;
CREATE DATABASE labSCSXTeam2;
USE labSCSXTeam2;

-- 2. Drop all tables in reverse dependency order (clean slate)
DROP TABLE IF EXISTS answer;
DROP TABLE IF EXISTS questionnaireSet;
DROP TABLE IF EXISTS questionnaireText;
DROP TABLE IF EXISTS questionnaire;

DROP TABLE IF EXISTS fundTransaction;
DROP TABLE IF EXISTS bondTransaction;
DROP TABLE IF EXISTS stockTransaction;

DROP TABLE IF EXISTS bondInPortfolio;
DROP TABLE IF EXISTS fundInPortfolio;
DROP TABLE IF EXISTS stockInPortfolio;

DROP TABLE IF EXISTS fund;
DROP TABLE IF EXISTS bond;
DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS AssetCompany;
DROP TABLE IF EXISTS asset;
DROP TABLE IF EXISTS company;

DROP TABLE IF EXISTS investedValue;
DROP TABLE IF EXISTS unrealisedGainLoss;
DROP TABLE IF EXISTS riskTolerance;
DROP TABLE IF EXISTS financialGoal;
DROP TABLE IF EXISTS portfolio;
DROP TABLE IF EXISTS investor;

-- 3. Recreate tables according to LAB_SCSX_Team_2_SETUP.sql

CREATE TABLE IF NOT EXISTS investor (
    phoneNo VARCHAR(20) NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    company VARCHAR(255),
    dateOfBirth DATETIME,
    gender ENUM('MALE','FEMALE','OTHER'),
    annualIncome DECIMAL(10,2),
    PRIMARY KEY (phoneNo)
);

CREATE TABLE IF NOT EXISTS portfolio (
    portfolioId INT AUTO_INCREMENT NOT NULL,
    phoneNo VARCHAR(20) NOT NULL,  
    inceptionDate DATETIME,
    marketValue DECIMAL(10,2),
    annualisedReturn DECIMAL(5,2),
    fee DECIMAL(5,2),
    PRIMARY KEY (portfolioId, phoneNo),
    FOREIGN KEY (phoneNo) REFERENCES investor(phoneNo) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS financialGoal (
    goalId INT AUTO_INCREMENT NOT NULL,
    investorID VARCHAR(20) NOT NULL,   -- references investor(phoneNo)
    goalDescription TEXT NOT NULL,
    amountRequired DECIMAL(10,2) NOT NULL,
    timeline DATETIME NOT NULL,
    PRIMARY KEY (goalId, investorID),
    FOREIGN KEY (investorID) REFERENCES investor(phoneNo) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS riskTolerance (
    riskInspectionDate DATETIME NOT NULL,
    investorID VARCHAR(20) NOT NULL,   -- references investor(phoneNo)
    riskLevel ENUM('LOW','MODERATE','HIGH'),
    PRIMARY KEY (riskInspectionDate),
    FOREIGN KEY (investorID) REFERENCES investor(phoneNo) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS unrealisedGainLoss (
    date TIMESTAMP NOT NULL,
    portfolioId INT NOT NULL,
    phoneNo VARCHAR(20) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (date, portfolioId, phoneNo),
    FOREIGN KEY (portfolioId, phoneNo) REFERENCES portfolio(portfolioId, phoneNo) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS investedValue (
    date TIMESTAMP NOT NULL,
    portfolioId INT NOT NULL,
    phoneNo VARCHAR(20) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(date, portfolioId, phoneNo),
    FOREIGN KEY(portfolioId, phoneNo) REFERENCES portfolio(portfolioId, phoneNo) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS company (
    companyName VARCHAR(255) NOT NULL,
    companyType VARCHAR(255),
    PRIMARY KEY(companyName)
);

CREATE TABLE IF NOT EXISTS asset (
    assetId INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (assetId)
);

-- Join table to implement many-to-many relationship between asset and company
CREATE TABLE IF NOT EXISTS AssetCompany (
    assetId INT NOT NULL,
    companyName VARCHAR(255) NOT NULL,
    PRIMARY KEY (assetId, companyName),
    FOREIGN KEY (assetId) REFERENCES asset(assetId) ON DELETE CASCADE,
    FOREIGN KEY (companyName) REFERENCES company(companyName) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS stock (
    stockId INT AUTO_INCREMENT NOT NULL,
    peRatio DECIMAL(10,2) NOT NULL,
    ebitda VARCHAR(69) NOT NULL,
    eps VARCHAR(69) NOT NULL,
    PRIMARY KEY (stockId),
    FOREIGN KEY (stockId) REFERENCES asset(assetId) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS bond (
    bondId INT AUTO_INCREMENT NOT NULL,
    interestRate DECIMAL(5,2) NOT NULL,
    maturityDate DATETIME NOT NULL,
    PRIMARY KEY(bondId),
    FOREIGN KEY (bondId) REFERENCES asset(assetId) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS fund (
    fundId INT AUTO_INCREMENT NOT NULL,
    dividendYield DECIMAL(5,2) NOT NULL,
    expenseRatio DECIMAL(5,2) NOT NULL,
    PRIMARY KEY(fundId),
    FOREIGN KEY (fundId) REFERENCES asset(assetId) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS stockInPortfolio (
    stockId INT NOT NULL,
    portfolioId INT NOT NULL,
    phoneNo VARCHAR(20) NOT NULL,
    startDate DATETIME,
    allocationRatio DOUBLE,
    postTradeCO VARCHAR(255),
    PRIMARY KEY (stockId, portfolioId, phoneNo),
    FOREIGN KEY (stockId) REFERENCES stock(stockId) ON DELETE CASCADE,
    FOREIGN KEY (portfolioId, phoneNo) REFERENCES portfolio(portfolioId, phoneNo) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS fundInPortfolio (
    fundId INT NOT NULL,
    portfolioId INT NOT NULL,
    phoneNo VARCHAR(20) NOT NULL,
    startDate DATETIME,
    allocationRatio DOUBLE,
    postTradeCO VARCHAR(255),
    PRIMARY KEY (fundId, portfolioId, phoneNo),
    FOREIGN KEY (fundId) REFERENCES fund(fundId) ON DELETE CASCADE,
    FOREIGN KEY (portfolioId, phoneNo) REFERENCES portfolio(portfolioId, phoneNo) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS bondInPortfolio (
    bondId INT NOT NULL,
    portfolioId INT NOT NULL,
    phoneNo VARCHAR(20) NOT NULL,
    startDate DATETIME,
    allocationRatio DOUBLE,
    postTradeCO VARCHAR(255),
    PRIMARY KEY (bondId, portfolioId, phoneNo),
    FOREIGN KEY(bondId) REFERENCES bond(bondId) ON DELETE CASCADE,
    FOREIGN KEY (portfolioId, phoneNo) REFERENCES portfolio(portfolioId, phoneNo) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS stockTransaction (
    stockTxnId INT AUTO_INCREMENT NOT NULL,
    stockId INT NOT NULL,
    type VARCHAR(255) NOT NULL,
    fee DECIMAL(10,2),
    txnDate DATETIME NOT NULL,
    PRIMARY KEY (stockTxnId),
    FOREIGN KEY (stockId) REFERENCES stock(stockId) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS bondTransaction (
    bondTxnId INT AUTO_INCREMENT NOT NULL,
    bondId INT NOT NULL,
    type VARCHAR(255) NOT NULL,
    fee DECIMAL(10,2),
    txnDate DATETIME NOT NULL,
    PRIMARY KEY (bondTxnId),
    FOREIGN KEY (bondId) REFERENCES bond(bondId) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS fundTransaction (
    fundTxnId INT AUTO_INCREMENT NOT NULL,
    fundId INT NOT NULL,
    type VARCHAR(255) NOT NULL,
    fee DECIMAL(10,2),
    txnDate DATETIME NOT NULL,
    PRIMARY KEY (fundTxnId),
    FOREIGN KEY (fundId) REFERENCES fund(fundId) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS questionnaire (
    questionnaireId INT NOT NULL,
    questionnaireName VARCHAR(255),
    PRIMARY KEY (questionnaireId)
);

CREATE TABLE IF NOT EXISTS questionnaireText (
    questionNo INT AUTO_INCREMENT NOT NULL,
    questionText TEXT NOT NULL,
    PRIMARY KEY (questionNo)
);

CREATE TABLE IF NOT EXISTS questionnaireSet (
    questionnaireId INT NOT NULL,
    questionNo INT NOT NULL,
    PRIMARY KEY (questionnaireId, questionNo),
    FOREIGN KEY (questionNo) REFERENCES questionnaireText(questionNo) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS answer (
    answerTimestamp TIMESTAMP NOT NULL,
    phoneNo VARCHAR(20) NOT NULL,           
    questionnaireId INT NOT NULL,           -- references questionnaireSet(questionnaireId)
    questionNo INT NOT NULL,
    answerText TEXT,
    PRIMARY KEY (answerTimestamp),
    FOREIGN KEY (phoneNo) REFERENCES investor(phoneNo) ON DELETE CASCADE,
    FOREIGN KEY (questionnaireId, questionNo) REFERENCES questionnaireSet(questionnaireId, questionNo) ON DELETE CASCADE
);
