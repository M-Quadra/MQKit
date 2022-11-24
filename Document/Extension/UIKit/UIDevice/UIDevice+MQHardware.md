# UIDevice+MQHardware

```
public var identifier: String { get }
```

获取机型标志, 如`iPhone11,8`

```
public var generation: String { get }
```

获取机型, 如`iPhone 4s`

```
.mq_totalCapacity
```

获取总容量

```
.mq_availableCapacity
```

获取可用容量

```
.mq_totalMemory
```

获取总内存大小

```
.mq_availableMemory
```

获取可用内存大小(低于实际值)

```
.mq_cpuThreads
```

获取CPU线程数(模拟器运行只能获取线程数, 目前手机没有超线程, 所以此处称呼为线程数)

```
.mq_simInfo
```

sim卡信息, 为双卡数组做了排序

```
.mq_isPad
```

判断是否为iPad
