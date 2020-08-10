------------------------------------------------------------------------------------------------
-- SELECT CON FUNCIONES
------------------------------------------------------------------------------------------------
/* 1
Mostrar la fecha actual de la siguiente forma:
Fecha actual
------------------------------
Sábado, 11 de febrero de 2017. 16:06:06

El día en palabras con la primera letra en mayúsculas, seguida de una coma, el día en números,
la palabra "de", el mes en minúscula en palabras, la palabra "de", el año en cuatro dígitos
finalizando con un punto. Luego la hora en formato 24h con minutos y segundos.
Y de etiqueta del campo "Fecha actual".
*/
select to_char (sysdate, 'Day, dd ' ||
    ' month' || 
    'yyyy. HH24:mm:ss'
    ) "NOW"
FROM dual;
/* 2
Día en palabras en el cual naciste
*/
 select to_char('30/06/1995' , 'Day'
 ) from dual;
/* 3
La suma de salarios, cuál es el mínimo, el máximo y la media de salario
*/
 select sum(salary) , min(salary), max (salary), round(avg(salary) , 1) "MEDIA"
 from employees;
/* 4
Cuántos empleados hay, cuántos tienen salario y cuántos tienen comisión.
*/
select COUNT(employee_id), COUNT(salary),
count(commission_pct)
from employees;
/* 5
Por un lado la media entre la media de salarios y el mínimo salario
Y por otro lado, la media entre la media de salarios y el máximo salario
Solo la parte entera, sin decimales ni redondeo.
*/
select round(avg(salary)+min(salary) / 2) mediaMIN,
round(avg(salary)+max(salary) /2) mediaMAX
from employees;
/* 6
Listar el número de departamento y el máximo salario en cada uno de ellos.
*/
select  department_id, max(salary)
from employees
group by department_id
order by department_id;
/* 7
Mostrar los nombres de los empleados que se repiten indicando cuántos hay del mismo
en orden descendente.
*/
select  first_name, count(first_name) from employees 
group by first_name 
having count(first_name) > 1
order by first_name desc;
/* 8
Mostrar en una fila cuántos empleados son jefes de departamento
y en otra fila cuántos son jefes de otros empleados.
*/
select count(distinct department_id) jefesDepartamentos, 
    count(distinct manager_id)-count(distinct department_id) jefesmpleados
from employees;
/* 9
Listar nombre, apellido de los empleados que les coindice a la vez
la primera letra de su nombre y el apellido
*/
select first_name, last_name
from employees
where substr(first_name,1,1) = substr(last_name,1,1);
/* 10
Número de empleados dados de alta por día
ordenados descendentemente por la fecha
*/
select
    count(employee_id)
from employees
group by hire_date
order by hire_date desc;
/* 11
Un listado por año de la media de salarios
de los empleados que ingresaron ese año
ordenados de forma descendente por año
*/
select to_char(hire_date, 'yyyy'), round(avg(salary)) media
from employees
group by hire_date
order by hire_date desc;
/* 12
Nombre del día en el que más empleados
se han dado de alta
*/
select
    to_char(hire_date, 'Day')
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
