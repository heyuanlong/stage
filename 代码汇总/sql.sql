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





desc information_schema.tables; --存储数据库的表信息
mysql> desc information_schema.tables;
+-----------------+---------------------+------+-----+---------+-------+
| Field           | Type                | Null | Key | Default | Extra |
+-----------------+---------------------+------+-----+---------+-------+
| TABLE_CATALOG   | varchar(512)        | YES  |     | NULL    |       |
| TABLE_SCHEMA    | varchar(64)         | NO   |     |         |       |
| TABLE_NAME      | varchar(64)         | NO   |     |         |       |
| TABLE_TYPE      | varchar(64)         | NO   |     |         |       |
| ENGINE          | varchar(64)         | YES  |     | NULL    |       |
| VERSION         | bigint(21) unsigned | YES  |     | NULL    |       |
| ROW_FORMAT      | varchar(10)         | YES  |     | NULL    |       |
| TABLE_ROWS      | bigint(21) unsigned | YES  |     | NULL    |       |
| AVG_ROW_LENGTH  | bigint(21) unsigned | YES  |     | NULL    |       |
| DATA_LENGTH     | bigint(21) unsigned | YES  |     | NULL    |       |
| MAX_DATA_LENGTH | bigint(21) unsigned | YES  |     | NULL    |       |
| INDEX_LENGTH    | bigint(21) unsigned | YES  |     | NULL    |       |
| DATA_FREE       | bigint(21) unsigned | YES  |     | NULL    |       |
| AUTO_INCREMENT  | bigint(21) unsigned | YES  |     | NULL    |       |
| CREATE_TIME     | datetime            | YES  |     | NULL    |       |
| UPDATE_TIME     | datetime            | YES  |     | NULL    |       |
| CHECK_TIME      | datetime            | YES  |     | NULL    |       |
| TABLE_COLLATION | varchar(32)         | YES  |     | NULL    |       |
| CHECKSUM        | bigint(21) unsigned | YES  |     | NULL    |       |
| CREATE_OPTIONS  | varchar(255)        | YES  |     | NULL    |       |
| TABLE_COMMENT   | varchar(80)         | NO   |     |         |       |

