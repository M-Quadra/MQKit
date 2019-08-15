# MQTextField

> textDidChange 回调  
> 文本输入长度限制

> 后续可能会让MQTextFieldDelegate使用强类型MQTextField  
> 后续可能会添加触发输入限制的回调  
> 后续可能会添加输入字符限制

```
.delegate_
```

由于swift不能重写父类变量类型, 为了强类型考虑, 就把新的`delegate`放在这里

```
.maxTextCount
```

最大文本`Count`, 计算方式为`String.count`, 默认Int.max

# MQTextFieldDelegate

> `UITextFieldDelegate`

> 正在考虑是否要重写为强类型

```
optional func textField(_ textField: MQTextField, textDidChange text: String)
```

TextField文本变化的回调

# UITextField+MQ

## String

```
.mq_lengthOfNSString
```

NSString 的length, 没想到有啥具体使用的地方, 暂时不开放

## UITextField

```
.mq_markedText
```

获取`markedTextRange`对应`Text`, 中文输入选词

```
.mq_selectedText
```

获取`selectedTextRange`对应`Text`
