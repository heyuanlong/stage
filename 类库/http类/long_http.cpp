
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
}
bool long_http::set_resquest_httphaves(bool b)
{
	mrequest_struct.have_s = b;
}
bool long_http::set_resquest_host(const char* str)
{
	mrequest_struct.host = str;
}
bool long_http::set_resquest_path(const char* str)
{
	mrequest_struct.paht = str;
}
bool long_http::set_resquest_urlparam(const char* keystr,const char* valuestr)
{

    std::map<std::string, std::string>::iterator i = mrequest_struct.urlparam.find(keystr);

    if (i != mrequest_struct.urlparam.end())//存在
    {
    	if ( valuestr == NULL || strcmp(valuestr,"") == 0  )
    	{
    		mrequest_struct.urlparam.erase(i);
    	}
    	else
    	{
        	i->second = valuestr;
   		}

    }
    else{
        std::pair<std::map<std::string ,std::string>::iterator,bool> ret;
        ret=mrequest_struct.urlparam.insert(make_pair(keystr,valuestr ) );
        return ret.second;
    }

    return true;
}
bool long_http::set_resquest_procol(const char* str)
{
	mrequest_struct.procol = str;
}
bool long_http::set_resquest_headparam(const char* keystr,const char* valuestr)
{
    std::map<std::string, std::string>::iterator i = mrequest_struct.headparam.find(keystr);

    if (i != mrequest_struct.headparam.end())//存在
    {
    	if ( valuestr == NULL || strcmp(valuestr,"") == 0  )
    	{
    		mrequest_struct.headparam.erase(i);
    	}
    	else
    	{
        	i->second = valuestr;
   		}

    }
    else{
        std::pair<std::map<std::string ,std::string>::iterator,bool> ret;
        ret=mrequest_struct.headparam.insert(make_pair(keystr,valuestr ) );
        return ret.second;
    }

    return true;
}
bool long_http::set_resquest_cookie(const char* keystr,const char* valuestr)
{
    std::map<std::string, std::string>::iterator i = mrequest_struct.cookieparam.find(keystr);

    if (i != mrequest_struct.cookieparam.end())//存在
    {
    	if ( valuestr == NULL || strcmp(valuestr,"") == 0  )
    	{
    		mrequest_struct.cookieparam.erase(i);
    	}
    	else
    	{
        	i->second = valuestr;
   		}

    }
    else{
        std::pair<std::map<std::string ,std::string>::iterator,bool> ret;
        ret=mrequest_struct.cookieparam.insert(make_pair(keystr,valuestr ) );
        return ret.second;
    }

    return true;
}
bool long_http::set_resquest_body(const char * str);
{
	mrequest_struct.body = str;
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
bool long_http::get_resquest_urlparam(const char* keystr,std::string * stdstr)
{
	 std::map<std::string, std::string>::iterator i = mrequest_struct.urlparam.find(keystr);
    if (i != mrequest_struct.urlparam.end())//存在
    {
        *stdstr =  i->second;
        return true;
    }
    else{
    	*stdstr  = "";
    	return false;
    }
}
bool long_http::get_resquest_procol(std::string * stdstr)
{
	*stdstr = mrequest_struct.procol;
	return true;
}
bool long_http::get_resquest_headparam(const char* keystr,std::string * stdstr)
{
	 std::map<std::string, std::string>::iterator i = mrequest_struct.headparam.find(keystr);
    if (i != mrequest_struct.headparam.end())//存在
    {
        *stdstr =  i->second;
        return true;
    }
    else{
    	*stdstr  = "";
    	return false;
    }
}
bool long_http::get_resquest_cookie(const char* keystr,std::string * stdstr)
{
	 std::map<std::string, std::string>::iterator i = mrequest_struct.cookieparam.find(keystr);
    if (i != mrequest_struct.cookieparam.end())//存在
    {
        *stdstr =  i->second;
        return true;
    }
    else{
    	*stdstr  = "";
    	return false;
    }
}
bool long_http::get_resquest_body(std::string  *)
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

}




bool long_http::parse_resquest_Request(const char * str)
{

}
bool long_http::packet_resquest_Request(std::string  * stdstr)
{

}




////////////////////////////////////////

//下面是set_response

////////////////////////////////////////

bool long_http::set_response_procol(const char* str)
{
	mresponse_struct.procol = str; 
}
bool long_http::set_response_StatusCode(int i)
{
	mresponse_struct.statuscode = i; 
}
bool long_http::set_response_StatusDes(const char* str)
{
	mresponse_struct.statusdes = str; 
}
bool long_http::set_response_headparam(const char* keystr,const char* valuestr)
{
    std::map<std::string, std::string>::iterator i = mresponse_struct.headparam.find(keystr);

    if (i != mresponse_struct.headparam.end())//存在
    {
    	if ( valuestr == NULL || strcmp(valuestr,"") == 0  )
    	{
    		mresponse_struct.headparam.erase(i);
    	}
    	else
    	{
        	i->second = valuestr;
   		}

    }
    else{
        std::pair<std::map<std::string ,std::string>::iterator,bool> ret;
        ret=mresponse_struct.headparam.insert(make_pair(keystr,valuestr ) );
        return ret.second;
    }

    return true;
}
bool long_http::set_response_cookie(const char* keystr,const char* valuestr)
{
    std::map<std::string, std::string>::iterator i = mresponse_struct.cookieparam.find(keystr);

    if (i != mresponse_struct.cookieparam.end())//存在
    {
    	if ( valuestr == NULL || strcmp(valuestr,"") == 0  )
    	{
    		mresponse_struct.cookieparam.erase(i);
    	}
    	else
    	{
        	i->second = valuestr;
   		}

    }
    else{
        std::pair<std::map<std::string ,std::string>::iterator,bool> ret;
        ret=mresponse_struct.cookieparam.insert(make_pair(keystr,valuestr ) );
        return ret.second;
    }

    return true;
}
bool long_http::set_response_body(const char * str);
{
	mresponse_struct.body = str; 
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
bool long_http::get_response_headparam(const char* keystr,std::string * stdstr)
{
 std::map<std::string, std::string>::iterator i = mresponse_struct.headparam.find(keystr);
    if (i != mresponse_struct.headparam.end())//存在
    {
        *stdstr =  i->second;
        return true;
    }
    else{
    	*stdstr  = "";
    	return false;
    }
}
bool long_http::get_response_cookie(const char* keystr,std::string * stdstr)
{
 std::map<std::string, std::string>::iterator i = mresponse_struct.cookieparam.find(keystr);
    if (i != mresponse_struct.cookieparam.end())//存在
    {
        *stdstr =  i->second;
        return true;
    }
    else{
    	*stdstr  = "";
    	return false;
    }
}
bool long_http::get_response_body(std::string  *stdstr);
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
	mresponse_structcookieparam.clear();	//Set-Cookie: sid=dB0E=; expires=Sun, 31-Aug-2025 12:19:00 GMT
	mresponse_struct.body = "";					// body

}



bool long_http::parse_response_Request(const char * str)
{

}
bool long_http::packet_response_Request(std::string  *stdstr)
{
	
}


