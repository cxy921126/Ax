//
//  ViewController.m
//  Ax
//
//  Created by Mac mini on 16/2/23.
//  Copyright © 2016年 XMU. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "SignUpViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *sighupBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *frameMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginMargin;
@property (retain,nonatomic) AFHTTPSessionManager *afManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.afManager = [AFHTTPSessionManager manager];
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
    [self.view endEditing:YES];
    self.loginMargin.constant = 1000;
    self.frameMargin.constant = 8;
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}
- (IBAction)Login:(id)sender {
    [self.afManager GET:@"http://localhost:3000/User" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"progress");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

- (IBAction)goSignUp:(id)sender {
    SignUpViewController *signUpVC = [[SignUpViewController alloc]init];
    [self presentViewController:signUpVC animated:YES completion:nil];
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end
