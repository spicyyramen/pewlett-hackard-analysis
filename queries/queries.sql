select * from departments;


-- determine retirement eligibility
select first_name, last_name
from employees
where birth_date between '1952-01-01' and '1955-12-31';


-- search for 1952 birthdates 
select first_name, last_name
from employees
where birth_date between '1952-01-01' and '1952-12-31';


-- search for 1953 birthdates 
select first_name, last_name
from employees
where birth_date between '1953-01-01' and '1953-12-31';

-- search for 1954 birthdates 
select first_name, last_name
from employees
where birth_date between '1954-01-01' and '1954-12-31';

-- search for 1955 birthdates 
select first_name, last_name
from employees
where birth_date between '1955-01-01' and '1955-12-31';


-- retirement eligibility
select first_name, last_name
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

-- number of employees retiring
select count(first_name)
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

-- retirement eligibility
select first_name, last_name
into retirement_info
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

select * from retirement_info;


-- employee count by department number
select count(ce.emp_no), de.dept_no
into dept_counts
from current_emp as ce
left join dept_emp de 
on ce.emp_no = de.emp_no 
group by de.dept_no
order by de.dept_no; 