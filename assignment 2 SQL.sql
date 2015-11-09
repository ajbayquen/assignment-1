

DROP TABLE IF EXISTS mysql_videos;
DROP TABLE IF EXISTS mysql_reviewers;


CREATE TABLE `videos`.`mysql_videos` (
  `video_id` INT NOT NULL,
  `video_title` VARCHAR(45) NULL,
  `video_length` INT NULL,
  `video_url` TINYTEXT NULL,
  PRIMARY KEY (`video_id`),
  UNIQUE INDEX `mysql_videoscol_UNIQUE` (`video_id` ASC));
  
  
INSERT INTO `videos`.`mysql_videos` (`video_id`, `video_title`, `video_length`, `video_url`) VALUES ('001', 'MySQL Tutorial', '1', 'https://www.youtube.com/watch?v=yPu6qV5byu4');
INSERT INTO `videos`.`mysql_videos` (`video_id`, `video_title`, `video_length`, `video_url`) VALUES ('002', 'SQL Introduction to Basics (Lesson 1)', '31', 'https://www.youtube.com/watch?v=pJCyTBkoIKA');
INSERT INTO `videos`.`mysql_videos` (`video_id`, `video_title`, `video_length`, `video_url`) VALUES ('003 ', 'MySQL Workbench Tutorial', '14', 'https://www.youtube.com/watch?v=X_umYKqKaF0');
INSERT INTO `videos`.`mysql_videos` (`video_id`, `video_title`, `video_length`, `video_url`) VALUES ('004', 'Creating and Querying a Database Schema', '19', 'https://www.youtube.com/watch?v=EL39BGSUkzw');
INSERT INTO `videos`.`mysql_videos` (`video_id`, `video_title`, `video_length`, `video_url`) VALUES ('005', 'Connection Creation and Troubleshooting', '24', 'https://www.youtube.com/watch?v=DCgRF4KOYIY');

    
 CREATE TABLE `videos`.`mysql_reviewers` (
  `reviewer_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `rating` INT NULL,
  `review` TINYTEXT NULL,
  PRIMARY KEY (`reviewer_id`, `video_id`),
  INDEX `video_id_idx` (`video_id` ASC),
  CONSTRAINT `video_id`
    FOREIGN KEY (`video_id`)
    REFERENCES `videos`.`mysql_videos` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);  
    
     
INSERT INTO `videos`.`mysql_reviewers` (`reviewer_id`, `video_id`, `name`, `rating`, `review`) VALUES ('1', '5', 'Roger Ebert', '5', 'Excellent');
INSERT INTO `videos`.`mysql_reviewers` (`reviewer_id`, `video_id`, `name`, `rating`, `review`) VALUES ('2', '4', 'Gene Siskel', '3', 'Average');
INSERT INTO `videos`.`mysql_reviewers` (`reviewer_id`, `video_id`, `name`, `rating`, `review`) VALUES ('1', '1', 'Roger Ebert', '1', 'Needs Improvement');
INSERT INTO `videos`.`mysql_reviewers` (`reviewer_id`, `video_id`, `name`, `rating`, `review`) VALUES ('3', '2', 'Emilio Zapata', '1', 'Unviewable');
INSERT INTO `videos`.`mysql_reviewers` (`reviewer_id`, `video_id`, `name`, `rating`, `review`) VALUES ('4', '2', 'Fred Jones', '2', 'Very Good'); 


SELECT v.video_title, v.video_length, r.name, r.rating, r.review, v.video_url
FROM videos.mysql_videos v
JOIN videos.mysql_reviewers r
ON v.video_id = r.video_id;

SELECT v.video_title, v.video_length, r.name, r.rating, r.review, v.video_url
FROM videos.mysql_videos v
LEFT JOIN videos.mysql_reviewers r
ON v.video_id = r.video_id;

SELECT v.video_title, v.video_length, r.name, r.rating, r.review, v.video_url
FROM videos.mysql_videos v
RIGHT JOIN videos.mysql_reviewers r
ON v.video_id = r.video_id;

SELECT v.video_title, v.video_length, r.name, r.rating, r.review, v.video_url
FROM videos.mysql_videos v
LEFT JOIN videos.mysql_reviewers r
ON v.video_id = r.video_id
UNION 
SELECT v.video_title, v.video_length, r.name, r.rating, r.review, v.video_url
FROM videos.mysql_videos v
RIGHT JOIN videos.mysql_reviewers r
ON v.video_id = r.video_id;


