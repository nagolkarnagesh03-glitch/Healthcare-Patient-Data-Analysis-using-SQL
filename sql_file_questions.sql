CREATE DATABASE hospital;
USE hospital;

-- Display all patient records. 
SELECT * FROM patients;


ALTER TABLE patients
RENAME COLUMN `Billing Amount` TO billing_amount ;

ALTER TABLE patients
RENAME COLUMN `Admission Type` TO admission_type ;
 
ALTER TABLE patients
RENAME COLUMN `Blood Type`  To blood_type;

ALTER TABLE patients
RENAME COLUMN `Medical Condition` To medical_condition ;

ALTER TABLE patients
RENAME COLUMN `Date of Admission` To date_of_admission ;

ALTER TABLE patients
RENAME COLUMN `Insurance Provider` To insurancr_provider ;

ALTER TABLE patients
RENAME COLUMN `Room Number` To room_number ;

ALTER TABLE patients
RENAME COLUMN `Discharge Date` To discharge_date ;

ALTER TABLE patients
RENAME COLUMN `Test Results` To test_results ;



-- Show only patient Name, Age and Gender.
SELECT name , age , gender
FROM patients;


-- Find patients older than 60.
SELECT * 
FROM patients
WHERE age > 60 ;


-- Find female patients.
SELECT *
FROM patients
WHERE gender = "Female" ;



-- Show patients admitted in Emergency.
SELECT * 
FROM patients
WHERE admission_type = "Emergency" ;



-- Sort patients by Age (Highest to Lowest)
SELECT *
FROM patients
ORDER BY age DESC ;



-- Total number of patients
SELECT COUNT(*) as total_customers
FROM patients;




-- Average patient age
SELECT AVG(age) as avg_age
FROM  patients ;



-- Maximum Billing Amount
SELECT MAX(billing_amount) as max_amount
FROM  patients ;



-- Minimum Billing Amount 
SELECT MIN(billing_amount) as min_amount
FROM patients ;


-- Total hospital billing
SELECT SUM(billing_amount) as total_bill
FROM patients ;


-- Number of patients by Gender
SELECT gender ,COUNT(*) AS total_patients
FROM patients
GROUP BY gender ;



--  Average age by Gender
SELECT  gender , AVG(age) as avg_age
FROM patients
GROUP BY gender ;




-- Number of patients for each Medical Condition
SELECT medical_condition , COUNT(*) as total
FROM patients
GROUP BY medical_condition 
ORDER BY total DESC ;


-- Average billing by Insurance Provider
SELECT insurancr_provider , AVG(billing_amount) as avg_bill_amt
FROM patients
GROUP BY insurancr_provider ;


--  Medical conditions having more than 5000 patients.
SELECT medical_condition , COUNT(*)  AS total
FROM patients
GROUP BY medical_condition
HAVING COUNT(*) > 5000 ;



-- Doctors treating more than 15 patients.
SELECT doctor , COUNT(*) as total
FROM patients
GROUP BY doctor
HAVING COUNT(*) > 15 ;


-- age category
SELECT name , age ,
      CASE
          WHEN age < 18 THEN "Child"
          WHEN age BETWEEN 18 AND 40 THEN "Young Adult"
          WHEN age BETWEEN 40 AND 60 THEN "Adult"
          ELSE "senior"
          END as age_group
FROM patients ;



-- Billing Category
SELECT name , billing_amount ,
CASE
      WHEN billing_amount < 10000 THEN "Low"
      WHEN billing_amount BETWEEN 10000 AND 40000 THEN "Medium"
      ELSE "High" 
	  END as billing_category
FROM patients ;


-- Number of admissions per year
SELECT YEAR(date_of_admission) as admission_year , COUNT(*) as total
FROM patients
GROUP BY YEAR(date_of_admission) ;


-- Admissions per month
SELECT MONTH(date_of_admission) as admission_per_month , COUNT(*) as total
FROM patients
GROUP BY MONTH(date_of_admission) 
ORDER BY admission_per_month  ;



-- Which doctor handled the most patients?
SELECT Doctor , COUNT(*) as total_patients
FROM patients
GROUP BY Doctor 
ORDER BY  total_patients DESC 
LIMIT 1 ;



-- Which hospital earned the highest billing?
SELECT hospital , SUM(billing_amount)  as bill
FROM patients
GROUP BY hospital 
ORDER BY bill DESC
LIMIT 1 ;


-- Which insurance provider covered the highest total amount?
SELECT insurancr_provider , SUM(billing_amount) as bill
FROM patients
GROUP BY insurancr_provider
ORDER BY bill DESC 
LIMIT 1 ;



-- Which medical condition generated the highest revenue?
SELECT medical_condition , SUM(billing_amount) as bill
FROM patients
GROUP BY medical_condition
ORDER BY bill DESC ;



-- Average billing by admission type.
SELECT admission_type , AVG(billing_amount) as bill
FROM patients
GROUP BY admission_type 
ORDER BY bill DESC ;



-- Top 5 highest billed patients.
SELECT name , SUM(billing_amount) as bill
FROM patients
GROUP BY name 
ORDER BY bill DESC ;



-- Most common blood type.
SELECT blood_type ,COUNT(*) as total
FROM patients 
GROUP BY blood_type 
ORDER BY total DESC 
LIMIT 1 ;



-- Number of abnormal test results.
SELECT test_results ,COUNT(*) as test
FROM patients
GROUP BY test_results ;




-- Which doctor generated the highest billing?
SELECT doctor , SUM(billing_amount)  as bill
FROM patients
GROUP BY doctor 
ORDER BY bill DESC 
LIMIT 1 ;





   






















 






















