//
//  ViewController.m
//  NJK_VerificationCodeView
//
//  Created by NJK on 2022/6/30.
//

#import "ViewController.h"
#import "NJK_VerificationCodeViewHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self creadeUI];
}

- (void)creadeUI{
    self.view.backgroundColor = UIColor.brownColor;

    NJK_VerificationCodeViewConfig *NJKConfig = NJK_VerificationCodeViewConfig.new;
    NJKConfig.inputCodeNumber = 6;


    [self.view addSubview:({
        NJK_VerificationCodeView *codeView = [[NJK_VerificationCodeView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50) config:NJKConfig];
        codeView.backgroundColor = UIColor.whiteColor;
        codeView.boxBackViewName = @"NJK_VerificationBoxBackView";
        codeView.finishBlock = ^(NJK_VerificationCodeView * _Nonnull codeView, NSString * _Nonnull code) {
            NSLog(@"%@",code);
        };
        codeView;
    })];
}

@end
