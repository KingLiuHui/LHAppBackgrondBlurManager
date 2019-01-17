//
//  LHUserPreferencesManager.m
//  LHApplicationBlurManager
//
//  Created by 刘辉 lewis on 2019/1/17.
//  Copyright © 2019 刘辉 lewis. All rights reserved.
//

#import "LHUserPreferencesManager.h"

static NSString *const LHUserPreferencesManagerKey   =  @"LHUserPreferencesManagerKey";

@implementation LHUserPreferencesManager

/**
 initialization
 
 @return instancetype
 */
+(instancetype)sharedManager{
    
    static LHUserPreferencesManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LHUserPreferencesManager alloc]init];
    });
    return manager;
    
}


-(void)lh_saveUserAction:(BOOL)show{
    NSUserDefaults* user =  [NSUserDefaults standardUserDefaults];
    [user setBool:show forKey:LHUserPreferencesManagerKey];
    [user synchronize];
}

-(BOOL)lh_getUserAction{
    NSUserDefaults* user =  [NSUserDefaults standardUserDefaults];
    BOOL status =   [user boolForKey:LHUserPreferencesManagerKey];
    return status;
}
@end
