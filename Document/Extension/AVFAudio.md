# AVFAudio 相关扩展



## AVAudioConverter

不想手写转换，找内置方法偷懒，打包了pcm转换方法。



### Data 转 AVAudioPCMBuffer

```swift
public extension AVAudioConverter {
    public func convert(data: consuming Data) throws -> AVAudioPCMBuffer
}
```



### AVAudioPCMBuffer 格式转换

```swift
public extension AVAudioConverter {
    public func convert(_ iptBuf: AVAudioPCMBuffer) throws -> AVAudioPCMBuffer
}
```



## AVSpeechSynthesizer



### 获取合成结果Buffer

```swift
public extension AVSpeechSynthesizer {
    public func generateBuffer(_ utt: consuming AVSpeechUtterance) async -> AVAudioPCMBuffer?
    public func generateStream(_ utt: consuming AVSpeechUtterance) -> AsyncStream<AVAudioPCMBuffer>
}
```

直接进行pcm流播放可能存在噪声问题，打包收集结果。

`generateBuffer`直接获取完整PCM流，由于设备与系统版本差别，耗时存在差异。

`generateStream`是针对write方法的async包装。

