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
select count(e.employee_id), count(d.department_id), city
from locations l 
    join departments d on l.location_id = d.location_id
    join employees e on d.department_id = e.department_id
group by city;
-- 7
-- Número de empleados y número de departamentos de todas las ciudades (nombre)
-- ordenado por número de empleados descendentemente
select count(e.employee_id), count(d.department_id), city
from locations l 
    left join departments d on l.location_id = d.location_id
    left join employees e on d.department_id = e.department_id
group by city
order by 2 desc;
-- 8
-- Mostrar el número de empleado, nombre y apellido de los empleados
-- que sean jefes tanto como de departamento como de otro empleado
-- indicando en una sola columna con un literal 'DEP' si es jefe de departamento
-- y 'EMP' si es jefe de otro empleado. Ordenados por número de empleado.
select employee_id, first_name, last_name, 
    case
        when employee_id = d.manager_id then 'DEP'
        else  'EMP'
    end employee_id
from employees e 
    join departments d on e.department_id = d.department_id
where employee_id = d.manager_id
group by manager_id
order by count(employee_id);
-- 9
-- Listar el nombre, apellido y salario de los tres empleados que ganan más
select first_name, last_name, salary
from
    (select
    rownum orden, last_name, salary, first_name
from employees
order by salary desc)
where rownum < 4;
-- 10
-- Imaginad que queremos crear nombres de usuario para direcciones de correo.
-- Cuyo formato es la primera letra del nombre más el apellido.
-- Queremos saber si del listado de nombres y apellidos alguien coinciden
select  repeat(concat(substr(first_name, 1,1),last_name),>1)
from employees
group by concat(substr(first_name, 1,1),last_name);

select concat(substr(first_name, 1,1),last_name), count(*)
from employees
group by concat(substr(first_name, 1,1),last_name)
having count(*) >1;
-- 11
-- Listar nombre, apellido y un literal que indique el salario.
-- 'BAJO' si el salario es menor a la mediabaja (media entre el salario mínimo y la media de salarios)
-- 'ALTO' si el salario es mayor a la mediaalta (media entre el salario máximo y la media de salarios)
-- 'MEDIO' si el salario está entre la mediabaja y medialata.
SELECT first_name, last_name, 
    case
        when salary < (avg(salary)+min(salary)) / 2 
            then 'BAJO'
        when salary > (avg(salary)+max(salary)) /2
            then 'ALTO' 
        else 'MEDIO'
    end salary
from employees;
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
select department_id 
from departments d
    join locations l on l.location_id = d.location_id
    join departments d on d.department_id = e.department_id
where l.city = Seatle;
-- 14
-- Nombre, apellido, email, department_name
-- de los empleados del departamento con más empleados
select first_name, last_name, email, d.department_name
from employees e
    join departments d on e.department_id = d.department_id
where department_id = (select department_id, count(*)
from employees
group by department_id
having count(employee_id) = (select max(count(employee_id))
from (select count(employee_id),department_id
from employees group by department_id)));
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
