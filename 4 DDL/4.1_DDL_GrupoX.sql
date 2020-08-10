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

create table FACILITIES(
    id number,
    guid varchar2(4000),
    name varchar2(4000),
    description varchar2(4000),
    category varchar2(4000),
    address varchar2(4000),
    constraint pk_facilities_id primary key(id),
    constraint uq_facilities_guide unique(guid)
);

FLOORS
id
guid
name
category
description
height
facilityId

create table FLOORS(
    id number,
    guid varchar2(4000),
    name varchar2(4000) not null,
    category varchar2(4000),
    description varchar2(4000),
    height varchar2(4000),
    facilityId number not null,
    constraint pk_floors_id primary key(id),
    constraint uq_floors_guide unique(guid),
    constraint uq_floors_name unique (name)
);

SPACES
id
guid
name
category
description
usableHeight
area
floorId

create table SPACES(
    id number,
    guid varchar2(4000),
    name varchar2(4000) not null,
    category varchar2(4000),
    description varchar2(4000),
    height varchar2(4000),
    facilityId number not null,
    usableHeight varchar2(4000),
    area varchar2(4000),
    floorId number not null,
    constraint pk_spaces_id primary key(id),
    constraint uq_spaces_guide unique(guid),
    constraint uq_spaces_name unique (name)
);

COMPONENTS
id
guid
name
description
serialNumber
installatedOn
spaceId
typeId

create table COMPONENTS(
    id number,
    guid varchar2(4000),
    name varchar2(4000) not null,
    category varchar2(4000),
    description varchar2(4000),
    height varchar2(4000),
    facilityId number not null,
    usableHeight varchar2(4000),
    area varchar2(4000),
    floorId number not null,
    serialNumber varchar2(4000),
    installatedOn varchar2(4000),
    spaceId number not null,
    typeId varchar2(4000),
    constraint pk_components_id primary key(id),
    constraint uq_components_guide unique(guid),
    constraint uq_components_name unique (name)
);

TYPES
id
guid
name
description
modelNumber
color
warrantyYears

create table TYPES(
    id number,
    guid varchar2(4000),
    name varchar2(4000) not null,
    category varchar2(4000),
    description varchar2(4000),
    height varchar2(4000),
    facilityId number not null,
    usableHeight varchar2(4000),
    area varchar2(4000),
    floorId number not null,
    serialNumber varchar2(4000),
    installatedOn varchar2(4000),
    spaceId number not null,
    typeId varchar2(4000),
    modelNumber varchar2(4000),
    color varchar2(4000),
    warrantyYears varchar2(4000),
    constraint pk_types_id primary key(id),
    constraint uq_types_guide unique(guid),
    constraint uq_types_name unique (name)
);

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
