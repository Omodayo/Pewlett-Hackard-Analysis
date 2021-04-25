-- EMPLOYEE_DATABASE_CHALLENGE.
-- DELIVERABLE 1
-- 1. Retrieve the emp_no, first_name, and last_name columns from the employee table.
select emp_no, first_name, last_name
from employees;

-- 2. Retrieve the title, from_date and to_date columns from the titles table.
select title, from_date, to_date
from title;

-- 3. Create a new table using the INTO clause.
-- 4. Join both tables on the primary key.
-- 5. Filter the data on the birth_date column to retrieve the employees who were 
-- born between 1952 and 1955. Then, order by the employee number.
-- 6-7. Export Retirement Titles tables ax retirement_titles.csv
select e.emp_no,
       e.first_name,
	   e.last_name,
	   t.title,
	   t.from_date,
	   t.to_date
into retirement_titles
from employees as e
   inner join title as t
       on(e.emp_no = t.emp_no)
where (e.birth_date between '1952-01-01' and '1955-12-31')
order by emp_no asc;

-- 8-14. Use Dictinct with Orderby to remove duplicate rows
-- Retrieve the employee number, first and last name, and title columns
-- from the Retirement Titles table.
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
       rt.first_name,
       rt.last_name,
	   rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.emp_no ASC;

-- 15. Retrieve the number of employees by their most recent job title who are about to retire.
select count(title)
from unique_titles;

-- 16-20. First, retrieve the number of titles from the Unique Titles table.
-- Then, create a Retiring Titles table to hold the required information.
-- Group the table by title, then sort the count column in descending order.
-- Export the Retiring Titles table.
select count(title), title
into retiring_titles
from unique_titles as ut
group by ut.title
order by count desc;


-- DELIVERABLE 2
-- Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
select emp_no,
       first_name,
	   last_name,
	   birth_date
from employees;

-- Retrieve the from_date and to_date columns from the Department Employee table.
select from_date,
       to_date
from dept_employee;

-- Retrieve the title column from the Titles table.
select title
from title;

-- Use a DISTINCT ON statement to retrieve the first occurrence of the employee number		
-- Create a new table using the INTO clause
-- Join all tables on primary keys.
-- Filter data on to_date column to gte current employees
-- whose birth dates are between Jan 1, 1965 and Dec 31, 1965.
-- Order table by the employee number.
select distinct on (e.emp_no) e.emp_no,
       e.first_name,
	   e.last_name,
	   e.birth_date,
	   de.from_date,
       de.to_date,
	   t.title
into mentorship_eligibility
from employees as e
    inner join dept_employee as de
	    on (e.emp_no = de.emp_no)
	inner join title as t
	    on (e.emp_no = t.emp_no)
where de.to_date = ('9999-01-01')
and (e.birth_date between '1965-01-01' and '1965-12-31')
order by e.emp_no, e.emp_no;

select * from mentorship_eligibility;