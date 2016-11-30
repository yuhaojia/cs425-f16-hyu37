drop table stock;
drop table provide;
drop table contain;
drop table pricePerState;
drop table associate;
drop table ProOrder;
drop table CreditCard;
drop table Customer;
drop table SupplierProduct;
drop table WareHouse;
drop table Supplier;
drop table Product;
drop table Staff;
drop table Info;
drop table Address;

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

--entity Info
--Do not create table AddInfo.
create table Info(
	infoType varchar(256),
	info varchar(2048),
	primary key(infoType, info)
);

--entity Staff
create table Staff(
	staffID int,
	jobTitle varchar(256) not null,
	lastName varchar(256) not null,
	firstName varchar(256) not null,
	addrID int,
	primary key(staffID),
	foreign key(addrID) references Address
		on delete set null
);

--entity Product
create table Product(
	proType varchar(256),
	proName varchar(256),
	proSize float not null,
	infoType varchar(256),
	info varchar(2048),
	primary key(proType, proName),
	foreign key(infoType, info) references Info
		on delete set null
);

--entitiy Supplier
create table Supplier
(
  supplierID int,
  lastName varchar(256) not null,
  firstName varchar(256) not null,
  addrID int,
  primary key(supplierID),
  foreign key(addrID) references Address
    on delete set null
);

--entitiy WareHouse
create table WareHouse
(
  wareHouseID int,
  capacity float not null,
  addrID int,
  primary key(wareHouseID),
  foreign key(addrID)references Address
    on delete cascade
);

--entitiy SupplierProduct
create table SupplierProduct
(
  supType varchar(256),
  supName varchar(256),
  primary key(supType, supName)
);

--Entity Customer
create table Customer (
	customerID int,
	balance float not null,
	lastName varchar(256) not null,
	firstName varchar(256) not null,
	primary key (customerID)
);

--Entity CreditCard
create table CreditCard (
	cardNum numeric(16,0),
	expDate date not null,
	holder varchar(256) not null,
	--foreign key
	customerID int,
	addrID int,

	primary key (cardNum),
	FOREIGN KEY (customerID) REFERENCES Customer
		on delete set null,
	FOREIGN KEY (addrID) REFERENCES Address
		on delete set null	
);

--Entity ProOrder
create table ProOrder (
	orderID int,
	status varchar(256) not null,
	--foreign key
	cardNum numeric(16,0),
	customerID int,

	primary key (orderID),
	FOREIGN KEY (cardNum) REFERENCES CreditCard
		on delete set null,
	FOREIGN KEY (customerID) REFERENCES Customer
		on delete set null,
	check(status = 'issued' or status = 'send' or status =  'recieved')
);

--relationship
--relationship associate many-to-many
create table associate(
	customerID int,
	addrID int,
	primary key(customerID, addrID),
	foreign key(customerID) references Customer
		on delete cascade,
	foreign key(addrID) references Address
		on delete cascade
);

--relationship liveIn one-to-many
--add PK of Address (one side) to Staff (many side)

--relationship pricePerState many-to-many
create table pricePerState(
	addrID int,
	proType varchar(256),
	proName varchar(256),
	statePrice float,
	primary key(addrID, proType, proName),
	foreign key(addrID) references Address
		on delete cascade,
	foreign key(proType, proName) references Product
		on delete cascade
);

--relationship contain many-to-many
create table contain(
	orderID int,
	proType varchar(256),
	proName varchar(256),
	quantity int,
	primary key(orderID, proType, proName),
	foreign key(orderID) references ProOrder
		on delete cascade,
	foreign key(proType, proName) references Product
		on delete cascade
);

--relationship provide many-to-many
create table provide
(
  supplierID int,
  supType varchar(256),
  supName varchar(256),
  price float,
  primary key(supplierID, supType, supName),
  foreign key(supplierID)references Supplier
    on delete cascade,
  foreign key(supType, supName)references SupplierProduct
    on delete cascade
);

--relationship stock many-to-many
create table stock
(
  proType varchar(256),
  proName varchar(256),
  wareHouseID int,
  quanity int,
  primary key(proType, proName, wareHouseID),
  foreign key(proType, proName)references Product
    on delete cascade,
  foreign key(wareHouseID)references WareHouse
    on delete cascade
);

commit;