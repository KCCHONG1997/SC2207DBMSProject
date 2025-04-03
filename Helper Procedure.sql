## 1. Get all asset by the investor name ##

DELIMITER $$
CREATE PROCEDURE GetAllAssetsByInvestorName(
    IN in_investorName VARCHAR(255)
)
BEGIN
    -- Return STOCK holdings
    SELECT 
        i.name AS investorName,
        p.portfolioId,
        'STOCK' AS assetType,
        a.name AS assetName
    FROM investor i
    JOIN portfolio p ON i.phoneNo = p.phoneNo
    JOIN stockInPortfolio sip ON p.portfolioId = sip.portfolioId
    JOIN stock s ON s.stockId = sip.stockId
    JOIN asset a ON a.assetId = s.stockId
    WHERE i.name = in_investorName

    UNION

    -- Return BOND holdings
    SELECT
        i.name AS investorName,
        p.portfolioId,
        'BOND' AS assetType,
        a.name AS assetName
    FROM investor i
    JOIN portfolio p ON i.phoneNo = p.phoneNo
    JOIN bondInPortfolio bip ON p.portfolioId = bip.portfolioId
    JOIN bond b ON b.bondId = bip.bondId
    JOIN asset a ON a.assetId = b.bondId
    WHERE i.name = in_investorName

    UNION

    -- Return FUND holdings
    SELECT
        i.name AS investorName,
        p.portfolioId,
        'FUND' AS assetType,
        a.name AS assetName
    FROM investor i
    JOIN portfolio p ON i.phoneNo = p.phoneNo
    JOIN fundInPortfolio fip ON p.portfolioId = fip.portfolioId
    JOIN fund f ON f.fundId = fip.fundId
    JOIN asset a ON a.assetId = f.fundId
    WHERE i.name = in_investorName

    ORDER BY investorName, portfolioId, assetType, assetName;
END $$
DELIMITER ;




## 2. getPortfolioSummary with portfolioID ##
DELIMITER $$
CREATE PROCEDURE getPortfolioSummary (
    IN p_portfolioId INT
)
BEGIN
    DECLARE v_invested DECIMAL(10,2) DEFAULT 0;
    DECLARE v_gainLoss DECIMAL(10,2) DEFAULT 0;

    -- Summation of Invested Value
    SELECT IFNULL(SUM(amount), 0) INTO v_invested
    FROM investedValue
    WHERE portfolioId = p_portfolioId;

    -- Summation of Unrealised Gain/Loss
    SELECT IFNULL(SUM(amount), 0) INTO v_gainLoss
    FROM unrealisedGainLoss
    WHERE portfolioId = p_portfolioId;

    SELECT 
        p_portfolioId AS portfolioId,
        v_invested AS totalInvested,
        v_gainLoss AS totalUnrealisedGainLoss,
        (v_invested + v_gainLoss) AS totalMarketValue
    FROM DUAL;
END $$
DELIMITER ;

CALL GetAllAssetsByInvestorName ("CHONG JIA CHERN");
CALL getPortfolioSummary (1);