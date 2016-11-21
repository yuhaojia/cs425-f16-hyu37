--entity
--entity Address
create table Address(
	addrID int,
	street varchar(256) not null,
	city varchar(256) not null,
	state varchar(256) not null,
	zipcode int not null,
	addrType varchar(256) not null,	--delivery, payment, product, staff, supplier
	staffID int,
	warehouseID int,
	supplierID int,
	cardNum numeric(16,0)
	primary key(addrID),
	foreign key(staffID) references Staff(staffID),
	foreign key(warehouseID) references WareHouse(warehouseID),
	foreign key(supplierID) references Supplier(supplierID),
	foreign key(cardNum) references CreditCard(cardNum)
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
	proType varchar(256),
	proName varchar(256),
	primary key(infoType, info),
	foreign key(proType, proName) references Product(proType, proName)
);

--relationship
--relationship associate many-to-many
create table associate(
	customerID int,
	addrID int,
	primary key(customerID, addrID),
	foreign key(customerID) references Customer(customerID),
	foreign key(addrID) references Address(addrID)
);

--relationship liveIn one-to-many
--add PK of Staff (one side) to Address (many side)

--relationship pricePerState many-to-many
create table pricePerState(
	addrID int,
	proType varchar(256),
	proName varchar(256),
	statePrice float,
	primary key(addrID, proType, proName),
	foreign key(addrID) references Address(addrID),
	foreign key(proType, proName) references Product(proType, proName)
);

--relationship contain many-to-many
create table contain(
	orderID int,
	proType varchar(256),
	proName varchar(256),
	quantity int,
	primary key(orderID, proType, proName),
	foreign key(orderID) references ProOrder(orderID),
	foreign key(proType, proName) references Product(proType, proName)
);

--relationship has one-to-many
--add PK of Product (one side) to Info (many side)

drop table Address;
drop table Staff;
drop table Product;
drop table Info;