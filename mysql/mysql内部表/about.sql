 select * from information_schema.columns where table_schema='ko_open' and table_name='battle_game';



select schema_name from information_schema.schemata;
select table_name from information_schema.tables where TABLE_SCHEMA="ko_open";
select column_name ,column_default from information_schema.columns where table_schema='ko_open' and table_name='battle_game';


select TABLE_SCHEMA ,table_name from information_schema.tables where table_name="server";

