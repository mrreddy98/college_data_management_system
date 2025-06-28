-- 1. Top 10 students by total score
SELECT TOP 10 *,
       (math_score + reading_score + writing_score) AS total_score
FROM StudentPerformance
ORDER BY total_score DESC;

-- 2. Average scores by gender and parental education
SELECT gender,
       parental_level_of_education,
       AVG(math_score) AS avg_math,
       AVG(reading_score) AS avg_reading,
       AVG(writing_score) AS avg_writing
FROM StudentPerformance
GROUP BY gender, parental_level_of_education;

-- 3. Performance distribution by lunch type
SELECT lunch,
       AVG(math_score) AS avg_math,
       AVG(reading_score) AS avg_reading,
       AVG(writing_score) AS avg_writing
FROM StudentPerformance
GROUP BY lunch;

-- 4. Students who failed any subject (assuming pass mark is 40)
SELECT *
FROM StudentPerformance
WHERE math_score < 40 OR reading_score < 40 OR writing_score < 40;

-- 5. Top scorers in math
SELECT TOP 5 *
FROM StudentPerformance
ORDER BY math_score DESC;

-- 6. Top scorers in reading
SELECT TOP 5 *
FROM StudentPerformance
ORDER BY reading_score DESC;

-- 7. Top scorers in writing
SELECT TOP 5 *
FROM StudentPerformance
ORDER BY writing_score DESC;

-- 8. Overall pass/fail status by gender (assuming pass in all subjects is required)
SELECT gender,
       COUNT(*) AS total_students,
       SUM(CASE WHEN math_score >= 40 AND reading_score >= 40 AND writing_score >= 40 THEN 1 ELSE 0 END) AS passed,
       SUM(CASE WHEN math_score < 40 OR reading_score < 40 OR writing_score < 40 THEN 1 ELSE 0 END) AS failed
FROM StudentPerformance
GROUP BY gender;

-- 9. Average scores by test preparation course
SELECT test_preparation_course,
       AVG(math_score) AS avg_math,
       AVG(reading_score) AS avg_reading,
       AVG(writing_score) AS avg_writing
FROM StudentPerformance
GROUP BY test_preparation_course;

-- 10. Count of students by parental level of education
SELECT parental_level_of_education,
       COUNT(*) AS student_count
FROM StudentPerformance
GROUP BY parental_level_of_education;
