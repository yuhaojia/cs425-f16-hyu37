--Entity
--CreditCard Entity
create table CreditCard (
	cardNum numeric(16,0),
	expDate date not null,
	holder varchar(256) not null,
	--foreign key
	orderID int,

	primary key (cardNum),
	foreign key (orderID) references ProOrder
);

--Customer Entity
create table Customer (
	customerID int,
	balance float not null,
	lastName varchar(256) not null,
	firstName varchar(256) not null,
	--foreign key
	cardNum numeric(16,0),
	orderID int,

	primary key (customerID),
	foreign key (cardNum) references CreditCard,
	foreign key (orderID) references ProOrder
);

--ProOrder Entity
create table ProOrder (
	orderID int,
	status varchar(256) not null,

	primary key (orderID),
	check(status = 'issued' or status = 'send' or status =  'recieved')
);

drop table CreditCard;
drop table Customer;
drop table ProOrder;

--Relation
