INSERT INTO investor 
  (phoneNo, name, email, company, dateOfBirth, gender, annualIncome)
VALUES
('9001 2345', 'CHONG JIA CHERN',   'jia.chern@ntu.com',   'Apple',      '1985-04-10',  'MALE',   85000.00),
('9002 3456', 'CHONG KWANG CHEN',  'kwang.chen@ntu.com',  'OpenAI',     '1992-09-25',  'MALE',   90000.00),
('9003 4567', 'CHONG YU SIANG',    'yu.siang@ntu.com',    'Nvidia',     '1996-03-11',  'FEMALE', 60000.00),
('9004 5678', 'HNG CHERNG KHAI',   'cherng.khai@ntu.com', 'Apple',      '2000-01-05',  'MALE',   40000.00),
('9005 6789', 'SIM YANG YUE',      'yang.yue@ntu.com',    'OpenAI',     '1994-07-21',  'FEMALE', 75000.00),
('9006 7890', 'SONG TINGFENG',     'tingfeng@ntu.com',    'Apple',      '1998-12-10',  'FEMALE', 55000.00),
('9007 8901', 'TAN UEI HORNG',     'uei.horng@ntu.com',   'Nvidia',     '1988-08-30',  'MALE',   65000.00);

-- PORTFOLIOS (only IDs=1 or 2 for each phoneNo)
INSERT INTO portfolio
  (portfolioId, phoneNo, inceptionDate, marketValue, annualisedReturn, fee)
VALUES
(1, '9001 2345', '2024-01-01', 50000.00, 12.0,  1.0),
(2, '9001 2345', '2023-06-15', 20000.00,  5.0,  0.8),
(1, '9002 3456', '2024-01-01', 30000.00, -2.0,  1.1),
(2, '9002 3456', '2023-05-10', 15000.00,  4.0,  1.0),
(1, '9003 4567', '2024-01-05', 40000.00, 11.0,  1.0),
(2, '9003 4567', '2022-03-01', 12000.00,  6.0,  0.9),
(1, '9004 5678', '2024-01-10', 10000.00, -5.0,  1.2),
(1, '9005 6789', '2024-01-05', 25000.00,  8.0,  1.2),
(1, '9006 7890', '2024-01-03',  8000.00,  2.0,  1.0),
(1, '9007 8901', '2024-01-02', 40000.00, 15.0,  1.5);

-- FINANCIAL GOALS
INSERT INTO financialGoal 
  (goalID, investorID, goalDescription, amountRequired, timeline)
VALUES
(1, '9001 2345', 'Save for Dream Car', 50000.00,  '2024-12-31'),
(2, '9001 2345', 'Buy a Condo',       300000.00, '2030-06-30'),
(1, '9002 3456', 'Early Retirement', 1000000.00, '2024-10-01'),
(2, '9002 3456', 'Emergency Fund',    20000.00,  '2024-03-01'),
(1, '9004 5678', 'Save for Dream Car',200000.00, '2024-01-01'),
(2, '9004 5678', 'Overseas Education',200000.00, '2025-01-01'),
(1, '9003 4567', 'Buy a House',       500000.00, '2024-05-15'),
(1, '9005 6789', 'Early Retirement',   80000.00, '2024-07-01'),
(1, '9006 7890', 'Buy a House',       500000.00, '2024-09-01'),
(1, '9007 8901', 'Buy a House',       500000.00, '2024-08-10');

-- RISK TOLERANCE
INSERT INTO riskTolerance
  (riskInspectionDate, investorID, riskLevel)
VALUES
('2023-01-01', '9001 2345', 'MODERATE'),
('2023-06-01', '9002 3456', 'LOW'),
('2024-01-01', '9002 3456', 'HIGH'),
('2024-02-01', '9003 4567', 'HIGH'),
('2024-02-15', '9004 5678', 'MODERATE'),
('2024-03-01', '9005 6789', 'LOW'),
('2024-03-05', '9006 7890', 'MODERATE'),
('2024-04-01', '9007 8901', 'HIGH');

---------------------------------------------------------------------------------
-- 4E) UNREALISED GAIN/LOSS 
-- (ONLY references portfolioId=1 or 2; phoneNo='9001 2345' for demonstration)
---------------------------------------------------------------------------------
INSERT INTO unrealisedGainLoss (date, portfolioId, phoneNo, amount)
VALUES
-- portfolioId=1, phoneNo='9001 2345'
('2024-01-01 08:00:00', 1, '9001 2345', 500.00),
('2024-02-01 08:00:00', 1, '9001 2345', 300.00),
('2024-03-01 08:00:00', 1, '9001 2345', 400.00),
('2024-04-01 08:00:00', 1, '9001 2345', 100.00),

-- portfolioId=2, phoneNo='9001 2345'
('2024-01-01 08:30:00', 2, '9001 2345', 250.00),
('2024-02-01 08:30:00', 2, '9001 2345', 300.00),
('2024-03-01 08:30:00', 2, '9001 2345', 200.00),
('2024-04-01 08:30:00', 2, '9001 2345', 100.00),
  
  -- Investor B (making a loss across all portfolios)
('2024-01-01 09:00:00', 1, '9002 3456', -200.00),
('2024-02-01 09:00:00', 1, '9002 3456', -300.00),
('2024-03-01 09:00:00', 1, '9002 3456', -100.00),
('2024-04-01 09:00:00', 1, '9002 3456', -400.00),

('2024-01-01 09:30:00', 2, '9002 3456', -150.00),
('2024-02-01 09:30:00', 2, '9002 3456', -250.00),
('2024-03-01 09:30:00', 2, '9002 3456', -200.00),
('2024-04-01 09:30:00', 2, '9002 3456', -300.00),

-- Investor C (mixed portfolio performance)
('2024-01-01 10:00:00', 1, '9003 4567', -500.00),
('2024-02-01 10:00:00', 1, '9003 4567', -400.00),
('2024-03-01 10:00:00', 1, '9003 4567', -300.00),
('2024-04-01 10:00:00', 1, '9003 4567', -200.00),

('2024-01-01 10:30:00', 2, '9003 4567', 500.00),
('2024-02-01 10:30:00', 2, '9003 4567', 400.00),
('2024-03-01 10:30:00', 2, '9003 4567', 300.00),
('2024-04-01 10:30:00', 2, '9003 4567', 200.00),

-- Other investors (not making a loss)
('2024-01-01 10:00:00', 1, '9004 5678', 100.00),
('2024-01-01 10:00:00', 1, '9005 6789', 100.00),
('2024-01-01 10:00:00', 1, '9006 7890', 100.00),
('2024-01-01 10:00:00', 1, '9007 8901', 100.00),

('2024-01-05 11:00:00', 1, '9003 4567', 1000.00),  -- female, age 25
('2024-02-05 11:00:00', 2, '9002 3456', 900.00),   -- female, age 25
('2024-03-05 11:00:00', 1, '9003 4567', 800.00),   -- female, age 25
('2024-04-05 11:00:00', 2, '9002 3456', 700.00),   -- female, age 25

('2024-01-10 11:30:00', 2, '9001 2345', 600.00),   -- female, age 26
('2024-02-10 11:30:00', 1, '9003 4567', 500.00),   -- female, age 26
('2024-03-10 11:30:00', 2, '9001 2345', 400.00),   -- female, age 26
('2024-04-10 11:30:00', 1, '9001 2345', 300.00);   -- female, age 26

---------------------------------------------------------------------------------
-- 4F) INVESTED VALUE
-- (ONLY references portfolioId=2; phoneNo='9001 2345')
---------------------------------------------------------------------------------
INSERT INTO investedValue (date, portfolioId, phoneNo, amount)
VALUES
('2024-01-01 00:00:00', 2, '9001 2345', 5000.00),
('2024-02-01 00:00:00', 2, '9001 2345', 5000.00),
('2024-03-01 00:00:00', 2, '9001 2345', 5000.00),
('2024-04-01 00:00:00', 2, '9001 2345', 5000.00);

---------------------------------------------------------------------------------
-- 4G) COMPANY & ASSET
---------------------------------------------------------------------------------
INSERT INTO company (companyName, companyType)
VALUES
('Apple Inc', 'Technology'),
('Nvidia Corp', 'Technology'),
('ARK Invest', 'Fund'),
('OpenAI Inc', 'AI Research'),
('Tesla Inc', 'Automotive'),
('BlackRock', 'Investment'),
('Google LLC', 'Technology'),
('TBill', 'Government'),
('Tnotes', 'Government');

INSERT INTO asset (assetId, name, price)
VALUES
(1, 'Apple Common Stock', 175.00),
(2, 'Nvidia Common Stock', 440.00),
(3, 'ARK Innovation Fund', 40.15),
(4, 'OpenAI Corporate Bond', 99.00),
(5, 'Tesla Stock', 260.00),
(6, 'iShares ETF', 110.25),
(7, 'Alphabet Class A', 135.50),
(8, 'Bond A', 100.00),
(9, 'Bond B', 102.50);

-- Many-to-many "AssetCompany" link
INSERT INTO AssetCompany (assetId, companyName)
VALUES
(1, 'Apple Inc'),
(2, 'Nvidia Corp'),
(3, 'ARK Invest'),
(4, 'OpenAI Inc'),
(5, 'Tesla Inc'),
(6, 'BlackRock'),
(7, 'Google LLC'),
(8, 'TBill'),
(9, 'Tnotes');

INSERT INTO stock (stockId, peRatio, ebitda, eps)
VALUES
(1, 30.00, '45B', '5.20'),
(2, 42.00, '15B', '3.10'),
(5, 50.00, '20B', '2.75'),
(7, 35.00, '25B', '4.10');

INSERT INTO fund (fundId, dividendYield, expenseRatio)
VALUES
(3, 2.50, 0.75),
(6, 1.80, 0.60);

INSERT INTO bond (bondId, interestRate, maturityDate)
VALUES
(4, 3.60, '2031-12-31'),
(8, 2.75, '2030-06-30'),
(9, 5.00, '2032-09-01');

---------------------------------------------------------------------------------
-- 4H) *In-Portfolio* & Transactions
-- (Removed lines referencing portfolioId=3..10; only keep ID=1 or 2 + phoneNo)
---------------------------------------------------------------------------------
INSERT INTO stockInPortfolio (stockId, portfolioId, phoneNo, startDate, allocationRatio, postTradeCO)
VALUES
(1, 1, '9001 2345', '2024-01-05', 0.40, 'OK'),
(2, 1, '9001 2345', '2024-01-10', 0.40, 'OK'),
(5, 2, '9001 2345', '2024-02-01', 0.50, 'OK');

INSERT INTO fundInPortfolio (fundId, portfolioId, phoneNo, startDate, allocationRatio, postTradeCO)
VALUES
(3, 1, '9001 2345', '2024-01-15', 0.20, 'OK'),
(6, 2, '9001 2345', '2024-02-10', 0.50, 'OK');

INSERT INTO bondInPortfolio (bondId, portfolioId, phoneNo, startDate, allocationRatio, postTradeCO)
VALUES
(4, 1, '9001 2345', '2024-01-20', 0.50, 'Interactive Broker'),
(8, 1, '9001 2345', '2024-02-20', 0.30, 'Saxo'),
(9, 1, '9001 2345', '2024-03-10', 0.40, 'Clearstream');

INSERT INTO stockTransaction (stockTxnId, stockId, type, fee, txnDate)
VALUES
(101, 1, 'BUY', 15.00, '2024-01-03'),
(102, 2, 'SELL', 20.00, '2024-02-02'),
(103, 5, 'BUY', 12.00, '2024-03-04'),
(104, 1, 'BUY', 10.00, '2024-04-03'),
(105, 1, 'BUY', 10.00, '2024-05-02'),
(106, 1, 'BUY', 10.00, '2024-06-03'),
(107, 1, 'BUY', 10.00, '2024-07-01'),
(108, 1, 'BUY', 10.00, '2024-08-03'),
(109, 1, 'BUY', 10.00, '2024-09-03'),
(110, 1, 'BUY', 10.00, '2024-10-01');

INSERT INTO bondTransaction (bondTxnId, bondId, type, fee, txnDate)
VALUES 
(201, 4, 'BUY', 10.00, '2024-01-02'),
(202, 8, 'BUY', 8.00, '2024-02-03'),
(203, 9, 'BUY', 9.00, '2024-03-04'),
(204, 9, 'BUY', 9.00, '2024-12-04');

INSERT INTO fundTransaction (fundTxnId, fundId, type, fee, txnDate)
VALUES 
(301, 3, 'BUY',  5.00, '2024-01-03'),
(302, 6, 'SELL', 6.00, '2024-02-03'),
(303, 3, 'BUY', 6.00, '2024-1-03');


---------------------------------------------------------------------------------
-- 4I) QUESTIONNAIRE
---------------------------------------------------------------------------------
INSERT INTO questionnaire (questionnaireId, questionnaireName)
VALUES (1, 'Risk Profiling Questionnaire');

INSERT INTO questionnaireText (questionText)
VALUES
('How many years of investment experience do you have?'),
('How comfortable are you with market fluctuations?'),
('What is your primary investment goal?'),
('How often do you review your investment portfolio?'),
('Would you prefer stable returns or higher but riskier gains?'),
('How long is your planned investment horizon?'),
('Have you invested in stocks, bonds, or mutual funds before?'),
('Do you rely on professional advice or invest independently?');

INSERT INTO questionnaireSet (questionNo, questionnaireId)
VALUES 
(1, 1), (2, 1), (3, 1), (4, 1),
(5, 1), (6, 1), (7, 1), (8, 1);

INSERT INTO answer (answerTimestamp, phoneNo, questionnaireId, questionNo, answerText)
VALUES
   ('2024-01-01 09:00:00', '9001 2345', 1, 1, '6 years'),
   ('2024-01-01 09:01:00', '9001 2345', 1, 2, 'Moderately comfortable'),
   ('2024-01-01 09:02:00', '9001 2345', 1, 3, 'Retirement Planning'),
   ('2024-01-01 09:03:00', '9001 2345', 1, 4, 'Monthly'),
   ('2024-01-01 09:04:00', '9001 2345', 1, 5, 'Stable returns'),
   ('2024-01-01 09:05:00', '9001 2345', 1, 6, '10+ years'),
   ('2024-01-01 09:06:00', '9001 2345', 1, 7, 'Stocks and mutual funds'),
   ('2024-01-01 09:07:00', '9001 2345', 1, 8, 'Invest independently'),

   ('2024-01-02 10:00:00', '9003 4567', 1, 1, '2 years'),
   ('2024-01-02 10:01:00', '9003 4567', 1, 2, 'Comfortable'),
   ('2024-01-02 10:02:00', '9003 4567', 1, 3, 'Buying a house'),
   ('2024-01-02 10:03:00', '9003 4567', 1, 4, 'Quarterly'),
   ('2024-01-02 10:04:00', '9003 4567', 1, 5, 'Higher but riskier gains'),
   ('2024-01-02 10:05:00', '9003 4567', 1, 6, '5–10 years'),
   ('2024-01-02 10:06:00', '9003 4567', 1, 7, 'Stocks'),
   ('2024-01-02 10:07:00', '9003 4567', 1, 8, 'Professional advice'),

   ('2024-01-03 11:00:00', '9006 7890', 1, 1, 'Less than a year'),
   ('2024-01-03 11:01:00', '9006 7890', 1, 2, 'Not comfortable'),
   ('2024-01-03 11:02:00', '9006 7890', 1, 3, 'Wealth accumulation'),
   ('2024-01-03 11:03:00', '9006 7890', 1, 4, 'Rarely'),
   ('2024-01-03 11:04:00', '9006 7890', 1, 5, 'Stable returns'),
   ('2024-01-03 11:05:00', '9006 7890', 1, 6, '1–3 years'),
   ('2024-01-03 11:06:00', '9006 7890', 1, 7, 'None'),
   ('2024-01-03 11:07:00', '9006 7890', 1, 8, 'Professional advice'),

   ('2024-01-04 08:00:00', '9002 3456', 1, 1, '4 years'),
   ('2024-01-04 08:01:00', '9002 3456', 1, 2, 'Very comfortable'),
   ('2024-01-04 08:02:00', '9002 3456', 1, 3, 'Early retirement'),
   ('2024-01-04 08:03:00', '9002 3456', 1, 4, 'Monthly'),
   ('2024-01-04 08:04:00', '9002 3456', 1, 5, 'Higher but riskier gains'),
   ('2024-01-04 08:05:00', '9002 3456', 1, 6, '10+ years'),
   ('2024-01-04 08:06:00', '9002 3456', 1, 7, 'Stocks and bonds'),
   ('2024-01-04 08:07:00', '9002 3456', 1, 8, 'Invest independently'),

   ('2024-01-04 09:00:00', '9004 5678', 1, 1, '1 year'),
   ('2024-01-04 09:01:00', '9004 5678', 1, 2, 'Slightly comfortable'),
   ('2024-01-04 09:02:00', '9004 5678', 1, 3, 'Paying for studies'),
   ('2024-01-04 09:03:00', '9004 5678', 1, 4, 'Every 6 months'),
   ('2024-01-04 09:04:00', '9004 5678', 1, 5, 'Stable returns'),
   ('2024-01-04 09:05:00', '9004 5678', 1, 6, '3–5 years'),
   ('2024-01-04 09:06:00', '9004 5678', 1, 7, 'Mutual funds only'),
   ('2024-01-04 09:07:00', '9004 5678', 1, 8, 'Professional advice'),

   ('2024-01-04 10:00:00', '9005 6789', 1, 1, '3 years'),
   ('2024-01-04 10:01:00', '9005 6789', 1, 2, 'Comfortable'),
   ('2024-01-04 10:02:00', '9005 6789', 1, 3, 'Buying a house'),
   ('2024-01-04 10:03:00', '9005 6789', 1, 4, 'Quarterly'),
   ('2024-01-04 10:04:00', '9005 6789', 1, 5, 'Balanced mix'),
   ('2024-01-04 10:05:00', '9005 6789', 1, 6, '5–10 years'),
   ('2024-01-04 10:06:00', '9005 6789', 1, 7, 'Stocks and funds'),
   ('2024-01-04 10:07:00', '9005 6789', 1, 8, 'Invest independently'),

   ('2024-01-04 11:00:00', '9007 8901', 1, 1, '5 years'),
   ('2024-01-04 11:01:00', '9007 8901', 1, 2, 'Very comfortable'),
   ('2024-01-04 11:02:00', '9007 8901', 1, 3, 'Wealth accumulation'),
   ('2024-01-04 11:03:00', '9007 8901', 1, 4, 'Weekly'),
   ('2024-01-04 11:04:00', '9007 8901', 1, 5, 'Riskier gains'),
   ('2024-01-04 11:05:00', '9007 8901', 1, 6, '10+ years'),
   ('2024-01-04 11:06:00', '9007 8901', 1, 7, 'All types'),
   ('2024-01-04 11:07:00', '9007 8901', 1, 8, 'Self-directed with some advice');

  INSERT INTO portfolioReturn (returnDate, portfolioId, phoneNo, annualisedReturn)
VALUES
('2024-01-01', 1, '9001 2345', 12.0),
('2023-06-15', 2, '9001 2345', 5.0),

('2024-01-01', 1, '9002 3456', -2.0),
('2023-05-10', 2, '9002 3456', 4.0),

('2024-01-05', 1, '9003 4567', 11.0),
('2022-03-01', 2, '9003 4567', 6.0),

('2024-01-10', 1, '9004 5678', -5.0),

('2024-01-05', 1, '9005 6789', 8.0),

('2024-01-03', 1, '9006 7890', 2.0),

('2024-01-02', 1, '9007 8901', 15.0);

