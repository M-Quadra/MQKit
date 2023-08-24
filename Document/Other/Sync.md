# Sync 并发工具

> 当前的结构化并发调度上约等于OperationQueue, 没有同Go一般的强占式调度。因此许多基于线程的旧操作都存在问题。
>
> 为了更愉快地异步乱飞, 参考Go瞎折腾一些工具。



## Mutex

互斥锁

```swift
public func lock() async
public func unlock()
public func tryLock() -> Bool
```

公平调度偷懒, 饥饿模式摆烂\_(ˊཀˋ」∠)_



## Channel

约等于`AsyncStream`, 没有实现缓冲区限制

<del>相比原版取数据操作加了锁, 避免了部分情况下的奇怪阻塞/死锁</del>, iOS更新后奇怪的阻塞/死锁问题消失了!?

在没有读请求的情况下可以不主动close

```swift
public init()
public func close()
public func push(_ v: T)
public func byPop() async -> T?
```



## Semaphore

信号量, 当前实现过丑, 重写待定



## RWMutex

读写锁, 虽然有`Actor`, 但是系统内部的调度过于差劲

开发待定



## NoMainActor

```swift
Task { @NoMainActor in
    print("x")
}
```

阻止Task被分配至主线程
