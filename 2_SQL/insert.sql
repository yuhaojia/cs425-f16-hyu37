--State
insert into State values('IL');
insert into State values('CA');

--Address
insert into address values(1, 'S King Dr', 'Chicago', 'IL', 60616, 'delivery');
insert into address values(2, 'S China Pl', 'Chicago', 'IL', 60616, 'delivery');

insert into address values(3, 'S King Dr', 'Chicago', 'IL', 60616, 'payment');
insert into address values(4, 'S China Pl', 'Chicago', 'IL', 60616, 'payment');

insert into address values(5, 'Federal Street', 'Chicago', 'IL', 60616, 'product');
insert into address values(6, 'Michgan Street', 'Chicago', 'IL', 60616, 'product');

insert into address values(7, 'King Dr', 'Chicago', 'IL', 60616, 'staff');
insert into address values(8, 'China Pl', 'Chicago', 'IL', 60616, 'staff');

insert into address values(9, 'Federal Street', 'Chicago', 'IL', 60616, 'supplier');
insert into address values(10, 'Michgan Street', 'Chicago', 'IL', 60616, 'supplier');

insert into address values(11, 'S Wabash Ave', 'Chicago', 'IL', 60616, 'warehouse');
insert into address values(12, 'S Dearborn Street', 'Chicago', 'IL', 60616, 'warehouse');

--Info
insert into Info values('Alcohol', '40%');
insert into Info values('Alcohol', '10%');
insert into Info values('Vitamins', '10%');
insert into Info values('Vitamins', '30%');
insert into Info values('Calorie', '110g');
insert into Info values('Calorie', '10g');
insert into Info values('Protein', '10g');
insert into Info values('Protein', '200g');
insert into Info values('Fat', '100g');
insert into Info values('Fat', '125g');

--Staff
insert into Staff values(101, 'Manager', 'John1', 'Dory1', 7);
insert into Staff values(102, 'Assistant Manager', 'John2', 'Dory2', 8);

--Product
insert into Product values('Wine', 'Vodka', 0.2, 'Alcohol', '40%');
insert into Product values('Wine', 'Champagne', 0.2, 'Alcohol', '10%');
insert into Product values('Fruit', 'Apple', 0.1, 'Vitamins', '10%');
insert into Product values('Fruit', 'Pear', 0.1, 'Vitamins', '30%');
insert into Product values('Snake', 'Donut', 0.1, 'Calorie', '110g');
insert into Product values('Snake', 'Cookie', 0.5, 'Calorie', '10g');
insert into Product values('Meat', 'Chicken', 0.3, 'Protein', '10g');
insert into Product values('Meat', 'Beef', 0.4, 'Protein', '200g');
insert into Product values('Beverage', 'Coke', 0.1, 'Fat', '100g');
insert into Product values('Beverage', 'Fanta', 0.1, 'Fat', '125g');

--Supplier
insert into Supplier values(201, 'White', 'Walter', 9);
insert into Supplier values(202, 'Pinkman', 'Jessy', 10);

--WareHouse
insert into WareHouse values(1, 1000.00, 11);
insert into WareHouse values(2, 5000.00, 12);

--SupplierProduct
insert into SupplierProduct values('Wine', 'Vodka');
insert into SupplierProduct values('Wine', 'Champagne');
insert into SupplierProduct values('Fruit', 'Apple');
insert into SupplierProduct values('Fruit', 'Pear');
insert into SupplierProduct values('Snake', 'Donut');
insert into SupplierProduct values('Snake', 'Cookie');
insert into SupplierProduct values('Meat', 'Chicken');
insert into SupplierProduct values('Meat', 'Beef');
insert into SupplierProduct values('Beverage', 'Coke');
insert into SupplierProduct values('Beverage', 'Fanta');

--Customer
insert into Customer values(1, 198.43, 'John1', 'Dow1');
insert into Customer values(2, 421.67, 'John2', 'Dow2');

--CreditCard
insert into CreditCard values(1111111111111111, '1-Nov-16', 'John1 Dow1', 1, 3);
insert into CreditCard values(2222222222222222, '2-Nov-16', 'John2 Dow2', 2, 4);

--ProOrder
insert into ProOrder values(10001, 'issued', 1111111111111111, 1);
insert into ProOrder values(10002, 'sent', 1111111111111111, 1);
insert into ProOrder values(10003, 'received', 2222222222222222, 2);
insert into ProOrder values(10004, 'issued', 2222222222222222, 2);

--associate
insert into associate values(1, 3);
insert into associate values(2, 4);

--pricePerState
insert into pricePerState values('IL', 'Wine', 'Vodka', 50.0);
insert into pricePerState values('IL', 'Wine', 'Champagne', 70.0);
insert into pricePerState values('IL', 'Fruit', 'Apple', 1.0);
insert into pricePerState values('IL', 'Fruit', 'Pear', 1.5);
insert into pricePerState values('IL', 'Snake', 'Donut', 1.0);
insert into pricePerState values('IL', 'Snake', 'Cookie', 2.3);
insert into pricePerState values('IL', 'Meat', 'Chicken', 3.4);
insert into pricePerState values('IL', 'Meat', 'Beef', 5.6);
insert into pricePerState values('IL', 'Beverage', 'Coke', 1.2);
insert into pricePerState values('IL', 'Beverage', 'Fanta', 1.1);

--contain
insert into contain values(10001, 'Wine', 'Vodka', 7);
insert into contain values(10002, 'Snake', 'Donut', 4);
insert into contain values(10003, 'Meat', 'Beef', 18);
insert into contain values(10004, 'Beverage', 'Coke', 20);

--provide
insert into provide values(201, 'Wine', 'Vodka', 45.0);
insert into provide values(201, 'Meat', 'Chicken', 2.0);
insert into provide values(202, 'Fruit', 'Apple', 0.6);
insert into provide values(202, 'Beverage', 'Fanta', 0.3);

--stock
insert into stock values('Wine', 'Champagne', 1, 10000);
insert into stock values('Meat', 'Beef', 1, 4500);
insert into stock values('Meat', 'Chicken', 2, 6500);
insert into stock values('Fruit', 'Pear', 2, 3000);

commit;