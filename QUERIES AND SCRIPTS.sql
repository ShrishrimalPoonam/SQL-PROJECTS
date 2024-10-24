#QUERIES:

#QUERY1:List all products and their categories with sales greater than 100 units.
SELECT #selecting product_id, name as product_name and category from product_details
    PD.product_id,
    PD.name AS product_name,
    PD.category,
    SUM(S.quantity) AS total_sales #Calculating total sales quantity using SUM() function
FROM
    productdetails PD
    JOIN #Joining (inner) productdetails and sales tables based on product_id
    sales S ON PD.product_id = S.product_id 
GROUP BY #Grouping the results by product ID, name, and category
    PD.product_id, PD.name, PD.category
HAVING #Filtering grouped results to include only products with total sales quantity greater than 100
    SUM(S.quantity) > 25;


#QUERY2: Calculate the total revenue per branch, considering the quantity sold and product prices
SELECT
    S.branch_id, #Selecting branch ID from the sales table
    BD.branch_name, #Selecting branch name from the branchdetails table
    SUM(S.quantity * PD.price) AS total_revenue #Calculating total revenue per branch
FROM
    sales S
    #Join sales and branchdetails tables based on branch_id
    INNER JOIN branchdetails BD ON S.branch_id = BD.branch_id
    #Join sales and productdetails tables based on product_id
    INNER JOIN productdetails PD ON S.product_id = PD.product_id 
GROUP BY  #Grouping the results by branch ID and branch name
    S.branch_id, BD.branch_name;


#QUERY3 :Identify customers who have made purchases in more than 3 different branches.
SELECT 
    CD.customer_id, #Selecting customer ID from the customerdetails tabl
    CD.name AS customer_name, #Selecting customer name from the customerdetails table
    #Counting the number of distinct branches each customer has made purchases in
    COUNT(DISTINCT S.branch_id) AS num_branches_purchased
FROM
    customerdetails CD
    #Joining customerdetails and sales tables based on customer_id
    JOIN sales S ON CD.customer_id = S.customer_id
GROUP BY #Grouping the results by customer ID and customer name
    CD.customer_id, CD.name
HAVING #Filtering the groups to include only customers who have made purchases in more than 3 different branches
    COUNT(DISTINCT S.branch_id) > 3
ORDER BY num_branches_purchased DESC;


#QUERY4: Determine the average sale quantity of products by category for sales made in the last quarter.
SELECT
    PD.category, #Selecting the category from the productdetails table
    ROUND( #Rounding the quantity to two decimal places
			AVG( #Calculating the average sale quantity for each category
				CASE #Using a conditional expression to filter sales quantities within the last quarter
            WHEN S.sale_date >= DATE_SUB((SELECT MAX(sale_date) FROM sales), INTERVAL 3 MONTH)
            THEN S.quantity
            ELSE NULL
        END), 2) AS average_sale_quantity
FROM #Selecting from the productdetails table
    productdetails PD 
    #Join the productdetails table with the sales table based on product_id
    LEFT JOIN sales S ON PD.product_id = S.product_id
GROUP BY #Grouping the results by category
    PD.category;

#QUERY 5:Rank products within each category based on the total sales quantity using a window function.
SELECT 
    PD.product_id, #Select the product_id
    PD.name AS product_name, #Select the name and alias it as product_name
    PD.category, #Select the category
    #Sum up the quantity from sales table and aliasing it as total_sales_quantity
    SUM(S.quantity) AS total_sales_quantity, 
    #Ranking sales within each category based on total quantity sold using a window function RANK()
    RANK() OVER (PARTITION BY PD.category ORDER BY SUM(S.quantity) DESC) AS sales_rank_within_category
FROM 
    productdetails PD #Select data from the productdetails table and alias it as PD
LEFT JOIN #Join the sales table with productdetails table on product_id
    sales S ON PD.product_id = S.product_id 
GROUP BY #Group the results by product ID, product name, and category
    PD.product_id, PD.name, PD.category
ORDER BY 
    CAST(SUBSTRING(PD.category, 9) AS UNSIGNED), -- Extract and cast the numeric part of the category
    sales_rank_within_category;



#QUERY6:Show the month-over-month percentage growth in sales for the top 5 products by total quantity sold.
#CTE for selecting the top 5 products based on total quantity sold using window functions to rank the products
WITH ranked_products AS (
    SELECT
        product_id, 
        SUM(quantity) AS total_quantity_sold,
        RANK() OVER (ORDER BY SUM(quantity) DESC) AS _rank
    FROM sales
    GROUP BY product_id
)
#CTE to Filter out only the top 5 ranked products
, top_products AS (
    SELECT
        product_id,
        total_quantity_sold
    FROM ranked_products
    WHERE _rank <= 5
),
#CTE to generate a list of all months present in the sales data
all_months AS (
    SELECT DISTINCT
        DATE_FORMAT(sale_date, '%Y-%m') AS month
    FROM sales
),
#Generating Cartesian product of top products and all months to ensure all combinations are included
cartesian_products AS (
    SELECT
        tp.product_id,
        am.month
    FROM top_products tp
    CROSS JOIN all_months am
),
#CTE for Aggregating monthly sales for top products
monthly_sales AS (
    SELECT
        cp.product_id,
        pd.name AS product_name,
        cp.month,
        COALESCE(SUM(s.quantity), 0) AS total_quantity_sold
    FROM cartesian_products cp
    LEFT JOIN
        sales s ON cp.product_id = s.product_id AND cp.month = DATE_FORMAT(s.sale_date, '%Y-%m')
    LEFT JOIN
        productdetails pd ON cp.product_id = pd.product_id
    GROUP BY
        cp.product_id, pd.name, cp.month
    ORDER BY cp.product_id, cp.month
)
# calculate month-over-month percentage growth in sales for top products
SELECT
    product_id,
    product_name,
    month,
    total_quantity_sold as current_month_quantity,
    LAG(total_quantity_sold) OVER (PARTITION BY product_id ORDER BY month) AS previous_month_quantity,
    CASE
        WHEN LAG(total_quantity_sold) OVER (PARTITION BY product_id ORDER BY month) = 0 THEN NULL
        ELSE ROUND(((total_quantity_sold - LAG(total_quantity_sold) OVER (PARTITION BY product_id ORDER BY month)) / LAG(total_quantity_sold) OVER (PARTITION BY product_id ORDER BY month)) * 100, 2)
    END AS percentage_growth
FROM monthly_sales;


#QUERY 7: Find all products that have not been sold in the last 6 months (from June to December 2022) but have stock levels above 50.
SELECT
    PD.product_id, #Select the product ID
    PD.name AS product_name, #Select the product name and alias it as product_name
    PD.category, ##Select the category
    PD.stock_level ##Select the stock_level
FROM
    productdetails PD #Select the above columns from productdetails and alias as PD
WHERE
    PD.stock_level > 50 #Filter the products with stock levels above 50
    #Filter the products that haven't been sold in the last 6 months
    AND PD.product_id NOT IN (
        SELECT DISTINCT S.product_id
        FROM sales S
        WHERE S.sale_date BETWEEN '2022-06-01' AND '2022-12-31'
    );


#QUERY 8: Calculate the total number of complaints lodged against products in each category.
SELECT
    PD.category,#Select the product category
    #Counting the number of complaints for each category and aliasing it as total_complaints
    COUNT(CD.complaint_id) AS total_complaints
FROM #Select the data from the productdetails table and alias it as PD
    productdetails PD
LEFT JOIN #Join the complaintdetails table with productdetails table on product_id
    complaintdetails CD ON PD.product_id = CD.product_id
GROUP BY #Group the results by category
    PD.category;


#QUERY 9: List the top 10 customers by total spending and show their most frequently bought product category.
SELECT
    C.customer_id, #Retrieve customer_id
    C.name AS customer_name, #retrieve name and alias it as customer_name
    #calculate total spending and alias it as total_spending
    SUM(S.quantity * PD.price) AS total_spending, 
    (#Subquery to find the most frequently bought product category for each customer
        SELECT PD.category #retrieve category
        FROM sales S, productdetails PD #Source data from sales and productdetails table
        #link the tables
        WHERE S.customer_id = C.customer_id AND S.product_id = PD.product_id 
        GROUP BY PD.category #group subquery results by category
        ORDER BY COUNT(S.product_id) DESC #Orderby product_id count
        LIMIT 1 #set limit as 1
    ) AS most_frequent_category
FROM #retrieve data from customerdetails, sales and productdetails table
    customerdetails C, sales S, productdetails PD
WHERE #link tables using common attributes
    C.customer_id = S.customer_id AND S.product_id = PD.product_id
GROUP BY #groupby customer_id and name
    C.customer_id, C.name
ORDER BY #orderby total_spending
    total_spending DESC
LIMIT 10; #set limit as 10


#QUERY 10: Identify days of the week with the highest sales transactions volume.
WITH daily_transaction_volume AS ( #CTE to Calculate Daily Transaction Volume
    SELECT
        #Extract the day of the week from the sale_date and alias it as days_of_week
        DAYNAME(sale_date) AS days_of_week,
        #Count the number of sales for each day of the week and alias it as transaction_volume
        COUNT(sale_id) AS transaction_volume,
        #Rank the days of the week by transaction volume in descending order and alias it as _rank
        RANK() OVER (ORDER BY COUNT(sale_id) DESC) AS _rank
    FROM sales #Select data from the sales table
    GROUP BY days_of_week #Group the results by days_of_week
)
SELECT
    days_of_week, #Select the days_of_week column
    transaction_volume #Select the transaction_volume column
FROM
    daily_transaction_volume #Select the data from the daily_transaction_volume CTE
WHERE
    _rank = 1; #Filter only the days with the highest transaction volume (ranked 1)


#Query11: Determine the branch with the lowest stock levels across all products.
#Common Table Expression (CTE) to calculate the total stock levels for each branch
WITH branch_stock_levels AS (
    SELECT
        BD.branch_id, #Selecting branch_id from branchdetails table
        BD.branch_name, #Selecting branch_name from branchdetails table
        SUM(PD.stock_level) AS total_stock_level, #Calculating the sum of stock levels for each branch
        RANK() OVER (ORDER BY SUM(PD.stock_level) ASC) AS stock_level_rank #Ranking branches based on total stock levels
    FROM branchdetails BD #Selecting data from branchdetails table and aliasing it as BD
        JOIN sales S ON BD.branch_id = S.branch_id #Joining branchdetails with sales table based on branch_id
        JOIN productdetails PD ON S.product_id = PD.product_id ##Joining sales table with productdetails table based on product_id
    GROUP BY BD.branch_id, BD.branch_name #Grouping the results by branch_id and branch_name
)
SELECT branch_id, branch_name, total_stock_level #select branch id, name and total_stock_level
FROM branch_stock_levels  #from above from branch stock levels
WHERE stock_level_rank = 1; #Filtering to get the branch with the lowest stock level



#QUERY12: Analyze the correlation between loyalty program status and the average transaction value per customer.
SELECT
    CD.loyalty_program_status, #Select the loyalty program status column
    #Calculate the average transaction value per customer and alias it as average_transaction_value
    AVG(S.quantity * PD.price) AS average_transaction_value
FROM
    customerdetails CD #Select the data from the customerdetails table and alias it as CD
JOIN # Join the customerdetails table with sales table on customer_id
    sales S ON CD.customer_id = S.customer_id 
JOIN #Join the sales table with productdetails table on product_id
    productdetails PD ON S.product_id = PD.product_id 
GROUP BY #Group the result by loyalty program status
    CD.loyalty_program_status;


#QUERY13: Calculate the average duration between complaint registration and resolution.
#Alter the complaintdetails table to add a column resolution_date
ALTER TABLE complaintdetails
ADD COLUMN resolution_date DATE;

#Update the resolution dates for resolved query
UPDATE complaintdetails
SET resolution_date = DATE_ADD(complaint_date, INTERVAL FLOOR(RAND() * 30) DAY)
WHERE resolution_status = 'Resolved';

#now calculate the average duration
SELECT ROUND(AVG(DATEDIFF(resolution_date, complaint_date)), 0) AS average_resolution_duration
FROM complaintdetails
WHERE resolution_status = 'Resolved';


#QUERY14: Identify staff members with shifts longer than 8 hours and list their corresponding branches and shift dates.
SELECT
    SD.staff_id, #Select the staff ID
    BD.branch_name, #Select the branch name
    SD.shift_date, #Select the shift date
    #Calculate the duration of the shift using TIMDIFF() function and alias it as shift_duration
    TIMEDIFF(SD.end_time, SD.start_time) AS shift_duration
FROM #Select the data from the staffshiftdetails table and alias it as SD
    staffshiftdetails SD 
JOIN #Join the staffshiftdetails table with branchdetails table on branch_id
    branchdetails BD ON SD.branch_id = BD.branch_id
WHERE #Filter the results with shifts longer than 8 hours
    TIMEDIFF(SD.end_time, SD.start_time)  > '08:00:00';


#QUERY15: Find the product with the highest number of complaints and detail the nature of these complaints.
SELECT
    CD.product_id, #Select the product ID
    PD.name AS product_name, #Select the product name and alias it as product name
    CD.complaint_id, #Select the complaint ID
    CD.complaint_date, #Select the complaint date
    CD.resolution_status #Select the resolution status
FROM complaintdetails CD #Select the data from the complaintdetails table and alias it as CD
JOIN #Join the complaintdetails table with productdetails table on product_id
    productdetails PD ON CD.product_id = PD.product_id
WHERE CD.product_id IN ( #Filter the products with the highest number of complaints
        SELECT CD.product_id
        FROM complaintdetails CD
        GROUP BY CD.product_id
        HAVING COUNT(CD.complaint_id) = ( #Count the number of complaints for each product
                SELECT MAX(complaint_count)
                FROM
                    (SELECT COUNT(complaint_id) AS complaint_count FROM complaintdetails GROUP BY product_id) AS counts
            )
    );


#ADDITIONAL QUERIES DESIGNED

#1: Staff Performance Evaluation - Which staff members have the highest average sales volume per shift, and how does it vary across different branches?
SELECT
    SD.staff_id, #select staff_id
    BD.branch_name, # select branch_name
    #calculate average of sales quantity and alias it as average_sales_volume_per_shift
    AVG(S.quantity) AS average_sales_volume_per_shift
FROM
    sales S #source data from sales table
JOIN #Inner join sales and staffshift details using branch_id
    staffshiftdetails SD ON S.branch_id = SD.branch_id
JOIN #Inner join sales and branchdetails using branch_id
    branchdetails BD ON S.branch_id = BD.branch_id
GROUP BY #Group the results by staff_id and branch name
    SD.staff_id, BD.branch_name
ORDER BY #order results by average_sales_volume_per_shift in descending order
    average_sales_volume_per_shift DESC;


#2. Customer Segmentation - Segment the customer based on their total spend over the given period.
#outer query
SELECT #select or retrive customer_id, order_count, total purchase amount and segment
	customer_id, customer_name, order_count, total_purchase_amount, customer_segment
#subquery to compute the aggregated values for each customer
FROM
    (SELECT # retrieve customer_id, customer name, order_count
        cd.customer_id,
        cd.name AS customer_name,
        COUNT(s.sale_id) AS order_count,
        SUM(s.quantity * p.price) AS total_purchase_amount,
        #Segment customers based on their total spend
        CASE
            WHEN SUM(s.quantity * p.price) >= 1000 THEN 'High Value'
            WHEN SUM(s.quantity * p.price) < 1000 AND SUM(s.quantity * p.price) >= 500 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS customer_segment
    FROM customerdetails cd
    JOIN #Inner join customer details and sales to include customers who have made purchases 
        sales s ON cd.customer_id = s.customer_id
    JOIN #Inner join customer details and product details
		productdetails p ON s.product_id = p.product_id
    GROUP BY #groupby customer id and name
		cd.customer_id, cd.name) AS combined_result
ORDER BY #order by total purchase amount
	total_purchase_amount DESC;


#3. Stagnant Product on shelf - List all products that have never been sold and there stock_levels
SELECT pd.product_id, #Select product ID
		pd.name as product_name,#Select product name and alias it as product_name
        pd.stock_level, #Select stock level of the product
        pd.price #Select price of the product
FROM  
	productdetails pd #Select from productdetails table and alias it as pd
LEFT JOIN #Left join with sales table on product_id to find sold products
	sales s ON pd.product_id = s.product_id
WHERE #Filter to include only products that have never been sold
	s.product_id IS NULL
ORDER BY stock_level DESC;

#4. Unresolved Complaints and Impact on Purchases
#List all customers who have unresolved complaints and check the impact on the purchases made
SELECT
    cd.customer_id, cd.name, c.complaint_date, c.resolution_status,
    #Counting purchases made before and after the complaint date for each customer
    COUNT(DISTINCT CASE WHEN s.sale_date <= c.complaint_date THEN s.sale_id END) AS purchases_before_complaint,
    COUNT(DISTINCT CASE WHEN s.sale_date > c.complaint_date THEN s.sale_id END) AS purchases_after_complaint
FROM customerdetails cd
JOIN complaintdetails c ON cd.customer_id = c.customer_id #Joincustomerdetails table with complaintdetails
LEFT JOIN sales s ON cd.customer_id = s.customer_id #Left join customerdetails table with sales table
WHERE c.resolution_status != 'Resolved' #filter to include only unresolved complaints
GROUP BY cd.customer_id,
    cd.name,
    c.complaint_date,
    c.resolution_status;


#5.Product Performance by Location
#Subquery to calculate total sales quantity and revenue for each product in each branch location
WITH product_sales AS (
    SELECT #retrieve following columns
        BD.branch_id, BD.branch_name, BD.location, PD.product_id, PD.name AS product_name,
        SUM(S.quantity) AS total_quantity_sold,
        SUM(S.quantity * PD.price) AS total_revenue
    #Assign data sources
    FROM branchdetails BD 
    #Inner join branch details with sales and product details resp,
    JOIN sales S ON BD.branch_id = S.branch_id
    JOIN productdetails PD ON S.product_id = PD.product_id
    GROUP BY BD.branch_id, BD.branch_name, BD.location, PD.product_id, PD.name
),
#Subquery to rank products within each branch location based on total sales quantity
ranked_products AS (
    SELECT #select below columns from product_sales subquery
        branch_id, branch_name, location, product_id, product_name, total_quantity_sold, total_revenue,
        #rank the product using RANK() window function
        RANK() OVER (PARTITION BY branch_id ORDER BY total_quantity_sold DESC) AS sales_rank
    FROM product_sales #assign data source
)
#Main query to retrieve top performing products by location
SELECT #retrive following tables for results
    branch_id,
    branch_name,
    location,
    product_id,
    product_name,
    total_quantity_sold,
    total_revenue,
    sales_rank
FROM
    ranked_products #set data source
WHERE #filter the results 
    sales_rank <2
order by product_id;


#6 Branch Performance Evaluation - What is the average revenue generated per day for each branch, and how does it vary across different branches?
SELECT #retrieve below columns 
    BD.branch_id,
    BD.branch_name,
    AVG(S.quantity * PD.price) AS average_daily_revenue
FROM #select the above columns from
    branchdetails BD
LEFT JOIN # Left join branch details with sales
    sales S ON BD.branch_id = S.branch_id
LEFT JOIN #left join branch details with products
    productdetails PD ON S.product_id = PD.product_id
GROUP BY #group the results by branch id and name
    BD.branch_id, BD.branch_name
ORDER BY #arrange the result bu average daily revenue in descending order
    average_daily_revenue DESC;