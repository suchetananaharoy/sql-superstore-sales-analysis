select * from SampleSuperstore


--1.	View sample records from the dataset
select Top 10 *
from SampleSuperstore



--2.	Count total number of transactions
select count(*) as total_transactions
from SampleSuperstore



--3.	Identify all distinct branches
select Segment
from SampleSuperstore



-- 4.	Identify all distinct cities
select distinct City
from SampleSuperstore



--Identify all distinct ship modes
select distinct Ship_Mode
from SampleSuperstore



--Identify all customer segments
select Segment, count(*) as total_segment
from SampleSuperstore
group by Segment

--Identify all distinct regions

select distinct Region
from SampleSuperstore


--List all product categories
select distinct Category
from SampleSuperstore

--List all sub-categories under each category
select Category, Sub_Category, count(*) as Total_Category
from SampleSuperstore
group by Category, Sub_Category 

SELECT DISTINCT Category, [Sub_Category]
FROM SampleSuperstore
ORDER BY Category



--Filter sales records for a specific region (e.g., West)
select *
from SampleSuperstore
where Region = 'West'



--Calculate total sales by region
select Region, SUM(Sales) as Total_Sales
from SampleSuperstore
group by Region
order by Total_Sales DESC



--Calculate average profit by category 
select Category, AVG(Profit) as Avg_profit
from SampleSuperstore
group by Category 
order by Avg_profit DESC


--Total sales by category
select Category, count(Sales) as Total_Sales
from SampleSuperstore
group by Category 
order by Total_Sales DESC


--Total profit by category
select Category, SUM(Profit) as Total_Profit
from SampleSuperstore
group by Category
order by Total_Profit DESC






--Sales and profit by sub-category
select category, Sub_Category, SUM(Sales) as Total_Sales , SUM(Profit) as Total_Profit
from SampleSuperstore
group by Sub_Category, Category
order by Total_Profit DESC








--Region-wise sales and profit
select Region, SUM(Sales) as Total_Sales, SUM(Profit) as Total_profit
from SampleSuperstore
group by Region
order by Total_profit DESC








--Segment-wise sales analysis
select Segment, SUM(Sales) as Total_Sales
from SampleSuperstore
group by Segment
order by Total_Sales DESC




--Average discount by category
select  Category, AVG(Discount) as Total_Discount
from SampleSuperstore
group by Category
order by Total_Discount DESC 




-- Impact of discount on profit
select Category, 
	cast(Discount * 100 As Int) as Total_discount_percentage, 
	Round(SUM(Profit), 2) as Total_Profit
from SampleSuperstore
group by Discount, Category
order by Discount


select Category, 
	concat(round(Discount * 100, 0), '%') as Total_discount_percentage, 
	Round(SUM(Profit), 2) as Total_Profit
from SampleSuperstore
group by Discount, Category
order by Discount



--Top 5 states by total sales

select Top 5 
	State,
	SUM(Sales) as total_sales
from SampleSuperstore
group by State
order by total_sales DESC



-- Cities with negative total profit
select City,
	SUM(Profit) as Total_Profit
from SampleSuperstore
group by City
Having SUM(Profit) < 0
order by Total_Profit DESC



-- Orders with sales above average
select *
from SampleSuperstore
where Sales > (Select AVG(Sales) from SampleSuperstore)



-- Categorize discount levels using CASE
select Category, 
	Discount,
	CASE
		when discount = 0 then 'No Discount'
		when discount between 0.01 and 0.20 then 'low discount'
		when discount between 0.21 and 0.50 then 'Medium discount'
		Else 'High Discount'
	End as Discount_level,
	Round(SUM(Profit), 2) as Total_Profit
from SampleSuperstore
group by Category, Discount


--Identify loss-making categories
SELECT 
    Category,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM SampleSuperstore
GROUP BY Category
HAVING SUM(Profit) < 0;

--Top 3 sub-categories by total sales
select Top 3
	Sub_Category, 
	Round(SUM(Sales), 2) as Total_sales
FROM SampleSuperstore
group by Sub_Category
ORDER BY Total_Sales DESC;

--Rank regions by total profit

select Region, 
	ROUND(SUM(Profit) , 2) as Total_Profit,
	RANK() Over (order by SUM(Profit) DESC) as Profit_Rank
FROM SampleSuperstore
group by Region


--Running total of sales by region
select Region, ROUND(SUM(Sales),2) as total_sales
from SampleSuperstore
group by Region


select Region, Sales, 
	ROUND(
		SUM(Sales) Over (partition by Region order by Sales),
		2) as Running_sales
from SampleSuperstore


--Average profit per order by segment
select Segment, Round(AVG(Profit) , 2) as avg_profit
from SampleSuperstore
group by Segment

-- Products contributing more than 10% of total sales

select Category, Round(SUM(Sales) ,2) as total_sales
from SampleSuperstore
group by Category 
having SUM(Sales) > 0.10 * (select SUM(Sales) as Total_Sales from SampleSuperstore)


-- CTE: Sales and profit summary by category 
with categorysummary as (select Category,
	Round(SUM(Sales) , 2) as total_sales,
	Round(SUM(Profit), 2) as Total_profit
from SampleSuperstore
group by Category
)
select Category,
	 total_sales,
	Total_profit
from categorysummary



-- Cities with highest average discount
select Top 5
	City, 
	Round(AVG(discount * 100), 2) as avg_discount
from SampleSuperstore
group by City
order by avg_discount DESC


--Profit margin calculation
select Category, 
	ROUND((SUM(Profit)/ Nullif(SUM(Sales), 0)) * 100 , 2) as Profit_percentage
from SampleSuperstore
group by Category 


