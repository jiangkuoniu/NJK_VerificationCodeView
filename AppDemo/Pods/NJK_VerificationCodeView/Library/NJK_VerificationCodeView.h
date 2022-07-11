//
//  NJK_VerificationCodeView.h
//  CodeTextField
//
//  Created by NJK on 2022/6/24.
//

#import <UIKit/UIKit.h>
#import "NJK_VerificationCodeViewConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface NJK_VerificationCodeView : UIView
@property (nonatomic, copy) void (^finishBlock)(NJK_VerificationCodeView *codeView, NSString *code);
- (instancetype)initWithFrame:(CGRect)frame config:(NJK_VerificationCodeViewConfig *)config;
@end

NS_ASSUME_NONNULL_END
