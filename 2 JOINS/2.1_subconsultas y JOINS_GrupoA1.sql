------------------------------------------------------------------------------------------------
-- SELECT con subconsultas y JOINS
------------------------------------------------------------------------------------------------
-- 1
-- Nombre y apellido del empleado que más gana.
Select last_name, first_name
From employees
Where salary = (select
			Max(salary)
			From employees);

-- 2
-- Nombre, apellido y salario de los empleados que ganan más que la media de salarios.
Select
first_name,
last_name,
	salary
From employees
where salary>=(select
Avg(salary)
from employees);

-- 3
-- Nombre y apellido del jefe del departamento de Marketing
select 
first_name,
last_name,
manager_id

from employees
where employee_id = (SELECT manager_id
FROM departments
WHERE department_name = 'Marketing');
-- 4
-- Nombre y apellido  de los empleados del departamento de Marketing
select 
    first_name,
    last_name
from
    employees
    join departments
        on employees.department_id = departments.department_id
where  departments.department_name = 'Marketing';

-- 5
-- Nombre, apellido, salario, nombre del departamento y ciudad
-- del empleado que gana más y el que menos
Select first_name, last_name, salary, department_name
From employees
join departments on employees.department_id = 
departments.department_id
Where salary = (select
			Max(salary)
			From employees)or salary = (select
			Min(salary)
			From employees);
-- 6
-- Número de empleados y número de departamentos por ciudad (nombre)
select

count(*),
count(distinct employees.department_id),
city
from employees
    full join departments on employees.department_id = 
    departments.department_id 
    full join locations on departments.location_id = 
    locations.location_id
    where city is not null
group by city;

-- 7
-- Número de empleados y número de departamentos de todas las ciudades (nombre)
-- ordenado por número de empleados descendentemente
select

count(*),
count(distinct employees.department_id),
city
from employees
    full join departments on employees.department_id = 
    departments.department_id 
    full join locations on departments.location_id = 
    locations.location_id
    where city is not null
group by city
order by count(*) desc;
-- 8
-- Mostrar el número de empleado, nombre y apellido de los empleados
-- que sean jefes tanto como de departamento como de otro empleado
-- indicando en una sola columna con un literal 'DEP' si es jefe de departamento
-- y 'EMP' si es jefe de otro empleado. Ordenados por número de empleado.

-- 9
-- Listar el nombre, apellido y salario de los tres empleados que ganan más
select 
    first_name,
    last_name,
    salary
from (select 
        rownum orden,
        first_name,
        last_name,
        salary
    from
        employees
    order by salary desc)
where
    rownum <= 3;

-- 10
-- Imaginad que queremos crear nombres de usuario para direcciones de correo.
-- Cuyo formato es la primera letra del nombre más el apellido.
-- Queremos saber si del listado de nombres y apellidos alguien coinciden

select
concat (substr (first_name,1,1), last_name),
count(*)
from
employees
group by
concat (substr (first_name,1,1), last_name)
having
count(*) >1;
-- 11
-- Listar nombre, apellido y un literal que indique el salario.
-- 'BAJO' si el salario es menor a la mediabaja (media entre el salario mínimo y la media de salarios)
-- 'ALTO' si el salario es mayor a la mediaalta (media entre el salario máximo y la media de salarios)
-- 'MEDIO' si el salario está entre la mediabaja y mediaalta



-- 12
-- Número de empleados dados de alta por día
-- entre dos fechas. Ej: entre 1997-10-10 y 1998-03-07
-- y para una o varias ciudades. Ej: Seattle, Rome
-- (Pensad que es una consulta que se va adaptar a variables
-- es decir, que las ciudades o el rango de fechas varia
-- en la parte visual de la aplicación se muestran desplegables
-- para escoger los valores, pero luego eso se reemplaza en la consulta)
-- Aquí usamos valores fijos de ejemplo.
select 
    count (employee_id),
    employees.hire_date,
    locations.city
from 
    employees
    join departments 
        on employees.department_id = departments.department_id
    join locations
        on departments.location_id = locations.location_id
where (employees.hire_date between '10/10/1997' and '07/03/1998') and locations.city in ('Seattle','Roma')
group by employees.hire_date,
        locations.city;  

-- 13
-- Un listado en el que se indique en líneas separadas
-- una etiqueda que describa el valor y como valor:
-- el número de empleados en Seattle, 
-- el número de departamentos con empleados en Seattle
-- el número de departamentos sin empleados en Seattle
-- el número de jefes de empleado en Seattle
-- el número de jefes de departamento en Seattle

-- 14
-- Nombre, apellido, email, department_name
-- de los empleados del departamento con más empleados

-- 15
-- Cuál es la fecha en la que más empleados
-- se han dado de alta
select hire_date
from employees
group by hire_date
having count (employee_id) = (select max ("Empleados")
                            from (select count (employee_id) "Empleados", hire_date
                                    from employees
                                    group by hire_date));
------------------------------------------------------------------------------------------------
