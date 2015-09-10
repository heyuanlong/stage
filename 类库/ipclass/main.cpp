#include <iostream>
#include "long_http.h"
using namespace std;

int main(int argc, char const *argv[])
{

	long_http ht;
	string str1 = "POST http://www.telerik.com/?d=eu7405&hao=110586 HTTP/1.1\r\nHost: www.telerik.com\r\nConnection: keep-alive\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36\r\nReferer: http://www.telerik.com/download/fiddler/first-run\r\nAccept-Encoding: gzip, deflate, sdch\r\nAccept-Language: zh-CN,zh;q=0.8,en;q=0.6\r\nContent-Length: 3\r\nCookie: sid=YMJPoxaAYQZssNDEVeS7/QBRpp9QI=; optimizelyEndUserId=oeu14403046668768; _dc_gtm_UA-15-21=1; ki_r=; forcookie=i am cookie; elqUserId=c38-304a-47e5-ad38-920\r\n\r\n1325323626423";

	ht.parse_resquest(str1.c_str());
	string str2;
	ht.packet_resquest(&str2);
	cout << endl << str2 << endl;

	string str3 = "HTTP/1.1 200 OK\r\nCache-Control: private\r\nServer: Microsoft-IIS/7.5\r\nSet - Cookie: sid = dB0E = ; expires = Sun, 31 - Aug - 2025 12:19 : 00 GMT; path = / \r\nAccess - Control - Allow - Origin: http://converter.telerik.com\r\nDate: Thu, 03 Sep 2015 12:18:59 GMT\r\nContent-Length: 11\r\n\r\n13454545454";
	ht.parse_response(str3.c_str());
	string str4;
	ht.packet_response(&str4);
	cout << endl << str4 << endl;
	return 0;
}