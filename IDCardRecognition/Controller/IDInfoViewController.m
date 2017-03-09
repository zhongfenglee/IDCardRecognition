//
//  IDInfoViewController.m
//  IDCardRecognition
//
//  Created by zhongfeng1 on 2017/2/21.
//  Copyright © 2017年 李中峰. All rights reserved.
//

#import "IDInfoViewController.h"
#import "IDInfo.h"
#import "AVCaptureViewController.h"

@interface IDInfoViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *IDImageView;
@property (strong, nonatomic) IBOutlet UILabel *IDNumLabel;

@end

@implementation IDInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"身份证信息";
    
    self.IDImageView.layer.cornerRadius = 8;
    self.IDImageView.layer.masksToBounds = YES;
    
    self.IDNumLabel.text = _IDInfo.num;
    self.IDImageView.image = _IDImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 错误，重新拍摄
- (IBAction)shootAgain:(UIButton *)sender {    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 正确，下一步
- (IBAction)nextStep:(UIButton *)sender {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationAVCaptureViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
