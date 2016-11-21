--Entity
--CreditCard Entity
create table CreditCard (
	cardNum numeric(16,0),
	expDate date not null,
	holder varchar(256) not null,
	--foreign key
	customerID int,
	addrID int,

	primary key (cardNum),
	FOREIGN KEY (customerID) REFERENCES Customer，
	FOREIGN KEY (addrID) REFERENCES Address
	
);

--Customer Entity
create table Customer (
	customerID int,
	balance float not null,
	lastName varchar(256) not null,
	firstName varchar(256) not null,
	--foreign key

	primary key (customerID),

);

--ProOrder Entity
create table ProOrder (
	orderID int,
	status varchar(256) not null,
	--foreign key
	cardNum numeric(16,0),
	customerID int,

	primary key (orderID),
	FOREIGN KEY (cardNum) REFERENCES CreditCard,
	FOREIGN KEY (customerID) REFERENCES Customer,
	check(status = 'issued' or status = 'send' or status =  'recieved')
);

drop table CreditCard;
drop table Customer;
drop table ProOrder;

--Relation
