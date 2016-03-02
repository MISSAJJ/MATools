//
//  MATools.h
//  MISSAJJ积累的各种工具类
//  https://github.com/MISSAJJ
//  Created by MISSAJJ on 15/11/24.
//  Copyright © 2015年 MISSAJJ. All rights reserved.
//

/**
 *  @author MISSAJJ, 更新日期: 16-03-02 15:03:24
 */
#import <Foundation/Foundation.h>

@interface MATools : NSObject


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
+ (BOOL)isValidateUrl: (NSString *)urlString;

//email是否合法(利用正则表达式验证)
+(BOOL)isValidateEmail:(NSString *)email;

//根据正文内容多少,动态确定正文content的frame
+ (CGRect)getContentFrameDynamic:(NSString *)word;

//根据正文内容多少,动态确定正文content的CGSize
+ (CGSize)getContentSizeDynamic:(NSString *)word;

//根据文字长度动态确定label的高度
+ (CGSize)getLabelHeighDynamic:(NSString *)word;

@end
