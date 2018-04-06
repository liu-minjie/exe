create database activity;

create table user(
	id int(12) not null auto_increment,
	name varchar(256) not null,
	primary key (id)
);
insert into user(name) value('user_a');
insert into user(name) value('user_b');

create table activity(
	id int(12) not null auto_increment,
	name varchar(256) not null,
	primary key (id)
);
insert into activity(name) value('act_a');
insert into activity(name) value('act_b');
insert into activity(name) value('act_c');


create table activity_sign(
	id int(12) not null auto_increment,
	user_id int(12) not null,
	act_id int(12) not null,
	primary key (id)
);
-- alter table activity_sign drop column id
-- alter table activity_sign drop primary key
-- alter table activity_sign add primary key(user_id, act_id)
-- 用户 a 加入了 a b c 3个活动
insert into activity_sign(user_id, act_id) value(1, 1);
insert into activity_sign(user_id, act_id) value(1, 2);
insert into activity_sign(user_id, act_id) value(1, 3);

create table activity_subscribe(
	id int(12) not null auto_increment,
	user_id int(12) not null,
	act_id int(12) not null,
	primary key (user_id, act_id)
);
-- alter table activity_subscribe drop column id
-- alter table activity_subscribe drop primary key
-- alter table activity_subscribe add primary key(user_id, act_id)
-- 用户 a  关注了 a b 活动
insert into activity_subscribe(user_id, act_id) value(1, 1);
insert into activity_subscribe(user_id, act_id) value(1, 2);
-- 用户 b  关注了 a  活动
insert into activity_subscribe(user_id, act_id) value(2, 1);

-- 选出用户 a 参加的活动, 并选出对应活动的关注人数
select sign.act_id, count(sub.act_id) sub
from activity_sign sign 
left join activity_subscribe sub on sign.act_id = sub.act_id
where  sign.user_id = 1
group by sign.act_id;


-- 选出用户 a 参加的活动, 并选出对应活动加入的人数
select sign.act_id, count(s.act_id) sign
from activity_sign sign 
left join activity_sign s on sign.act_id = s.act_id
where  sign.user_id = 1
group by sign.act_id;

insert into activity_sign(user_id, act_id) value(2, 1);




select sign.act_id, count(sub.user_id) as sub_uid, count(s.user_id) as sign_uid
from activity_sign sign
left join activity_subscribe sub on sign.act_id = sub.act_id
left join activity_sign s on sign.act_id = s.act_id
where sign.user_id = 1
group by sign.act_id;




-- 选出用户 a 参加的活动, 并选出对应活动加入人数和关注人数
-- 能不用子查询不 ???
select act_sign.act_id, act_sign.sign_count, count(sub.act_id) from
(select sign.act_id, count(s.act_id) as sign_count
from activity_sign sign 
left join activity_sign s on sign.act_id = s.act_id
where  sign.user_id = 1
group by sign.act_id) act_sign
left join activity_subscribe sub on act_sign.act_id = sub.act_id
group by act_sign.act_id;