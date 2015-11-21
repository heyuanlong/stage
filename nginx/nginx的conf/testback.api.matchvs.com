

server {
	listen   80;
	server_name  testback.api.matchvs.com;
	access_log  /var/log/nginx/testback.api.matchvs.com.access.log;
	error_log  /var/log/nginx/testback.api.matchvs.com.error.log info;

	root /data/matchvs.com/open/;
	index index.html index.htm;



    location = / {
        deny all;
    }
    
    location = /wc4/robot.html{

        default_type 'text/plain';
        charset UTF-8;
        index /data/matchvs.com/open/wc4/;
    }   

    location = /wc4/autoBatchInsert.do{

        default_type 'text/plain';
        charset UTF-8;
        content_by_lua_file /data/matchvs.com/open/wc4/autoBatchInsert.lua;
    }   

    location = /wc4/autoBatchQuery.do{

        default_type 'text/plain';
        charset UTF-8;
        content_by_lua_file /data/matchvs.com/open/wc4/autoBatchQuery.lua;
    }  

    location = /wc4/autoFieldQuery.do{

        default_type 'text/plain';
        charset UTF-8;
        content_by_lua_file /data/matchvs.com/open/wc4/autoFieldQuery.lua;
    } 

    location = /wc4/autoChangeStatus.do{

        default_type 'text/plain';
        charset UTF-8;
        content_by_lua_file /data/matchvs.com/open/wc4/autoChangeStatus.lua;
    } 


}
 
