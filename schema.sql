-- Creating tables for PH-EmployeeDB

-- departments
create table departments(
	dept_no varchar(4) not null,
	dept_name varchar(40) not null,
	primary key (dept_no),
	unique (dept_name)
);

-- employees
create table employees(
	emp_no int not null,
	birth_date date not null,
	first_name varchar not null,
	last_name varchar not null,
	gender varchar not null,
	hire_date date not null,
	primary key (emp_no)
);

-- managers
CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

-- salaries
create table salaries (
	emp_no int not null,
	salary int not null,
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employees (emp_no),
	primary KEY (emp_no)
);

-- dept_employees
create table dept_emp(
	emp_no int not null,
	dept_no varchar(4) not null,
	from_date date not null,
	to_date date not null,
foreign key (emp_no) references employees (emp_no),
foreign key (dept_no) references departments (dept_no),
primary key(emp_no, dept_no)
);

-- titles
create table titles(
	emp_no int not null,
	title varchar not null,
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employees (emp_no),
	primary key (emp_no)
);


select * from departments;