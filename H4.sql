

INSERT INTO countries(name)
	VALUES ( 'Venezuela'),('Argentina'),('Brasil'),('Peru'),('Canada');
	
	SELECT * FROM 	countries;
	
	INSERT INTO priorities(type_name)
	VALUES ('Baja'),('Media'),('Alta');
	
	SELECT * FROM priorities;
	
	INSERT INTO contact_request(id_email, id_country, id_priority, detail, name, physical_address)
	VALUES ('bar@bar.com', 2, 1,'casa propia', 'barziman', 'buenos aires' ),
	       ('foo@foo.com', 1, 3,'casa alquilada', 'fooziman', 'caracas' ),
	       ('qux@qux.com', 5, 2,'apartamento', 'bqux', 'Toronto' );
	       
SELECT * FROM 	contact_request;

DELETE FROM contact_request
	WHERE  id_email = 'qux@qux.com';
	
	
	UPDATE contact_request
	SET id_email='juan@lab.com', id_country= 4, id_priority=3, detail='casa propia', name='detox', physical_address= 'Lima'
	WHERE  id_email = 'bar@bar.com';
	
	SELECT * FROM 	contact_request;
	