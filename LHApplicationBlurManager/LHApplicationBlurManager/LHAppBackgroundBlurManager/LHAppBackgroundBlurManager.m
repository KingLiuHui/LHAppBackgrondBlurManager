//
//  LHAppBackgroundBlurManager.m
//  LHApplicationBlurManager
//
//  Created by 刘辉 lewis on 2019/1/17.
//  Copyright © 2019 刘辉 lewis. All rights reserved.
//

#import "LHAppBackgroundBlurManager.h"
#import <UIKit/UIKit.h>
#import "UIImage+snapShot.h"
#import "NSString+appInfo.h"
#import "LHUserPreferencesManager.h"

#define KLHScreenWidth     [UIScreen mainScreen].bounds.size.width
#define KLHScreenHeight    [UIScreen mainScreen].bounds.size.height
#define KLHScreenBounds    [UIScreen mainScreen].bounds
#define KLHTextViewHeight  40
#define KLHAlphaValue      0.95

@interface LHAppBackgroundBlurManager()

@property(nonatomic,strong)UIVisualEffectView* blurView;
@property(nonatomic,strong)UIImageView       * imageView;
@property(nonatomic,strong)UILabel           * textLabel;
@property(nonatomic,strong)UIVisualEffectView* textView;
@property(nonatomic,strong)UIView            * contentView;

@end

@implementation LHAppBackgroundBlurManager

#pragma mark - lazy load
-(UIVisualEffectView*)blurView{
    if (!_blurView) {
        _blurView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        _blurView.frame  = self.imageView.bounds;
        _blurView.alpha  = KLHAlphaValue;
    }
    return _blurView;
}

-(UIImageView*)imageView{
    if (!_imageView) {
        _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KLHScreenHeight, KLHScreenHeight-KLHTextViewHeight)];
        _imageView.contentMode=UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

-(UIVisualEffectView*)textView{
    if (!_textView) {
        _textView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
        _textView.frame  = CGRectMake(0, KLHScreenHeight-KLHTextViewHeight, KLHScreenWidth, KLHTextViewHeight);
    }
    return _textView;
}

-(UIView*)contentView{
    if (!_contentView) {
        _contentView=[[UIView alloc]initWithFrame:KLHScreenBounds];
    }
    return _contentView;
}

-(UILabel*)textLabel{
    if (!_textLabel) {
        _textLabel=[[UILabel alloc]initWithFrame:self.textView.bounds];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.textColor=[UIColor lightGrayColor];
        _textLabel.text=[NSString stringWithFormat:@"%@全力保护您的信息安全与隐私",[NSString lh_getAppDisplayName]];
        _textLabel.font=[UIFont systemFontOfSize:16];
    }
    return _textLabel;
}
#pragma mark - init method
+(instancetype)sharedManager{
    
    static LHAppBackgroundBlurManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LHAppBackgroundBlurManager alloc]init];
    });
    return manager;
}

-(instancetype)init{
    if (self=[super init]) {
        [[UIApplication sharedApplication].keyWindow addSubview:self.contentView];
        self.imageView.image=[UIImage lh_snapShot];
        [self.imageView              addSubview:self.blurView];
        [self.contentView            addSubview:self.imageView];
        [self.contentView            addSubview:self.textView];
        [self.textView.contentView   addSubview:self.textLabel];
        self.showBlur = YES;
    }
    return self;
}

#pragma mark  - public method
+(BOOL)lh_isSupportBackgroundBlur{
    if (@available(iOS 8.0, *)) {
        return YES;
    } else {
        return NO;
    }
}

-(void)lh_showBlurInterface{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if ([[LHUserPreferencesManager sharedManager] lh_getUserAction]) {
            [[UIApplication sharedApplication].keyWindow addSubview:self.contentView];
        }else{
            [self lh_removeBlurInterface];
        }
        
    });
}

-(void)lh_removeBlurInterface{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.contentView) {
            [self.contentView removeFromSuperview];
        }
    });
}

#pragma mark - setter method
-(void)setShowBlur:(BOOL)showBlur{
    _showBlur = showBlur;
    [[LHUserPreferencesManager sharedManager] lh_saveUserAction:showBlur];
    if (!showBlur) {
        [self lh_removeBlurInterface];
    }
}

-(void)setBlurText:(NSString *)blurText{
    _blurText = blurText;
    self.textLabel.text = blurText;
}
@end
