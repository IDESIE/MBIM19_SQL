------------------------------------------------------------------------------------------------
-- DML
------------------------------------------------------------------------------------------------
/* 1
Insertar un empleado llamado James Dexter 
en el departamento de IT Innovation 
que se encuentra en la ciudad de Madrid, Spain
Y como tipo de trabajo: Software Engineering 
*/
insert into countries
values ('SP','Spain',1);

insert into locations (location_id,city,state_province,country_id)
values (3300,'Madrid','Madrid',(select country_id from countries where country_name='Spain'));

insert into departments (department_id,department_name,location_id)
values (280, 'IT Innovation', (select location_id from locations where city = 'Madrid'));

insert into jobs
values ('IT_SOFT','Software Engineering',4000,10000);

insert into employees(employee_id,first_name,last_name,email,hire_date,job_id,department_id)
values (207,'James','Dexter','JDEXTER','06/08/2020',
(select job_id from jobs where job_title='Software Engineering'),
(select department_id from departments where department_name='IT Innovation'));

/*
Comprobar que se ven los datos insertados de forma conjunta con una JOIN
y no de forma independiente. Con el fin de comprobar las relaciones.
*/
select *
from 
    employees
    join departments 
        on employees.department_id = departments.department_id
    join locations
        on departments.location_id = locations.location_id
    join countries
        on locations.country_id = countries.country_id
    join jobs
        on employees.job_id = employees.job_id
where employee_id=207 and jobs.job_id='IT_SOFT';

/* 2
Actualizarle el salario a 60000
*/
update employees
set salary = 6000
where employee_id = 207;

/* 3
Colocarle una comisión igual a la media de comisiones
Manteniendo dos centésimas como valor.
*/
update employees
set commission_pct = (select avg(commission_pct) from employees)
where employee_id = 207;

/* 4
Anonimizar sus datos personales: nombre, apellido, email, teléfono
*/