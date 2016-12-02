--Address
insert into address values(1, 'King Dr', 'Chicago', 'IL', 60616, 'delivery');
insert into address values(2, 'China Pl', 'Chicago', 'IL', 60616, 'delivery');

insert into address values(3, 'King Dr', 'Chicago', 'IL', 60616, 'payment');
insert into address values(4, 'China Pl', 'Chicago', 'IL', 60616, 'payment');

insert into address values(5, 'Federal Street', 'Chicago', 'IL', 60616, 'product');
insert into address values(6, 'Michgan Street', 'Chicago', 'IL', 60616, 'product');

insert into address values(7, 'King Dr', 'Chicago', 'IL', 60616, 'staff');
insert into address values(8, 'China Pl', 'Chicago', 'IL', 60616, 'staff');

insert into address values(9, 'Federal Street', 'Chicago', 'IL', 60616, 'supplier');
insert into address values(10, 'Michgan Street', 'Chicago', 'IL', 60616, 'supplier');

--Info
insert into Info values('Alcohol', '40%');
insert into Info values('Alcohol', '10%');
insert into Info values('Vitamins', '1%');
insert into Info values('Vitamins', '10%');
insert into Info values('Calorie', '110g');
insert into Info values('Calorie', '0g');	


--Staff
insert into Staff values(101, 'Manager', 'John1', 'Dory1', 7);
insert into Staff values(102, 'Assistant Manager', 'John2', 'Dory2', 8);

--Product
insert into Product values('Snake', 'Cookie', 0.5, 'Vitamins', '1%');
insert into Product values('Fruit', 'Apple', 0.1, 'Vitamins', '10%');
insert into Product values('Vegetable', 'Cabbage', 0.2, 'Calorie', '0g');

--Customer
insert into Customer values(1, 1.00, 'John1', 'Dow1');
insert into Customer values(2, 2.00, 'John2', 'Dow2');



commit;