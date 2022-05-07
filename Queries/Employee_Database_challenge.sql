--CHALLENGE

SELECT emp_no, birth_date, first_name, last_name
INTO emp1
FROM employees;

SELECT emp_no, title, from_date, to_date
INTO titles1
FROM titles;

SELECT emp1.emp_no,
	emp1.first_name,
	emp1.last_name,
	titles1.title,
	titles1.from_date,
	titles1.to_date
INTO retirement_titles
FROM emp1
INNER JOIN titles1
ON titles1.emp_no = emp1.emp_no
WHERE emp1.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp1.emp_no;

SELECT DISTINCT ON (emp_no)emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE to_date ='9999-01-01'
ORDER BY emp_no, to_date DESC
	
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

--Deliverable 2

SELECT DISTINCT ON (emp_no)employees.emp_no,
                    employees.first_name,
					employees.last_name,
					employees.birth_date,
					dept_emp.from_date,
					dept_emp.to_date,
					titles.title
INTO mentorship_eligibilty
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN titles ON titles.emp_no = employees.emp_no
WHERE (dept_emp.to_date ='9999-01-01') AND (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY employees.emp_no;