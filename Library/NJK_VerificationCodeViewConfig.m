//
//  NJK_VerificationCodeViewConfig.m
//  CodeTextField
//
//  Created by NJK on 2022/6/24.
//

#import "NJK_VerificationCodeViewConfig.h"

@implementation NJK_VerificationCodeViewConfig

- (instancetype)init{
    if (self = [super init]) {
        _inputCodeNumber = 4;
        _inputBoxWidth = 70;
        _inputBoxHeight = 50;
        _inputBoxSpacing = 5;
        _padding = UIEdgeInsetsMake(0, 0, 0, 0);
        _tintColor = UIColor.blackColor;
        _secureTextEntry = NO;
        _showDivider = NO;
        _dividerWidth = _inputBoxWidth;
        _dividerHeight = 2;
        _font = [UIFont systemFontOfSize:20];
        _inputType = NJKConfigInputType_Number_Alphabet;
        _textColor = UIColor.blackColor;
        _showFlickerAnimation = YES;
        _keyboardType = UIKeyboardTypeNumberPad;
        _boxLabelString = @"NJK_VerificationBoxBaseLabel";
    }
    return self;
}

@end
