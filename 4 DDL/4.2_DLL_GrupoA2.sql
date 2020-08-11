/*
Se desea gestionar solicitudes sobre componentes. Y para ello se quiere almacenar:
Información sobre una solicitud: asunto, tipo de solicitud (incidencia, petición de servicio),
 descripción y el estado (creada, asignada, terminada, cerrada). Y los componentes sobre los que se genera.
Las solicitudes pueden generar ordenes de trabajo de las que se quiere tener: 
tipo de problema, empresa a la que se asigna, 
un nivel de criticidad (baja, media, alta, urgente), 
un estado (creada, en progreso, terminada, cerrada), el tiempo de trabajo.
Además, se quiere tener el coste de los materiales utilizados 
en cada orden de trabajo. Tanto el número de unidades como el valor del material utilizado.

Nos describen las siguientes restricciones:
Cada tabla tiene un id.
Toda orden de trabajo pertenece a una solicitud.
El tipo de solicitud debe ser Incidencia o Petición de servicio si se genera una orden de trabajo.
La cantidad de unidades y el coste no puede ser inferior a cero.

Nota: como con cualquier proyecto el cliente facilita ideas de lo que quiere. 
Algunas son útiles y otras no, es necesario educir y aclarar lo que el cliente quiere.

1-Generar las siguientes tablas

COMPONENTS
id
guid
name
description
serialNumber
installatedOn
spaceId
typeId

TICKETS
id
subject
ticketTypeId
description
statusId

TICKET_TYPE
id
name

TICKET_STATUS
id
name

TICKET_COMPONENT
ticketId
componentId

ORDERS
id
problemTypeId
companyId
criticalityId
statusId
ticketId
workingHours

COMPANY
id
name

PROBLEM_TYPE
id
name

ORDER_STATUS
id
name

CRITICALLY
id
name

MATERIALS
id
name

COSTS
id
cost
quantity
orderId
materialId

En las definiciones establacer las siguientes restricciones
-Toda orden de trabajo pertenece a una solicitud.
-La cantidad de unidades y el coste no puede ser inferior a cero.
-Toda solicitud tiene un estado.
-Toda orden de trabajo tiene un estado.
-Toda orden de trabajo tiene un tipo de problema.
-Toda orden de trabajo tiene un nivel de criticidad.
-Los nombres de los estados son únicos.
-Los tipos de problemas son únicos.
-Se debe mantener la integridad referencial.

*/

/* la tabla de componentes está creada en el ejercicio anterior*/
create table BBBTICKET_TYPE (
    id number,
    name varchar(4000),
    constraint pk_BBBTICKETTYPE_id primary key (id)
);   
    
create table BBBTICKET_STATUS (
    id number,
    name varchar(4000),
    constraint pk_BBBTICKETSTATUS_id primary key (id)    
);   
        
create table BBBTICKETS (
    id number,
    Subject varchar (4000),
    TicketType_Id number not null,
    description varchar(4000),
    status_Id number not null,
    constraint pk_BBBTICKETS_id primary key (id),
    constraint fk_BBBTICKETS_statusid foreign key (status_id)
        references BBBTICKET_STATUS (id),
    constraint fk_BBBTICKETS_typeid foreign key (TicketType_id)
        references BBBTICKET_TIPE (id)
);   
        
create table BBBTICKET_COMPONENT (
    ticket_Id number not null,
    component_Id number not null,
    constraint fk_BBBTICKCOMP_CompId foreign key (component_id)
        references AAACOMPONENTS (id),
    constraint fk_BBBTICKCOMP_ticketId foreign key (ticket_Id)
        references BBBTICKETS (id)
);   
            
create table BBBCOMPANY (
    id number,
    name varchar(4000),
    constraint pk_BBBCOMPANY_id primary key (id)
);   
    
create table BBBPROBLEMTYPE (
    id number,
    name varchar(4000),
    constraint pk_BBBPROBLEMTYPE_id primary key (id),
    constraint uq_BBBPROBLEMTYPE_name unique (name)
);   
    
create table BBBORDERSTATUS (
    id number,
    name varchar(4000),
    constraint pk_BBBORDERSTATUS_id primary key (id),
    constraint uq_BBBBORDERSTATUS_name unique (name)
);   
        
create table BBBCRITICALLY (
    id number,
    name varchar(4000),
    constraint pk_BBBCRITICALLY_id primary key (id)
);   
    
create table BBBORDERS (
    id number,
    problemType_Id number not null,
    company_Id number,
    criticality_Id number not null,
    status_Id number not null,
    ticket_Id number not null,
    workingHours number,
    constraint pf_BBBORDERS_id primary key (id)
);   

create table BBBMATERIALS (
    id number,
    name varchar(4000),
    constraint pk_BBBMATERIALS_id primary key (id)
);
    
create table BBBCOSTES (
    id number,
    cost number,
    quantity number not null,
    order_Id number not null,
    material_Id number not null,
    constraint pk_BBBCOSTES_id primary key (id),
    constraint ck_BBBCOSTES_cost check (cost > 0),
    constraint ck_BBBCOSTES_quantity check (quantity > 0),
    constraint fk_BBBCOSTES_orderId foreign key (order_Id)
        references BBBORDERS (id)
);
        
Alter table BBBORDERS ADD(
    constraint fk_BBBORDERS_PROBLEM foreign key (problemtype_id)
        reference BBBPROBLEMTYPE (id),
    constraint fk_BBBORDERS_COMPANY foreign key (company_Id)
        reference BBBCOMPANY (id),
    constraint fk_BBBORDERS_CRITICALITY foreign key (criticality_Id)
        reference BBBCRITICALLY (id),
    constraint fk_BBBORDERS_STATUS foreign key (status_Id)
        reference BBBORDERSTATUS (id),
    constraint fk_BBBORDERS_TICKET foreign key (ticket_Id)
        reference BBBTICKETS (id)
);

alter table BBBTICKETS ADD(
    component_Id number,
    constraint fk_BBBTICKETS_COMPONENT foreign key (component_Id)
        reference AAACOMPONENTS (id)
);