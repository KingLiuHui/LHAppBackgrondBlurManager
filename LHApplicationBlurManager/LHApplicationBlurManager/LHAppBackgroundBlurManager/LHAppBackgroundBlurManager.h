//
//  LHAppBackgroundBlurManager.h
//  LHApplicationBlurManager
//
//  Created by 刘辉 lewis on 2019/1/17.
//  Copyright © 2019 刘辉 lewis. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LHAppBackgroundBlurManager : NSObject
/**
 Whether to display a fuzzy interface,The default is YES
 */
@property(nonatomic,assign) BOOL showBlur;

/**
 Custom text displayed in the background, if not set, use the default text
 */
@property(nonatomic,copy)  NSString *blurText;

/**
 Before initialization, you should call this method to determine whether the current device supports background blur.
 
 @return true or false
 */
+(BOOL)lh_isSupportBackgroundBlur;

/**
 initialization
 
 @return instancetype
 */
+(instancetype)sharedManager;

/**
 Display fuzzy interface
 */
-(void)lh_showBlurInterface;

/**
 Remove fuzzy interface
 */
-(void)lh_removeBlurInterface;
@end

NS_ASSUME_NONNULL_END
