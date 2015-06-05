INSERT INTO `mydb`.`locations` (`country`, `city`, `street`, `number`) VALUES ('USA', 'Bellevue', 'Northeast Street', '4');

INSERT INTO `mydb`.`employees` (`id`, `last_name`, `first_name`, `age`, `position`, `locations_country`, `locations_city`, `locations_street`, `locations_number`, `employees_id`) VALUES ('1', 'Newell', 'Gabe', '23', 'CEO', 'USA', 'Bellevue', 'Northeast Street', '4', '1');
INSERT INTO `mydb`.`employees` (`id`, `last_name`, `first_name`, `age`, `position`, `locations_country`, `locations_city`, `locations_street`, `locations_number`, `employees_id`) VALUES ('2', 'Walker', 'Robin', '23', 'TF2 Inventor', 'USA', 'Bellevue', 'Northeast Street', '4', '1');
INSERT INTO `mydb`.`employees` (`id`, `last_name`, `first_name`, `age`, `position`, `locations_country`, `locations_city`, `locations_street`, `locations_number`, `employees_id`) VALUES ('3', 'Gates', 'Bill', '65', 'VP', 'USA', 'Bellevue', 'Northeast Street', '4', '1');
INSERT INTO `mydb`.`employees` (`id`, `last_name`, `first_name`, `age`, `position`, `locations_country`, `locations_city`, `locations_street`, `locations_number`, `employees_id`) VALUES ('4', 'Ismail', 'Abdul', '31', 'Dota Inventor', 'USA', 'Bellevue', 'Northeast Street', '4', '1');

INSERT INTO `mydb`.`locations` (`country`, `city`, `street`, `number`) VALUES ('Austria', 'Graz', 'Inffeldgasse', '16');
INSERT INTO `mydb`.`locations` (`country`, `city`, `street`, `number`) VALUES ('Germany', 'Berlin', 'Hauptstrasse', '1');
INSERT INTO `mydb`.`locations` (`country`, `city`, `street`, `number`) VALUES ('USA', 'Springfield', 'Fakestreet', '123');
INSERT INTO `mydb`.`locations` (`country`, `city`, `street`, `number`) VALUES ('USA', 'Silicon Valley', 'Mountain View', '3');
INSERT INTO `mydb`.`locations` (`country`, `city`, `street`, `number`) VALUES ('Westeros', 'Winterfell', 'Main Road ', '1');

# Lo vehicles
INSERT INTO `mydb`.`vehicles` (`id`, `type`, `brand`, `model`, `date_of_purchase`, `locations_country`, `locations_city`, `locations_street`, `locations_number`) VALUES ('1', 'Limousine', 'BMW', '5 2014', '2014-05-30', 'Germany', 'Berlin', 'Hauptstrasse', '1');
INSERT INTO `mydb`.`vehicles` (`id`, `type`, `brand`, `model`, `date_of_purchase`, `locations_country`, `locations_city`, `locations_street`, `locations_number`) VALUES ('2', 'Truck', 'Dodge', 'Ram 2010', '2011-04-12', 'USA', 'Bellevue', 'Northeast Street', '4');
INSERT INTO `mydb`.`vehicles` (`id`, `type`, `brand`, `model`, `date_of_purchase`, `locations_country`, `locations_city`, `locations_street`, `locations_number`) VALUES ('3', 'Bus', 'VW', 'Multivan 2013', '2013-01-14', 'Germany', 'Berlin', 'Hauptstrasse', '1');

# Stefan employees

INSERT INTO `mydb`.`employees` (`id`, `last_name`, `first_name`, `age`, `position`, `locations_country`, `locations_city`, `locations_street`, `locations_number`, `employees_id`) VALUES ('5', 'Musterman', 'Max', '37', 'Developer', 'USA', 'Bellevue', 'Northeast Street', '4', '2');
INSERT INTO `mydb`.`employees` (`id`, `last_name`, `first_name`, `age`, `position`, `locations_country`, `locations_city`, `locations_street`, `locations_number`, `employees_id`) VALUES ('6', 'Rogrammer', 'Peter', '27', 'Graphic Designer', 'USA', 'Bellevue', 'Northeast Street', '4', '2');
INSERT INTO `mydb`.`employees` (`id`, `last_name`, `first_name`, `age`, `position`, `locations_country`, `locations_city`, `locations_street`, `locations_number`, `employees_id`) VALUES ('7', 'Dude', 'Guy', '52', 'Developer', 'USA', 'Bellevue', 'Northeast Street', '4', '2');
INSERT INTO `mydb`.`employees` (`id`, `last_name`, `first_name`, `age`, `position`, `locations_country`, `locations_city`, `locations_street`, `locations_number`, `employees_id`) VALUES ('8', 'Balmer', 'Steve', '48', 'Developer', 'USA', 'Bellevue', 'Northeast Street', '4', '2');
INSERT INTO `mydb`.`employees` (`id`, `last_name`, `first_name`, `age`, `position`, `locations_country`, `locations_city`, `locations_street`, `locations_number`, `employees_id`) VALUES ('9', 'Jobs', 'Steve', '42', 'Engineer', 'USA', 'Bellevue', 'Northeast Street', '4', '2');

INSERT INTO `mydb`.`employees` (`id`, `last_name`, `first_name`, `age`, `position`, `locations_country`, `locations_city`, `locations_street`, `locations_number`, `employees_id`) VALUES ('10', 'Burns', 'Montgomery', '122', 'Manager', 'USA', 'Springfield', 'Fakestreet', '123', '1');
INSERT INTO `mydb`.`employees` (`id`, `last_name`, `first_name`, `age`, `position`, `locations_country`, `locations_city`, `locations_street`, `locations_number`, `employees_id`) VALUES ('11', 'Simpson', 'Homer', '38', 'Safety Inspector', 'USA', 'Springfield', 'Fakestreet', '123', '10');
INSERT INTO `mydb`.`employees` (`id`, `last_name`, `first_name`, `age`, `position`, `locations_country`, `locations_city`, `locations_street`, `locations_number`, `employees_id`) VALUES ('12', 'Simpson', 'Marge', '36', 'House Wife', 'USA', 'Springfield', 'Fakestreet', '123', '10');

INSERT INTO `mydb`.`employees` (`id`, `last_name`, `first_name`, `age`, `position`, `locations_country`, `locations_city`, `locations_street`, `locations_number`, `employees_id`) VALUES ('13', 'Jörg', 'Hans', '45', 'Manager', 'Germany', 'Berlin', 'Hauptstrasse', '1', '1');
INSERT INTO `mydb`.`employees` (`id`, `last_name`, `first_name`, `age`, `position`, `locations_country`, `locations_city`, `locations_street`, `locations_number`, `employees_id`) VALUES ('14', 'Musterfrau', 'Anita', '32', 'Developer', 'Germany', 'Berlin', 'Hauptstrasse', '1', '13');

# Jul Products & Software
INSERT INTO `mydb`.`products` (`id`, `name`, `type`, `value`, `selling_price`) VALUES ('1', 'Database Management Suite', 'Software', '200', '300');
INSERT INTO `mydb`.`products` (`id`, `name`, `type`, `value`, `selling_price`) VALUES ('2', 'Database Control Center', 'Software', '75', '95');
INSERT INTO `mydb`.`products` (`id`, `name`, `type`, `value`, `selling_price`) VALUES ('3', 'Database Editor', 'Software', '65', '75');
INSERT INTO `mydb`.`products` (`id`, `name`, `type`, `value`, `selling_price`) VALUES ('4', 'Database Cloud Management', 'Software', '50', '60');
INSERT INTO `mydb`.`products` (`id`, `name`, `type`, `value`, `selling_price`) VALUES ('5', 'Database Helpdesk', 'Software', '25', '30');


INSERT INTO `mydb`.`software` (`id`, `type`, `distributor`, `name`, `license_expiration`) VALUES ('1', 'IDE', 'Microsoft', 'Visual Studio Ultimate', '2016-05-06');
INSERT INTO `mydb`.`software` (`id`, `type`, `distributor`, `name`, `license_expiration`) VALUES ('2', 'Editor', 'Sublime', 'Sublime Text', '2016-12-31');
INSERT INTO `mydb`.`software` (`id`, `type`, `distributor`, `name`, `license_expiration`) VALUES ('3', 'Database Management', 'MySQL', 'MySQL Enterprise Edition', '2016-08-31');
INSERT INTO `mydb`.`software` (`id`, `type`, `distributor`, `name`, `license_expiration`) VALUES ('4', 'Image Editing', 'Adobe', 'Creative Cloud', '2015-05-31');

INSERT INTO `mydb`.`clients` (`id`, `last_name`, `first_name`, `age`, `employees_id`) VALUES ('1', 'Lannister', 'Tyrion', '28', '3');
INSERT INTO `mydb`.`clients` (`id`, `last_name`, `first_name`, `age`, `employees_id`) VALUES ('2', 'Stark', 'Arya', '12', '6');
INSERT INTO `mydb`.`clients` (`id`, `last_name`, `first_name`, `age`, `employees_id`) VALUES ('3', 'Snow', 'Jon', '20', '12');
INSERT INTO `mydb`.`clients` (`id`, `last_name`, `first_name`, `age`, `employees_id`) VALUES ('4', 'Tarth', 'Brianne', '26', '8');
INSERT INTO `mydb`.`clients` (`id`, `last_name`, `first_name`, `age`, `employees_id`) VALUES ('5', 'Lannister', 'Cersei', '34', '1');
INSERT INTO `mydb`.`clients` (`id`, `last_name`, `first_name`, `age`, `employees_id`) VALUES ('6', 'NoName', 'Mellisandre', '33', '10');
INSERT INTO `mydb`.`clients` (`id`, `last_name`, `first_name`, `age`, `employees_id`) VALUES ('7', 'Tarly', 'Sam', '22', '9');
INSERT INTO `mydb`.`clients` (`id`, `last_name`, `first_name`, `age`, `employees_id`) VALUES ('8', 'Bolton', 'Ramsay', '25', '14');
INSERT INTO `mydb`.`clients` (`id`, `last_name`, `first_name`, `age`, `employees_id`) VALUES ('9', 'Baratheon', 'Stannis', '42', '12');
INSERT INTO `mydb`.`clients` (`id`, `last_name`, `first_name`, `age`, `employees_id`) VALUES ('10', 'Tyrell', 'Loras', '26', '1');

INSERT INTO `mydb`.`sales` (`id`, `date`, `price`, `employees_id`, `clients_id`) VALUES ('1', '2002-07-20', '20', '2', '6');
INSERT INTO `mydb`.`sales` (`id`, `date`, `price`, `employees_id`, `clients_id`) VALUES ('2', '2009-03-20', '43500', '7', '1');
INSERT INTO `mydb`.`sales` (`id`, `date`, `price`, `employees_id`, `clients_id`) VALUES ('3', '2014-12-20', '76500', '5', '5');
INSERT INTO `mydb`.`sales` (`id`, `date`, `price`, `employees_id`, `clients_id`) VALUES ('4', '2003-01-20', '8034', '8', '6');
INSERT INTO `mydb`.`sales` (`id`, `date`, `price`, `employees_id`, `clients_id`) VALUES ('5', '2009-05-20', '3456', '1', '9');
INSERT INTO `mydb`.`sales` (`id`, `date`, `price`, `employees_id`, `clients_id`) VALUES ('6', '2007-09-20', '23678', '2', '10');
INSERT INTO `mydb`.`sales` (`id`, `date`, `price`, `employees_id`, `clients_id`) VALUES ('7', '2007-06-20', '41768', '3', '8');

INSERT INTO `mydb`.`sale_has_products` (`sales_id`, `products_id`, `number_of_product`) VALUES ('1', '2', '5');
INSERT INTO `mydb`.`sale_has_products` (`sales_id`, `products_id`, `number_of_product`) VALUES ('2', '4', '1');
INSERT INTO `mydb`.`sale_has_products` (`sales_id`, `products_id`, `number_of_product`) VALUES ('3', '1', '2');
INSERT INTO `mydb`.`sale_has_products` (`sales_id`, `products_id`, `number_of_product`) VALUES ('4', '5', '4');
INSERT INTO `mydb`.`sale_has_products` (`sales_id`, `products_id`, `number_of_product`) VALUES ('5', '2', '4');
INSERT INTO `mydb`.`sale_has_products` (`sales_id`, `products_id`, `number_of_product`) VALUES ('6', '1', '3');
INSERT INTO `mydb`.`sale_has_products` (`sales_id`, `products_id`, `number_of_product`) VALUES ('7', '5', '2');

INSERT INTO `mydb`.`sold_at` (`products_id`, `locations_country`, `locations_city`, `locations_street`, `locations_number`) VALUES ('2', 'Austria', 'Graz', 'Inffeldgasse', '16');
INSERT INTO `mydb`.`sold_at` (`products_id`, `locations_country`, `locations_city`, `locations_street`, `locations_number`) VALUES ('5', 'Germany', 'Berlin', 'Hauptstrasse', '1');
INSERT INTO `mydb`.`sold_at` (`products_id`, `locations_country`, `locations_city`, `locations_street`, `locations_number`) VALUES ('3', 'Westeros', 'Winterfell', 'Main Road', '1');
INSERT INTO `mydb`.`sold_at` (`products_id`, `locations_country`, `locations_city`, `locations_street`, `locations_number`) VALUES ('2', 'Germany', 'Berlin', 'Hauptstrasse', '1');
INSERT INTO `mydb`.`sold_at` (`products_id`, `locations_country`, `locations_city`, `locations_street`, `locations_number`) VALUES ('4', 'USA', 'Springfield', 'Fakestreet', '123');
INSERT INTO `mydb`.`sold_at` (`products_id`, `locations_country`, `locations_city`, `locations_street`, `locations_number`) VALUES ('1', 'Westeros', 'Winterfell', 'Main Road', '1');

INSERT INTO `mydb`.`devices` (`id`, `type`, `brand`, `date_of_purchase`, `locations_country`, `locations_city`, `locations_street`, `locations_number`) VALUES ('1', 'Laptop', 'HP', '2014-07-24', 'Austria', 'Graz', 'Inffeldgasse', '16');
INSERT INTO `mydb`.`devices` (`id`, `type`, `brand`, `date_of_purchase`, `locations_country`, `locations_city`, `locations_street`, `locations_number`) VALUES ('2', 'Smartphone', 'HTC', '2012-09-01', 'USA', 'Silicon Valley', 'Mountain View', '3');
INSERT INTO `mydb`.`devices` (`id`, `type`, `brand`, `date_of_purchase`, `locations_country`, `locations_city`, `locations_street`, `locations_number`) VALUES ('3', 'PC', 'Dell', '2000-10-12', 'Westeros', 'Winterfell', 'Main Road', '1');
INSERT INTO `mydb`.`devices` (`id`, `type`, `brand`, `date_of_purchase`, `locations_country`, `locations_city`, `locations_street`, `locations_number`) VALUES ('4', 'PC', 'Fujitsu', '2013-03-05', 'Germany', 'Berlin', 'Hauptstrasse', '1');
INSERT INTO `mydb`.`devices` (`id`, `type`, `brand`, `date_of_purchase`, `locations_country`, `locations_city`, `locations_street`, `locations_number`) VALUES ('5', 'Smartphone', 'Samsung', '2015-01-01', 'Austria', 'Graz', 'Inffeldgasse', '16');
INSERT INTO `mydb`.`devices` (`id`, `type`, `brand`, `date_of_purchase`, `locations_country`, `locations_city`, `locations_street`, `locations_number`) VALUES ('6', 'Laptop', 'Sony', '2012-02-07', 'Westeros', 'Winterfell', 'Main Road', '1');
INSERT INTO `mydb`.`devices` (`id`, `type`, `brand`, `date_of_purchase`, `locations_country`, `locations_city`, `locations_street`, `locations_number`) VALUES ('7', 'PC', 'MacBook', '2014-01-02', 'USA', 'Bellevue', 'Northeast Street', '4');

INSERT INTO `mydb`.`employee_used_vehicles` (`employees_id`, `vehicles_id`, `date_used`) VALUES ('2', '2', '2012-03-04');
INSERT INTO `mydb`.`employee_used_vehicles` (`employees_id`, `vehicles_id`, `date_used`) VALUES ('5', '1', '2014-06-01');
INSERT INTO `mydb`.`employee_used_vehicles` (`employees_id`, `vehicles_id`, `date_used`) VALUES ('2', '3', '2014-02-05');
INSERT INTO `mydb`.`employee_used_vehicles` (`employees_id`, `vehicles_id`, `date_used`) VALUES ('3', '1', '2011-05-23');
INSERT INTO `mydb`.`employee_used_vehicles` (`employees_id`, `vehicles_id`, `date_used`) VALUES ('14', '3', '2013-09-12');
INSERT INTO `mydb`.`employee_used_vehicles` (`employees_id`, `vehicles_id`, `date_used`) VALUES ('10', '2', '2012-02-16');
INSERT INTO `mydb`.`employee_used_vehicles` (`employees_id`, `vehicles_id`, `date_used`) VALUES ('8', '2', '2013-07-19');
INSERT INTO `mydb`.`employee_used_vehicles` (`employees_id`, `vehicles_id`, `date_used`) VALUES ('9', '1', '2014-10-24');

INSERT INTO `mydb`.`employee_uses_devices` (`devices_id`, `employees_id`) VALUES ('1', '5');
INSERT INTO `mydb`.`employee_uses_devices` (`devices_id`, `employees_id`) VALUES ('2', '3');
INSERT INTO `mydb`.`employee_uses_devices` (`devices_id`, `employees_id`) VALUES ('1', '6');
INSERT INTO `mydb`.`employee_uses_devices` (`devices_id`, `employees_id`) VALUES ('2', '7');
INSERT INTO `mydb`.`employee_uses_devices` (`devices_id`, `employees_id`) VALUES ('4', '2');
INSERT INTO `mydb`.`employee_uses_devices` (`devices_id`, `employees_id`) VALUES ('5', '7');
INSERT INTO `mydb`.`employee_uses_devices` (`devices_id`, `employees_id`) VALUES ('6', '8');
