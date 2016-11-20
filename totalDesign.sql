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

--CreditCard Entity
create table CreditCard (
	cardNum numeric(16,0),
	expDate date not null,
	holder varchar(256) not null,

	primary key (cardNum)
);

--Customer Entity
create table Customer (
	customerID int,
	balance float not null,
	lastName varchar(256) not null,
	firstName varchar(256) not null,

	primary key (customerID)
);

--ProOrder Entity
create table ProOrder (
	orderID int,
	status varchar(256) not null,

	primary key (orderID),
	check(status = 'issued' or status = 'send' or status =  'recieved')
);

create table WareHouse
(
  wareHouseID int,
  capacity float not null,
  primary key(wareHouseID)
);

--entitiy Supplier
create table Supplier
(
  supplierID int,
  lastName varchar(256) not null,
  firstName varchar(256) not null,
  primary key(supplierID)
);

--entitiy SupplierProduct
create table SupplierProduct
(
  supType varchar(256),
  supName varchar(256),
  primary key(supType, supName)
);