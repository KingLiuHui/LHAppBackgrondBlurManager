//
//  NSString+appInfo.h
//  LHApplicationBlurManager
//
//  Created by 刘辉 lewis on 2019/1/17.
//  Copyright © 2019 刘辉 lewis. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (appInfo)
/**
 Get the display name of APP
 
 @return name
 */
+(NSString*)lh_getAppDisplayName;
@end

NS_ASSUME_NONNULL_END
