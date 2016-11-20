


--CreditCard Entity

create table CreditCard (
	cardNum numeric(16,0),
	expDate date,
	holder varchar(256),

	primary key cardNum
);

--Customer Entity

create table Customer (
	customerID int,
	balance float,
	lastName char(256),
	firstName char(256),

	primary key customerID
);

--Order Entity

create table Order (
	orderID int,
	status varchar(256),
	check(status in ('issued', 'send', 'recieved'))
	

	primary key orderID
);