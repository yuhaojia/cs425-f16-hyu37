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
  primary key(supType, name)
);
