 /*************************************************************************************
       *  Author     : Amish Trivedi
       *  Version    : 1.0
       *  Created    : 25-November-2021
       *  Description : Create the necessary data structures to contain the data specified in the Appendix ensuring that data integrity is enforced.
       *  Tables :  tbl_departments, tbl_employees
       *  Change History
       *  Version        Date                Author             Change
       *  1.0         25-Nov-2021     Amish Trivedi    Initial version
       *************************************************************************************/ 
       
-- Creating tbl_departments from the data specified in the Appendix
CREATE TABLE tbl_departments
( Department_Id NUMBER(5) NOT NULL,
  Department_Name VARCHAR2(50) NOT NULL,
  Location VARCHAR2(50) NOT NULL,
  CONSTRAINT departments_pk PRIMARY KEY (Department_Id)
);

SELECT *
FROM tbl_departments;

-- Creating tbl_employees from the data specified in the Appendix
CREATE TABLE tbl_employees
( Employee_Id NUMBER(10) NOT NULL,
  Employee_Name VARCHAR2(50) NOT NULL,
  Job_Title VARCHAR2(50) NOT NULL,
  Manager_Id NUMBER(10),
  Date_Hired DATE NOT NULL,
  Salary NUMBER(10) NOT NULL,
  Department_Id NUMBER(5) NOT NULL,
  CONSTRAINT employees_pk PRIMARY KEY (Employee_Id),
  CONSTRAINT fk_departments
    FOREIGN KEY (Department_Id)
    REFERENCES tbl_departments(Department_Id)
);

SELECT *
FROM tbl_employees;