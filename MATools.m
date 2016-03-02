//
//  MATools.m
//  MISSAJJ积累的各种工具类
//  https://github.com/MISSAJJ
//  Created by MISSAJJ on 15/11/24.
//  Copyright © 2015年 MISSAJJ. All rights reserved.
//
//  积微，月不胜日，时不胜月，岁不胜时  _____________MISSAJJ on 16/2/3.
//

/**
 *  @author MISSAJJ, 更新日期: 16-03-02 15:03:24
 */

#import "MATools.h"

/*
 *比例  按照iphone5的比例，iphone4单独做xib适配比例为1.0
 本方法iPad不适用，只适用于4，5，6，6Plus。
 本方法用在iPhone上的话只需准备4，5的尺寸两套布局。效率高，也方便后期维护。
 5，6，6Plus三种屏幕的尺寸宽高比是差不多的，因此可以在5的基础上，按比例放大来兼容6和6Plus的屏幕
 http://blog.it985.com/5121.html
 */
#define  autoSizeScaleX   kDeviceWidth/320;
#define  autoSizeScaleY   kDeviceHeight/568;

@implementation MATools

//storyBoard view自动适配
+ (void)storyBoradAutoLay:(UIView *)allView
{
    for (UIView *temp in allView.subviews) {
        
        temp.frame = CGRectMake1(temp.frame.origin.x, temp.frame.origin.y, temp.frame.size.width, temp.frame.size.height);
        
        for (UIView *temp1 in temp.subviews) {
            temp1.frame = CGRectMake1(temp1.frame.origin.x, temp1.frame.origin.y, temp1.frame.size.width, temp1.frame.size.height);
            
            for (UIView *temp2 in temp1.subviews) {
                temp2.frame = CGRectMake1(temp2.frame.origin.x, temp2.frame.origin.y, temp2.frame.size.width, temp2.frame.size.height);
            }
        }
    }
}

//修改CGRectMake
CG_INLINE CGRect
CGRectMake1(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
   
    CGRect rect;
    
    if (kDeviceHeight  > 480) {  //iphone 5 6 6plus
        
        rect.origin.x = x * autoSizeScaleX;
        rect.origin.y = y * autoSizeScaleY;
        rect.size.width = width * autoSizeScaleX;
        rect.size.height = height * autoSizeScaleY;
    
    }else{  //iphone 4
    
        rect.origin.x = x * 1.0;
        rect.origin.y = y * 1.0;
        rect.size.width = width * 1.0;
        rect.size.height = height * 1.0;
    }
    
    
    return rect;
}

#pragma mark ======获取plist文件====
+(NSArray *)arrayWithPlistString:(NSString *)string{
    
    
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:string ofType:nil];
    NSArray *array = [[NSArray alloc]initWithContentsOfFile:plistPath];
    return array;
    
}
#pragma mark ====== 隐藏手机号码为＊号====
+(NSString *)hidePhoneNumberbyCharacters :(NSString *)phoneStr
{
    
    NSString * tel = [phoneStr stringByReplacingCharactersInRange:NSMakeRange(6, 4) withString:@"******"];
    //NSLog(@"tel:%@",phoneStr);
    //输出 tel:+86137******33
    return tel;
}

#pragma mark ======ios 判断字符串为空和只为空格解决办法==
+ (BOOL)isBlankString:(NSString *)string{
    
    if (string == nil) {
        return YES;
    }
    
    if (string == NULL) {
        return YES;
    }
    
    if ([string isEqualToString:@""]) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

#pragma mark ======ios 判断数组为空的解决办法==
+ (BOOL)isBlankArray:(NSArray *)array{

    if (array == nil) {
        return YES;
    }

    if ([array isKindOfClass:[NSNull class]]) {
        return YES;
    }

    if (array.count == 0) {
        return YES;
    }
    
    return NO;
}





#pragma mark ======网址是否合法
+ (BOOL)isValidateUrl: (NSString *)urlString
{
    /*NSString *urlRegEx =
     @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
     NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
     return [urlTest evaluateWithObject:urlString];
     */
    if ([urlString rangeOfString:@"https://"].location != NSNotFound || [urlString rangeOfString:@"http://"].location != NSNotFound)
        return TRUE;
    else
        return FALSE;
}

#pragma mark ======email是否合法(利用正则表达式验证)
+(BOOL)isValidateEmail:(NSString *)email
{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
    
}

#pragma mark ======根据正文内容多少,动态确定正文content的frame
+(CGRect)getContentFrameDynamic:(NSString *)word
{
    // 宽度W
    CGFloat contentW = kDeviceWidth-90;
    // label的字体 HelveticaNeue  Courier
    UIFont * font =[UIFont systemFontOfSize:TITLEFONTSIZE];
    //_content.font = fnt;
    
    //_content.lineBreakMode = NSLineBreakByWordWrapping;
    // iOS7中用以下方法替代过时的iOS6中的sizeWithFont:constrainedToSize:lineBreakMode:方法
    CGRect tmpRect = [word boundingRectWithSize:CGSizeMake(contentW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] context:nil];
    
    return tmpRect;
    
}

#pragma mark ======根据正文内容多少,动态确定正文content的CGSize
+(CGSize)getContentSizeDynamic:(NSString *)word
{
    // 宽度W
    CGFloat contentW = kDeviceWidth-90;
    
    //自适应news_title文字高度
    UIFont * font =[UIFont systemFontOfSize:TITLEFONTSIZE];
    //获得文本属性
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    //计算文本的大小
    CGSize textSize = [word boundingRectWithSize:CGSizeMake(contentW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin  attributes:attributes context:nil].size;
    
    //NSLog(@" textSize.height %f \n%@\n\n",textSize.height,word);
    
    
    return textSize;
    
}

#pragma mark ======根据文字长度动态确定label的高度
+(CGSize)getLabelHeighDynamic:(NSString *)word
{
    UIFont * font =[UIFont systemFontOfSize:TITLEFONTSIZE];
    CGSize size = [word sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]];
    return size;
}




@end
