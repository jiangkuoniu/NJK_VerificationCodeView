//
//  NJK_VerificationBoxBorderLabel.m
//  NJK_VerificationCodeView
//
//  Created by NJK on 2022/7/8.
//

#import "NJK_VerificationBoxBorderLabel.h"

@implementation NJK_VerificationBoxBorderConfig
- (instancetype)init{
    if (self = [super init]) {
        _cornerRadius = 5;
        _borderWidth = 1;
        _borderColor = UIColor.clearColor;
    }
    return self;
}
@end


@implementation NJK_VerificationBoxBorderLabel

- (void)creadeData{
    self.boxNormalConfig = NJK_VerificationBoxBorderConfig.new;
    self.boxHighlightedConfig = NJK_VerificationBoxBorderConfig.new;
    
    ((NJK_VerificationBoxBorderConfig *)self.boxNormalConfig).borderColor = UIColor.grayColor;
    ((NJK_VerificationBoxBorderConfig *)self.boxHighlightedConfig).borderColor = UIColor.redColor;
}
- (void)updateUINormal{
    [super updateUINormal];
    NJK_VerificationBoxBorderConfig *boxNormalConfig = (NJK_VerificationBoxBorderConfig *)self.boxNormalConfig;
    if (!boxNormalConfig) {
        return;
    }
    self.layer.cornerRadius = boxNormalConfig.cornerRadius;
    self.layer.borderWidth = boxNormalConfig.borderWidth;
    self.layer.borderColor = boxNormalConfig.borderColor.CGColor;
    self.layer.masksToBounds = YES;
}

- (void)updateUIHighlighted{
    [super updateUIHighlighted];
    NJK_VerificationBoxBorderConfig *boxHighlightedConfig = (NJK_VerificationBoxBorderConfig *)self.boxHighlightedConfig;
    if (!boxHighlightedConfig) {
        return;
    }

    self.layer.cornerRadius = boxHighlightedConfig.cornerRadius;
    self.layer.borderWidth = boxHighlightedConfig.borderWidth;
    self.layer.borderColor = boxHighlightedConfig.borderColor.CGColor;
    self.layer.masksToBounds = YES;
}


@end
