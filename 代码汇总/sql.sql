create table if not exists t2 select * from t1;
create table t3 like t1
数据库的字符串一定得加上引号

on duplicate key update只是mysql特有的语法
insert into table(a) values(10) on duplicate key update a=10;
(a为主键或unique时)

show create table table_name 可以实时查看AUTO_INCREMENT的最新值
select * from table where colum is null;
select * from table where colum is not null;
