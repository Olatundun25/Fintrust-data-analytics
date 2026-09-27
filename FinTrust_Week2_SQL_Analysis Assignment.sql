-- Question 1: How do transaction volume and total monetary value trend across January, February, and March 2026?

SELECT 
    strftime('%m', Transaction_DateTime) AS Month,
    COUNT(Transaction_ID) AS Total_Transactions,
    ROUND(SUM(Amount_NGN), 2) AS Total_Value_NGN
FROM FinTrust_Transaction_Data
GROUP BY Month
ORDER BY Month;

Result: Jan (4,133 txns, 188.49M NGN), Feb (3,734 txns, 175.79M NGN), Mar (4,133 txns, 196.20M NGN).
Business Interpretation: Transaction volume is highly stable, with the slight dip in February perfectly aligning with it being a shorter month.


-- Question 2: Which customer segments generate the highest transaction volume and average value?

SELECT 
    c.Customer_Segment,
    COUNT(t.Transaction_ID) AS Total_Transactions,
    ROUND(AVG(t.Amount_NGN), 2) AS Average_Amount_NGN
FROM FinTrust_Customer_Data c
JOIN FinTrust_Transaction_Data t ON c.Customer_ID = t.Customer_ID
GROUP BY c.Customer_Segment
ORDER BY Total_Transactions DESC;

Result: Everyday (5,644 txns, 46,325 NGN avg), Premium (2,361 txns, 45,637 NGN avg), Student (2,289 txns, 46,953 NGN avg), SME (1,706 txns, 49,115 NGN avg).
Business Interpretation: The "Everyday" segment drives the most volume, but SMEs process the highest average value. We need distinct retention strategies: high-frequency consumer features for Everyday users, and enterprise-tier limits for SMEs.


-- Question 3: Which digital channels see the most transaction usage?

SELECT 
    Channel,
    COUNT(Transaction_ID) AS Total_Transactions
FROM FinTrust_Transaction_Data
GROUP BY Channel
ORDER BY Total_Transactions DESC;

Result: Mobile App (5,102), POS (2,393), Web (1,869), ATM (1,747), USSD (889).
Business Interpretation: Mobile App is the dominant channel by a massive margin. Any infrastructure investments and uptime monitoring must prioritize the mobile backend to prevent widespread operational failure.


-- Question 4: What share of transactions fail, get reversed, or stay pending?

SELECT 
    Transaction_Status,
    COUNT(Transaction_ID) AS Total_Transactions,
    ROUND(COUNT(Transaction_ID) * 100.0 / (SELECT COUNT(*) FROM FinTrust_Transaction_Data), 2) AS Percentage
FROM FinTrust_Transaction_Data
GROUP BY Transaction_Status;

Result: Successful (90.47%), Failed (5.25%), Reversed (2.72%), Pending (1.57%).
Business Interpretation: While the success rate is over 90%, a combined 9.5% failure/friction rate is high for a digital bank and will directly drive customer support ticket volume.


 Question 5: How does the risk-review rate vary by international transaction status?

SELECT 
    International_Transaction,
    COUNT(Transaction_ID) AS Total_Transactions,
    SUM(CASE WHEN Risk_Review_Flag = 'Yes' THEN 1 ELSE 0 END) AS Flagged_Transactions,
    ROUND(SUM(CASE WHEN Risk_Review_Flag = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(Transaction_ID), 2) AS Risk_Rate_Percentage
FROM FinTrust_Transaction_Data
GROUP BY International_Transaction;

Result: No (18.88% flagged), Yes (36.88% flagged).
Business Interpretation: International transactions are flagged at nearly double the rate of domestic ones, confirming they carry the highest risk and require the most compliance oversight.


-- Question 6: Is there a relationship between the transaction amount and the likelihood of a risk flag?

SELECT 
    Risk_Review_Flag,
    COUNT(Transaction_ID) AS Total_Transactions,
    ROUND(AVG(Amount_NGN), 2) AS Average_Amount
FROM FinTrust_Transaction_Data
GROUP BY Risk_Review_Flag;

Result: Flagged 'No' (Avg 41,324 NGN), Flagged 'Yes' (Avg 68,786 NGN).
Business Interpretation: Flagged transactions are notably larger than unflagged ones. The system is correctly prioritizing higher-value exposures rather than flagging minor everyday spending.


-- Question 7: How does the risk-review rate vary by transaction type?

SELECT 
    Transaction_Type,
    COUNT(Transaction_ID) AS Total_Transactions,
    ROUND(SUM(CASE WHEN Risk_Review_Flag = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(Transaction_ID), 2) AS Risk_Rate_Percentage
FROM FinTrust_Transaction_Data
GROUP BY Transaction_Type
ORDER BY Risk_Rate_Percentage DESC;
 Result: Transfer (28.49%), Cash Withdrawal (25.31%), Deposit (16.19%), Airtime/Data (15.19%), Card Purchase (13.02%), Bill Payment (12.81%).
 Business Interpretation: Transfers and Cash Withdrawals carry the most risk. FinTrust should focus its fraud-prevention and limit-control rules heavily on peer-to-peer transfers and cash-out points.


-- Question 8: Does a customer's digital engagement score relate to their account status?

SELECT 
    Account_Status,
    ROUND(AVG(Digital_Engagement_Score), 2) AS Avg_Digital_Score,
    COUNT(Customer_ID) AS Customer_Count
FROM FinTrust_Customer_Data
GROUP BY Account_Status;

Result: Active (68.31 score), Restricted (65.45 score), Dormant (64.03 score).
Business Interpretation: Dormant accounts show the lowest historical digital engagement. Tracking a dropping digital engagement score could serve as an early warning indicator for customer churn.