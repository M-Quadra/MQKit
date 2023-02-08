# ThirdScheme

> 记录其他应用可能会用到的 URL Scheme



## QQ

ThirdScheme.QQ



```swift
static func canOpenQQGroup(_ group: String) -> Bool

@available(iOS 13.0.0, *)
@MainActor
static func byOpenQQGroup(
    _ group: String,
    options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:]
) async -> Bool

static func openQQGroup(
    _ group: String,
    options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:],
    completionHandler handler: ((Bool) -> Void)? = nil
)
```

Q群名片



```swift
static func canOpenScan() -> Bool

@available(iOS 13.0.0, *)
@MainActor
static func byOpenScan(
    options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:]
) async -> Bool

static func openScan(
    options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:],
    completionHandler handler: ((Bool) -> Void)? = nil
)
```

QQ 扫一扫



## 微信

ThirdScheme.WeChat



```swift
static func canOpenScan() -> Bool

@available(iOS 13.0.0, *)
@MainActor
static func byOpenScan(
    options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:]
) async -> Bool

static func openScan(
    options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:],
    completionHandler handler: ((Bool) -> Void)? = nil
)
```

微信 扫一扫

