 /*************************************************************************************
       *  Author     : Amish Trivedi
       *  Version    : 1.0
       *  Created    : 26-November-2021
       *  Description : Write a report to show all Employees for a Department.
       *  Tables :  tbl_departments, tbl_employees
       *  Change History
       *  Version        Date                Author             Change
       *  1.0         26-Nov-2021     Amish Trivedi    Initial version
       *************************************************************************************/ 
SELECT td.department_name,
            te.employee_name,
            te.job_title,
            '£' || te.salary AS salary,
            te.date_hired,
            td.location
FROM tbl_departments td,
         tbl_employees te
WHERE td.department_id = te.department_id
ORDER BY td.department_name, te.employee_name;

/* Note: We can also create a view of the above SQL query to retrieve the data. */