# SC2207DBMSProject

# ERDiagram
![image](https://github.com/user-attachments/assets/3595883b-8eec-4623-ad3a-f6daa4b42628)

# PK & FK Table
<table border="1" cellspacing="0" cellpadding="5">
  <thead>
    <tr>
      <th>Table Name</th>
      <th>Primary Key</th>
      <th>Foreign Keys</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>investor</td>
      <td>phoneNo</td>
      <td>–</td>
    </tr>
    <tr>
      <td>portfolio</td>
      <td>(portfolioId, phoneNo)</td>
      <td>phoneNo → investor(phoneNo)</td>
    </tr>
    <tr>
      <td>financialGoal</td>
      <td>(goalId, investorID)</td>
      <td>investorID → investor(phoneNo)</td>
    </tr>
    <tr>
      <td>riskTolerance</td>
      <td>riskInspectionDate</td>
      <td>investorID → investor(phoneNo)</td>
    </tr>
    <tr>
      <td>unrealisedGainLoss</td>
      <td>(date, portfolioId, phoneNo)</td>
      <td>(portfolioId, phoneNo) → portfolio(portfolioId, phoneNo)</td>
    </tr>
    <tr>
      <td>investedValue</td>
      <td>(date, portfolioId, phoneNo)</td>
      <td>(portfolioId, phoneNo) → portfolio(portfolioId, phoneNo)</td>
    </tr>
    <tr>
      <td>company</td>
      <td>companyName</td>
      <td>–</td>
    </tr>
    <tr>
      <td>asset</td>
      <td>assetId</td>
      <td>–</td>
    </tr>
    <tr>
      <td>AssetCompany</td>
      <td>(assetId, companyName)</td>
      <td>
        assetId → asset(assetId); <br>
        companyName → company(companyName)
      </td>
    </tr>
    <tr>
      <td>stock</td>
      <td>stockId</td>
      <td>stockId → asset(assetId)</td>
    </tr>
    <tr>
      <td>bond</td>
      <td>bondId</td>
      <td>bondId → asset(assetId)</td>
    </tr>
    <tr>
      <td>fund</td>
      <td>fundId</td>
      <td>fundId → asset(assetId)</td>
    </tr>
    <tr>
      <td>stockInPortfolio</td>
      <td>(stockId, portfolioId, phoneNo)</td>
      <td>
        stockId → stock(stockId); <br>
        (portfolioId, phoneNo) → portfolio(portfolioId, phoneNo)
      </td>
    </tr>
    <tr>
      <td>fundInPortfolio</td>
      <td>(fundId, portfolioId, phoneNo)</td>
      <td>
        fundId → fund(fundId); <br>
        (portfolioId, phoneNo) → portfolio(portfolioId, phoneNo)
      </td>
    </tr>
    <tr>
      <td>bondInPortfolio</td>
      <td>(bondId, portfolioId, phoneNo)</td>
      <td>
        bondId → bond(bondId); <br>
        (portfolioId, phoneNo) → portfolio(portfolioId, phoneNo)
      </td>
    </tr>
    <tr>
      <td>stockTransaction</td>
      <td>stockTxnId</td>
      <td>stockId → stock(stockId)</td>
    </tr>
    <tr>
      <td>bondTransaction</td>
      <td>bondTxnId</td>
      <td>bondId → bond(bondId)</td>
    </tr>
    <tr>
      <td>fundTransaction</td>
      <td>fundTxnId</td>
      <td>fundId → fund(fundId)</td>
    </tr>
    <tr>
      <td>questionnaire</td>
      <td>questionnaireId</td>
      <td>–</td>
    </tr>
    <tr>
      <td>questionnaireText</td>
      <td>questionNo</td>
      <td>–</td>
    </tr>
    <tr>
      <td>questionnaireSet</td>
      <td>(questionnaireId, questionNo)</td>
      <td>questionNo → questionnaireText(questionNo)</td>
    </tr>
    <tr>
      <td>answer</td>
      <td>answerTimestamp</td>
      <td>
        phoneNo → investor(phoneNo); <br>
        (questionnaireId, questionNo) → questionnaireSet(questionnaireId, questionNo)
      </td>
    </tr>
  </tbody>
</table>
