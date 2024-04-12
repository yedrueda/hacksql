

create table countries(

  id_country serial primary key,
  name varchar(50) not null  
);

create table roles(
	
  id_role serial primary key,
	name varchar(50) not null
   
);
	
create table taxes(
	
  id_tax integer primary key,
	percentage integer not null
   
);

create table offers(
	
  id_offer serial primary key,
	status varchar(50) not null
   
);

create table discounts(
	
  id_discount serial primary key,
	status varchar(50) not null,
	percentage integer not null
   
);

create table payments(
	
  id_payment serial primary key,
	type varchar(50) not null	
   
);

create table customers(
	
	id_customer serial primary key,
  email varchar(100) ,
	id_country integer not null,
	id_role integer not null, 
	name varchar(50) not null,
	age integer not null,
	password varchar(50) not null,
	physical_address varchar(100) not null,
	foreign key (id_country) references countries (id_country),
	foreign key (id_role) references roles (id_role)
   
);

create table invoice_status(
	
  id_invoice_status serial primary key,
	status varchar(50) not null
   
);

create table products(
	
  id_product serial primary key,
	id_discount integer not null,
	id_offer integer not null,
	id_tax integer not null,
	name varchar(100) not null,
	details varchar(50),
	minimum_stock integer not null,
	maximum_stock integer not null,
	current_stock integer not null,
	price integer not null,
	price_with_tax integer not null,
	foreign key (id_discount) references discounts (id_discount),
	foreign key (id_offer) references offers (id_offer),
	foreign key (id_tax) references taxes (id_tax)
	
);


create table product_customers(
	
	id_product integer not null,
	id_customer integer not null,
	foreign key (id_product) references products (id_product),
	foreign key (id_customer) references customers (id_customer)
	
);

create table invoices(
	
	id_invoice serial primary key,
	id_customer integer not null,
	id_payment integer not null,
	id_invoice_status integer not null,
	date date not null,
	total_to_pay integer not null,
	foreign key (id_customer) references customers (id_customer),
	foreign key (id_payment) references payments (id_payment),
	foreign key (id_invoice_status) references invoice_status (id_invoice_status)
	
);

create table orders(
	
	id_order serial primary key,
	id_invoice integer not null,
	id_product integer not null,
	detail varchar(50) not null,
	amount integer not null,
	price integer not null,
	foreign key(id_invoice) references invoices(id_invoice),
	foreign key(id_product) references products(id_product)
);






