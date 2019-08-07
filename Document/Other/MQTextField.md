# MQTextField

> textDidChange 回调

> 后续会修改textDidChange返回方式  
> 后续会添加文本长度限制
> 后续会添加正在编辑中的文本回调


```
.delegate_
```

由于swift不能重写父类变量类型, 为了强类型考虑, 就把新的`delegate`放在这里

# MQTextFieldDelegate

> `UITextFieldDelegate`

> 正在考虑是否要重写为强类型

```
optional func textField(_ textField: MQTextField, textDidChange text: String)
```

TextField文本变化的回调
