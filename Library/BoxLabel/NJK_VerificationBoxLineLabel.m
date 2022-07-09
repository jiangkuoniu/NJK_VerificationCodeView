//
//  NJK_VerificationBoxLineLabel.m
//  NJK_VerificationCodeView
//
//  Created by NJK on 2022/7/9.
//

#import "NJK_VerificationBoxLineLabel.h"
#import <Masonry.h>

@implementation NJK_VerificationBoxLineConfig
- (instancetype)init{
    if (self = [super init]) {
        _lineHeight = 2;
        _lineWidth = 0;
        _lineColor = UIColor.blackColor;
    }
    return self;
}
@end


@interface NJK_VerificationBoxLineLabel ()
@property (nonatomic, strong)UIView *lineView;
@end
@implementation NJK_VerificationBoxLineLabel

- (void)creadeData{
    self.boxNormalConfig = NJK_VerificationBoxLineConfig.new;
    self.boxHighlightedConfig = NJK_VerificationBoxLineConfig.new;

    ((NJK_VerificationBoxLineConfig *)self.boxNormalConfig).lineColor = UIColor.blackColor;
    ((NJK_VerificationBoxLineConfig *)self.boxHighlightedConfig).lineColor = UIColor.redColor;
}
- (void)creadeUI{
    self.lineView = UIView.new;
    [self addSubview:self.lineView];
}

- (void)updateUINormal{
    [super updateUINormal];
    NJK_VerificationBoxLineConfig *boxNormalConfig = (NJK_VerificationBoxLineConfig *)self.boxNormalConfig;
    if (!boxNormalConfig) {
        return;
    }

    self.lineView.backgroundColor = boxNormalConfig.lineColor;
    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.centerX.equalTo(self);
        make.height.mas_equalTo(boxNormalConfig.lineHeight);
        if (boxNormalConfig.lineWidth) {
            make.width.mas_equalTo(boxNormalConfig.lineWidth);
        }else{
            make.left.right.equalTo(self);
        }
    }];

}

- (void)updateUIHighlighted{
    [super updateUIHighlighted];
    NJK_VerificationBoxLineConfig *boxHighlightedConfig = (NJK_VerificationBoxLineConfig *)self.boxHighlightedConfig;
    if (!boxHighlightedConfig) {
        return;
    }

    self.lineView.backgroundColor = boxHighlightedConfig.lineColor;
    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.centerX.equalTo(self);
        make.height.mas_equalTo(boxHighlightedConfig.lineHeight);
        if (boxHighlightedConfig.lineWidth) {
            make.width.mas_equalTo(boxHighlightedConfig.lineWidth);
        }else{
            make.left.right.equalTo(self);
        }
    }];
}

@end
