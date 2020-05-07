# MQKit

拖延症巨制, 不定时太监

既然12.2 Swift ABI稳定, SwiftPM也来了, 那么就尽量纯swift吧

在[QMUI](https://github.com/Tencent/QMUI_iOS)里看到了一些感觉有趣的方法，这里就班门弄斧了

许久之后可能会更新一波UIView相关的内容

随缘更新

# 集成

- SwiftPM

```
git@github.com:M-Quadra/MQKit.git
or
https://github.com/M-Quadra/MQKit.git
```

- CocoaPods

```
pod 'MQKit', :git => 'git@github.com:M-Quadra/MQKit.git'
or
pod 'MQKit', :git => 'https://github.com/M-Quadra/MQKit.git'
```

暂不支持`Objective-C`(懒), 可尝试手动打`framework`

由于`SwiftPM`目前不支持资源引用, 相关功能已移除

还不敢发正式库\_(ˊཀˋ」∠)_

# 方法扩展

1. [Foundation](Document/Extension/Foundation/Foundation.md)
2. [UIKit](Document/Extension/UIKit/UIKit.md)
3. [Metal](Document/Extension/Metal/Metal.md)

# 零零碎碎

1. [震动反馈](Document/Other/MQTaptic.md)
2. [简易Keychain](Document/Other/MQKeychain.md)
3. [加密解密](Document/Other/MQCrypt.md)
4. [MQCollectionView](Document/MQ_Class.md)
5. [MQTableView](Document/MQ_Class.md)
6. [MQHorizontalPagingView](Document/MQ_Class.md)
7. [MQTextField](Document/Other/MQTextField.md)
