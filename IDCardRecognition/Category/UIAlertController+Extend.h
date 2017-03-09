//
//  UIAlertController+Extend.h
//  IDCardRecognition
//
//  Created by zhongfeng1 on 2017/3/6.
//  Copyright © 2017年 李中峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Extend)

+(instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle okAction:(UIAlertAction *)okAction cancelAction:(UIAlertAction *)cancelAction;

@end
