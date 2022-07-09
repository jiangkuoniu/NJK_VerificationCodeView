//
//  NJK_VerificationCodeView.m
//  CodeTextField
//
//  Created by NJK on 2022/6/24.
//

#import "NJK_VerificationCodeView.h"
#import <Masonry/Masonry.h>
#import "NJK_VerificationBoxBaseLabel.h"

#define NJKVerificationAnimation @"NJKVerificationAnimation"

@interface NJK_VerificationCodeView ()
@property (nonatomic, strong)NJK_VerificationCodeViewConfig         *config;
@property (nonatomic, assign)CGFloat                                rootWidth;
@property (nonatomic, assign)CGFloat                                rootHeight;
@property (nonatomic, strong)UITextField                            *rootTextField;
@property (nonatomic, strong)NSMutableArray                         *textLabelArr;
@property (nonatomic, strong)CAShapeLayer                           *flickerLayer;
@end

@implementation NJK_VerificationCodeView

- (instancetype)initWithFrame:(CGRect)frame config:(NJK_VerificationCodeViewConfig *)config{
    if (self = [super initWithFrame:frame]) {
        self.config = config;
        self.rootWidth = self.frame.size.width;
        self.rootHeight = self.frame.size.height;

        [self updateConfig];
        [self creadeUI];
    }
    return self;
}

- (void)updateConfig{
#pragma ===================== 这里处理的是空间不够用的情况
    //Box宽度最小的情况
    //Box宽度最小为10.分割线和空格为5
    if ((self.config.padding.left+self.config.padding.right
        +self.config.inputCodeNumber*(10+5)-5//这里Box和空格的宽度
        +(self.config.showDivider?15:0))//这里是分割线和分割线的空格
        >self.rootWidth
        ) {//左右边距和不能大于父宽度

        self.config.inputBoxSpacing = 5;
        self.config.inputBoxWidth = 10;
        self.config.dividerWidth = 5;

        CGFloat paddingWidthHeight = (self.rootWidth - self.config.inputCodeNumber*15 + 5 - (self.config.showDivider?15:0))/2;
        self.config.padding = UIEdgeInsetsMake(self.config.padding.top, paddingWidthHeight, self.config.padding.bottom, paddingWidthHeight);
    }
    if ((self.config.padding.top+self.config.padding.bottom + 10)
        >self.rootHeight) {//上下边距和不能大于父高度

        self.config.inputBoxHeight = 10;
        self.config.padding = UIEdgeInsetsMake((self.rootHeight-10)/2, self.config.padding.left, (self.rootHeight-10)/2, self.config.padding.right);
    }

    if ((self.config.padding.left+self.config.padding.right
         +self.config.inputCodeNumber*(self.config.inputBoxWidth+self.config.inputBoxSpacing)
         -self.config.inputBoxSpacing
         +(self.config.showDivider?self.config.dividerWidth+self.config.inputBoxSpacing:0))
        >self.rootWidth) {//间距和宽度的设置

        if ((self.config.padding.left+self.config.padding.right
             +self.config.inputCodeNumber*(self.config.inputBoxWidth+5)
             - 5
             +(self.config.showDivider?self.config.dividerWidth+5:0))
            >self.rootWidth) {//间隔设置为5，如果还是大

            self.config.inputBoxSpacing = 5;
            self.config.inputBoxWidth = (self.rootWidth
                                         -(self.config.padding.left+self.config.padding.right)
                                         -self.config.inputCodeNumber*5+5
                                         -(self.config.showDivider?5:0)
                                         )/(self.config.inputCodeNumber+(self.config.showDivider?.5:0));

            self.config.dividerWidth = self.config.inputBoxWidth/2;
        }else{
            self.config.inputBoxSpacing = (self.rootWidth
                                           -(self.config.padding.left+self.config.padding.right)
                                           -self.config.inputCodeNumber*self.config.inputBoxWidth
                                           -(self.config.showDivider?self.config.dividerWidth:0)
                                           )/(self.config.inputCodeNumber+(self.config.showDivider?.5:0));
        }
    }
    if ((self.config.padding.top+self.config.padding.bottom+self.config.inputBoxHeight)>self.rootHeight) {//高度的设置
        self.config.inputBoxHeight = self.rootHeight - (self.config.padding.top+self.config.padding.bottom);
    }

#pragma ===================== 这里处理的是空间未使用完整的情况
    if ((self.config.padding.left+self.config.padding.right
         +self.config.inputCodeNumber*(self.config.inputBoxWidth+self.config.inputBoxSpacing)-self.config.inputBoxSpacing
         +(self.config.showDivider?self.config.dividerWidth+self.config.inputBoxSpacing:0))
        <self.rootWidth) {

        CGFloat leftAndRight = (self.rootWidth - (self.config.inputCodeNumber*(self.config.inputBoxWidth+self.config.inputBoxSpacing)-self.config.inputBoxSpacing))/2;
        self.config.padding = UIEdgeInsetsMake(self.config.padding.top, leftAndRight, self.config.padding.bottom, leftAndRight);
    }
    if ((self.config.padding.top+self.config.padding.bottom+self.config.inputBoxHeight)
        <self.rootHeight) {//高度的设置
        self.config.padding = UIEdgeInsetsMake((self.rootHeight-self.config.inputBoxHeight)/2, self.config.padding.left, (self.rootHeight-self.config.inputBoxHeight)/2, self.config.padding.right);
    }



    
}
- (void)creadeUI{
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.spacing = self.config.inputBoxSpacing;
    stackView.axis  =  UILayoutConstraintAxisHorizontal;

    [self addSubview:stackView];
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.config.padding.left);
        make.top.mas_equalTo(self.config.padding.top);
        make.width.mas_equalTo(self.rootWidth - self.config.padding.left - self.config.padding.right);
        make.height.mas_equalTo(self.rootHeight - self.config.padding.top - self.config.padding.bottom);
    }];



    [self.textLabelArr removeAllObjects];
    for (int i = 0; i<self.config.inputCodeNumber; i++) {
        if (i == self.config.inputCodeNumber/2 && self.config.showDivider) {
            [stackView addArrangedSubview:self.creadeLineView];
        }

        UILabel *textLabel = [NSClassFromString(self.config.boxLabelString) new];
        if (![textLabel isKindOfClass:[NJK_VerificationBoxBaseLabel class]]) {
            textLabel = NJK_VerificationBoxBaseLabel.new;
        }

        textLabel.textAlignment = NSTextAlignmentCenter;

        [stackView addArrangedSubview:textLabel];
        [self.textLabelArr addObject:textLabel];

        [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(self.config.inputBoxWidth));
            make.height.equalTo(@(self.config.inputBoxHeight));
       }];
    }


    self.rootTextField = [[UITextField alloc] init];
    self.rootTextField.frame = CGRectMake(0, CGRectGetHeight(stackView.frame), 0, 0);
    self.rootTextField.keyboardType = self.config.keyboardType;
    self.rootTextField.hidden = YES;
    if (@available(iOS 12.0, *)) {
        self.rootTextField.textContentType = UITextContentTypeOneTimeCode;
    }
    [self addSubview:self.rootTextField];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(RootTextFTextChange:) name:UITextFieldTextDidChangeNotification object:self.rootTextField];
    [self addGestureRecognizer:({
        [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(RootTextFTextChangeTap)];
    })];
}

- (UIView *)creadeLineView{
    UIView *lineView = UIView.new;
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(self.config.dividerWidth));
    }];

    UIView *line = UIView.new;
    line.backgroundColor = self.config.tintColor;
    [lineView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(lineView);
        make.height.mas_equalTo(@(self.config.dividerHeight));
        make.centerY.equalTo(lineView);
    }];
    return lineView;
}

- (void)RootTextFTextChangeTap{
    [self.rootTextField becomeFirstResponder];
    [self updateBoxView];
}
- (void)RootTextFTextChange:(NSNotification *)noti{
    if (self.rootTextField != noti.object) {
        return;
    }

    [self filterTextCode];
    [self updateBoxView];

    if (self.rootTextField.text.length == self.config.inputCodeNumber) {
        [self TextFSFinish];
    }
}

- (void)filterTextCode{
    NSString *text = [self.rootTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""];

    // number & alphabet
    NSMutableString *mstr = @"".mutableCopy;
    for (int i = 0; i < text.length; ++i) {
        unichar c = [text characterAtIndex:i];
        if (self.config.inputType == NJKConfigInputType_Number_Alphabet) {
            if ((c >= '0' && c <= '9') ||
                (c >= 'A' && c <= 'Z') ||
                (c >= 'a' && c <= 'z')) {
                [mstr appendFormat:@"%c",c];
            }
        }else if (self.config.inputType == NJKConfigInputType_Number) {
            if ((c >= '0' && c <= '9')) {
                [mstr appendFormat:@"%c",c];
            }
        }else if (self.config.inputType == NJKConfigInputType_Alphabet) {
            if ((c >= 'A' && c <= 'Z') ||
                (c >= 'a' && c <= 'z')) {
                [mstr appendFormat:@"%c",c];
            }
        }
    }

    text = mstr;
    NSInteger count = self.config.inputCodeNumber;
    if (text.length > count) {
        text = [text substringToIndex:count];
    }
    self.rootTextField.text = text;
}
- (void)updateBoxView{
    NJK_VerificationBoxBaseLabel *Responderlabel = self.textLabelArr.firstObject;

    NSString *textString = self.rootTextField.text;
    for (int i = 0; i < self.textLabelArr.count; ++i) {
        UILabel *textLabel = self.textLabelArr[i];
        if (i>=textString.length) {
            textLabel.text = @"";
        }else{
            unichar c = [textString characterAtIndex:i];
            textLabel.text = [NSString stringWithFormat:@"%c",c];

            if (i<(self.config.inputCodeNumber-1)) {
                Responderlabel = self.textLabelArr[i+1];
            }
        }
    }

#pragma ==========> 移除光标
    [self.flickerLayer removeAnimationForKey:NJKVerificationAnimation];
    [self.flickerLayer removeFromSuperlayer];

    if (textString.length == self.config.inputCodeNumber){
        return;
    }
    if (Responderlabel) {
        [self.flickerLayer addAnimation:[self xx_alphaAnimation] forKey:NJKVerificationAnimation];
        [Responderlabel.layer addSublayer:self.flickerLayer];
        Responderlabel.text = @" ";
    }
}
- (void)TextFSFinish{
    if (self.finishBlock) {
        self.finishBlock(self, self.rootTextField.text);
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self endEditing:YES];
    });
}

- (NSMutableArray *)textLabelArr{
    if (!_textLabelArr) {
        _textLabelArr = NSMutableArray.array;
    }
    return _textLabelArr;
}
- (CAShapeLayer *)flickerLayer{
    if (!_flickerLayer) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(self.config.inputBoxWidth/2-1
                                                                         ,(self.config.inputBoxHeight-self.config.font.lineHeight)/2
                                                                         ,2
                                                                         ,self.config.font.lineHeight)];
        _flickerLayer = [CAShapeLayer layer];
        _flickerLayer.path = path.CGPath;
        _flickerLayer.fillColor = self.config.tintColor.CGColor;
        [_flickerLayer addAnimation:[self xx_alphaAnimation] forKey:NJKVerificationAnimation];
    }
    return _flickerLayer;
}
- (CABasicAnimation *)xx_alphaAnimation{
    CABasicAnimation *alpha = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alpha.fromValue = @(1.0);
    alpha.toValue = @(0.0);
    alpha.duration = 1.0;
    alpha.repeatCount = CGFLOAT_MAX;
    alpha.removedOnCompletion = NO;
    alpha.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    return alpha;
}

@end
