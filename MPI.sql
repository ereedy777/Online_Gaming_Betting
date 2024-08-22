#1 MPI Data
SELECT * FROM 
online_sports_betting
WHERE Licensee = 'MPI Master Wagering License CT, LLC';

#2 GGR
SELECT date,
GGR
FROM online_sports_betting
WHERE Licensee = 'MPI Master Wagering License CT, LLC'
GROUP BY 1,2
ORDER BY 1;

#3 Year over Year (YOY) - Average GGR 
SELECT Fiscal_Year,
AVG(GGR) AS Avg_GGR
FROM online_sports_betting
WHERE Licensee = 'MPI Master Wagering License CT, LLC'
GROUP BY 1
ORDER BY 1;


#4 Find which months usually have highest amounts wagered (Q4)
SELECT 
date,
  FORMAT(SUM(CASE WHEN MONTH(date) IN (1, 2, 3) THEN Wag ELSE 0 END), 0) AS Q1,
  FORMAT(SUM(CASE WHEN MONTH(date) IN (4, 5, 6) THEN Wag ELSE 0 END), 0) AS Q2,
  FORMAT(SUM(CASE WHEN MONTH(date) IN (7, 8, 9) THEN Wag ELSE 0 END), 0) AS Q3,
  FORMAT(SUM(CASE WHEN MONTH(date) IN (10, 11, 12) THEN Wag ELSE 0 END), 0) AS Q4
FROM online_sports_betting
WHERE Licensee = 'MPI Master Wagering License CT, LLC'
GROUP BY 1;

#5 Which months within Q4 have people spent most money
SELECT date,
FORMAT(Wag,0) AS Wag
FROM online_sports_betting
WHERE Licensee = 'MPI Master Wagering License CT, LLC'
AND MONTH(date) IN (10,11,12);

#6 GGR Quarterly Report
SELECT 
date,
  FORMAT(SUM(CASE WHEN MONTH(date) IN (1, 2, 3) THEN Coup_credit_wag ELSE 0 END), 0) AS Q1,
  FORMAT(SUM(CASE WHEN MONTH(date) IN (4, 5, 6) THEN Coup_credit_wag ELSE 0 END), 0) AS Q2,
  FORMAT(SUM(CASE WHEN MONTH(date) IN (7, 8, 9) THEN Coup_credit_wag ELSE 0 END), 0) AS Q3,
  FORMAT(SUM(CASE WHEN MONTH(date) IN (10, 11, 12) THEN Coup_credit_wag ELSE 0 END), 0) AS Q4
FROM online_sports_betting
WHERE Licensee = 'MPI Master Wagering License CT, LLC'
GROUP BY 1;

#8 YOY Net Gaming Revenue(NGR)
SELECT Fiscal_Year,
AVG(NGR) AS Avg_NGR
FROM online_sports_betting
GROUP BY 1;


#9 Hold percentage
SELECT Fiscal_Year, 
date,
AVG((GGR/Wag) * 100) AS Hold_Pct
FROM online_sports_betting
GROUP BY 1,2;

#10 - Revenue per wager
SELECT Licensee,
Fiscal_Year,
AVG(((GGR / Wag) * 100)) AS Avg_revenue_per_wag
FROM online_sports_betting
WHERE Licensee = 'MPI Master Wagering License CT, LLC'
GROUP BY Licensee, Fiscal_Year;

#10 Retrun to Player(RTP) 96% - considered generally good RTP
SELECT  Licensee,
date,
Win_rate,
GGR
FROM online_sports_betting
WHERE Win_rate > 96;

#11 NGR to Promotional Expenses Ratio
SELECT Fiscal_Year,
NGR/(Coup_credit_wag + Promo_Deduct) AS NGR_to_Promo_Ratio
FROM online_sports_betting
WHERE Licensee = 'MPI Master Wagering License CT, LLC';




