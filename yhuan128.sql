--entitiy wareHouse
create table WareHouse
(
  wareHouseID int,
  capacity float not null,
  primary key(wareHouseID)
);

--entitiy Supplier
create table Supplier
(
  supplierID int,
  lastName varchar(256) not null,
  firstName varchar(256) not null,
  primary key(supplierID)
);

--entitiy SupplierProduct
create table SupplierProduct
(
  supType varchar(256),
  supName varchar(256),
  primary key(supType, supName)
);
--many to many
create table provide
(
supplierID int,
supName int,
price float,
primary key(supplierID,supName),
foreign key(supplierID)references Supplier,
foreign key(supName)references SupplierProduct,
);
--many to many
create table stock
(
proType varchar(256),
wareHouseID int,
quanity float,
primary key(proType,wareHouseID),
foreign key(proType)references Product,
foreign key(wareHouseID)references WareHouse,
);

drop table WareHouse;
drop table Supplier;
drop table SupplierProduct;
drop table provide;
drop table stock;


