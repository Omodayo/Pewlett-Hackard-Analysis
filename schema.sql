-- Creating tables for PH-EmployeeDB
create table departments(
	dept_no varchar(4) not null,
	dept_name varchar(40) not null,
	primary key (dept_no),
	unique (dept_name)
);

create table employees(
	emp_no int not null,
	birth_date date not null,
	first_name varchar not null,
	last_name varchar not null,
	gender varchar not null,
	hire_date date not null,
	primary key (emp_no)
);

create table dept_manager (
	dept_no varchar(4) not null,
	emp_no int not null,
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no)
);

create table salaries (
	emp_no int not null,
	salary int not null,
	from_date date not null,
	to_date date not null,
foreign key (emp_no) references employees (emp_no),
	primary key (emp_no),
);


create table title (
	emp_no int not null,
	title varchar not null,
	from_date date not null,
	to_date date not null,
foreign key (emp_no) references employees (emp_no),
	primary key (emp_no, title, from_date)
);

create table dept_employee (
	emp_no int not null,
	dept_no varchar(4) not null,
	from_date date not null,
	to_date date not null,
foreign key (emp_no) references employees (emp_no),
foreign key (dept_no) references departments (dept_no),
	primary key (emp_no, dept_no)
);

select * from departments;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from title;
select * from dept_employee;
