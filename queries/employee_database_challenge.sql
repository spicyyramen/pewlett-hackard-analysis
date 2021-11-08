-- DELIVERABLE 1

-- retirement titles 
select e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
into retirement_titles
from employees e
inner join titles t 
	on (e.emp_no = t.emp_no)
where (e.birth_date between '1952-01-01' and '1955-12-31')
order by e.emp_no;

-- unique titles table	
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- retiring titles
select count(ut.title), ut.title
into retiring_titles
from unique_titles as ut
group by ut.title 
order by count(ut.title) desc;

-- DELIVERABLE 2 

select distinct on (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
de.from_date,
    de.to_date,
t.title
--into table
from employees as e
inner join dept_emp as de
    on (e.emp_no = de.emp_no)
inner join titles as t
    on (de.emp_no = t.emp_no)
where de.to_date = ('9999-01-01')
and (birth_date between '1965-01-01' and '1965-12-31')
order by e.emp_no;
