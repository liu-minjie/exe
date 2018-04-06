-- terminal1:
create table tab_no_index(
	id int,
	name varchar(10)
) engine=innodb;
insert into tab_no_index values(1,'1'),(2,'2'),(3,'3'),(4,'4');
set autocommit=0;
select * from tab_no_index where id = 1 for update;


-- terminal2:
set autocommit=0;
select * from tab_no_index where id = 2 for update; -- 这里会等 terminal1 执行 commit