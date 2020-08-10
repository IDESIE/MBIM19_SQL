------------------------------------------------------------------------------------------------
--SELECTS SIMPLES
------------------------------------------------------------------------------------------------
/* 1
Describir la tabla employees
*/
DESC employees;

/* 2
Describir la tabla departments
*/
DESC departments;

/* 3
Describir la tabla locations
*/
DESC locations;

/* 4
Datos de la tabla regions
*/
SELECT *
FROM REGIONS;

/* 5
Datos de la tabla countries
*/
SELECT *
FROM countries;


/* 6
Ciudad y estado de las localidades
*/
SELECT city,state_province
FROM locations; 

/* 7
Nombre, apellido, salario de los empleados
*/
SELECT FIRST_NAME, LAST_NAME,SALARY
FROM EMPLOYEES;
/* 8
Número de departamento, nombre, y manager_id de los departamentos
*/
SELECT department_id, department_name,manager_id
FROM DEPARTMENTS;

/* 9
Número y nombre de departamento, además, el código del empleado jefe,
de la localidad 1700.
*/
SELECT 
department_id||' '||department_name,
location_id,
manager_id
FROM DEPARTMENTS
where
location_id = 1700 ;

/* 10
Nombre y número de departamento de los empleados.
*/
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES;


/* 11
Nombre y número de departamento de los empleados
ordenados por número de departamento ascendentemente.
*/
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
ORDER BY
DEPARTMENT_ID ASC; 

/* 12
Listar los distintos números de departamento en el que trabajan los empleados.
*/
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES;

/* 13
Listar los distintos números de departamento en el que trabajan los empleados
ordenados descendentemente.
*/
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES
ORDER BY 
DEPARTMENT_ID DESC;


/* 14
Nombre, apellido y salario ordenados por id de empleado descendentemente
*/
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
ORDER BY 
DEPARTMENT_ID DESC;

/* 15
Nombre, apellido y salario ordenado por apellido ascendentemente y salario descendentemente
*/
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
ORDER BY 
LAST_NAME ASC,
SALARY DESC;


/* 16
códigos de los distintos trabajos que existen en el departamento 30
*/
select distinct
job_id
from employees
where
department_id=30;

/* 17
códigos de los distintos trabajos que existen en el departamento 60
ordenados descendentemente
*/
select distinct
job_id
from employees
where
department_id=60
order by
job_id desc;

/* 18
Nombre, apellido y correo de los empleados del departamento 30
cuyo salario es menor a 3000
*/
select distinct
first_name,
last_name,
email
from employees
where
department_id=30 and
salary<3000;

/* 19
Nombre, apellido y correo de los empleados del departamento 30
cuyo salario es menor a 3000
o que sean del departamento 90
*/
select distinct
first_name,
last_name,
email
from employees
where
department_id=30 and
salary<=3000 or
department_id=90;
/* 20
nombre, apellido y número de departamento de los empleados
que no tengan comisión. Ordenados por número de departamento 
del mayor a menor y por apellido descendentemente.
*/
SELECT first_name, last_name, department_id
FROM employees
WHERE commission_pct is null
ORDER BY department_id desc, last_name desc;

/* 21
nombre, apellido, número de departamento y salario de los empleados
que no tengan comisión o su salario sea menor a 6000 
y que se cumpla que son del departamento 60 o del 90
ordenados por número de departamento descendentemente
y por salario ascendentemente.
*/
SELECT first_name, last_name, department_id, salary
FROM employees
WHERE (salary < 6000 OR commission_pct is null) AND department_id in (60,90)
ORDER BY department_id desc, salary asc;

/* 22
Número de empleado, nombre y apellido de los empleados
desde el apellido que empieza por L hasta los que su apellido
empieza por la R, incluidos.
*/
SELECT employee_id, first_name||' '||last_name "NOMBRE Y APELLIDO"
FROM employees
WHERE last_name BETWEEN 'L' AND 'R';

/* 23
Lista de apellidos que su segunda letra sea una 'a'
*/
SELECT last_name
FROM employees
WHERE last_name like '_a%'; 

/* 24
Lista de apellidos de empleados donde el apellido empieza por alguna vocal
y que su salario es menor a 3000 o mayor a 9000
y debe cumplirse que su departamento es el 30, 60 o 90.
*/
SELECT last_name
FROM employees
WHERE (last_name LIKE 'A%' OR last_name LIKE 'E%' OR last_name LIKE 'I%' OR last_name LIKE 'O%' OR last_name LIKE 'U%') 
AND (salary <3000 OR SALARY >9000) 
AND department_id in (30,60,90);

/* 25
Nombre, apellido y el salario de los empleados
pero como salario una etiqueta que indique 
'BAJO' si es menor a 4280, 'ALTO' si es mayor a 15230
y 'MEDIO' si está entre medias
*/
select 
first_name,
last_name,
salary,
case
when salary>15230 then 'alto'
when salary between 4280 and 15230 then 'medio'
else 'bajo'
end salarytype
from employees;

/* 26
Listar los correos concatenados con el texto '@company.com'
*/
SELECT lower(email)||'@company.com' "email"
FROM employees;

/* 27
Lista de nombres de las ciudades que su país es 'US'
*/
SELECT city
FROM locations
WHERE country_id = 'US';

/* 28
Lista de nombre de las ciudades que su país no es Estados Unidos
*/
SELECT city
FROM locations
WHERE country_id != 'US';

/* 29
Número y nombre de los departamentos que tienen un jefe.
*/
select distinct
department_name,
department_id,
manager_id
from departments
where
manager_id is not null;

/* 30
Número y nombre de los departamentos que no tienen jefe.
*/
select distinct
department_name,
department_id,
manager_id
from departments
where
manager_id is null;

/* 31
Nombre de las columnas de la tabla de empleados 'Employees'
que no tienen un guión bajo en el nombre.
*/
SELECT COLUMN_NAME
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'EMPLOYEES' AND COLUMN_NAME NOT LIKE '%@_%' escape '@';
--
------------------------------------------------------------------------------------------------
