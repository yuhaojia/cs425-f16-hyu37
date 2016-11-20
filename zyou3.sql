--entity Address
create table Address(
	addrID int,
	streetNo int,
	street varchar(256),
	city varchar(256),
	state varchar(256),
	zipcode int,
	addrType varchar(256),	--delivery, payment, product, staff, supplier
	primary key(addrID)
);

--entity Staff
create table Staff(
	staffID int,
	jobTitle varchar(256),
	lastName varchar(256),
	firstName varchar(256),
	primary key(staffID)
);

--entity Product
create table Product(
	proType varchar(256),
	name varchar(256),
	addInfo varchar(2048),
	proSize float,
	primary key(proType, name)
);