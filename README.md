

### MATools

`MISSAJJ`自己积累整理的各种常用代码 

 

###前言


积微，

月不胜日，

时不胜月，

岁不胜时....


_____________MISSAJJ on 16/3/2.



###Why?为什么要写这个工具类？


  项目中经常会碰到的方法和解决方案, 为什么要重复,重复又重复地去拷贝黏贴呢?

  养成多思考, 多封装, 多积累的习惯, 陆续整理在一个工具类内, 同时节约了后期大量的工作时间...
  


###Void＃快速写单例的方法----(已经封装在MASingleton.h头文件里啦)################################################

```objective-c
/**
*  @author MISSAJJ, 更新日期: 16-03-02 15:03:55
*
*  专门用来保存单例代码,最后一行不要加 \
*
使用方法:
在.h 文件头部@interface下面
写 singleton_interface(类名)

在.m 文件头部@implementation下面
写 singleton_implementation(类名)
*
*
*
*
*/

// .h
#define singleton_interface(class)  + (class *)shared##class;

// .m
// \ 代表下一行也属于宏
// ## 是分隔符
#define singleton_implementation(class) \
static class *_instance; \
\
+ (class *)shared##class \
{ \
if (_instance == nil) { \
_instance = [[self alloc] init]; \
} \
return _instance; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
}

```
###Void＃请求方法################################################

```objective-c


/**
*  @author MISSAJJ, 更新日期: 16-03-02 15:03:24
*/


//storyBoard view自动适配
+ (void)storyBoradAutoLay:(UIView *)allView;

//获取plist文件
+ (NSArray *)arrayWithPlistString:(NSString *)string;

//隐藏手机号码为＊号
+ (NSString *)hidePhoneNumberbyCharacters :(NSString *)phoneStr;

//ios 判断字符串为空和只为空格解决办法
+ (BOOL)isBlankString:(NSString *)string;

//ios 判断数组为空的解决办法
+ (BOOL)isBlankArray:(NSArray *)array;

//网址是否合法
+ (BOOL)isValidateUrl:(NSString *)urlString;

//email是否合法(利用正则表达式验证)
+(BOOL)isValidateEmail:(NSString *)email;

//根据正文内容多少,动态确定正文content的frame
+ (CGRect)getContentFrameDynamic:(NSString *)word;

//根据正文内容多少,动态确定正文content的CGSize
+ (CGSize)getContentSizeDynamic:(NSString *)word;

//根据文字长度动态确定label的高度
+ (CGSize)getLabelHeighDynamic:(NSString *)word;


```


###Other其他
 

很希望能和大咖们一起快乐地奔跑,不再是一个孤独的攻城狮，
希望能有更多的狮子一起共勉探讨学习，共同进步！

我的联系方式 ： QQ   996174446  ［验证：IOS攻城狮］
