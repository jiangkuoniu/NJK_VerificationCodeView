//
//  NJK_VerificationBoxBorderLabel.h
//  NJK_VerificationCodeView
//
//  Created by NJK on 2022/7/8.
//

#import "NJK_VerificationBoxBaseLabel.h"

NS_ASSUME_NONNULL_BEGIN
@interface NJK_VerificationBoxBorderConfig : NJK_VerificationBoxBaseConfig
@property (assign, nonatomic) NSInteger        cornerRadius;
@property (assign, nonatomic) NSInteger        borderWidth;
@property (strong,  nonatomic) UIColor         *borderColor;
@end

@interface NJK_VerificationBoxBorderLabel : NJK_VerificationBoxBaseLabel

@end

NS_ASSUME_NONNULL_END
