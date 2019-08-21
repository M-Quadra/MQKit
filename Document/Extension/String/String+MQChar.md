
```swift
func mq_substring(with charSet: MQCharacterSet) -> String
```

String 过滤

# MQCharacterSet (Set\<Character>)

```swift
MQCharacterSet.naturalNumber
```

自然数集合, [0-9]

```
MQCharacterSet.uppercaseLetter
```

大写字母集合, [A-Z]

```
MQCharacterSet.lowercaseLetter
```

小写字母集合, [a-z]

```
MQCharacterSet.letter
```

字母集合, [A-Z]|[a-z]

```
MQCharacterSet.base64
```

base64 字符集合, [A-Z]|[a-z]|[0-9]|[\+/=]

[为啥用Set\<Character>?](字符过滤.md)