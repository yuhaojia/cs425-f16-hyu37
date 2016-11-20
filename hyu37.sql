


--CreditCard Entity

create table CreditCard (
	cardNum numeric(16,0),
	expDate date,
	holder char(256),

	primary key cardNum,
);

--Customer Entity

create table Customer (
	customerID numeric(16,0),
	expDate date,
	holder char(256),

	primary key cardNum,
);