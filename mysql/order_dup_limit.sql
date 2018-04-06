create table glon(  
  id int not null auto_increment primary key,  
  name varchar(20) not null,  
  create_time datetime not null,  
  age tinyint unsigned default 18  
);

INSERT INTO `glon` VALUES (1, 'Eason Chan', '2017-05-02 08:10:10', 19),(2, 'Glon Ho', '2017-05-03 12:10:10', 18),(3, '赵敏', '2017-05-03 14:10:10', 17),(4, 'Jacky Cheung', '2017-05-02 14:00:00', 22),(5, '周芷若', '2017-05-02 14:00:00', 16),(6, 'Andy Lau', '2017-05-02 14:00:00', 50),(7, '至尊宝', '2017-05-02 14:00:00', 20),(8, '刘三姐', '2017-05-02 14:00:00', 19);
ALTER TABLE `glon` CHANGE `name` `name` VARCHAR(20) CHARACTER SET utf8 NOT NULL;
select * from glon oder by create_time limit 0,4
select * from glon oder by create_time limit 4,4