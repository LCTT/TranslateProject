[#]: subject: (Use this open source tool to monitor variables in Python)
[#]: via: (https://opensource.com/article/21/4/monitor-debug-python)
[#]: author: (Tian Gao https://opensource.com/users/gaogaotiantian)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13279-1.html)

使用这个开源工具来监控 Python 中的变量
======

> Watchpoints 是一个简单但功能强大的工具，可以帮助你在调试 Python 时监控变量。

![](https://img.linux.net.cn/data/attachment/album/202104/08/231614imw8zqfncz5qwwow.jpg)

在调试代码时，你经常面临着要弄清楚一个变量何时发生变化。如果没有任何高级工具，那么可以选择使用打印语句在期望它们更改时输出变量。然而，这是一种非常低效的方法，因为变量可能在很多地方发生变化，并且不断地将其打印到终端上会产生很大的干扰，而将它们打印到日志文件中则变得很麻烦。

这是一个常见的问题，但现在有一个简单而强大的工具可以帮助你监控变量：[watchpoints][2]。

[“监视点”的概念在 C 和 C++ 调试器中很常见][3]，用于监控内存，但在 Python 中缺乏相应的工具。`watchpoints` 填补了这个空白。

### 安装

要使用它，你必须先用 `pip` 安装它：

```
$ python3 -m pip install watchpoints
```

### 在Python中使用 watchpoints

对于任何一个你想监控的变量，使用 `watch` 函数对其进行监控。

```
from watchpoints import watch

a = 0
watch(a)
a = 1
```

当变量发生变化时，它的值就会被打印到**标准输出**：

```
====== Watchpoints Triggered ======

Call Stack (most recent call last):
  <module> (my_script.py:5):
> a = 1
a:
0
->
1
```

信息包括：

  * 变量被改变的行。
  * 调用栈。
  * 变量的先前值/当前值。

它不仅适用于变量本身，也适用于对象的变化：

```
from watchpoints import watch

a = []
watch(a)
a = {} # 触发
a["a"] = 2 # 触发
```

当变量 `a` 被重新分配时，回调会被触发，同时当分配给 `a` 的对象发生变化时也会被触发。

更有趣的是，监控不受作用域的限制。你可以在任何地方观察变量/对象，而且无论程序在执行什么函数，回调都会被触发。

```
from watchpoints import watch

def func(var):
    var["a"] = 1

a = {}
watch(a)
func(a)
```

例如，这段代码打印出：

```
====== Watchpoints Triggered ======

Call Stack (most recent call last):

  <module> (my_script.py:8):
> func(a)
  func (my_script.py:4):
> var["a"] = 1
a:
{}
->
{'a': 1}
```

`watch` 函数不仅可以监视一个变量，它也可以监视一个字典或列表的属性和元素。

```
from watchpoints import watch

class MyObj:
    def __init__(self):
        self.a = 0

obj = MyObj()
d = {"a": 0}
watch(obj.a, d["a"]) # 是的，你可以这样做
obj.a = 1 # 触发
d["a"] = 1 # 触发
```

这可以帮助你缩小到一些你感兴趣的特定对象。

如果你对输出格式不满意，你可以自定义它。只需定义你自己的回调函数：

```
watch(a, callback=my_callback)

# 或者全局设置

watch.config(callback=my_callback)
```

当触发时，你甚至可以使用 `pdb`：

```
watch.config(pdb=True)
```

这与 `breakpoint()` 的行为类似，会给你带来类似调试器的体验。

如果你不想在每个文件中都导入这个函数，你可以通过 `install` 函数使其成为全局：

```
watch.install() # 或 watch.install("func_name") ，然后以 func_name() 方式使用
```

我个人认为，`watchpoints` 最酷的地方就是使用直观。你对一些数据感兴趣吗？只要“观察”它，你就会知道你的变量何时发生变化。

### 尝试 watchpoints

我在 [GitHub][2] 上开发维护了 `watchpoints`，并在 Apache 2.0 许可下发布了它。安装并使用它，当然也欢迎大家做出贡献。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/monitor-debug-python

作者：[Tian Gao][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gaogaotiantian
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/look-binoculars-sight-see-review.png?itok=NOw2cm39 (Looking back with binoculars)
[2]: https://github.com/gaogaotiantian/watchpoints
[3]: https://opensource.com/article/21/3/debug-code-gdb
