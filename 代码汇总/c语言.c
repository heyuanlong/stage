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
