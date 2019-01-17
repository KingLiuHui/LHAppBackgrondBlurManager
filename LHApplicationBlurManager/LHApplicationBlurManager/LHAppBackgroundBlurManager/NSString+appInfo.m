//
//  NSString+appInfo.m
//  LHApplicationBlurManager
//
//  Created by 刘辉 lewis on 2019/1/17.
//  Copyright © 2019 刘辉 lewis. All rights reserved.
//

#import "NSString+appInfo.h"

@implementation NSString (appInfo)
+(NSString*)lh_getAppDisplayName{
    NSString *appName = [[NSBundle mainBundle] infoDictionary][@"CFBundleDisplayName"];
    if (appName) {
        return appName;
    }
    NSString*name=[[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    return name;
}
@end
