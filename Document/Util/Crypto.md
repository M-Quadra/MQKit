# Crypto

> 虽然已经有, 但我喜欢这么调（
> 



## Hash

```swift
Crypto.md5(_ data: Data) -> Data
```

md5

```swift
Crypto.sha256(_ data: Data) -> Data
```

sha256



## AES

```swift
Crypto.AES.CBC.encrypt(
    _ plaintext: Data,
    key: Data,
    iv: Data? = nil,
    padding: Crypto.Padding = .pkcs7
) -> Data?

Crypto.AES.CBC.decrypt(
    _ ciphertext: Data,
    key: Data,
    iv: Data? = nil,
    padding: Crypto.Padding = .pkcs7
) -> Data?
```

AES CBC

```swift
Crypto.AES.ECB.encrypt(
    _ plaintext: Data,
    key: Data,
    iv: Data? = nil,
    padding: Crypto.Padding = .pkcs7
) -> Data?

Crypto.AES.ECB.decrypt(
    _ ciphertext: Data,
    key: Data,
    iv: Data? = nil,
    padding: Crypto.Padding = .pkcs7
) -> Data?
```

AES ECB



```swift
@available(iOS 13.0, *)
Crypto.AES.GCM.encrypt(_ plaintext: Data, key: Data) -> Data?
```

AES GCM加密, 输出格式`nonce + ciphertext + tag`

```swift
@available(iOS 13.0, *)
Crypto.AES.GCM.decrypt(_ ciphertext: Data, key: Data) -> Data?
```

AES GCM解密, 明文格式`nonce + ciphertext + tag`



## RSA

```swift
Crypto.RSA.PKCS1.encrypt(_ plaintext: Data, publicKey keyData: Data) -> Data?
```

RSA PKCS1 公钥加密

```swift
Crypto.RSA.PKCS1.decrypt(_ ciphertext: Data, privateKey keyData: Data) -> Data?
```

RSA PKCS1 私钥解密

```swift
Crypto.RSA.PKCS1.sign(_ plaintext: Data, privateKey keyData: Data, hash: Crypto.RSA.Hash = .sha256) -> Data?
```

RSA PKCS1 私钥签名

```swift
Crypto.RSA.PKCS1.verify(_ plaintext: Data, publicKey keyData: Data, signature: Data, hash: Crypto.RSA.Hash = .sha256)
```

RSA PKCS1 公钥验签



```swift
Crypto.RSA.Raw.decrypt(_ ciphertext: Data, publicKey keyData: Data) -> Data?
```

RSA Raw 公钥解密
