# MQKeychain

> 简易Keychain访问控制

```
static func set(key: String, value: Data?)
static func set(key: String, value: String)
```

设置key, value, String默认使用`.utf8`

若为nil则删除

```
static func search(key: String) -> Data?
static func search(stringKey: String) -> String
```

获取对应key的值

```
static func clear()
```

清空Keychain