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

INSERT INTO countries (name) 
 VALUES ('España'), ('Francia'), ('Italia');

	SELECT * FROM countries;
	
INSERT INTO roles (name) 
 VALUES ('Vendedor'), ('Gerente'), ('Contador');

	SELECT * FROM roles;

INSERT INTO taxes (id_tax,percentage)
 VALUES (1,21), (2,10), (3,5);

 SELECT * FROM taxes;

INSERT INTO offers (status)
 VALUES ('Activa'), ('Inactiva'), ('Próximamente');

	SELECT * FROM offers;
	
INSERT INTO discounts (status, percentage)
 VALUES ('Activo', 15), ('Inactivo', 10), ('Próximo', 20);

	SELECT * FROM discounts;

INSERT INTO payments (type) 
 VALUES ('Tarjeta de crédito'), ('Efectivo'), ('Transferencia bancaria');
	
	SELECT * FROM payments;

INSERT INTO customers (email, id_country, id_role, name, age, password, physical_address)
 VALUES ('ejemplo1@correo.com', 1, 2, 'Ana García', 30, 'clave123', 'Calle Mayor 123'),
        ('ejemplo2@correo.com', 2, 1, 'Juan Pérez', 25, 'clave456', 'Avenida del Sol 456'),
        ('ejemplo3@correo.com', 3, 3, 'Maria López', 40, 'clave789', 'Plaza de España 789');

	SELECT * FROM customers;
	
INSERT INTO invoice_status (status)
 VALUES ('Pagada'), ('En proceso'), ('Pendiente');

	SELECT * FROM invoice_status;	

INSERT INTO products (id_discount, id_offer, id_tax, name, details, minimum_stock, maximum_stock, current_stock, price, price_with_tax)
 VALUES (1, 2, 1, 'Producto 1', 'Descripción 1', 10, 50, 20, 100, 121),
        (2, 3, 2, 'Producto 2', 'Descripción 2', 20, 100, 50, 200, 220),
        (3, 1, 3, 'Producto 3', 'Descripción 3', 30, 150, 80, 300, 330);

  SELECT * FROM products;
  
INSERT INTO product_customers (id_product, id_customer)
 VALUES (1, 1), (2, 2), (3, 3);

 SELECT * FROM product_customers;
 
INSERT INTO invoices (id_customer, id_payment, id_invoice_status, date, total_to_pay)
 VALUES (1, 1, 1, '2023-11-14', 100), (2, 2, 2, '2023-11-15', 200), (3, 3, 3, '2023-11-16', 300);
 
 SELECT * FROM invoices;
 
INSERT INTO orders (id_invoice, id_product, detail, amount, price)
 VALUES (1, 1, 'Detalle 1', 1, 100), (2, 2, 'Detalle 2', 2, 200), (3, 3, 'Detalle 3', 3, 300);
 
 SELECT * FROM orders;
 
-- 
UPDATE customers
	SET name= 'Martha garcia'
	WHERE id_customer = 1 ;
 
  SELECT * FROM customers;
  
UPDATE taxes
  SET percentage = percentage + 5;
  
SELECT * FROM taxes;


UPDATE products
  SET price = price + 100;
  
SELECT * FROM products;