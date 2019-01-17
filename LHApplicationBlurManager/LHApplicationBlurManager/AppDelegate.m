//
//  AppDelegate.m
//  LHApplicationBlurManager
//
//  Created by 刘辉 lewis on 2019/1/17.
//  Copyright © 2019 刘辉 lewis. All rights reserved.
//

#import "AppDelegate.h"
#import "LHAppBackgroundBlurManager/LHAppBackgroundBlurManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
    if ([LHAppBackgroundBlurManager lh_isSupportBackgroundBlur]) {
        LHAppBackgroundBlurManager *manager = [LHAppBackgroundBlurManager sharedManager];
        //        manager.blurText=@"隐私安全";
        [manager lh_showBlurInterface];
    }
    
}

-(void)applicationDidBecomeActive:(UIApplication *)application{
    
    if ([LHAppBackgroundBlurManager lh_isSupportBackgroundBlur]) {
        [[LHAppBackgroundBlurManager sharedManager] lh_removeBlurInterface];
    }
    
}

@end
