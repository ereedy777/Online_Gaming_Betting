# Overall data
#1 - Total revenue by Licensee and fiscal year 
SELECT Licensee, 
Fiscal_Year,
SUM(GGR) AS Total_GGR
from online_sports_betting
group by Licensee,Fiscal_Year
ORDER BY Licensee;


#2 - Average wagering amounts
SELECT Licensee,
Fiscal_Year,
AVG(Wag) AS Avg_wager,
AVG(Patron_win) AS Avg_Pwin
FROM online_sports_betting
GROUP BY 1,2;

#3 - Gross Gaming Revenue (GGR)
SELECT Licensee,
Fiscal_Year,
AVG(GGR) AS Avg_GGR
FROM online_sports_betting
GROUP BY 1,2;

#4 - Hold percentage Wager - Win/Wager amount)
SELECT Licensee,
Fiscal_Year,
((GGR/ Wag) * 100) AS Hold_perc
FROM online_sports_betting
GROUP BY 1,2,3;

#5 - Revenue per wager
SELECT Licensee,
Fiscal_Year,
AVG(((GGR / Wag) * 100)) AS Avg_revenue_per_wag
FROM online_sports_betting
GROUP BY Licensee, Fiscal_Year;

#6 - Average RTP
SELECT  Licensee,
date,
Win_rate,
GGR
FROM online_sports_betting;
 