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

/* 2
Actualizarle el salario a 60000
*/

/* 3
Colocarle una comisión igual a la media de comisiones
Manteniendo dos centésimas como valor.
*/

/* 4
Anonimizar sus datos personales: nombre, apellido, email, teléfono
*/
