 /*************************************************************************************
       *  Author     : Amish Trivedi
       *  Version    : 1.0
       *  Created    : 26-November-2021
       *  Description : Write a report to show the total of Employee Salary for a Department.
       *  Tables :  tbl_departments, tbl_employees
       *  Change History
       *  Version        Date                Author             Change
       *  1.0         26-Nov-2021     Amish Trivedi    Initial version
       *************************************************************************************/ 
SELECT td.department_name,
             '£' || SUM(te.salary) AS Total_Salary
FROM tbl_departments td,
         tbl_employees te
WHERE td.department_id = te.department_id
GROUP BY  td.department_name
ORDER BY td.department_name;

/* Note: We can also create a view of the above SQL query to retrieve the data. */