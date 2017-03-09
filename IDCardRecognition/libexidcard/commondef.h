/************************************************************************/
/* copyright                                                            */
/* version 1.1    修改TPoint  TRect 的数据类型为int                     */
/************************************************************************/
#ifndef __COMMON_DEF_H__
#define __COMMON_DEF_H__

//////////////////////////////////////////////////////////////////////////
/* 平台相关的一些定义 */
/** 调用方式约定 */
#if (defined WIN32 || defined WIN64)
//-----------windows-----------------------------
    #define STD_CDECL   __cdecl         //C调用约定
    #define STD_STDCALL __stdcall       //pascall调用约定
    #define STD_EXPORTS __declspec(dllexport)
    #define STD_WINAPI  __stdcall 
#else
//-----------linux-------------------------------
    #define STD_CDECL
    #define STD_STDCALL
    #define STD_EXPORTS __attribute__ ((visibility("default")))
#endif

/* 导出方式定义 */
#ifndef STD_EXTERN_C
    #ifdef __cplusplus
        #define STD_EXTERN_C  extern "C"
    #else
        #define STD_EXTERN_C  extern
    #endif
#endif

/* 接口定义:采用标准的C调用约定 */
#ifndef STD_API
    #define STD_API(rettype) STD_EXTERN_C STD_EXPORTS rettype STD_CDECL
	/* 接口实现:采用标准的C调用约定 */
	#define STD_IMPL STD_EXTERN_C STD_EXPORTS
#endif
/* C++接口定义 */
#ifndef CPP_API
	#define CPP_API(rettype) STD_EXPORTS rettype STD_CDECL
	#define CPP_IMPL STD_EXPORTS
#endif

//////////////////////////////////////////////////////////////////////////
//常用定义宏
/* MIN, MAX, ABS */
#define ZMIN(a, b)	((a)>(b) ? (b) : (a))
#define ZMAX(a, b)	((a)<(b) ? (b) : (a))
#define ZABS(a)		((a) < 0 ? (-(a)) : a)
#define ZSIGN(x)    (((x) < 0) ? -1 : 1)

#define ZFALSE		(0)
#define ZTRUE		(1)
#define ZPI			(3.1415926535)
#define PROCNAME(name)  static const char procName[] = name
#define ROUND(a) ((int)((a) + ((a) >= 0 ? 0.5 : -0.5)))
#define FLOOR(a) ( ROUND(a) + ((a - ROUND(a)) < 0 ) )
#define CEIL(a)  ( ROUND(a) + ((ROUND(a) - a) < 0 ) )

//////////////////////////////////////////////////////////////////////////
//64位大数，由于下面long被重定义了，所以这个要提前
#if (defined WIN32 || defined WIN64)
typedef __int64			TInt64;
#else
typedef long long		TInt64;
#endif

//由于long的长度有32位好64位的问题，统一用int来处理，识别内核没有问题
//#define long int
//////////////////////////////////////////////////////////////////////////
/**common data types, when we write code, we must use this data type to make our code partable
 *more easily, and make our code write more precise in data type.*/
typedef signed char	    TInt8;
typedef signed short	TInt16;
typedef signed int	    TInt32;
typedef signed int	    TInt;
typedef signed long     TLong;      //长度x32，4byte，x64是8byte
typedef unsigned char	TUint8;
typedef unsigned short	TUint16;
typedef unsigned int	TUint32;
typedef unsigned int	TUint;      //DWORD
typedef unsigned char   TUchar;     //BYTE
typedef unsigned short  TUshort;    //WORD
typedef unsigned long   TUlong;     //长度x32，4byte，x64是8byte
typedef float		    TReal32;
typedef double		    TReal64;
typedef int		        TBool;
typedef void		    TVoid;
typedef void*           THandle;    // handle=void*
typedef int				TStatus;
typedef int				TSTATUS;
typedef void*			THandle;

//////////////////////////////////////////////////////////////////////////
/* 点 */
typedef struct TPoint_
{
	int x;
	int y;
}TPoint;

/* 矩形(包含关系) */
typedef struct TRect_
{
	int nLft; 
	int nRgt;
	int nTop;
	int nBtm;
}TRect;

//////////////////////////////////////////////////////////////////////////
//数据类型最大值和最小值
#define TINT8_MIN  (-128) 
#define TINT16_MIN (-32768)
#define TINT32_MIN (-2147483647 - 1)
#define TINT64_MIN (-9223372036854775807LL - 1)

#define TINT8_MAX  127
#define TINT16_MAX 32767
#define TINT32_MAX 2147483647
#define TINT64_MAX 9223372036854775807LL

#define TUINT8_MAX  0xff /* 255U */
#define TUINT16_MAX 0xffff /* 65535U */
#define TUINT32_MAX 0xffffffff  /* 4294967295U */
#define TUINT64_MAX 0xffffffffffffffffULL /* 18446744073709551615ULL */

//////////////////////////////////////////////////////////////////////////
//错误类型 错误编码 <0 发生错误 否则正确，32位的错误编码
/** 判断语句 */
#define ISFAILED(iStatus)	 ((iStatus) <  0 )
#define ISSUCCEEDED(iStatus) ((iStatus) >= 0 )

/** 没有错误 */
#define STATUS_OK                   (0     )
/** 内存不足 */
#define STATUS_NOMEMORY             (-80001)
/** 输入参数不对 */
#define STATUS_INVALIDARG           (-80002)
/** 无此接口 */
#define STATUS_NOINTERFACE          (-80003)
/** 无效指针 */
#define STATUS_INVALIDPTR           (-80004)
/* 文件错误 */
#define STATUS_FILEERROR            (-80005)
/** 识别字典没有初始化 */
#define STATUS_DICT_UNINIT			(-80006)
/** 识别字典错误 */
#define STATUS_RECG_ERROR			(-80007)
/** 字典初始化错误 */
#define STATUS_DICT_ERROR			(-80008)
/** 指针为空 */
#define STATUS_NULLPTR				(-80009)
/** not supported image formate    */      
#define	STATUS_UNKNOWFMT			(-80010)
/** 图像错误 */
#define STATUS_BADIMAGE				(-80011)
/** 添加其他错误 ........................ */
/** 定位错误 */
#define STATUS_DETECTERR			(-80020)
/** 解码错误 */
#define STATUS_DECODEERR			(-80021)
/** 编码错误 */
#define STATUS_ENCODEERR			(-80022)
/** 库过期了*/
#define STATUS_OVERTIME				(-80023)
/**其他错误 */
#define STATUS_UNEXPECTED			(-88888)

//////////////////////////////////////////////////////////////////////////

#endif //__COMMON_DEF_H__
