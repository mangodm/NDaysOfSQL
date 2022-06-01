SELECT
    MAX(salary * months),
    SUM(CASE WHEN salary * months = (SELECT MAX(salary * months) FROM Employee) THEN 1 ELSE 0 END)
FROM Employee;