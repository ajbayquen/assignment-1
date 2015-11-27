-- Problem 1

DROP DATABASE `buildingenergy`;

CREATE DATABASE `buildingenergy`;

-- Problem 2

drop table if exists `buildingenergy`.`energy_categories`;
drop table if exists `buildingenergy`.`energy_types`;

CREATE TABLE `buildingenergy`.`energy_categories` (
  `Cat_ID` INT NOT NULL,
  `Energy_Cat_Desc` VARCHAR(60) NULL,
  UNIQUE INDEX `Cat_ID_UNIQUE` (`Cat_ID` ASC),
  PRIMARY KEY (`Cat_ID`));

CREATE TABLE `buildingenergy`.`energy_types` (
  `Type_ID` INT NOT NULL,
  `Cat_ID` INT NOT NULL,
  `Energy_Type_Desc` VARCHAR(60) NULL,
  PRIMARY KEY (`Type_ID`, `Cat_ID`),
  UNIQUE INDEX `Type_ID_UNIQUE` (`Type_ID` ASC),
  INDEX `Cat_ID_idx` (`Cat_ID` ASC),
  CONSTRAINT `Cat_ID`
    FOREIGN KEY (`Cat_ID`)
    REFERENCES `buildingenergy`.`energy_categories` (`Cat_ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);
    
INSERT INTO `buildingenergy`.`energy_categories` (`Cat_ID`, `Energy_Cat_Desc`) VALUES (1, 'Fossil');
INSERT INTO `buildingenergy`.`energy_categories` (`Cat_ID`, `Energy_Cat_Desc`) VALUES (2, 'Renewable');

INSERT INTO `buildingenergy`.`energy_types` (`Type_ID`, `Cat_ID`, `Energy_Type_Desc`) VALUES (1, 1, 'Electricity');
INSERT INTO `buildingenergy`.`energy_types` (`Type_ID`, `Cat_ID`, `Energy_Type_Desc`) VALUES (2, 1, 'Gas');
INSERT INTO `buildingenergy`.`energy_types` (`Type_ID`, `Cat_ID`, `Energy_Type_Desc`) VALUES (3, 1, 'Steam');
INSERT INTO `buildingenergy`.`energy_types` (`Type_ID`, `Cat_ID`, `Energy_Type_Desc`) VALUES (4, 1, 'Fuel');
INSERT INTO `buildingenergy`.`energy_types` (`Type_ID`, `Cat_ID`, `Energy_Type_Desc`) VALUES (5, 1, 'Oil');
INSERT INTO `buildingenergy`.`energy_types` (`Type_ID`, `Cat_ID`, `Energy_Type_Desc`) VALUES (6, 2, 'Solar');
INSERT INTO `buildingenergy`.`energy_types` (`Type_ID`, `Cat_ID`, `Energy_Type_Desc`) VALUES (7, 2, 'Wind');


-- Problem 3

select Energy_Cat_Desc, Type_ID, Energy_Type_Desc  
from `buildingenergy`.`energy_categories` c
left join `buildingenergy`.`energy_types` t
on c.Cat_ID = t.Cat_ID;


-- Problem 4

drop table if exists  `buildingenergy`.`building`;
drop table if exists `buildingenergy`.`build_energy`;

CREATE TABLE `buildingenergy`.`building` (
  `build_id` INT NOT NULL,
  `build_name` VARCHAR(60) NULL,
  PRIMARY KEY (`build_id`),
  UNIQUE INDEX `build_id_UNIQUE` (`build_id` ASC));

CREATE TABLE `buildingenergy`.`build_energy` (
  `build_id` INT NOT NULL,
  `Type_id` INT NOT NULL,
  PRIMARY KEY (`build_id`, `Type_id`),
  INDEX `Type_ID_x_idx` (`Type_id` ASC),
  CONSTRAINT `build_id_x`
    FOREIGN KEY (`build_id`)
    REFERENCES `buildingenergy`.`building` (`build_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `Type_ID_x`
    FOREIGN KEY (`Type_id`)
    REFERENCES `buildingenergy`.`energy_types` (`Type_ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);
    
    
INSERT INTO `buildingenergy`.`building` (`build_id`, `build_name`) VALUES (1, 'Empire State Building');
INSERT INTO `buildingenergy`.`building` (`build_id`, `build_name`) VALUES (2, 'Chrysler Building');
INSERT INTO `buildingenergy`.`building` (`build_id`, `build_name`) VALUES (3, 'Borough of Manhattan Community College');


INSERT INTO `buildingenergy`.`build_energy` (`build_id`, `Type_id`) VALUES (1, 1);
INSERT INTO `buildingenergy`.`build_energy` (`build_id`, `Type_id`) VALUES (1, 2);
INSERT INTO `buildingenergy`.`build_energy` (`build_id`, `Type_id`) VALUES (1, 3);
INSERT INTO `buildingenergy`.`build_energy` (`build_id`, `Type_id`) VALUES (2, 1);
INSERT INTO `buildingenergy`.`build_energy` (`build_id`, `Type_id`) VALUES (2, 3);
INSERT INTO `buildingenergy`.`build_energy` (`build_id`, `Type_id`) VALUES (3, 1);
INSERT INTO `buildingenergy`.`build_energy` (`build_id`, `Type_id`) VALUES (3, 3);
INSERT INTO `buildingenergy`.`build_energy` (`build_id`, `Type_id`) VALUES (3, 6);



-- Problem 5

select build_name, Energy_Type_Desc
from `buildingenergy`.`build_energy` be
left outer join `buildingenergy`.`building` b
on be.build_id = b.build_id
left outer join `buildingenergy`.`energy_types` e
on be.Type_id = e.Type_ID;


-- Problem 6

INSERT INTO `buildingenergy`.`building` (`build_id`, `build_name`) VALUES (4, 'Bronx Lion House');
INSERT INTO `buildingenergy`.`building` (`build_id`, `build_name`) VALUES (5, 'Brooklyn Childrens Museum');
INSERT INTO `buildingenergy`.`energy_types` (`Type_ID`, `Cat_ID`, `Energy_Type_Desc`) VALUES (8, 2, 'Geothermal');

INSERT INTO `buildingenergy`.`build_energy` (`build_id`, `Type_id`) VALUES (4, 8);
INSERT INTO `buildingenergy`.`build_energy` (`build_id`, `Type_id`) VALUES (5, 1);
INSERT INTO `buildingenergy`.`build_energy` (`build_id`, `Type_id`) VALUES (5, 8);

-- Problem 7

select build_name, Energy_Type_Desc, Energy_Cat_Desc
from `buildingenergy`.`energy_types` e, `buildingenergy`.`building` b, `buildingenergy`.`build_energy` be, `buildingenergy`.`energy_categories` c
where be.build_id = b.build_id and
      be.Type_id = e.Type_ID and
      e.Cat_ID = c.Cat_ID and
      e.Cat_ID = 2;

-- Problem 8

select e.Type_ID, e.Energy_Type_Desc, (select count(*) from `buildingenergy`.`build_energy` be where be.Type_id = e.Type_ID) as 'frequency (buildings)'
  from `buildingenergy`.`energy_types` e 
  group by e.Type_ID, e.Energy_Type_Desc;




