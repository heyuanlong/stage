#include <string>
#include <map>
class long_http
{
public:
	long_http();
	~long_http();

	struct request
	{
		std::string method;								//请求方法
		bool have_s;									//https://
		std::string host;								//www.baidu.com
		std::string path;								//   /ht/kkk/Update.php
		std::map<std::string,std::string> urlparam;		//?wd=asfr&rsv_spt=1&issp=1
		std::string procol;								//HTTP/1.1
		std::map<std::string,std::string> headparam;	//
		std::map<std::string,std::string> cookieparam;	//Cookie: sid=YMpI=456; oprId=oe7 68; _d15-121=1; ki_r=; foe=ie
		std::string body;								//body
	};
	bool set_resquest_method(const char*);
	bool set_resquest_httphaves(bool);
	bool set_resquest_host(const char*);
	bool set_resquest_path(const char*);
	bool set_resquest_urlparam(const char*,const char*);
	bool set_resquest_procol(const char*);
	bool set_resquest_headparam(const char*,const char*);
	bool set_resquest_cookie(const char*,const char*);
	bool set_resquest_body(const char *);

	bool get_resquest_method(std::string *);
	bool get_resquest_httphaves();
	bool get_resquest_host(std::string *);
	bool get_resquest_path(std::string *);
	bool get_resquest_urlparam(const char*,std::string *);
	bool get_resquest_procol(char*);
	bool get_resquest_headparam(const char*,std::string *);
	bool get_resquest_cookie(const char*,std::string *);
	bool get_resquest_body(std::string  *);
	bool clear_resquest();


	bool parse_resquest_Request(const char *);
	bool packet_resquest_Request(std::string  *);
	struct request mrequest_struct;


	struct response
	{
	std::string procol;								//HTTP/1.1
	int statuscode;									// 200
	std::string statusdes;							// ok
	std::map<std::string,std::string> headparam;	//
	std::map<std::string,std::string> cookieparam;	//Set-Cookie: sid=dB0E=; expires=Sun, 31-Aug-2025 12:19:00 GMT
	std::string body;								// body
	};

	bool set_response_procol(const char*);
	bool set_response_StatusCode(int );
	bool set_response_StatusDes(const char*);
	bool set_response_headparam(const char*,const char*);
	bool set_response_cookie(const char*,const char*);
	bool set_response_body(const char *);

	bool get_response_procol(std::string *);
	int get_response_StatusCode();
	bool get_response_StatusDes(std::string *);
	bool get_response_headparam(const char*,std::string *);
	bool get_response_cookie(const char*,std::string *);
	bool get_response_body(std::string  *);
	bool clear_response();

	bool parse_response_Request(const char *);
	bool packet_response_Request(std::string *);
	struct request mresponse_struct;


private:
	bool deal_request_url(std::string &);
	bool deal_request_cookie(std::string &str);
};













/*


GET http://www.telerik.com/UpdateCheck.aspx?isBeta=False HTTP/1.1
User-Agent: Fiddler/2.5.1.2 (.NET 2.0.50727.5466; WinNT 6.1.7601 SP1; zh-CN; 4xAMD64)
Pragma: no-cache
Accept-Language: zh-CN
Referer: http://fiddler2.com/client/2.5.1.2
Host: www.telerik.com
Accept-Encoding: gzip, deflate
Connection: Close



HTTP/1.1 200 OK
Cache-Control: private
Content-Type: text/plain; charset=utf-8
Content-Encoding: gzip
Vary: Accept-Encoding
Server: Microsoft-IIS/7.5
Set-Cookie: sid=dB4FETAlzSoEAyFVVn/Y+xM99xWjBu/qh++3B89IVXEowCWi9OcGiYWz6SAYobmxIdLRx95MgkTrKLxu+YnVxMOU+px+mE5QmYJMB4vr17JGnc9AeBrXny4ddYbSadaJhIw+c1KqOgDElVCv073BubC2e0E=; expires=Sun, 31-Aug-2025 12:19:00 GMT; path=/
Access-Control-Allow-Origin: http://converter.telerik.com
Date: Thu, 03 Sep 2015 12:18:59 GMT
Content-Length: 671
Connection: close

         `I %&/m 

*/