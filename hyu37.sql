--Entity
--CreditCard Entity
create table CreditCard (
	cardNum numeric(16,0),
	expDate date,
	holder varchar(256),

	primary key (cardNum)
);

--Customer Entity
create table Customer (
	customerID int,
	balance float,
	lastName varchar(256),
	firstName varchar(256),

	primary key (customerID)
);

--Order Entity
create table Order (
	orderID int,
	status varchar(256)	check(in ('issued', 'send', 'recieved')),	

	primary key (orderID)
);

--Relation
