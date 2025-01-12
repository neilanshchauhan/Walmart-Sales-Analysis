SELECT * FROM sales;

# EDA 
# Different Payment Method 
SELECT payment_method, COUNT(*) AS Count
FROM sales
GROUP BY payment_method
ORDER BY Count DESC;

# Number of branches 
SELECT COUNT(DISTINCT Branch) AS branch_count
From sales;

-- PROBLEMS
-- Q1. Find different payment methods, number of transactions, and quantity sold by payment method
SELECT payment_method, COUNT(*) AS Count, SUM(quantity) AS Number_Qts_Sold
FROM sales
GROUP BY payment_method
ORDER BY Count DESC;

-- Q2. Identify the highest-rated category in each branch
-- Display the branch, category, and avg rating
SELECT branch, category, avg_rating
FROM (
    SELECT 
        Branch,
        category,
        ROUND(AVG(rating),2) AS avg_rating,
		RANK() OVER(PARTITION BY Branch ORDER BY ROUND(AVG(rating),2) DESC) AS ranked_position
    FROM sales
    GROUP BY Branch, category
) AS ranked
WHERE ranked_position = 1;

-- Q3: a) Identify the busiest day for each branch based on the number of transactions
SELECT *
FROM
	(SELECT Branch, 
		dayname(date) as day_name, 
		COUNT(*) AS no_transactions,
		RANK() OVER(PARTITION BY Branch ORDER BY COUNT(*) DESC) AS ranked_position
	FROM sales
	GROUP BY Branch, day_name) AS ranked
WHERE ranked_position = 1;

-- b) Identify the busiest month for each branch based on the number of transactions
SELECT * 
FROM
	(SELECT Branch, 
		MONTHNAME(date) AS month_name, 
		COUNT(*) no_transactions,
		RANK() OVER(PARTITION BY Branch ORDER BY COUNT(*) DESC) AS ranked_position
	FROM sales
	GROUP BY Branch, month_name) AS ranked
WHERE ranked_position = 1;
## Most transactions are during Holiday Season Nov-Jan

-- Q4: Calculate the total quantity of items sold per payment method
SELECT payment_method, SUM(quantity) AS total_qty
FROM sales
GROUP BY payment_method
ORDER BY total_qty DESC;

-- Q5: Determine the average, minimum, and maximum rating of categories for each city
SELECT City, category,
	ROUND(AVG(rating),2) AS avg_rating, 
    MIN(rating) AS min_rating, 
    MAX(rating) AS max_rating
FROM sales
GROUP BY City,category;

-- Q6: Calculate the total profit for each category
-- total_profit = (total_price * profit_margin). 
-- List category and total_profit, ordered from highest to lowest profit.

SELECT category, 
	ROUND(SUM(total_price * profit_margin),2) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC;

-- Q7. Determine the Average Profit Margin %, with respect to each city.
SELECT 
    City, 
    ROUND(AVG(profit_margin)*100,2) AS avg_profit_margin_percent
FROM sales
GROUP BY City
ORDER BY avg_profit_margin_percent DESC
LIMIT 10;

-- Q.8 Determine the most common payment method for each Branch. 
-- Display Branch and the preferred_payment_method.

SELECT *
FROM
	(SELECT Branch,
		payment_method,
		COUNT(*) AS total_transactions,
		RANK() OVER(PARTITION BY Branch ORDER BY COUNT(*) DESC) AS ranked_position
	FROM sales
	GROUP BY Branch, payment_method) AS ranked
WHERE ranked_position = 1;

-- Q9: a) Categorize sales into Morning, Afternoon, and Evening shifts
SELECT Branch, COUNT(*) AS Total_Transactions,
	CASE 
		WHEN HOUR(time) < 12 THEN "Morning"
		WHEN HOUR(time) BETWEEN 12 AND 17 THEN "Afternoon"
		ELSE "Evening"
	END day_time
FROM sales
GROUP BY Branch, day_time
ORDER BY Branch, Total_Transactions DESC;

-- b) Find out the time slot for each  branch with most transactions
SELECT * 
FROM
	(SELECT Branch, COUNT(*) AS Total_Transactions,
		RANK() OVER(PARTITION BY Branch ORDER BY COUNT(*) DESC) AS ranked_position,
		CASE 
			WHEN HOUR(time) < 12 THEN "Morning"
			WHEN HOUR(time) BETWEEN 12 AND 17 THEN "Afternoon"
			ELSE "Evening"
		END day_time
	FROM sales
	GROUP BY Branch, day_time) AS ranked
WHERE ranked_position = 1;

-- Q10. Identify 5 branch with highest decrese ratio in 
-- revevenue compare to last year(current year 2023 and last year 2022)
-- rdr == last_rev-cr_rev/ls_rev*100

-- 2022 Sales
WITH revenue_2022
AS 
	(SELECT branch, SUM(total_price) AS revenue
	FROM sales
	WHERE YEAR(date) = 2022
	GROUP BY Branch),
    
revenue_2023 AS
    (SELECT branch, SUM(total_price) AS revenue
	FROM sales
	WHERE YEAR(date) = 2023
	GROUP BY Branch)
    
SELECT ly.branch,
    ly.revenue AS last_year_revenue,
    cy.revenue AS current_year_revenue,
    ROUND(((ly.revenue - cy.revenue) / ly.revenue) * 100, 2) AS revenue_decrease_ratio
FROM revenue_2022 as ly
JOIN revenue_2023 as cy
ON ly.Branch = cy.Branch
WHERE ly.revenue > cy.revenue
ORDER BY revenue_decrease_ratio DESC;
    
