Create DATABASE EcommerceCustomerAnalytics;

-- Check Row Counts After import
SELECT Count(*) as Rows_2009_2010 from dbo.[Year 2009-2010];
SELECT Count(*) as Rows_2010_2011 from dbo.[Year 2010-2011];

-- Combine Both years and Convert Types Safely
SELECT 
    Invoice,
    StockCode,
    Description,
    Quantity,
    COALESCE(
        TRY_CONVERT(DATETIME, InvoiceDate, 103), 
        TRY_CONVERT(DATETIME, InvoiceDate, 101)
    ) AS InvoiceDate,
    TRY_CAST(Price AS DECIMAL(10, 2)) AS Price,
    Customer_ID,
    Country
INTO Retail_Combined
FROM (
    SELECT * FROM dbo.[Year 2009-2010]
    UNION ALL
    SELECT * FROM dbo.[Year 2010-2011]
) AS combined;

-- Confirm the Conversion Worked Clearly
SELECT COUNT(*) AS Total_Rows FROM dbo.Retail_Combined;
SELECT COUNT(*) AS Failed_Dates FROM dbo.Retail_Combined WHERE InvoiceDate IS NULL;
SELECT COUNT(*) AS Failed_Prices FROM dbo.Retail_Combined WHERE Price IS NULL;

-- CHECK 1 - MISSING CUSTOMER ID
SELECT COUNT(*) AS Missing_CustomerID 
FROM dbo.Retail_Combined WHERE Customer_ID IS NULL;

-- CHECK 2 - NEGATIVE OR ZERO QUANTITY
SELECT COUNT(*) AS Negative_Qty 
FROM dbo.Retail_Combined WHERE Quantity <= 0;

-- CHECK 3 - MISSING DESCRIPTION
SELECT COUNT(*) AS Missing_Description
FROM dbo.Retail_Combined WHERE Description IS NULL;

-- CHECK 4 - EXACT DUPLICATE ROWS
SELECT Invoice, StockCode, Description, Quantity, InvoiceDate, Price, Customer_ID, Country,
       COUNT(*) AS ExactDupeCount
FROM dbo.Retail_Combined
GROUP BY Invoice, StockCode, Description, Quantity, InvoiceDate, Price, Customer_ID, Country
HAVING COUNT(*) > 1;

-- DEDUPLICATE AND PRODUCE THE FINAL CLEANED TABLE
WITH Deduplicated AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Invoice, StockCode, Description, Quantity, InvoiceDate, Price, Customer_ID, Country
               ORDER BY InvoiceDate
           ) AS rn
    FROM dbo.Retail_Combined
)
SELECT Invoice, StockCode, Description, Quantity, InvoiceDate, Price, Customer_ID, Country
INTO RetailCleaned
FROM Deduplicated
WHERE rn = 1;

select * from dbo.RetailCleaned;