
#include"long_http.h"
long_http::long_http()
{
	clear_resquest();
	clear_response();
}
long_http::~long_http()
{

}



////////////////////////////////////////

//下面是set_resquest

////////////////////////////////////////

bool long_http::set_resquest_method(const char* str)
{
	mrequest_struct.method = str;
	return true;
}
bool long_http::set_resquest_httphaves(bool b)
{
	mrequest_struct.have_s = b;
	return true;
}
bool long_http::set_resquest_host(const char* str)
{
	mrequest_struct.host = str;
	return true;
}
bool long_http::set_resquest_path(const char* str)
{
	mrequest_struct.path = str;
	return true;
}
bool long_http::set_resquest_urlparam(const char* keystr, const char* valuestr)
{

	std::map<std::string, std::string>::iterator i = mrequest_struct.urlparam.find(keystr);

	if (i != mrequest_struct.urlparam.end())//存在
	{
		if (valuestr == NULL || strcmp(valuestr, "") == 0)
		{
			mrequest_struct.urlparam.erase(i);
		}
		else
		{
			i->second = valuestr;
		}

	}
	else {
		std::pair<std::map<std::string, std::string>::iterator, bool> ret;
		ret = mrequest_struct.urlparam.insert(std::make_pair(keystr, valuestr));
		return ret.second;
	}

	return true;
}
bool long_http::set_resquest_procol(const char* str)
{
	mrequest_struct.procol = str;
	return true;

}
bool long_http::set_resquest_headparam(const char* keystr, const char* valuestr)
{
	std::map<std::string, std::string>::iterator i = mrequest_struct.headparam.find(keystr);

	if (i != mrequest_struct.headparam.end())//存在
	{
		if (valuestr == NULL || strcmp(valuestr, "") == 0)
		{
			mrequest_struct.headparam.erase(i);
		}
		else
		{
			i->second = valuestr;
		}

	}
	else {
		std::pair<std::map<std::string, std::string>::iterator, bool> ret;
		ret = mrequest_struct.headparam.insert(std::make_pair(keystr, valuestr));
		return ret.second;
	}

	return true;
}
bool long_http::set_resquest_cookie(const char* keystr, const char* valuestr)
{
	std::map<std::string, std::string>::iterator i = mrequest_struct.cookieparam.find(keystr);

	if (i != mrequest_struct.cookieparam.end())//存在
	{
		if (valuestr == NULL || strcmp(valuestr, "") == 0)
		{
			mrequest_struct.cookieparam.erase(i);
		}
		else
		{
			i->second = valuestr;
		}

	}
	else {
		std::pair<std::map<std::string, std::string>::iterator, bool> ret;
		ret = mrequest_struct.cookieparam.insert(std::make_pair(keystr, valuestr));
		return ret.second;
	}

	return true;
}
bool long_http::set_resquest_body(const char * str)
{
	mrequest_struct.body = str;
	return true;

}

////////////////////////////////////////

//下面是get_resquest

////////////////////////////////////////


bool long_http::get_resquest_method(std::string * stdstr)
{
	*stdstr = mrequest_struct.method;
	return true;
}
bool long_http::get_resquest_httphaves()
{
	return mrequest_struct.have_s;
}
bool long_http::get_resquest_host(std::string * stdstr)
{
	*stdstr = mrequest_struct.host;
	return true;
}
bool long_http::get_resquest_path(std::string * stdstr)
{
	*stdstr = mrequest_struct.path;
	return true;
}
bool long_http::get_resquest_urlparam(const char* keystr, std::string * stdstr)
{
	std::map<std::string, std::string>::iterator i = mrequest_struct.urlparam.find(keystr);
	if (i != mrequest_struct.urlparam.end())//存在
	{
		*stdstr = i->second;
		return true;
	}
	else {
		*stdstr = "";
		return false;
	}
}
bool long_http::get_resquest_procol(std::string * stdstr)
{
	*stdstr = mrequest_struct.procol;
	return true;
}
bool long_http::get_resquest_headparam(const char* keystr, std::string * stdstr)
{
	std::map<std::string, std::string>::iterator i = mrequest_struct.headparam.find(keystr);
	if (i != mrequest_struct.headparam.end())//存在
	{
		*stdstr = i->second;
		return true;
	}
	else {
		*stdstr = "";
		return false;
	}
}
bool long_http::get_resquest_cookie(const char* keystr, std::string * stdstr)
{
	std::map<std::string, std::string>::iterator i = mrequest_struct.cookieparam.find(keystr);
	if (i != mrequest_struct.cookieparam.end())//存在
	{
		*stdstr = i->second;
		return true;
	}
	else {
		*stdstr = "";
		return false;
	}
}
bool long_http::get_resquest_body(std::string  * stdstr)
{
	*stdstr = mrequest_struct.body;
	return true;
}
bool long_http::clear_resquest()
{

	mrequest_struct.method = "GET";			//请求方法
	mrequest_struct.have_s = false;			//https://
	mrequest_struct.host = "";				//www.baidu.com
	mrequest_struct.path = "";				//   /ht/kkk/Update.php
	mrequest_struct.urlparam.clear();		//?wd=asfr&rsv_spt=1&issp=1
	mrequest_struct.procol = "HTTP/1.1";			//HTTP/1.1
	mrequest_struct.headparam.clear();	    //
	mrequest_struct.cookieparam.clear();	//Cookie: sid=YMpI=456; oprId=oe7 68; _d15-121=1; ki_r=; foe=ie
	mrequest_struct.body = "";				//body
	return true;


}




bool long_http::parse_resquest_Request(const char * str)
{
	std::istringstream is(str);
	std::getline(is, mrequest_struct.method, ' ');

	std::string tempurl;
	std::getline(is, tempurl, ' ');
	if (deal_request_url(tempurl) == false)//处理整条URL
	{
		return false;
	}

	std::getline(is, mrequest_struct.procol, '\r');

	if (!is.good()
		|| mrequest_struct.method.empty()
		|| tempurl.empty()
		|| mrequest_struct.procol.empty())
	{
		return false;
	}
	char c;
	is.get(c);
	if (c != '\n')
	{
		return false;
	}
	std::string key, value;
	char sp, cr, lf;
	while (true)
	{
		is.get(cr);
		is.get(lf);
		if (!is.good())
		{
			return false;
		}
		if (cr == '\r')
		{
			if (lf == '\n')
			{
				break;
			}
			else
			{
				return false;
			}
		}
		is.unget();
		is.unget();

		std::getline(is, key, ':');
		is.get(sp);
		std::getline(is, value, '\r');
		is.get(lf);
		if (!is.good()
			|| key.empty()
			|| value.empty()
			|| sp != ' '
			|| lf != '\n')
		{
			return false;
		}
		if (key.compare("Cookie") == 0)
		{
			if (deal_request_cookie(value) == false)
				return false;
		}
		else
		{
			set_resquest_headparam(key.c_str(), value.c_str());
		}
	}

	std::istringstream::pos_type  curr = is.tellg();
	is.seekg(0, is.end);
	std::istringstream::pos_type  endd = is.tellg();
	unsigned long int bodylength = endd - curr;
	if (bodylength == 0)
	{
		return true;
	}
	is.seekg(curr, is.beg);
	char *buf = (char *)malloc(bodylength + 1);
	memset(buf, 0, sizeof(buf));
	is.read(buf, bodylength);
	mrequest_struct.body = buf;
	free(buf);

char s[12];
#if (defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(__NT__))
	sprintf_s(s, "%u", bodylength);
#elif defined(__linux__) || defined(__linux)
	sprintf(s, "%u", bodylength);
#endif
	set_resquest_headparam("Content-Length",s);
	
	return true;

}
bool long_http::packet_resquest_Request(std::string  * stdstr)
{
	std::string str;
	int iac = 0;
	std::string crlf = "\r\n";
	str += mrequest_struct.method;
	str += " http";
	if (mrequest_struct.have_s)
	{
		str += "s";
	}
	str += "://";
	str += mrequest_struct.host;
	str += "/";
	str += mrequest_struct.path;

	if (!mrequest_struct.urlparam.empty())
	{
		iac = 0;
		str += "?";
		std::map<std::string, std::string>::iterator b_upa = mrequest_struct.urlparam.begin(),
			e_upa = mrequest_struct.urlparam.end();

		for (; b_upa != e_upa; ++b_upa)
		{
			if (iac > 0)
			{
				str += "&";

			}
			str += b_upa->first + "=" + b_upa->second;
			++iac;
		}
	}

	str += " ";
	str += mrequest_struct.procol;
	str += crlf;

	std::map<std::string, std::string>::iterator b_hpa = mrequest_struct.headparam.begin(), e_hpa = mrequest_struct.headparam.end();
	for (; b_hpa != e_hpa; ++b_hpa)
	{
		str += b_hpa->first + ": " + b_hpa->second + crlf;
	}

	if (!mrequest_struct.cookieparam.empty())
	{
		iac = 0;
		str += "Cookie: ";
		std::map<std::string, std::string>::iterator bcookiepa = mrequest_struct.cookieparam.begin(),
			ecookiepa = mrequest_struct.cookieparam.end();
		iac = 0;
		for (; bcookiepa != ecookiepa; ++bcookiepa)
		{
			if (iac > 0)
			{
				str += "; ";
			}
			str += bcookiepa->first + "=" + bcookiepa->second;
			++iac;
		}
		str += crlf;
	}
	str += crlf;
	str += mrequest_struct.body;

	*stdstr = str;

	return true;

}














////////////////////////////////////////

//下面是set_response

////////////////////////////////////////

bool long_http::set_response_procol(const char* str)
{
	mresponse_struct.procol = str;
	return true;

}
bool long_http::set_response_StatusCode(int i)
{
	mresponse_struct.statuscode = i;
	return true;

}
bool long_http::set_response_StatusDes(const char* str)
{
	mresponse_struct.statusdes = str;
	return true;

}
bool long_http::set_response_headparam(const char* keystr, const char* valuestr)
{
	std::map<std::string, std::string>::iterator i = mresponse_struct.headparam.find(keystr);

	if (i != mresponse_struct.headparam.end())//存在
	{
		if (valuestr == NULL || strcmp(valuestr, "") == 0)
		{
			mresponse_struct.headparam.erase(i);
		}
		else
		{
			i->second = valuestr;
		}

	}
	else {
		std::pair<std::map<std::string, std::string>::iterator, bool> ret;
		ret = mresponse_struct.headparam.insert(std::make_pair(keystr, valuestr));
		return ret.second;
	}

	return true;
}
bool long_http::set_response_cookie(const char* keystr, const char* valuestr)
{
	std::map<std::string, std::string>::iterator i = mresponse_struct.cookieparam.find(keystr);

	if (i != mresponse_struct.cookieparam.end())//存在
	{
		if (valuestr == NULL || strcmp(valuestr, "") == 0)
		{
			mresponse_struct.cookieparam.erase(i);
		}
		else
		{
			i->second = valuestr;
		}

	}
	else {
		std::pair<std::map<std::string, std::string>::iterator, bool> ret;
		ret = mresponse_struct.cookieparam.insert(std::make_pair(keystr, valuestr));
		return ret.second;
	}

	return true;
}
bool long_http::set_response_body(const char * str)
{
	mresponse_struct.body = str;
	return true;

}


////////////////////////////////////////

//下面是get_response

////////////////////////////////////////



bool long_http::get_response_procol(std::string * stdstr)
{
	*stdstr = mresponse_struct.procol;
	return true;
}
int long_http::get_response_StatusCode()
{
	return mresponse_struct.statuscode;

}
bool long_http::get_response_StatusDes(std::string * stdstr)
{
	*stdstr = mresponse_struct.statusdes;
	return true;
}
bool long_http::get_response_headparam(const char* keystr, std::string * stdstr)
{
	std::map<std::string, std::string>::iterator i = mresponse_struct.headparam.find(keystr);
	if (i != mresponse_struct.headparam.end())//存在
	{
		*stdstr = i->second;
		return true;
	}
	else {
		*stdstr = "";
		return false;
	}
}
bool long_http::get_response_cookie(const char* keystr, std::string * stdstr)
{
	std::map<std::string, std::string>::iterator i = mresponse_struct.cookieparam.find(keystr);
	if (i != mresponse_struct.cookieparam.end())//存在
	{
		*stdstr = i->second;
		return true;
	}
	else {
		*stdstr = "";
		return false;
	}
}
bool long_http::get_response_body(std::string  *stdstr)
{
	*stdstr = mresponse_struct.body;
	return true;
}
bool long_http::clear_response()
{


	mresponse_struct.procol = "HTTP/1.1";			//HTTP/1.1
	mresponse_struct.statuscode = 0;		// 200
	mresponse_struct.statusdes = "";		// ok
	mresponse_struct.headparam.clear();	    //
	mresponse_struct.cookieparam.clear();	//Set-Cookie: sid=dB0E=; expires=Sun, 31-Aug-2025 12:19:00 GMT
	mresponse_struct.body = "";					// body

	return true;

}



bool long_http::parse_response_Request(const char * str)
{
	return true;

}
bool long_http::packet_response_Request(std::string  *stdstr)
{
	return true;

}


bool long_http::deal_request_url(std::string &str)
{
	str += '&';
	std::istringstream uis(str);
	std::string tempstr;
	char c;
	std::getline(uis, tempstr, '/');
	if (tempstr[4] == 's')
	{
		mrequest_struct.have_s = true;
	}
	uis.get(c);
	if (!uis.good()
		|| c != '/')
	{
		return false;
	}
	std::istringstream::pos_type curr = uis.tellg();
	uis >> tempstr;
	std::string::size_type f = tempstr.find('/');
	if (f == std::string::npos)
	{
		mrequest_struct.host = tempstr;
		return true;
	}

	uis.seekg(curr, uis.beg);
	std::getline(uis, tempstr, '/');
	mrequest_struct.host = tempstr;//host
	if (!uis.good())
	{
		return true;
	}

	curr = uis.tellg();
	uis >> tempstr;
	f = tempstr.find('?');
	if (f == std::string::npos)
	{
		mrequest_struct.path = tempstr;
		return true;
	}

	uis.seekg(curr, uis.beg);
	std::getline(uis, tempstr, '?');
	mrequest_struct.path = tempstr;//path
	if (!uis.good())
	{
		return true;
	}

	std::string key, value;
	while (uis.good())//如果这样不行可以加上get good unget
	{
		uis.get();
		if (uis.good())
			uis.unget();
		else
			break;

		std::getline(uis, key, '=');
		std::getline(uis, value, '&');
		set_resquest_urlparam(key.c_str(), value.c_str());
	}

	return true;
}

bool long_http::deal_request_cookie(std::string &str)
{
	str += ',';
	std::istringstream uis(str);
	std::string key, value;
	while (uis.good())//
	{
		uis.get();
		if (uis.good())
			uis.unget();
		else
			break;
		std::getline(uis, key, '=');
		std::getline(uis, value, ',');
		if (uis.peek() == ' ')
		{
			uis.ignore();
		}
		set_resquest_cookie(key.c_str(), value.c_str());
	}
	return true;
}
