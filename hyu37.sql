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

--ProOrder Entity
create table ProOrder (
	orderID int,
	status varchar(256) not null check(in ('issued', 'send', 'recieved')),	

	primary key (orderID)
);

drop table CreditCard;
drop table Customer;
drop table ProOrder;

--Relation
