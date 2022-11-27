# Sync 并发工具

> 默认的NSLock async不安全, 根据测试, with-lock的表现也存在问题
>
> 看了看Go, 自己勉强糊了些疑似能用的东西
>
> 使用Actor替代OC中标记为过期的原子操作



## Mutex

互斥锁

```swift
public func lock() async
public func tryLock() async -> Bool
public func unlock() async
```



## Channel

约等于`AsyncStream`, 没有实现缓冲区限制, 相比原版取数据操作加了锁, 避免了部分情况下的奇怪阻塞/死锁

在没有读请求的情况下可以不主动close

```swift
public init()
public func close()
public func push(_ v: T)
public func pop() async -> T?
```



## Semaphore

信号量, 还没考虑是否开放, 为避免警告目前的实现方式过于丑陋

`async`没有Go那样runtime实现的信号量机制, 所以相关功能也不会依赖此实现

目前还很纠结, 后续可能删掉



## RWMutex

读写锁, 但是有`Actor`, 目前不考虑实现

后续待观察

