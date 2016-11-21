--entity
--entity Address
create table Address(
	addrID int,
	street varchar(256) not null,
	city varchar(256) not null,
	state varchar(256) not null,
	zipcode int not null,
	addrType varchar(256) not null,	--delivery, payment, product, staff, supplier
	supplierID int,
	cardNum numeric(16,0)
	primary key(addrID),
	foreign key(supplierID) references Supplier,
	foreign key(cardNum) references CreditCard
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
);

--entity Info
--Do not create table AddInfo.
create table Info(
	infoType varchar(256),
	info varchar(2048),
	primary key(infoType, info)
);

--relationship
--relationship associate many-to-many
create table associate(
	customerID int,
	addrID int,
	primary key(customerID, addrID),
	foreign key(customerID) references Customer,
	foreign key(addrID) references Address
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
	foreign key(addrID) references Address,
	foreign key(proType, proName) references Product
);

--relationship contain many-to-many
create table contain(
	orderID int,
	proType varchar(256),
	proName varchar(256),
	quantity int,
	primary key(orderID, proType, proName),
	foreign key(orderID) references ProOrder,
	foreign key(proType, proName) references Product
);

--relationship has one-to-many
--add PK of Info (one side) to Product (many side)

drop table Address;
drop table Staff;
drop table Product;
drop table Info;