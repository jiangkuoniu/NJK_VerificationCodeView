//
//  NJK_VerificationBoxBackLabel.m
//  AppDemo
//
//  Created by NJK on 2022/7/11.
//

#import "NJK_VerificationBoxBackLabel.h"


@implementation NJK_VerificationBoxBackConfig
- (instancetype)init{
    if (self = [super init]) {
        _backColor = UIColor.clearColor;
    }
    return self;
}
@end

@implementation NJK_VerificationBoxBackLabel

- (void)creadeData{
    self.boxNormalConfig = NJK_VerificationBoxBackConfig.new;
    self.boxHighlightedConfig = NJK_VerificationBoxBackConfig.new;

    ((NJK_VerificationBoxBackConfig *)self.boxNormalConfig).backColor = UIColor.greenColor;
    ((NJK_VerificationBoxBackConfig *)self.boxHighlightedConfig).backColor = UIColor.yellowColor;
}
- (void)creadeUI{
}

- (void)updateUINormal{
    [super updateUINormal];
    NJK_VerificationBoxBackConfig *boxNormalConfig = (NJK_VerificationBoxBackConfig *)self.boxNormalConfig;
    if (!boxNormalConfig) {
        return;
    }

    self.backgroundColor = boxNormalConfig.backColor;
}

- (void)updateUIHighlighted{
    [super updateUIHighlighted];
    NJK_VerificationBoxBackConfig *boxHighlightedConfig = (NJK_VerificationBoxBackConfig *)self.boxHighlightedConfig;
    if (!boxHighlightedConfig) {
        return;
    }

    self.backgroundColor = boxHighlightedConfig.backColor;
}

@end
