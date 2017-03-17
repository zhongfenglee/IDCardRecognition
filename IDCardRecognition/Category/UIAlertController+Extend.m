//
//  UIAlertController+Extend.m
//  IDCardRecognition
//
//  Created by zhongfeng1 on 2017/3/6.
//  Copyright © 2017年 李中峰. All rights reserved.
//

#import "UIAlertController+Extend.h"

@implementation UIAlertController (Extend)

+(instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle okAction:(UIAlertAction *)okAction cancelAction:(UIAlertAction *)cancelAction {
    UIAlertController *alertC = [self alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    // 两个action（"确定"、“取消”）依添加顺序从左至右排列
    if (cancelAction) {
        [alertC addAction:cancelAction];
    }
    
    if (okAction) {
        [alertC addAction:okAction];
    }
    
    return alertC;
}

+(instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message okAction:(UIAlertAction *)okAction cancelAction:(UIAlertAction *)cancelAction {
    return [self alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert okAction:okAction cancelAction:cancelAction];
}

+(instancetype)actionSheetControllerWithTitle:(NSString *)title message:(NSString *)message okAction:(UIAlertAction *)okAction cancelAction:(UIAlertAction *)cancelAction {
    return [self alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet okAction:okAction cancelAction:cancelAction];
}

@end
