//
//  IDInfoViewController.h
//  IDCardRecognition
//
//  Created by zhongfeng1 on 2017/2/21.
//  Copyright © 2017年 李中峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IDInfo;

@interface IDInfoViewController : UIViewController

// 身份证信息
@property (nonatomic,strong) IDInfo *IDInfo;

// 身份证图像
@property (nonatomic,strong) UIImage *IDImage;

@end
