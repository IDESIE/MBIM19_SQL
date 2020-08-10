------------------------------------------------------------------------------------------------
-- DDL
------------------------------------------------------------------------------------------------
/* 
Se desea tener una base de datos con la información de instalaciones/edificios (falicities).
-Información acerca de las plantas, nombre, categoria, descripción, GUID (Global Unique identifier), altura.
-Sobre los espacios, nombre, categoria, descripción, altura usable, area, GUID
-componentes, nombre, descripción, GUID, numero de serie, fecha de instalación
-tipo de componentes, nombre, descripción, modelo, GUID, material, color, años de garantia

1-Generar las siguientes tablas
FACILITIES
id
guid
name
description
category
address

FLOORS
id
guid
name
category
description
height
facilityId

SPACES
id
guid
name
category
description
usableHeight
area
floorId

COMPONENTS
id
guid
name
description
serialNumber
installatedOn
spaceId
typeId

TYPES
id
guid
name
description
modelNumber
color
warrantyYears

En las definiciones establacer las siguientes restricciones
-Los guid deben ser únicos.
-No es posible dar de alta un componente sin un tipo.
-No es posible dar de alta un espacio sin una planta.
-No es posiblde dar de alta una planta sin un facility.
-Dos componentes no pueden llamarse igual, lo mismo pasa con el resto de entidades.
-La fecha de instalación de un componente por defecto es la actual.
-Los nombres no pueden estar vacíos en todas las entidades.
-Los años de garantia no pueden ser cero ni negativos.
-Se debe mantener la integridad referencial.

NOTA: Algunos ejercicios provocan errores que deben probar (para ver el error) y corregir.
*/
create table FACILITIES(
    id number,
    guid varchar2(4000),
    name varchar2 (4000) not null,
    description varchar2 (4000),
    category varchar2(4000),
    address varchar2 (4000),
    constraint pk_facilities_id primary key (id),
    constraint uq_facilities_guid unique(guid)
);

create table FLOORS(
    id number,
    guid varchar2(4000),
    name varchar2(4000) not null,
    category varchar2(4000),
    description varchar2 (4000),
    height varchar2 (4000),
    facilityId number not null,
    constraint pk_floors_id primary key (id),
    constraint uq_floors_guid unique(guid),
    constraint uq_floors_name unique(name)
);

create table SPACES(
    id number,
    guid varchar2(4000),
    name varchar2(4000) not null,
    category varchar2(4000),
    description varchar2 (4000),
    usableHeight varchar2 (4000),
    area varchar2 (4000),
    floorId number not null,
    constraint pk_spaces_id primary key (id),
    constraint uq_spaces_guid unique(guid),
    constraint uq_spaces_name unique(name)
);

create table COMPONENTS(
    id number,
    guid varchar2(4000),
    name varchar2(4000)  not null,
    description varchar2 (4000),
    serialNumber varchar2 (4000),
    installatedOn date default sysdate,
    spaceId number not null,
    typeId number not null,
    constraint pk_components_id primary key (id),
    constraint uq_components_guid unique(guid),
    constraint uq_components_name unique(name)
);

create table TYPES(
    id number,
    guid varchar2(4000),
    name varchar2(4000)  not null,
    description varchar2 (4000),
    modelNumber varchar2 (4000),
    color varchar2 (4000),
    warrantyYears number,
    constraint pk_types_id primary key (id),
    constraint uq_types_guid unique(guid),
    constraint uq_types_name unique(name),
    constraint ck_types_warrantyYears check(warrantyYears>0)
);

alter table FLOORS ADD (
    constraint fk_floors_facilityId
    foreign key (facilityId)
    references FACILITIES (id)
);

alter table SPACES ADD (
    constraint fk_spaces_floorId
    foreign key (floorId)
    references FLOORS (id)
);

alter table COMPONENTS ADD (
    constraint fk_components_typeId
    foreign key (typeId)
    references TYPES (id)
);

alter table COMPONENTS ADD (
    constraint fk_components_spaceId
    foreign key (spaceId)
    references SPACES (id)
);
