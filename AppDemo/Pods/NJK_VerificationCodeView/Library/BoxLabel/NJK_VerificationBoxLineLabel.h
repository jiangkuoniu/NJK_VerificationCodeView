//
//  NJK_VerificationBoxLineLabel.h
//  NJK_VerificationCodeView
//
//  Created by NJK on 2022/7/9.
//

#import "NJK_VerificationBoxBaseLabel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NJK_VerificationBoxLineConfig : NJK_VerificationBoxBaseConfig
@property (assign, nonatomic) NSInteger        lineHeight;
@property (assign, nonatomic) NSInteger        lineWidth;
@property (strong,  nonatomic) UIColor         *lineColor;
@end


@interface NJK_VerificationBoxLineLabel : NJK_VerificationBoxBaseLabel

@end

NS_ASSUME_NONNULL_END
