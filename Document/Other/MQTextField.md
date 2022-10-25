# MQTextField

> textDidChange 回调  
> 文本输入长度限制

> 后续可能会添加触发输入限制的回调  
> 后续可能会添加输入字符限制   
> 也许不加了, 靠回调实现吧

```
var textDidChang: ((_ textField: MQTextField, _ text: String) -> Void)?
```

变化回调, 没有`markedTextRange`时触发, `delegate`太麻烦, 还是直接开闭包方便

```
var maxTextCount: Int
```

最大文本`Count`, 计算方式为`String.count`, 默认`0`, <=0时则没有限制

