create table percent (
	addr varchar(256),
	value varchar(256)
);
alter table percent modify addr varchar(256) character set utf8;
insert into percent values('江苏省', 'js'),('江苏省扬州市江都区', 'jsyzjd'),('江苏省扬州市', 'jsyz'),('', 'default');
select value from percent
where '江苏省扬州市高邮镇' like concat(addr, '%')
order by char_length(addr) desc limit 1;