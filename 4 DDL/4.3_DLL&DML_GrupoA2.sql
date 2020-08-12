/*
NOTA: Algunos ejercicios provocan errores que deben probar (para ver el error) y corregir.
*/

/*1
Dar de alta al edificio matriz
*/
insert into AAAFACILITIES (id, guid, name)
values ( 10, 001, 'Edificio Matriz');
/*2
Dar de alta Planta 1, Planta 2 y Planta 3
en el edificio matriz con una altura de 3.69m
*/
insert into AAAFLOORS (id, guid, name, height, facilityid)
select 10, 001, 'Planta 1', 3.69 , 10 from dual UNION 
select 20, 002, 'Planta 2', 3.69 * 2, 10 from dual UNION 
select 30, 003, 'Planta 3', 3.69*3, 10 from dual; 
/*3
Dar de alta en Planta 1 los espacios: Recepción, Sala1, Sala2
*/
insert into AAASPACES (id, guid, name, floorid)
select 10,001,'Reception', 10 from dual UNION
select 20,002,'Room1', 10 from dual UNION
select 30,003,'Room2',10 from dual;
/*4
Dar de alta los tipos: 
Mesa madera cuadrada 1x1x1
Mesa madera redonda 2x1
Silla reclinable TPM
*/
insert into AAATYPES (id,guid,name)
select 10,001,'Mesa madera cuadrada 1x1x1' from dual UNION
select 20,002, 'Mesa madera redonda 2x1' from dual UNION
select 30,003, 'Silla reclinable TPM' from dual;
/*5
Dar de alta los componentes: 
[{
"name": "Mobiliario_Mesa madera cuadrada 1x1x1",
"serialNumber": "ASD-3322",
"assetId": "MOB-MES-1234",
"space": "Sala 1",
"type": "Mesa madera cuadrada 1x1x1"
},
{
"name": "Mobiliario_Mesa madera cuadrada 1x1x1",
"serialNumber": "ASD-3355",
"assetId": "MOB-MES-4321",
"space": "Sala 2",
"type": "Mesa madera cuadrada 1x1x1"
}
]
*/
/*
Nota:
-se necesita agregar un campo para almacenar el código dado que es independiente del nuestro.
-se elimina la restricción de que el nombre de los componentes no pueda repetirse
*/
/*agregar campo */
ALTER TABLE AAACOMPONENTS ADD(
assetId varchar(4000));
/*eliminar restricción*/
ALTER TABLE AAACOMPONENTS DROP
constraint uq_aaacomponents_name ;
/*modificar serial number*/
alter table AAACOMPONENTS 
modify SERIALNUMBER VARCHAR(4000);
/*insertar componentes*/
insert into aaacomponents(ID,GUID,name,serialnumber,
assetid,spaceid,typeid)
select 10,'00a','Mobiliario_Mesa madera cuadrada 1x1x1',
    'ASD-3322', 'MOB-MES-1234', 20, 
    10 from dual UNION
select 20,'00b','Mobiliario_Mesa madera cuadrada 1x1x1',
    'ASD-3355','MOB-MES-4321',30,
    10 from dual;
/*6
Actualizar la fecha de instalación del componente número 2
al 31 de junio del 2020
*/
UPDATE AAACOMPONENTS 
set installatedon = '31/07/2020'
where id = 20;
/*7
Quitar restricción de obliga a los componentes
a tener un espacio
*/
alter table  AAACOMPONENTS modify spaceid null;
/*8
Quitar restricción de obliga a los componentes
a tener un tipo
*/
alter table  AAACOMPONENTS modify typeid null;