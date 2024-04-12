create table priorities(

  id_priority serial primary key,
  type_name varchar(50) not null);



create table countries(

  id_country serial primary key,
  name varchar(50) not null  
);

create table contact_request(

 id_email varchar(100) primary key,
 id_country integer not null,
 id_priority integer not null,
 detail varchar(100) not null,
 name varchar (50) not null,
 physical_address varchar(100) not null,
 foreign key (id_country) references countries (id_country),
 foreign key (id_priority) references priorities (id_priority)
    
);