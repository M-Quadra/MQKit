# Metal 相关扩展

# MTLTexture+MQ

```
.mq_uiImage(alpha: Bool = false) -> UIImage?
```

从`MTLTexture`中获取`UIImage`, `alpha`决定是否使`colorAttachments[0].clearColor`中的`alpha`值生效