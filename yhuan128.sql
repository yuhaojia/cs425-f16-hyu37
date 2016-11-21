--entitiy wareHouse
create table WareHouse
(
  wareHouseID int,
  capacity float not null,
  addrID int,
  primary key(wareHouseID),
  foreign key(addrID)references Address
    on delete cascade
);

--entitiy Supplier
create table Supplier
(
  supplierID int,
  lastName varchar(256) not null,
  firstName varchar(256) not null,
  addrID int,
  primary key(supplierID),
  foreign key(addrID) references Address
    on delete set null
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
  supType varchar(256),
  supName varchar(256),
  price float,
  primary key(supplierID, supType, supName),
  foreign key(supplierID)references Supplier
    on delete cascade,
  foreign key(supType, supName)references SupplierProduct
    on delete cascade
);
--many to many
create table stock
(
  proType varchar(256),
  proName varchar(256),
  wareHouseID int,
  quanity int,
  primary key(proType, proName, wareHouseID),
  foreign key(proType, proName)references Product
    on delete cascade,
  foreign key(wareHouseID)references WareHouse
    on delete cascade
);

drop table WareHouse;
drop table Supplier;
drop table SupplierProduct;
drop table provide;
drop table stock;


