# AVFAudio 相关扩展



## AVAudioConverter

不想手写转换，找内置方法偷懒，打包了pcm转换方法。

```swift
func convert(to outputBuffer: AVAudioBuffer, error outError: NSErrorPointer, withInputFrom inputBlock: @escaping AVAudioConverterInputBlock) -> AVAudioConverterOutputStatus
```

不知为啥具体转换过程必须在主线程调用，否则会崩溃。



### Data 转 AVAudioPCMBuffer

```swift
public extension AVAudioConverter {

    @MainActor public func convert(data: consuming Data) throws -> AVAudioPCMBuffer
}
```



### AVAudioPCMBuffer 格式转换

```swift
public extension AVAudioConverter {

    @MainActor public func convert(_ iptBuf: AVAudioPCMBuffer) throws -> AVAudioPCMBuffer

    @available(iOS 13, *)
    @MainActor public func convert(_ iptBuf: AVAudioPCMBuffer) async throws -> AVAudioPCMBuffer
}
```



## AVSpeechSynthesizer



### 获取合成结果Buffer

```swift
public extension AVSpeechSynthesizer {

    @available(iOS 13.0, *)
    public func generateBuffer(_ utt: consuming AVSpeechUtterance) async -> AVAudioPCMBuffer?
}
```

直接进行pcm流播放可能存在噪声问题，打包收集结果。
