# NJK_VerificationCodeView
A validation box that can be expanded freely

---

# Version
Latest release version: 
- [1.3.7](https://github.com/jiangkuoniu/NJK_VerificationCodeView/releases)


# Cocoapods

`pod "NJK_VerificationCodeView"`

---

# What
![Simulator Screen Shot - iPhone 11 Pro Max - 2022-07-11 at 11 37 00](https://user-images.githubusercontent.com/25656751/178184043-8f62db73-a44d-45ee-ae91-c2115e5337a0.png)


---

# Usage

```
    NJK_VerificationCodeViewConfig *NJKConfig = NJK_VerificationCodeViewConfig.new;
    NJKConfig.padding = UIEdgeInsetsMake(0, 10, 0, 10);
    NJKConfig.inputCodeNumber = 6;
    NJKConfig.showDivider = NO;
    NJKConfig.tintColor = UIColor.redColor;
    NJKConfig.boxLabelString = @"NJK_VerificationBoxBorderLabel";

    [self.view addSubview:({
        NJK_VerificationCodeView *codeView = [[NJK_VerificationCodeView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50) config:NJKConfig];
        codeView.backgroundColor = UIColor.whiteColor;
        codeView.finishBlock = ^(NJK_VerificationCodeView * _Nonnull codeView, NSString * _Nonnull code) {
            NSLog(@"%@",code);
        };
        codeView;
    })];
```



#自定义样式
```
//
//  NJK_VerificationBoxBackLabel.h
//  AppDemo
//
//  Created by NJK on 2022/7/11.
//

#import "NJK_VerificationBoxBaseLabel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NJK_VerificationBoxBackConfig : NJK_VerificationBoxBaseConfig
@property (strong,  nonatomic) UIColor         *backColor;
@end

@interface NJK_VerificationBoxBackLabel : NJK_VerificationBoxBaseLabel

@end

NS_ASSUME_NONNULL_END

```
```
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

```

---

# Logs

- change log: [click here](https://github.com/xjh093/JHVerificationCodeView/blob/master/CHANGELOG.md)

---

# More detail in Demo :)
