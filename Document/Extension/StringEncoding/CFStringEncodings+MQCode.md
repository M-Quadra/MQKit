# CFStringEncodings

```
.mq_StringEncoding
```

CFStringEncodings 转 String.Encoding

# String

```
init?(data: Data, mq_encoding: CFStringEncodings)
```

使用`Data`与`CFStringEncodings`创建字符串

```
init?(data: Data, mq_encoding: String.Encoding)
```

等效系统方法, 纯粹为了上面修改方便留着