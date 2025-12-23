-- INSERT DATA into the Silver Layer 
INSERT INTO silver.crm_cust_info (
	cst_id ,
	cst_key,
	cst_firstname, 
	cst_lastname,
	cst_martial_status,
	cst_gndr,
	cst_create_date
)

SELECT
cst_id, 
cst_key, 
TRIM(cst_firstname) AS cst_firstname ,
TRIM(cst_lastname) AS cst_lastname,
CASE WHEN UPPER(TRIM(cst_martial_status)) = 'M' THEN 'Married'
	 WHEN UPPER(TRIM(cst_martial_status)) = 'S' THEN 'Single'
	 ELSE 'n/a'
END cst_martial_status ,
CASE WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
	 WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
	 ELSE 'n/a'
END cst_gndr,
cst_create_date
FROM (
	SELECT * , ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) as flag_last
	FROM bronze.crm_cust_info
) t
WHERE flag_last = 1 AND cst_id IS NOT NULL ;

-- check records 
SELECT * FROM silver.crm_cust_info;

-- Quality check for silver 
SELECT cst_id , COUNT(*) 
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 AND cst_id IS NULL;

-- INSERT bronze.crm_prd_info Data INTO silver layer
INSERT INTO silver.crm_prd_info (
	prd_id,
	cat_id,
	prd_key,
	prd_nm,
	prd_cost,
	prd_line,
	prd_start_dt,
	prd_end_dt
)
SELECT 
	prd_id,
	REPLACE(SUBSTRING(prd_key, 1, 5), '-' , '_') AS cat_id ,
	SUBSTRING(prd_key, 7, LEN(prd_key)) AS prd_key,
	prd_nm,
	ISNULL(prd_cost , 0) AS prd_cost,
	CASE UPPER(TRIM(prd_line))
		 WHEN 'M' THEN 'Mountain'
		 WHEN 'R' THEN 'Road'
		 WHEN 'S' THEN 'Other Sales'
		 WHEN 'T' THEN 'Touring'
		 ELSE 'n/a'
	END prd_line,
	prd_start_dt,
	DATEADD(DAY, -1 , LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt)) AS prd_end_dt
FROM bronze.crm_prd_info

-- check records and quality check 
SELECT * FROM silver.crm_prd_info ;
SELECT * FROM silver.crm_prd_info WHERE prd_cost < 0 ;
SELECT * FROM silver.crm_prd_info WHERE prd_end_dt < prd_start_dt ;


