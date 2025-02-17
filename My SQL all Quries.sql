# KPI 1
SELECT 
    `Account Executive` AS account_executive, 
    COUNT(invoice_number) AS total_invoices
FROM 
    invoice
GROUP BY 
    `Account Executive`
ORDER BY 
    total_invoices DESC;


# KPI 2 Yearly Meeting Count
SELECT YEAR(meeting_date) as Meeting_Year, COUNT(*) as Meeting_Count, 
(Select count(*) from meeting) as Total_count
FROM meeting
GROUP BY meeting_year;

# KPI 4
/*STAGE FUNNEL BY REVENUE */

select * from stage_funnel_by_revenue;

CREATE VIEW stage_funnel_by_revenue AS
SELECT 
    stage,
    SUM(revenue_amount) AS total_revenue,
    COUNT(*) AS total_opportunities
FROM 
    opportunity
GROUP BY 
    stage;
    
    
# KPI 5 Number of meetings by account Executives	
SELECT 
    Account_Executive, 
    COUNT(*) AS Meeting_Count 
FROM 
    Meeting 
GROUP BY 
    Account_Executive 
ORDER BY 
    Meeting_Count DESC;
    
   
# KPI 6 - *OPPORTUNITY BY REVENUE TOP-4*/ 

select * from opportunities_by_revenue_top_4;

CREATE VIEW opportunities_by_revenue_top_4 AS
SELECT opportunity_name,revenue_amount
FROM opportunity
ORDER BY revenue_amount DESC
LIMIT 4;
/*OPEN OPPORTUNITY TOP -4 */

select * from open_opportunities_top_4;

CREATE VIEW open_opportunities_top_4 AS
SELECT 
    opportunity_name,
    revenue_amount,
    CASE 
        WHEN stage = 'Negotiate' THEN 'Closed'
        ELSE 'Open'
    END AS status
FROM 
    opportunity
WHERE 
    stage != 'Closed'
ORDER BY 
    revenue_amount DESC
LIMIT 4;



/*OPPORTUNITY PRODUCT DISTRIBUTION */

select * from opportunity_product_distribution;

CREATE VIEW opportunity_product_distribution AS
SELECT product_group, COUNT(DISTINCT opportunity_name) AS total_opportunities
FROM opportunity
GROUP BY product_group;
    
