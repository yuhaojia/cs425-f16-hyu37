--entity Address
create table Address(
	addrID int,
	street varchar(256) not null,
	city varchar(256) not null,
	state varchar(256) not null,
	zipcode int not null,
	addrType varchar(256) not null,	--delivery, payment, product, staff, supplier
	primary key(addrID)
);

--entity Staff
create table Staff(
	staffID int,
	jobTitle varchar(256) not null,
	lastName varchar(256) not null,
	firstName varchar(256) not null,
	primary key(staffID)
);

--entity Product
create table Product(
	proType varchar(256),
	proName varchar(256),
	addInfo varchar(2048),
	proSize float not null,
	primary key(proType, proName)
);

--entity Info
--Do not create table AddInfo.
create table Info(
	infoType varchar(256),
	info varchar(2048),
	primary key(infoType, info)
);

drop table Address;
drop table Staff;
drop table Product;