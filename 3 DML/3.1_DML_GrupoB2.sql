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