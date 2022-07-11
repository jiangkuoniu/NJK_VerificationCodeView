//
//  NJK_VerificationBoxBaseLabel.m
//  NJK_VerificationCodeView
//
//  Created by NJK on 2022/7/8.
//

#import "NJK_VerificationBoxBaseLabel.h"

@implementation NJK_VerificationBoxBaseConfig
@end

@implementation NJK_VerificationBoxBaseLabel

- (instancetype)init{
    if (self = [super init]) {
        [self creadeData];
        [self creadeUI];
        [self creadeNotification];
        [self updateUINormal];
    }
    return self;
}

- (void)creadeData{
    self.boxNormalConfig = NJK_VerificationBoxBaseConfig.new;
    self.boxHighlightedConfig = NJK_VerificationBoxBaseConfig.new;
}
- (void)creadeUI{}

- (void)creadeNotification{
    [self addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"text"]) {
        if (((NSString *)[change objectForKey:@"new"]).length) {
            [self updateUIHighlighted];
        }else{
            [self updateUINormal];
        }
    }
}

- (void)updateUINormal{}

- (void)updateUIHighlighted{}

@end
