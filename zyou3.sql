--entity Address
create table Address{
	addrID int,
	streetNo int,
	street varchar(256),
	city varchar(256),
	state varchar(256),
	zipcode int,
	addrType varchar(256)	--delivery, payment, product, staff, supplier
}

--entity Staff
create table Staff{
	
}