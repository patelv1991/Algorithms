# In a SQL db, you have two tables, an employees table and a departments table.
# Employees belong to only one department. Write a SQL query that, given a
# department name, finds all the employees in that department.

SELECT
  employees.name
FROM
  employees
JOIN
  departments ON employees.dept_id = departments.id
WHERE
  departments.name = ?
  
