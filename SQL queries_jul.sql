INSERT INTO `mydb`.`locations` (`country`, `city`, `street`, `number`) VALUES ('USA', 'Bellevue', 'Northeast Street', '4');

INSERT INTO `mydb`.`employees` (`id`, `last_name`, `first_name`, `age`, `position`, `locations_country`, `locations_city`, `locations_street`, `locations_number`, `employees_id`) VALUES ('1', 'Newell', 'Gabe', '23', 'CEO', 'USA', 'Bellevue', 'Northeast Street', '4', '1');
INSERT INTO `mydb`.`employees` (`id`, `last_name`, `first_name`, `age`, `position`, `locations_country`, `locations_city`, `locations_street`, `locations_number`, `employees_id`) VALUES ('2', 'Walker', 'Robin', '23', 'TF2 Inventor', 'USA', 'Bellevue', 'Northeast Street', '4', '1');
INSERT INTO `mydb`.`employees` (`id`, `last_name`, `first_name`, `age`, `position`, `locations_country`, `locations_city`, `locations_street`, `locations_number`, `employees_id`) VALUES ('3', 'Gates', 'Bill', '65', 'VP', 'USA', 'Bellevue', 'Northeast Street', '4', '1');
INSERT INTO `mydb`.`employees` (`id`, `last_name`, `first_name`, `age`, `position`, `locations_country`, `locations_city`, `locations_street`, `locations_number`, `employees_id`) VALUES ('4', 'Ismail', 'Abdul', '31', 'Dota Inventor', 'USA', 'Bellevue', 'Northeast Street', '4', '1');

INSERT INTO `mydb`.`products` (`id`, `name`, `type`, `value`, `selling_price`) VALUES ('1', 'Database Management Suite', 'Software', '200', '300');
INSERT INTO `mydb`.`products` (`id`, `name`, `type`, `value`, `selling_price`) VALUES ('2', 'Database Control Center', 'Software', '75', '95');
INSERT INTO `mydb`.`products` (`id`, `name`, `type`, `value`, `selling_price`) VALUES ('3', 'Database Editor', 'Software', '65', '75');
INSERT INTO `mydb`.`products` (`id`, `name`, `type`, `value`, `selling_price`) VALUES ('4', 'Database Cloud Management', 'Software', '50', '60');
INSERT INTO `mydb`.`products` (`id`, `name`, `type`, `value`, `selling_price`) VALUES ('5', 'Database Helpdesk', 'Software', '25', '30');


INSERT INTO `mydb`.`software` (`id`, `type`, `distributor`, `name`, `license_expiration`) VALUES ('1', 'IDE', 'Microsoft', 'Visual Studio Ultimate', '2016-05-06');
INSERT INTO `mydb`.`software` (`id`, `type`, `distributor`, `name`, `license_expiration`) VALUES ('2', 'Editor', 'Sublime', 'Sublime Text', '2016-12-31');
INSERT INTO `mydb`.`software` (`id`, `type`, `distributor`, `name`, `license_expiration`) VALUES ('3', 'Database Management', 'MySQL', 'MySQL Enterprise Edition', '2016-08-31');
INSERT INTO `mydb`.`software` (`id`, `type`, `distributor`, `name`, `license_expiration`) VALUES ('4', 'Image Editing', 'Adobe', 'Creative Cloud', '2015-05-31');
