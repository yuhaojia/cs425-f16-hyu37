--entity
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
	foreign key(addrID) references Address,
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

--relationship has one-to-many
--add PK of Info (one side) to Product (many side)

drop table Address;
drop table Staff;
drop table Product;
drop table Info;
drop table associate;
drop table pricePerState;
drop table contain;