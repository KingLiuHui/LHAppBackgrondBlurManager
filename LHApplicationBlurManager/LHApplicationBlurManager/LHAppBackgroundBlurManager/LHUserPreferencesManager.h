//
//  LHUserPreferencesManager.h
//  LHApplicationBlurManager
//
//  Created by 刘辉 lewis on 2019/1/17.
//  Copyright © 2019 刘辉 lewis. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LHUserPreferencesManager : NSObject
/**
 initialization
 
 @return instancetype
 */
+(instancetype)sharedManager;

-(void)lh_saveUserAction:(BOOL)show;

-(BOOL)lh_getUserAction;
@end

NS_ASSUME_NONNULL_END
