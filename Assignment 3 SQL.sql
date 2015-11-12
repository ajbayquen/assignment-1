
drop table if exists `key_card_access`.`group_room_access`;
drop table if exists `key_card_access`.`user`; 
drop table if exists `key_card_access`.`room`;
drop table if exists `key_card_access`.`group`;

CREATE TABLE `key_card_access`.`group` (
  `group_id` INT NOT NULL,
  `group_name` VARCHAR(45) NULL,
  PRIMARY KEY (`group_id`));
  
  CREATE TABLE `key_card_access`.`user` (
  `user_id` INT NOT NULL,
  `group_name` VARCHAR(45) NULL,
  `group_id` INT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `group_id_idx` (`group_id` ASC),
  CONSTRAINT `group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `key_card_access`.`group` (`group_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
ALTER TABLE `key_card_access`.`user` 
CHANGE COLUMN `group_name` `user_name` VARCHAR(45) NULL DEFAULT NULL ;

CREATE TABLE `key_card_access`.`room` (
  `room_id` INT NOT NULL,
  `room_name` VARCHAR(45) NULL,
  PRIMARY KEY (`room_id`));

CREATE TABLE `key_card_access`.`group_room_access` (
  `group_id` INT NOT NULL,
  `room_id` INT NOT NULL,
  PRIMARY KEY (`group_id`, `room_id`),
  INDEX `room_id_idx` (`room_id` ASC),
  CONSTRAINT `access_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `key_card_access`.`group` (`group_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `access_room_id`
    FOREIGN KEY (`room_id`)
    REFERENCES `key_card_access`.`room` (`room_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

INSERT INTO `key_card_access`.`group` (`group_id`, `group_name`) VALUES ('1', 'IT');
INSERT INTO `key_card_access`.`group` (`group_id`, `group_name`) VALUES ('2', 'Sales');
INSERT INTO `key_card_access`.`group` (`group_id`, `group_name`) VALUES ('3', 'Administration');
INSERT INTO `key_card_access`.`group` (`group_id`, `group_name`) VALUES ('4', 'Operations');

INSERT INTO `key_card_access`.`user` (`user_id`, `user_name`, `group_id`) VALUES ('1', 'Modesto', '1');
INSERT INTO `key_card_access`.`user` (`user_id`, `user_name`, `group_id`) VALUES ('2', 'Ayine', '1');
INSERT INTO `key_card_access`.`user` (`user_id`, `user_name`, `group_id`) VALUES ('3', 'Christopher', '2');
INSERT INTO `key_card_access`.`user` (`user_id`, `user_name`, `group_id`) VALUES ('4', 'Cheong Woo', '2');
INSERT INTO `key_card_access`.`user` (`user_id`, `user_name`, `group_id`) VALUES ('5', 'Saulat', '3');
INSERT INTO `key_card_access`.`user` (`user_id`, `user_name`) VALUES ('6', 'Heidy');

INSERT INTO `key_card_access`.`room` (`room_id`, `room_name`) VALUES ('1', '101');
INSERT INTO `key_card_access`.`room` (`room_id`, `room_name`) VALUES ('2', '102');
INSERT INTO `key_card_access`.`room` (`room_id`, `room_name`) VALUES ('3', 'Auditorium A');
INSERT INTO `key_card_access`.`room` (`room_id`, `room_name`) VALUES ('4', 'Auditorium B');


INSERT INTO `key_card_access`.`group_room_access` (`group_id`, `room_id`) VALUES ('1', '1');
INSERT INTO `key_card_access`.`group_room_access` (`group_id`, `room_id`) VALUES ('1', '2');
INSERT INTO `key_card_access`.`group_room_access` (`group_id`, `room_id`) VALUES ('2', '2');
INSERT INTO `key_card_access`.`group_room_access` (`group_id`, `room_id`) VALUES ('2', '3');

SELECT g.group_name, u.user_name
from key_card_access.group g 
left join key_card_access.user u
on g.group_id = u.group_id; 

select * from room;  

SELECT r.room_name, g.group_name
from key_card_access.group_room_access a 
right outer join key_card_access.room r
on a.room_id = r.room_id
left outer join key_card_access.group g
on a.group_id = g.group_id; 


SELECT u.user_name, g.group_name, r.room_name
from key_card_access.user u 
left outer join key_card_access.group g
on u.group_id = g.group_id
left outer join  key_card_access.group_room_access a
on g.group_id = a.group_id 
left outer join key_card_access.room r
on a.room_id = r.room_id
order by 1, 2, 3; 

    