[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13123-1.html)
[#]: subject: (Namespaces are the shamash candle of the Zen of Python)
[#]: via: (https://opensource.com/article/19/12/zen-python-namespaces)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

命名空间是 Python 之禅的精髓
======

> 这是 Python 之禅特别系列的一部分，重点是一个额外的原则：命名空间。

![](https://img.linux.net.cn/data/attachment/album/202102/16/105800d64ceaeertt4u4ee.jpg)

著名的<ruby>光明节<rt>Hanukkah</rt></ruby>有八个晚上的庆祝活动。然而，光明节的灯台有九根蜡烛：八根普通的蜡烛和总是偏移的第九根蜡烛。它被称为 “shamash” 或 “shamos”，大致可以翻译为“仆人”或“看门人”的意思。

shamos 是点燃所有其它蜡烛的蜡烛：它是唯一一支可以用火的蜡烛，而不仅仅是观看。当我们结束 Python 之禅系列时，我看到命名空间提供了类似的作用。

### Python 中的命名空间

Python 使用命名空间来处理一切。虽然简单，但它们是稀疏的数据结构 —— 这通常是实现目标的最佳方式。

> *命名空间* 是一个从名字到对象的映射。
>
> —— [Python.org][2]

模块是命名空间。这意味着正确地预测模块语义通常只需要熟悉 Python 命名空间的工作方式。类是命名空间，对象是命名空间。函数可以访问它们的本地命名空间、父命名空间和全局命名空间。

这个简单的模型，即用 `.` 操作符访问一个对象，而这个对象又通常（但并不总是）会进行某种字典查找，这使得 Python 很难优化，但很容易解释。

事实上，一些第三方模块也采取了这个准则，并以此来运行。例如，[variants][3] 包把函数变成了“相关功能”的命名空间。这是一个很好的例子，说明 [Python 之禅][4] 是如何激发新的抽象的。

### 结语

感谢你和我一起参加这次以光明节为灵感的 [我最喜欢的语言][5] 的探索。

静心参禅，直至悟道。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/zen-python-namespaces

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_code_programming_laptop.jpg?itok=ormv35tV (Person programming on a laptop on a building)
[2]: https://docs.python.org/3/tutorial/classes.html
[3]: https://pypi.org/project/variants/
[4]: https://www.python.org/dev/peps/pep-0020/
[5]: https://opensource.com/article/19/10/why-love-python
