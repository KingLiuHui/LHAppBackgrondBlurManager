//
//  UIImage+snapShot.m
//  LHApplicationBlurManager
//
//  Created by 刘辉 lewis on 2019/1/17.
//  Copyright © 2019 刘辉 lewis. All rights reserved.
//

#import "UIImage+snapShot.h"

@implementation UIImage (snapShot)

+(UIImage*)lh_snapShot{
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake([UIScreen mainScreen].bounds.size.width*[UIScreen mainScreen].scale, [UIScreen mainScreen].bounds.size.height*[UIScreen mainScreen].scale), YES, 0);
    [[[[UIApplication sharedApplication] keyWindow] layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRef imageRef = viewImage.CGImage;
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width*[UIScreen mainScreen].scale,[UIScreen mainScreen].bounds.size.height*[UIScreen mainScreen].scale);
    CGImageRef imageRefRect =CGImageCreateWithImageInRect(imageRef, rect);
    UIImage *sendImage = [[UIImage alloc] initWithCGImage:imageRefRect];
    return sendImage;
    
}

@end
