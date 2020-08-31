# MQCrypt

> 咕咕咕咕咕
> 

# MQCrypt.AES128

```
func encrypt(data strIn: String, key: String, vi: String? = nil) -> String
```

base64字符串, AES128加密

```
func decrypt(data strIn: String, key: String, vi: String? = nil) -> String
```

base64字符串, AES128解密

```
func encrypt(data dataIn: Data, key: Data, vi: Data? = nil) -> Data
```

Data, AES128加密, 填充模式为`PKCS7Padding`

若存在偏移`vi`不为nil则使用`CBC`模式, 否则使用`ECB`模式

```
func decrypt(data dataIn: Data, key: Data, vi: Data? = nil) -> Data
```

Data, AES128解密, 规则同上

# Data+MQCrypt

```
Data.mq_random(bytes: Int) -> Data
```

返回指定长度的随机Data

```
.mq_random128
```

128位(16 bytes)随机Data

```
.mq_random192
```

192位(24 bytes)随机Data

```
.mq_random256
```

256位(32 bytes)随机Data

```
.mq_random1024
```

1024位(64 bytes)随机Data