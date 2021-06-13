
SELECT e.emp_no, e.first_name, e.last_name, tt.title, tt.from_date, tt.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as tt
ON(e.emp_no = tt.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, tt.title, tt.from_date, tt.to_date
INTO unique_titles
FROM employees as e
INNER JOIN titles as tt
ON(e.emp_no = tt.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, tt.to_date DESC;

SELECT COUNT (ut.emp_no), ut.title 
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;


SELECT  DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, tt.title
INTO mentorship eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON(e.emp_no = de.emp_no)
INNER JOIN titles as tt
ON(e.emp_no = tt.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;