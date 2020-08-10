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
create table AAAFACILITIES(
    id number,
    guid varchar2(4000),
    name  varchar2(4000),
    description  varchar2(4000),
    category  varchar2(4000),
    address varchar2(4000),
    constraint pk_AAAfacilities_id primary key(id),
    constraint uq_AAAfacilities_guid unique(guid));

create table AAAFLOORS(
    id number,
    guid varchar2(4000),
    name  varchar2(4000) not null,
    category  varchar2(4000),
    description  varchar2(4000),
    height  number,
    facilityId number not null,
    constraint pk_AAAfloors_id primary key(id),
    constraint uq_AAAfloors_guid unique(guid),
    constraint uq_AAAfloors_name unique(name));
    
create table AAASPACES(
    id number,
    guid varchar(4000),
    name varchar(4000) not null,
    category varchar(4000),
    description varchar(4000),
    usableHeight number,
    area number,
    floorId number not null,
    constraint pk_AAAspace_id primary key (id),
    constraint uq_AAAspace_guid unique(guid),
    constraint uq_AAAspace_name unique(name));
    
create table AAATYPES (
    id number,
    guid varchar2(4000),
    name varchar2(4000) not null,
    description varchar2(4000),
    modelNumber number,
    color varchar2(4000),
    warrantyYears number,
    constraint pk_AAAtypes_id primary key (id),
    constraint uq_AAAspace_guid unique(guid),
    constraint uq_AAAspace_name unique(name),
    constraint ck_AAAspace_warrantyYears check
        (warrantyYears > 0);
    
create table AAACOMPONENTS (
    id number,
    guid varchar2(4000),
    name varchar2(4000) not null,
    description varchar2(4000),
    serialNumber number,
    installatedOn date default sysdate,
    spaceId number not null,
    typeId number not null,
    constraint pk_AAAcomponents_id primary key (id),
    constraint uq_AAAcomponents_guid unique(guid),
    constraint uq_AAAcomponents_name unique(name);
    
ALTER TABLE AAACOMPONENTS ADD(
    constraint fk_AAACOMPONENTS_spaceId FOREIGN KEY(spaceId)
        references AAASPACES (id),
    constraint fk_AAACOMPONENTS_typeId FOREIGN KEY(typeId)
        references AAATYPES (id)
);

ALTER TABLE AAASPACES ADD(
    constraint fk_AAASPACES_floorId FOREIGN KEY(floorId)
        references AAAFLOORS (id)
);

ALTER TABLE AAAFLOORS ADD(
    constraint fk_AAAFLOORS_facilitiesId FOREIGN KEY(facilityId)
        references AAAfacilities (id)
);
