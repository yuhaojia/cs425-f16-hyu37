--entitiy wareHouse
create Table WareHouse
(
  WareHouseID int,
  capacity float,
  primary key(WareHouseID)
);
--entitiy Supplier
create TABLE Supplier
(
  SupplierID int,
  lastName varchar(256),
  firstName varchar(256),
  primary key(SupplierID)
);
--entitiy SupplierProduct
create table SupplierProduct
(
  SPID int,
  SPname varchar(256),
  primary key(SPID,SPname)
);
