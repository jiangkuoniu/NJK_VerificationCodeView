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

---

# Logs

- change log: [click here](https://github.com/xjh093/JHVerificationCodeView/blob/master/CHANGELOG.md)

---

# More detail in Demo :)
