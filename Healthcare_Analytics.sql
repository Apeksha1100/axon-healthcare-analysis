USE work;

-- 1. Total Patients
SELECT COUNT(`patient id`) AS total_patients
FROM patient;


-- 2. Total Doctors
SELECT COUNT(`doctor id`) AS total_doctors
FROM doctor;


-- 3. Total Lab Tests
SELECT COUNT(`lab result id`) AS total_lab_tests
FROM `lab test`;


-- 4. Average Age of Patients
SELECT ROUND(AVG(age), 2) AS avg_age
FROM patient;


-- 5. Gender Wise Patient Count
SELECT gender, COUNT(*) AS total_patients
FROM patient
GROUP BY gender;


-- 6. Abnormal Lab Results Percentage
SELECT CONCAT(
       ROUND(
           COUNT(*) / (SELECT COUNT(*) FROM `lab test`) * 100,
           2
       ),
       '%'
) AS abnormal_percentage
FROM `lab test`
WHERE `test result` = 'Abnormal';


-- 7. Normal Lab Results Count
SELECT COUNT(*) AS normal_results
FROM `lab test`
WHERE `test result` = 'Normal';


-- 8. Patients Above Average Age
SELECT *
FROM patient
WHERE age > (SELECT AVG(age) FROM patient);

-- 10. Total Male and Female Patients
SELECT gender, COUNT(*) AS total
FROM patient
GROUP BY gender;
