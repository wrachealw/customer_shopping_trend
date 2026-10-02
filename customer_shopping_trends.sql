CREATE DATABASE customer_shopping_data;
USE customer_shopping_data;
SHOW TABLES FROM customer_shopping_data;

SELECT * FROM shopping_trends;
-- 1. Which products sell the most, the least, and most consistently? (Understand sales)
SELECT `Item Purchased`,
	COUNT(*) AS Units
FROM shopping_trends
GROUP BY `Item Purchased`
ORDER BY Units ASC;
-- The top 5 Item purshased and the units: Blouse	171,Pants	171,Jewelry	171,Shirt	169,Dress	166
-- The least 5 Item purshased and the units: Jeans	124,Gloves	140,Backpack	143,Boots	144,Sneakers	145
SELECT `Item Purchased`,
	COUNT(*) AS weekly_units
FROM shopping_trends
WHERE `Frequency of purchases` = 'Weekly'
GROUP BY `Item Purchased`
ORDER BY weekly_units DESC;
-- The top frequently purchased items are: Hoodie	20,Jacket	19,Hat	19,T-shirt	19,Gloves	19. 
-- These are weekly purchases since it indicates most frequent purchases and we are looking for the most consistently products.

SELECT `Item Purchased`,
	SUM(`Purchase Amount (USD)`) AS Revenue
FROM shopping_trends
 GROUP BY `Item Purchased`
ORDER BY Revenue DESC;
-- The top 5 products that generate the highest revenue are: Blouse	10410,Shirt	10332,Dress	10320,Pants	10090,Jewelry	10010
-- The Categories that generate the highest revenue are:Clothing	104264,Accessories	74200,Footwear	36093,Outerwear	18524
SELECT Category,
	SUM(`Purchase Amount (USD)`) AS Revenue
FROM shopping_trends
 GROUP BY Category
ORDER BY Revenue DESC;

-- 2. When does each product sell? (Understand demand patterns) Shipping type, color & Season.
SELECT DISTINCT Season -- `Frequency of purchases`
FROM shopping_trends;

SELECT `Item Purchased`, COUNT(`Item Purchased`) AS Units_solds, SUM(`Purchase Amount (USD)`)
FROM shopping_trends
WHERE Season = 'Winter'
GROUP BY `Item Purchased`
ORDER BY Units_solds DESC;
-- In winter sunglasses were the most purchased item with also the seecond highest revenue of 3085 as shirt had a revenue of 3102 the highest but had 31 units sold taking the 3rd place while else Backpack were the least purchased item 25 with also the least revenue 1642. 
--  `Item Purchased`, COUNT(`Item Purchased`) AS Units_solds, SUM(`Purchase Amount (USD)`): Sunglasses	52	3085,Pants	51	2999,Shirt	50	3102,Hoodie	48	2850,Jewelry	47	2708,Sweater	42	2365,Jacket	41	2397,Blouse	40	2333,Dress	40	2535,T-shirt	40	2511,
-- Hat	40	2293Belt	40	2491,Coat	39	2165,Sneakers	39	2220,Skirt	38	2446,Shoes	38	2252,Shorts	35	2130,Socks	35	2170,Handbag	34	2077,Scarf	33	1990,Sandals	32	1952,Gloves	32	2005,Boots	31	2056,Jeans	29	1833,Backpack	25	1642

SELECT `Item Purchased`, COUNT(`Item Purchased`) AS Units_solds, SUM(`Purchase Amount (USD)`)
FROM shopping_trends
WHERE Season = 'Spring'
GROUP BY `Item Purchased`
ORDER BY Units_solds DESC;
-- In Spring sweaters were the most purchased item 52 with also the highest revenue of 3145  while else hat were the least purchased item 27 with also the least revenue 1625 
--  `Item Purchased`, COUNT(`Item Purchased`) AS Units_solds, SUM(`Purchase Amount (USD)`): Sweater	52	3145,Shorts	47	2704,Blouse	46	2771,Coat	46	2436,Skirt	46	2794,Sandals	44	2384,Dress	43	2594,Jewelry	42	2216,Gloves	42	2473,Shirt	42	2669,Scarf	41	2217,
-- Belt	41	2358,Socks	40	2420,Shoes	40	2549,Boots	40	2428,Sneakers	39	2194,Backpack	39	2206,T-shirt	38	2506,Handbag	36	2008,Hoodie	36	2179,Jacket	35	1989,Sunglasses	33	1904,Jeans	32	1881,Pants	32	2029,Hat	27	1625

SELECT `Item Purchased`, COUNT(`Item Purchased`) AS Units_solds, SUM(`Purchase Amount (USD)`)
FROM shopping_trends
WHERE Season = 'Summer'
GROUP BY `Item Purchased`
ORDER BY Units_solds DESC;

-- In Summer Pants were the most purchased item 50 with also the seecond highest revenue of 2886  as jewelry had a revenue of 3006 the highest but had 47 units sold taking the 3rd place while else skirt were the least purchased item 28 with also the least revenue 1589. 
--  `Item Purchased`, COUNT(`Item Purchased`) AS Units_solds, SUM(`Purchase Amount (USD)`): Pants	50	2886,Dress	47	2745,Jewelry	47	3006,Shoes	46	2781,Backpack	45	2780,Blouse	43	2616,Scarf	43	2759,Coat	42	2521,Socks	42	2403,Shorts	40	2221,Sandals	40	2123,
-- Belt	39	2233,Shirt	38	1965,Boots	38	2375,Hat	37	2233,Sunglasses	37	2294,Sneakers	36	2114,Handbag	35	1990,Jacket	33	1757,Hoodie	31	1653,Jeans	31	1842,T-shirt	30	1640,Gloves	29	1733,Sweater	28	1518,Skirt	28	1589

SELECT `Item Purchased`, COUNT(`Item Purchased`) AS Units_solds, SUM(`Purchase Amount (USD)`)
FROM shopping_trends
WHERE Season = 'Fall'
GROUP BY `Item Purchased`
ORDER BY Units_solds DESC;
-- In Fall Jacket were the most purchased item 54 with also the highest revenue of 3106  while else shoes were the least purchased item 26 with also the least revenue 1658. 
--  `Item Purchased`, COUNT(`Item Purchased`) AS Units_solds, SUM(`Purchase Amount (USD)`): Jacket	54	3106,Hat	50	3224,Handbag	48	2782,Skirt	46	2573,Sandals	44	2741,Socks	42	2259,Sweater	42	2434,Blouse	42	2690,Belt	41	2553Scarf	40	2595,
-- Shirt	39	2596,T-shirt	39	2591,Sunglasses	39	2366,Pants	38	2176,Gloves	37	2266,Dress	36	2446,Hoodie	36	2085,Boots	35	2159,Jewelry	35	2080,Shorts	35	2378,Backpack	34	2008,Coat	34	2153,Jeans	32	1992,Sneakers	31	2107,Shoes	26	1658

SELECT `Shipping Type`, COUNT(`Shipping Type`) AS Units_solds, SUM(`Purchase Amount (USD)`)
FROM shopping_trends
GROUP BY `Shipping Type`
ORDER BY Units_solds DESC;
-- Free Shipping has the highest uits_sold 675 generating the highest incom of 40777 followed by stadard with 654 units sold but had the 4th highest income generated of 38233 followed by store pickup with 650 units sold and 38931 as 3rd highest income.
-- The send highest income 39067 came from Express shippig type which had the third lowest units sold of 646 and 2-day shipping had the lowest units sold of 627 with the second least revenue 38080. Next day air has the least reveue of 37993 and 3rd lowest units sold of 648. 

SELECT DISTINCT `Shipping Type` -- `Frequency of purchases` Season
FROM shopping_trends;

SELECT `Item Purchased`, COUNT(`Item Purchased`) AS Units_solds, SUM(`Purchase Amount (USD)`)
FROM shopping_trends
WHERE `Shipping Type` = 'Store Pickup'
GROUP BY `Item Purchased`
ORDER BY Units_solds DESC;
-- For Express Shipping type: Pants have the highest item purchased 36 with a revenue of 2190 followed by Sweater 33 making 2090 and coat the 3rd with 32 making 1658.
-- For Free Shipping type: Jacket have the highest item purchased 41 with a revenue of 2371 followed by Shoes 35 making 2135 and Sunlasses the 3rd with 34 making 2080.
-- For Next Day Air Shipping type: Sunglasses have the highest item purchased 36 with a revenue of 2207 followed by Socks 33 making 1822 and Dress the 3rd with 32 making 1869, Sweaters 32 units purchased  making 1666 USD.
-- For starndard Shipping type: Skirt have the highest item purchased 40 with a revenue of 2159 followed by Shirt 33 making 2028 and Jewelry the 3rd with 32 making 1935.
-- For 2-Day Shipping type: Socks have the highest item purchased 35 with a revenue of 2094 followed by Scarf 32 making 2056 and Dress the 3rd with 31 making 2057.
-- For Store Pickup Shipping type: Scarf have the highest item purchased 37 with a revenue of 2261 followed by Coat 33 making 2216 and Jewelry the 3rd with 32 making 1837.

SELECT Color, COUNT(Color) AS Units_solds, SUM(`Purchase Amount (USD)`)
FROM shopping_trends
GROUP BY Color
ORDER BY Units_solds DESC;
-- The best color is Olive with 177 Purchased Items followed by Yellow 174 then Teal 172 the revenues as follows 10292, 10308 and 10459 Respectively. 
-- The color wth the highest Revenue is Green makig 11104 & units purched are 169 5th highest color. The least purched cor item is gold 138 Revenue 8419.

SELECT `Item Purchased`, COUNT(`Item Purchased`) AS Units_solds, SUM(`Purchase Amount (USD)`)
FROM shopping_trends
WHERE Color = 'Gold'
GROUP BY `Item Purchased`
ORDER BY Units_solds DESC;
-- Sunglasses sell most in Olive color 12 Making 581. For Yellow the item that sells most is Shorts 13 purchases. Skirts is loved in the color Teal 12 making 834.
-- For Green Hodies sell most with 11 making 801 and Gold 11 shoes were sold making 695.

SELECT DISTINCT Category 
FROM shopping_trends;

SELECT Category, COUNT(Category) AS Units_solds, SUM(`Purchase Amount (USD)`)
FROM shopping_trends
WHERE Color = 'Olive'
GROUP BY Category
ORDER BY Units_solds DESC;
-- Green, Gold, Teal, Yellow have the highest purchases in Clothing category with olive having the hiest in Accessories.

-- ------------- THE FIRST TWO QUESTIONS ANSWERED TO 'WHAT HAPPENED?'.
-- ------------- THE NEXT QUESTIONS ANSWER 'WHY IT IS HAPPENING?' AND THE LAST WILL ANSWER 'WHAT SHOULD THE BUSINESS DO?'


-- 3(a). Who buys the most? This is to understand your cutsomers.
SELECT Gender, COUNT(Gender) AS Units_Purchased, Sum(`Purchase Amount (USD)`) AS Revenue, AVG(`Purchase Amount (USD)`) AS Avg_order_value
FROM shopping_trends
GROUP BY Gender;
-- Male purchases more units 2652 generating more revenue 157890 but he oder value is lower 59.53 compared to female which is 60.24 but he units they purchase is lower 1248 and revenue still lower 75191
-- 3(b). Which customer demographics(age) generate the most sales and revenue?
SELECT DISTINCT COUNT(DISTINCT Age)
FROM shopping_trends; -- 53 differnt ages.
SELECT Age, COUNT(Age) AS Units_Purchased, Sum(`Purchase Amount (USD)`) AS Revenue, AVG(`Purchase Amount (USD)`) AS Avg_order_value
FROM shopping_trends
GROUP BY Age
ORDER BY Units_Purchased
DESC;
-- Customer at the of 69 have the highest purchses of 88 uits making 5484 in revenue with an avg orde value of 62.32 followed by age 57 purchasing 87 units making 5200 in reveue and avg order value of 59.77 followed by age 41 havig 86 purchases making 5282 i revenue with avg order value of 6186. 
-- The least purchaseing age is 44 with 51 purchases making 3312 on a avg order value of 64.94
SELECT Age, COUNT(*) AS age_count
FROM shopping_trends
GROUP BY Age
ORDER BY Age DESC; -- Youngest age is 18 oldest is 70 

SELECT 
	CASE
		WHEN Age < 20 THEN 'Under 20'
        WHEN Age BETWEEN 20 AND 29 THEN '20-29'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
	END AS Age_group,
    COUNT(*) AS Purchases,
    Sum(`Purchase Amount (USD)`) AS Revenue, 
    AVG(`Purchase Amount (USD)`) AS Avg_order_value
FROM shopping_trends
GROUP BY Age_group
ORDER BY Purchases
DESC;
-- The top three age_groups with the highes purchases are 60+ with 788 purchases making revenue of 46894 and avg orde value of 59.5 followed by 50-59 with 771 purchases making revenue of 46516 and avg orde value of 60.3 then
-- 40-49 with 739 purchases making revenue of 43225 and avg orde value of 58.5. The top 3 age groups with th ehighest reveue are 60+ making 46894, 50-59 making 46516 then 20-29 making 43825 respectively. 
-- The top 3 Age group wit th highest order value are Under 20 with 60.5 then 50-59 with 60.3 then 20-29 with 60.2

-- 4. Which customers are the most valuable?
SELECT `Previous Purchases`, COUNT(*) AS No_of_customers, Sum(`Purchase Amount (USD)`) AS Revenue, AVG(`Purchase Amount (USD)`) AS Avg_order_value
FROM shopping_trends
GROUP BY `Previous Purchases`
ORDER BY Revenue
DESC;
-- Considering high number of customers within the bracket the top 3 are: Previous Purchases 31 has 97 customers making a revenue of 5557 followed by Previous Purchases 21 having 96 customers makig 5566 revenue then Previous Purchases 14 having 92 customers making 5333
-- Considering high frequency of purchase the top 3 are: Previous Purchases 50 has 77 customers making a revenue of 5026 followed by Previous Purchases 49 having 58 customers makig 3277 revenue then Previous Purchases 48 having 90 customers making 5723 
-- Considering high revenue the top 3 are: Previous Purchases 48 has 90 customers making a revenue of 5723 followed by Previous Purchases 47 having 90 customers makig 5639 revenue then Previous Purchases 5 having 87 customers making 5590

-- Does Discouting actually increase sales? I.E Are discounts associated with higher purchase frequency, higher revenue, or simply lower-value purchases?
SELECT `Discount Applied`, COUNT(*), Sum(`Purchase Amount (USD)`) AS Revenue, AVG(`Purchase Amount (USD)`) AS Avg_order_value
FROM shopping_trends
GROUP BY `Discount Applied`;
-- `Discount Applied`, COUNT(*), Revenue, AS Avg_order_value: 'Yes', '1677', '99411', '59.2791','No', '2223', '133670', '60.1305' From this discounting does not assosiate to increase sales nor revenue.
SELECT `Item Purchased`, `Discount Applied`, COUNT(*), Sum(`Purchase Amount (USD)`) AS Revenue, AVG(`Purchase Amount (USD)`) AS Avg_order_value
FROM shopping_trends
GROUP BY `Item Purchased`,`Discount Applied`
ORDER BY COUNT(*)
DESC;
-- The top 3 items being purchased are Blouse, Socks, Sandals, 113,107,101 with a revenue of 6916,6120,5547 respectively and they all dont have  discouts. The first item having a discount is pants placed at number top 20 item from the list of the top sales with a revenue of 4837 having sold 81 pants.

-- 6. Analyze subscription: Are most of our customers subscribed and the sales purchased by subscribers?
SELECT `Subscription Status`, COUNT(*), Sum(`Purchase Amount (USD)`) AS Revenue, AVG(`Purchase Amount (USD)`) AS Avg_order_value
FROM shopping_trends
GROUP BY `Subscription Status`;
-- NO, most of our sales areby non-subscribers making 73% leaving 27% as subscribers.
-- non-subscribers make more revenue 170436 than subssribers 62645 but the average order value of non-subscribers 59.86 and subscribers 59.49 is almost the same
SELECT `Subscription Status`, COUNT(*), Sum(`Purchase Amount (USD)`) AS Revenue, AVG(`Purchase Amount (USD)`) AS Avg_order_value, `Discount Applied`
FROM shopping_trends
GROUP BY `Subscription Status`, `Discount Applied`;
-- All sales where subscription status were Yes discount was applied. The sales where customers subscription status were No 624 sales recieved discount their AVG order value was 58.92 with reveue 36766 and the rest no discount was applied making 2223 sales and 133670 i revenue where their AVG order value was 60.13.
-- From the data we can see Subscription garantees discount. Also, non-subscribers get the best discounts when applied, their avg order value was 58.92 while subscribers avg order value is 59.49.

-- Reveal whether subscribers are purchasing more frequently?
SELECT
    `Subscription Status`,
    `Frequency of Purchases`,
    COUNT(*) AS Purchases,
    SUM(`Purchase Amount (USD)`) AS Revenue
FROM shopping_trends
GROUP BY `Subscription Status`, `Frequency of Purchases`
ORDER BY `Subscription Status`, Purchases DESC;
-- No, highest sales are from non-subscribers and also the most revenue are from non-subscribers.

-- 7. Analyze rating. Which products have high sales and high ratings
SELECT `Item Purchased`, COUNT(*) AS Purchases, ROUND(AVG(`Review Rating`), 2) AS Avg_Rating
FROM shopping_trends
GROUP BY `Item Purchased`
ORDER BY Avg_Rating 
DESC;
-- Based on high sales volume + high average rating, the top 3 are: Jewelry — 171 purchases, 3.76 rating,Sandals — 160 purchases, 3.84 rating,Hat — 154 purchases, 3.81 rating
SELECT `Item Purchased`, COUNT(*) AS Purchases, ROUND(AVG(`Review Rating`), 2) AS Avg_Rating
FROM shopping_trends
GROUP BY `Item Purchased`
ORDER BY Purchases DESC, Avg_Rating ASC;
-- Based on high sales + low ratings, the strongest examples from your data are:Shirt — 169 purchases, 3.63 rating, 'Jewelry', '171', '3.76', Blouse — 171 purchases, 3.68 rating, Pants — 171 purchases, 3.72 rating.
-- These products sell frequently but have relatively lower customer ratings, making them good candidates for product-quality or customer-satisfaction investigation.

SELECT `Item Purchased`, COUNT(*) AS Purchases, ROUND(AVG(`Review Rating`), 2) AS Avg_Rating
FROM shopping_trends
GROUP BY `Item Purchased`
ORDER BY Purchases ASC, Avg_Rating DESC;
-- Based on your data, low sales + high ratings would be products that have relatively fewer purchases but comparatively strong ratings: 'Jeans', '124', '3.65', 'Gloves', '140', '3.86', 'Backpack', '143', '3.75','Boots', '144', '3.81'
-- These  indicate products that customers like, but that aren't being purchased as frequently—potentially worth investigating for visibility, pricing, or marketing.

SELECT `Item Purchased`, COUNT(*) AS Purchases, ROUND(AVG(`Review Rating`), 2) AS Avg_Rating
FROM shopping_trends
GROUP BY `Item Purchased`
ORDER BY Purchases ASC, Avg_Rating ASC;
-- Based on THE data, the clearest low sales + low ratings products are: Jeans — 124 purchases, 3.65 rating, Shirt — 169 purchases, 3.63 rating, Blouse — 171 purchases, 3.68 rating
-- Business insight: These products may need attention through pricing, product quality, marketing, or customer feedback analysis.

SELECT Location, COUNT(*) AS Purchases, ROUND(AVG(`Review Rating`), 2) AS Avg_Rating
FROM shopping_trends
GROUP BY Location
ORDER BY Avg_Rating DESC;
-- Texas has the highest Avg ratig of 3.91 and number of purchases is 77 followed by Wisconsin 3.89 and number of purchases is 75 then Iowa 3.85 and number of purchases is 69. The lowest Rating was in West Viginia 3.58 but had higher purchases of 81.

SELECT Season, COUNT(*) AS Purchases, ROUND(AVG(`Review Rating`), 2) AS Avg_Rating
FROM shopping_trends
GROUP BY Season
ORDER BY Avg_Rating DESC;
-- In Spring we had the highest purchases 999 and highest avg rating of 3.79 and fall we got the second highest purchases 975 but lowest rating of 3.73
-- Season, Purchases, Avg_Rating: 'Spring', '999', '3.79','Winter', '971', '3.75','Summer', '955', '3.73','Fall', '975', '3.73'


-- 8. product performance matrix: Which product has strong overall performance?
SELECT `Item Purchased`, COUNT(*) AS Purchases, Sum(`Purchase Amount (USD)`) AS Revenue, AVG(`Purchase Amount (USD)`) AS Avg_order_value, ROUND(AVG(`Review Rating`), 2) AS Avg_Rating
FROM shopping_trends
GROUP BY `Item Purchased`
ORDER BY Purchases DESC, Revenue DESC, Avg_Rating DESC;
-- Dress — high units, very high revenue, good rating, and the highest average order value among these top sellers, Jewelry — highest units (tied) and strong revenue + rating, Pants — highest units (tied) and strong revenue, with a reasonable rating.
-- Using  data, high units + low revenue means products that sell many units but generate comparatively less total revenue: 'Sweater',164 PURCHASES, REVENUE(9462), Lower avg order value of 57.6951 and an avg rating of 3.77 followed by 'Jewelry',171 PURCHASES, REVENUE(10010), Lower avg order value of 58.5380 and an avg rating of 3.76 then 'Pants',171 PURCHASES, REVENUE(10090), Lower avg order value of 59.0058 and an avg rating of 3.72
-- Meaning Business insight: High unit volume with relatively low revenue can indicate lower-priced products. These products may generate strong traffic and sales volume but contribute less revenue per transaction.
-- From data, low units + high revenue means products that sell fewer units but generate relatively high total revenue.T-shirt — only 147 units but $9,248 revenue and the highest average order value among these, Boots — just 144 units but $9,018 revenue and a high $62.63 average order value, Shoes — 150 units and $9,240 revenue, with a $61.60 average order value.
-- Business insight: These products generate relatively strong revenue despite lower sales volume, suggesting that their higher price per purchase compensates for fewer units sold.
-- Based on data, low units + low rating identifies products with both relatively weak sales volume and weaker customer satisfaction. Clearest low-units + low-rating products, Hoodie — 151 units, 3.72 rating, Shorts — 157 units, 3.71 rating.
-- Business insight: These products have relatively low demand and lower customer ratings, so they may warrant investigation into product quality, pricing, marketing, or customer feedback.










