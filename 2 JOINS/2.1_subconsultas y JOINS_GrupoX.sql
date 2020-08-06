------------------------------------------------------------------------------------------------
-- SELECT con suncolsultas y JOINS
------------------------------------------------------------------------------------------------
-- 1
-- Nombre y apellido del empleado que más gana.
select first_name, last_name
from employees
where salary =(select max(salary) from employees);
-- 2
-- Nombre, apellido y salario de los empleados que ganan más que la media de salarios.
select first_name, last_name,salary
from employees
where salary >(select avg(salary) from employees);
-- 3
-- Nombre y apellido del jefe del departamento de Marketing
select first_name, last_name
from employees
        join departments on employees.employee_id
        = departments.manager_id
where employee_id = (select  departments.manager_id
from departments
where departments.department_name = 'Marketing');
-- 4
-- Nombre y apellido  de los empleados del departamento de Marketing
select e.first_name,e.last_name
from 
employees e 
join departments d
        on e.department_id
        =   d.department_id
where 
d.department_name='Marketing';
-- 5
-- Nombre, apellido, salario, nombre del departamento y ciudad
-- del empleado que gana más y el que menos
select first_name, last_name, salary, d.department_name, d.location_id
from employees e join departments d
       on e.department_id 
       = d.department_id
where salary in ((select max(salary) from employees), 
    (select min(salary) from employees))
order by salary desc;
-- 6
-- Número de empleados y número de departamentos por ciudad (nombre)

-- 7
-- Número de empleados y número de departamentos de todas las ciudades (nombre)
-- ordenado por número de empleados descendentemente

-- 8
-- Mostrar el número de empleado, nombre y apellido de los empleados
-- que sean jefes tanto como de departamento como de otro empleado
-- indicando en una sola columna con un literal 'DEP' si es jefe de departamento
-- y 'EMP' si es jefe de otro empleado. Ordenados por número de empleado.

-- 9
-- Listar el nombre, apellido y salario de los tres empleados que ganan más
select last_name, salary
from
    (select
    rownum orden, last_name, salary
from employees
order by salary desc)
where rownum < 4;
-- 10
-- Imaginad que queremos crear nombres de usuario para direcciones de correo.
-- Cuyo formato es la primera letra del nombre más el apellido.
-- Queremos saber si del listado de nombres y apellidos alguien coinciden

-- 11
-- Listar nombre, apellido y un literal que indique el salario.
-- 'BAJO' si el salario es menor a la mediabaja (media entre el salario mínimo y la media de salarios)
-- 'ALTO' si el salario es mayor a la mediaalta (media entre el salario máximo y la media de salarios)
-- 'MEDIO' si el salario está entre la mediabaja y medialata.

-- 12
-- Número de empleados dados de alta por día
-- entre dos fechas. Ej: entre 1997-10-10 y 1998-03-07
-- y para una o varias ciudades. Ej: Seattle, Rome
-- (Pensad que es una consulta que se va adaptar a variables
-- es decir, que las ciudades o el rango de fechas varia
-- en la parte visual de la aplicación se muestran desplegables
-- para escoger los valores, pero luego eso se reemplaza en la consulta)
-- Aquí usamos valores fijos de ejemplo.

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
select
    hire_date
from employees
group by hire_date
having
    count(employee_id) = 
    (Select max(numemp) 
    from(select count(employee_id)numemp,
    hire_date
    from employees
    group by hire_date));
------------------------------------------------------------------------------------------------
wd