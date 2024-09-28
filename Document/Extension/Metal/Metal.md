# Metal 相关扩展

太久不碰Shader，准备删除。



# MTLTexture+MQ

```
.mq_uiImage(alpha: Bool = false) -> UIImage?
```

从`MTLTexture`中获取`UIImage`, `alpha`决定是否使`colorAttachments[0].clearColor`中的`alpha`值生效

# MTLClearColor+MQ

```
.mq_black
.mq_darkGray
.mq_lightGray
.mq_white
.mq_gray
.mq_red
.mq_green
.mq_blue
.mq_cyan
.mq_yellow
.mq_magenta
.mq_orange
.mq_purple
.mq_brown
```

与`UIColor`对应的预设颜色

```
.mq_random
```

随机色