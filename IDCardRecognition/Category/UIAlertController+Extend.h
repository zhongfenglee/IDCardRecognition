//
//  UIAlertController+Extend.h
//  IDCardRecognition
//
//  Created by zhongfeng1 on 2017/3/6.
//  Copyright © 2017年 李中峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Extend)

// 创建AlertController
+(instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message okAction:(UIAlertAction *)okAction cancelAction:(UIAlertAction *)cancelAction;

// 创建ActionSheetController
+(instancetype)actionSheetControllerWithTitle:(NSString *)title message:(NSString *)message okAction:(UIAlertAction *)okAction cancelAction:(UIAlertAction *)cancelAction;

@end
