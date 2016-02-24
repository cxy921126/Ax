//
//  ViewController.m
//  Ax
//
//  Created by Mac mini on 16/2/23.
//  Copyright © 2016年 XMU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *sighupBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *frameMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginMargin;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.sighupBtn.layer.cornerRadius = 5;
//    self.sighupBtn.layer.masksToBounds = YES;
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)goSignIn:(id)sender {
    self.loginMargin.constant = 8;
    self.frameMargin.constant = -500;
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}
- (IBAction)backToOriginal:(id)sender {
    self.loginMargin.constant = 1000;
    self.frameMargin.constant = 8;
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
