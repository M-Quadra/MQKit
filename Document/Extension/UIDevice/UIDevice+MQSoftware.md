# UIDevice+MQSoftware

```
.mq_isJailbroken
```

检测设备是否越狱(建议直接复制代码并使用exit(0))

```
.mq_isDebug
```

判断当前是否处于debug

```
.mq_networkType
```

获取当前网络类型, 4G/Wi-Fi

```
func mq_systemUserAgent(_ closure: @escaping (_: String)->Void)
```

获取默认UserAgent

```
.mq_systemPoweronTime
```

上一次设备启动时间戳, 精度μs