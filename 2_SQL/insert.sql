--State
insert into State values('IL');
insert into State values('CA');
insert into State values('SD');

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
insert into Product values(1, 'Wine', 'Vodka', 0.2, 'Alcohol', '40%');
insert into Product values(2, 'Wine', 'Champagne', 0.2, 'Alcohol', '10%');
insert into Product values(3, 'Fruit', 'Apple', 0.1, 'Vitamins', '10%');
insert into Product values(4, 'Fruit', 'Pear', 0.1, 'Vitamins', '30%');
insert into Product values(5, 'Snake', 'Donut', 0.1, 'Calorie', '110g');
insert into Product values(6, 'Snake', 'Cookie', 0.5, 'Calorie', '10g');
insert into Product values(7, 'Meat', 'Chicken', 0.3, 'Protein', '10g');
insert into Product values(8, 'Meat', 'Beef', 0.4, 'Protein', '200g');
insert into Product values(9, 'Beverage', 'Coke', 0.1, 'Fat', '100g');
insert into Product values(10, 'Beverage', 'Fanta', 0.1, 'Fat', '125g');

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

--ShoppingCart
insert into ShoppingCart values(1, 1);
insert into ShoppingCart values(2, 2);

--ProOrder
insert into ProOrder values(10001, 'issued', 1111111111111111, 1, 1);
insert into ProOrder values(10002, 'sent', 1111111111111111, 1, 1);
insert into ProOrder values(10003, 'received', 2222222222222222, 2, 2);
insert into ProOrder values(10004, 'issued', 2222222222222222, 2, 2);

--associate
insert into associate values(1, 3);
insert into associate values(2, 4);

--pricePerState
insert into pricePerState values('IL', 1, 50.0);
insert into pricePerState values('IL', 2, 70.0);
insert into pricePerState values('IL', 3, 1.0);
insert into pricePerState values('IL', 4, 1.5);
insert into pricePerState values('IL', 5, 1.0);
insert into pricePerState values('IL', 6, 2.3);
insert into pricePerState values('IL', 7, 3.4);
insert into pricePerState values('IL', 8, 5.6);
insert into pricePerState values('IL', 9, 1.2);
insert into pricePerState values('IL', 10, 1.1);

--contain
insert into contain values(10001, 2, 7);
insert into contain values(10002, 4, 4);
insert into contain values(10003, 7, 18);
insert into contain values(10004, 1, 20);

--provide
insert into provide values(201, 'Wine', 'Vodka', 67.0);
insert into provide values(201, 'Meat', 'Chicken', 2.0);
insert into provide values(202, 'Fruit', 'Apple', 0.6);
insert into provide values(202, 'Beverage', 'Fanta', 0.3);

--stock
insert into stock values(1, 1, 10000);
insert into stock values(2, 1, 4500);
insert into stock values(3, 2, 6500);
insert into stock values(4, 2, 3000);

--pay
insert into pay values(1111111111111111, 1);
insert into pay values(2222222222222222, 2);

--include
insert into include values(1, 1, 45);
insert into include values(2, 5, 50);

commit;