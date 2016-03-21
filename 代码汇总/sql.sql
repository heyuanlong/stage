create table if not exists t2 select * from t1;
create table t3 like t1
数据库的字符串一定得加上引号

on duplicate key update只是mysql特有的语法
insert into table(a) values(10) on duplicate key update a=10;
(a为主键或unique时)

show create table table_name 可以实时查看AUTO_INCREMENT的最新值
select * from table where colum is null;
select * from table where colum is not null;


create table IF NOT EXISTS `blog`(
`blogid` INT NOT NULL AUTO_INCREMENT COMMENT '博客id',
`classid` tinyint NOT NULL default '0' COMMENT '分类id',  
`userid` INT NOT NULL default '0' COMMENT '用户id',  
`inputTime` varchar(19) NOT NULL default '0000-00-00 00:00:00' comment '插入时间',
`title` varchar(250) NOT NULL default '' COMMENT '标题',
`content` text NOT NULL COMMENT '内容',
`views` INT NOT NULL  default '0' COMMENT '阅读数',
PRIMARY KEY (`blogid`),
KEY `I_CLASS` (`classid`),
KEY `I_USER` (`userid`)
)ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
--AUTO_INCREMENT 列必须声明为 PRIMARY KEY