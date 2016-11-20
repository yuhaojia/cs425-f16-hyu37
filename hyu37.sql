--Entity
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

--Order Entity
create table Order (
	orderID int,
	status varchar(256) not null check(in ('issued', 'send', 'recieved')),	

	primary key (orderID)
);

--Relation
