# Insert location
INSERT INTO `mydb`.`locations` (`country`, `city`, `street`, `number`) VALUES ('asdfs', 'asdffsd', 'asdsdf', '234');

# Insert client
INSERT INTO `mydb`.`clients` (`id`, `last_name`, `first_name`, `age`, `employees_id`) VALUES ('99', 'asdff', 'fdsa', '22', '1');

# Insert product
INSERT INTO `mydb`.`products` (`id`, `name`, `type`, `value`, `selling_price`) VALUES ('99', 'asdf', 'sdfg', '1', '2');

# Delete employee
# Change
DELETE FROM `mydb`.`employees` WHERE `id`='14';
