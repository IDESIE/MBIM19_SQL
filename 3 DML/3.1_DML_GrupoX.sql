------------------------------------------------------------------------------------------------
-- DML
------------------------------------------------------------------------------------------------
/* 1
Insertar un empleado llamado James Dexter 
en el departamento de IT Innovation 
que se encuentra en la ciudad de Madrid, Spain
Y como tipo de trabajo: Software Engineering 
*/
insert into countries(country_ID, country_name)
values ('SP', 'Spain');
insert into locations(location_id, city)
values ( 3300, 'Madrid');
insert into departments(department_name, department_id)
values('IT Innovation', 280);
insert into jobs(job_id, job_title)
values('SO_ENG', 'Software Engineering');
insert into employees(employee_id, first_name, last_name, email, hire_date, job_id, department_id)
values(207, 'James', 'Dexter', 'JDEXTER', '06/08/2020','SO_ENG', 280);
/*
Comprobar que se ven los datos insertados de forma conjunta con una JOIN
y no de forma independiente. Con el fin de comprobar las relaciones.
*/
select d.department_name, d.department_id,
    e.employee_id, e.first_name, e.last_name, e.email, 
    e.hire_date, e.job_id, e.department_id, 
    l.location_id, l.city, c.country_id, c.country_name
from employees e 
        join departments d 
            on e.department_id = d.department_id 
        join jobs j 
            on e.job_id = j.job_id 
        join locations l 
            on d.location_id = l.location_id
        join countries c
            on l.country_id = c.country_id
where employee_id = 207;
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
set commission_pct = 
    (select round(avg(commission_pct), 2) from employees)
where employee_id = 207;
/* 4
Anonimizar sus datos personales: nombre, apellido, email, teléfono
*/
