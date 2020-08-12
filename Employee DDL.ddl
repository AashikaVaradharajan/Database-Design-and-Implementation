
CREATE TYPE DateDom14
	FROM DATE NULL
go

CREATE TYPE MoneyDom14
	FROM MONEY NULL
go

CREATE TABLE Employee
( 
	EmployeeIDNumber     char(5)  NOT NULL ,
	LastName             char(5)  NULL ,
	FirstName            char(5)  NULL ,
	MiddleInitial        char(1)  NULL ,
	Street               char(20)  NULL ,
	City                 char(10)  NULL ,
	State                char(2)  NULL ,
	PostalCode           char(5)  NULL ,
	Sex                  char(1)  NULL ,
	DateOfBirth          DateDom14 ,
	PRIMARY KEY  CLUSTERED (EmployeeIDNumber ASC)
)
go

CREATE TABLE Job
( 
	JobCode              char(4)  NOT NULL ,
	JobTitle             char(20)  NULL ,
	MinimumSalary        MoneyDom14 ,
	MaximumSalary        MoneyDom14 ,
	PRIMARY KEY  CLUSTERED (JobCode ASC)
)
go

CREATE TABLE Department
( 
	DeptCode             char(4)  NOT NULL ,
	DepartmentName       char(20)  NULL ,
	Budget               MoneyDom14 ,
	PRIMARY KEY  CLUSTERED (DeptCode ASC)
)
go

CREATE TABLE JobHistory
( 
	EmployeeIDNumber     char(5)  NOT NULL ,
	JobCode              char(4)  NOT NULL ,
	StartDateOfJob       DateDom14 ,
	EndDateOfJob         DateDom14 ,
	DepartmentCode       char(4)  NOT NULL ,
	PRIMARY KEY  CLUSTERED (EmployeeIDNumber ASC,JobCode ASC),
	 FOREIGN KEY (EmployeeIDNumber) REFERENCES Employee(EmployeeIDNumber),
	 FOREIGN KEY (JobCode) REFERENCES Job(JobCode),
	 FOREIGN KEY (DepartmentCode) REFERENCES Department(DeptCode)
)
go

CREATE TABLE WorkStatus
( 
	StatusCode           char(1)  NOT NULL ,
	StatusDescription    char(20)  NULL ,
	PRIMARY KEY  CLUSTERED (StatusCode ASC)
)
go

CREATE TABLE SalaryHistory
( 
	EmployeeIDNumber     char(5)  NOT NULL ,
	JobCode              char(4)  NOT NULL ,
	StartDateOfSalary    DateDom14  NOT NULL ,
	SalaryAmount         MoneyDom14 ,
	EndDateOfSalary      DateDom14 ,
	StatusCode           char(1)  NOT NULL ,
	PRIMARY KEY  CLUSTERED (EmployeeIDNumber ASC,JobCode ASC,StartDateOfSalary ASC),
	 FOREIGN KEY (EmployeeIDNumber,JobCode) REFERENCES JobHistory(EmployeeIDNumber,JobCode),
	 FOREIGN KEY (StatusCode) REFERENCES WorkStatus(StatusCode)
)
go
