------------------------------------------------------------------------------------------------
--SELECTS SIMPLES
------------------------------------------------------------------------------------------------
/* 1
Describir la tabla employees
*/
select *
from department;
desc employees;
/* 2
Describir la tabla departments
*/
select *
from department;
desc departments;

/* 3
Describir la tabla locations
*/
select *
from locations;
desc locations;

/* 4
Datos de la tabla regions
*/
select *
from regions;
/* 5
Datos de la tabla countries
*/
select *
from countries;
/* 6
Ciudad y estado de las localidades
*/
select city,state_province
from locations;
desc locations;
/* 7
Nombre, apellido, salario de los empleados
*/
select
    first_name,
    last_name,
    salary;

/* 8
Número de departamento, nombre, y manager_id de los departamentos
*/
Select 
    department_id, 
    department_name,
    manager_id
From departments
;

/* 9
Número y nombre de departamento, además, el código del empleado jefe,
de la localidad 1700.
*/
select 
    department_name,
    department_id,
    manager_id,
    locations
from departments
Where locations = 1700
;

/* 10
Nombre y número de departamento de los empleados.
*/
select 
    first_name, 
    last_name,
    department_id, 
from employees
;


/* 11
Nombre y número de departamento de los empleados
ordenados por número de departamento ascendentemente.
*/

select first_name, last_name,department_id
from employees
order by department_id asc
;


/* 12
Listar los distintos números de departamento en el que trabajan los empleados.
*/

select DISTINCT department_ID
from departments
;


/* 13
Listar los distintos números de departamento en el que trabajan los empleados
ordenados descendentemente.
*/
select DISTINCT department_ID
from departments
order by
department_ID desc;

select DISTINCT department_ID
from departments
order by department_id desc
;


/* 14
Nombre, apellido y salario ordenados por id de empleado descendentemente
*/

select first_name, last_name,salary
from employees
order by department_id desc
;

/* 15
Nombre, apellido y salario ordenado por apellido ascendentemente y salario descendentemente
*/
select first_name, last_name,salary
from employees
order by 
last_name asc and
department_id desc
;


/* 16
códigos de los distintos trabajos que existen en el departamento 30
*/
select distinct department_id
from employees
department_id=30
;


/* 17
códigos de los distintos trabajos que existen en el departamento 60
ordenados descendentemente
*/
select distinct
    job_id

from employees

where department_id = 60

order by
    job_id desc;





/* 18
Nombre, apellido y correo de los empleados del departamento 30
cuyo salario es menor a 3000
*/
select 
    first_name, last_name, email
    
from employees

where
    department_id in (30) and
    salary <= 3000;



/* 19
Nombre, apellido y correo de los empleados del departamento 30
cuyo salario es menor a 3000
o que sean del departamento 90
*/
select 
    first_name, last_name, email
    
from employees

where
    department_id in (30) and
    salary <= 3000 or
    department_id in(90);


/* 20
nombre, apellido y número de departamento de los empleados
que no tengan comisión. Ordenados por número de departamento 
del mayor a menor y por apellido descendentemente.
*/
select
    first_name,
    last_name,
    department_id

from employees

where 
    commission_pct is null

order by
    department_id desc, 
    last_name desc;


/* 21
nombre, apellido, número de departamento y salario de los empleados
que no tengan comisión o su salario sea menor a 6000 
y que se cumpla que son del departamento 60 o del 90
ordenados por número de departamento descendentemente
y por salario ascendentemente.
*/
select
    first_name,
    last_name,
    department_id,
    salary

from employees

where 
    commission_pct is null or 
    salary <= 6000 and
    department_id = 60 or
    department_id = 90

order by
    department_id desc, 
    salary asc;



/* 22
Número de empleado, nombre y apellido de los empleados
desde el apellido que empieza por L hasta los que su apellido
empieza por la R, incluidos.
*/




/* 23
Lista de apellidos que su segunda letra sea una 'a'
*/




/* 24
Lista de apellidos de empleados donde el apellido empieza por alguna vocal
y que su salario es menor a 3000 o mayor a 9000
y debe cumplirse que su departamento es el 30, 60 o 90.
*/
select last_name
from employees
where (last_name like 'A%' OR last_name 
like 'E%' OR last_name like 'I%'
 OR last_name like 'O%'  OR last_name like 'U%') and 
 salary between 3000 and 9000 AND
 department_id in(30,60,90);
/* 25
Nombre, apellido y el salario de los empleados
pero como salario una etiqueta que indique 
'BAJO' si es menor a 4280, 'ALTO' si es mayor a 15230
y 'MEDIO' si está entre medias
*/
select first_name, last_name,
    case
        when salary > 15230 then 'ALTO'
        when salary between 4280 and 15230 then 'MEDIO'
        else
            'BAJO'
    end salary
from employees;
/* 26
Listar los correos concatenados con el texto '@company.com'
*/
select 
    email ||'@company.com' EMAIL
 
from EMPLOYEES
/* 27
Lista de nombres de las ciudades que su país es 'US'
*/
select city
from LOCATIONS
where
    country_id = 'US'
/* 28
Lista de nombre de las ciudades que su país no es Estados Unidos
*/
select city
from LOCATIONS
where
    not country_id = 'US'
/* 29
Número y nombre de los departamentos que tienen un jefe.
*/
select 
    department_id, department_name, manager_id

from departments
where
     manager_id is not null;
/* 30
Número y nombre de los departamentos que no tienen jefe.
*/
select 
    department_id, department_name

from departments
where
    manager_id is null;
/* 31
Nombre de las columnas de la tabla de empleados 'Employees'
que no tienen un guión bajo en el nombre.
*/
SELECT table_name, column_name

from user_tab_columns
where
    table_name = 'EMPLOYEES' and
    column_name  not like '%@_%' escape '@'
--
------------------------------------------------------------------------------------------------
