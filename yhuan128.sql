--entitiy wareHouse
create table WareHouse
(
  wareHouseID int,
  capacity float,
  primary key(WareHouseID)
);

--entitiy Supplier
create table Supplier
(
  supplierID int,
  lastName varchar(256),
  firstName varchar(256),
  primary key(supplierID)
);

--entitiy SupplierProduct
create table SupplierProduct
(
  supType varchar(256),
  name varchar(256),
  primary key(supType, name)
);
