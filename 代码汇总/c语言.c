1.在网络程序中采用#prama pack(1)即变量紧缩，不但可以减少网络流量，还可以兼容各种系统，不会因为系统对齐方式不同而导致解包错误。

2.标准库的名也可以被重新#define
#define printf longprintf


//-----------------------
#ifndef __MATCH_VS_CUSER_H__
#define __MATCH_VS_CUSER_H__

#if (defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(__NT__))
#define DLL_API __declspec(dllexport)
#else
#define DLL_API __attribute__((visibility("default")))
#endif

extern "C" {
    typedef int (*MatchVSSDKUserOnError)(int error);
    typedef int (*MatchVSSDKUserOnGetUserInfoBack)(int error, int  status, int rspErrCode, const char *rspErrMsg, const char *rspData);

	DLL_API int    MatchVSSDKUserChangeUserInfo(const char *pNickName, const char *pAvatar);
	DLL_API int    MatchVSSDKUserGetLastError();
}
#endif

1. extern "C"
2. DLL_API
//-----------------------
void ContructDemoEcho(char *msg, char *fmt, ...)
{
	va_list args;
	va_start(args, fmt);
#if (defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(__NT__))
	vsprintf_s(msg, 1024, fmt, args);
#else // defined(__linux__) || defined(__linux)
	vsprintf(msg, fmt, args);
#endif
	va_end(args);

}

void DemoEcho(char *fmt, ...)
{
	va_list args;
	char szEchoBuf[256] = { 0 };
	va_start(args, fmt);
#if (defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(__NT__))
	vsprintf_s(szEchoBuf, 1024, fmt, args);
#else // defined(__linux__) || defined(__linux)
	vsprintf(szEchoBuf, fmt, args);
#endif
	va_end(args);
	printf("DemoEcho:%s\n", szEchoBuf);
}


//------------字符串转数字---------
const char *str="123";
int out = 0;
#if (defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(__NT__))
		sscanf_s(str, "%u", &out);
#else // defined(__linux__) || defined(__linux)
		sscanf(str, "%u", &out);
#endif

//-----------数字转字符串
int num = 100;
char str[25];
sprintf(str, " %d" , num);

//-------------
const char useridArr[][10] = { "31334","31335","31336","31337","31338" };
numsall = sizeof(useridArr) / sizeof(useridArr[0]);

//--随机数
srand((unsigned)time(NULL));  
产生一定范围随机数的通用表示公式 
要取得[a,b)的随机整数，使用(rand() % (b-a))+ a; 
要取得[a,b]的随机整数，使用(rand() % (b-a+1))+ a; 
要取得(a,b]的随机整数，使用(rand() % (b-a))+ a + 1; 
通用公式:a + rand() % n；其中的a是起始值，n是整数的范围。 
要取得a到b之间的随机整数，另一种表示：a + (int)b * rand() / (RAND_MAX + 1)。 
要取得0～1之间的浮点数，可以使用rand() / double(RAND_MAX)。

c99不支持__func__
#ifndef __func__
#define __func__ __FUNCTION__
#endif