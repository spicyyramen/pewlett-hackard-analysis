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

-- mentorship eligibility
select distinct on (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
de.from_date,
    de.to_date,
t.title
into mentorship_eligibility
from employees as e
inner join dept_emp as de
    on (e.emp_no = de.emp_no)
inner join titles as t
    on (de.emp_no = t.emp_no)
where de.to_date = ('9999-01-01')
and (birth_date between '1965-01-01' and '1965-12-31')
order by e.emp_no;


-- DELIVERABLE 3

----EXTRA TABLES 

--mentorship counts by title
select count(me.title), me.title
into mentor_titles
from mentorship_eligibility as me
group by me.title
order by count(me.title) desc;

-- num retiring vs eligible mentors by title
select rt.title as retiring_title,
	rt.count as retiring_count,
	mt.title as mentor_titles,
	mt.count as mentor_count
into retiring_vs_mentor
from retiring_titles rt 
left join mentor_titles mt 
	on (rt.title = mt.title)
order by rt.count desc;