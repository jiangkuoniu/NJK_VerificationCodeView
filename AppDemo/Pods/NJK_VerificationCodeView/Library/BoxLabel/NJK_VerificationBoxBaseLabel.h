//
//  NJK_VerificationBoxBaseLabel.h
//  NJK_VerificationCodeView
//
//  Created by NJK on 2022/7/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NJK_VerificationBoxBaseConfig : NSObject
@end

@interface NJK_VerificationBoxBaseLabel : UILabel
@property (nonatomic, strong)NJK_VerificationBoxBaseConfig *boxNormalConfig;
@property (nonatomic, strong)NJK_VerificationBoxBaseConfig *boxHighlightedConfig;

- (void)updateUINormal;
- (void)updateUIHighlighted;
@end

NS_ASSUME_NONNULL_END
