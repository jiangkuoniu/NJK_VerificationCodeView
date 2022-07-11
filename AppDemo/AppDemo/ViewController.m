//
//  ViewController.m
//  AppDemo
//
//  Created by NJK on 2022/7/1.
//

#import "ViewController.h"
#import <NJK_VerificationCodeView/NJK_VerificationCodeViewHeader.h>
#import "NJK_VerificationBoxBackLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creadeUI];
}

- (void)creadeUI{
    self.view.backgroundColor = UIColor.grayColor;

    NJK_VerificationCodeViewConfig *NJKConfig = NJK_VerificationCodeViewConfig.new;
    NJKConfig.padding = UIEdgeInsetsMake(0, 10, 0, 10);
    NJKConfig.inputCodeNumber = 6;
    NJKConfig.showDivider = NO;
    NJKConfig.tintColor = UIColor.redColor;
    NJKConfig.boxLabelString = @"NJK_VerificationBoxBorderLabel";

    [self.view addSubview:({
        NJK_VerificationCodeView *codeView = [[NJK_VerificationCodeView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50) config:NJKConfig];
        codeView.backgroundColor = UIColor.whiteColor;
        codeView.finishBlock = ^(NJK_VerificationCodeView * _Nonnull codeView, NSString * _Nonnull code) {
            NSLog(@"%@",code);
        };
        codeView;
    })];


    NJK_VerificationCodeViewConfig *NJKConfig2 = NJK_VerificationCodeViewConfig.new;
    NJKConfig2.padding = UIEdgeInsetsMake(0, 10, 0, 10);
    NJKConfig2.inputCodeNumber = 6;
    NJKConfig2.showDivider = NO;
    NJKConfig2.tintColor = UIColor.redColor;
    NJKConfig2.boxLabelString = @"NJK_VerificationBoxBackLabel";

    [self.view addSubview:({
        NJK_VerificationCodeView *codeView = [[NJK_VerificationCodeView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 50) config:NJKConfig2];
        codeView.backgroundColor = UIColor.whiteColor;
        codeView.finishBlock = ^(NJK_VerificationCodeView * _Nonnull codeView, NSString * _Nonnull code) {
            NSLog(@"%@",code);
        };
        codeView;
    })];
}

@end
