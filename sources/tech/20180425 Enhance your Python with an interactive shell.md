使用交互式 shell 来增强你的 Python
======
![](https://fedoramagazine.org/wp-content/uploads/2018/03/python-shells-816x345.jpg)
Python 编程语言已经成为 IT 中使用的最流行的语言之一。成功的一个原因是它可以用来解决各种问题。从网站开发到数据科学、机器学习到任务自动化，Python 生态系统有丰富的框架和库。本文将介绍 Fedora 软件包集合中提供的一些有用的 Python shell 来简化开发。

### Python Shell

Python Shell 让你以交互模式使用解释器。在测试代码或尝试新库时非常有用。在 Fedora 中，你可以通过在终端会话中输入 python3 来调用默认的 shell。虽然 Fedora 提供了一些更高级和增强的 shell。

### IPython

IPython 为 Python shell 提供了许多有用的增强功能。例子包括 tab 补全，对象内省，系统 shell 访问和命令历史检索。许多功能也被 [Jupyter Notebook][1] 使用，因为它底层使用 IPython。

#### 安装和运行 IPython
```
dnf install ipython3
ipython3

```

使用 tab 补全会提示你可能的选择。当你使用不熟悉的库时，此功能会派上用场。

![][2]

如果你需要更多信息，输入 ? 命令使用文档。有关更多详细信息，你可以使用 ?? 命令。

![][3]

另一个很酷的功能是使用 ! 字符执行系统 shell 命令的能力。然后可以在 IPython shell 中引用该命令的结果。

![][4]

IPython 完整的功能列表可在[官方文档][5]中找到。

### bpython

bpython 并不能像 IPython 做那么多，但它却在一个简单轻量级包中提供了一系列有用功能。除其他功能之外，bpython 提供：

  * 内嵌语法高亮显示
  * 在你输入时提供自动补全建议
  * 可预期的参数列表
  * 能够将代码发送或保存到 pastebin 服务或文件中



#### 安装和运行 bpython
```
dnf install bpython3
bpython3

```

在你输入的时候，bpython 为你提供了选择来自动补全你的代码。

![][6]

当你调用函数或方法时，会自动显示需要的参数和文档字符串。

![][7]

另一个很好的功能是可以使用功能键 F7 在外部编辑器（默认为 Vim）中打开当前的 bpython 会话。这在测试更复杂的程序时非常有用。

有关配置和功能的更多细节，请参考 bpython [文档][8]。

### 总结

使用增强的 Python shell 是提高生产力的好方法。它为你提供增强的功能来编写快速原型或尝试新库。你在使用增强的 Python shell 吗？请随意在评论区留言。

图片由 [David Clode][9] 在 [Unsplash][10] 上发布


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/enhance-python-interactive-shell/

作者：[Clément Verna][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/cverna/
[1]:https://ipython.org/notebook.html
[2]:https://fedoramagazine.org/wp-content/uploads/2018/03/ipython-tabcompletion.png
[3]:https://fedoramagazine.org/wp-content/uploads/2018/03/ipyhton_doc1.png
[4]:https://fedoramagazine.org/wp-content/uploads/2018/03/ipython_shell.png
[5]:https://ipython.readthedocs.io/en/stable/overview.html#main-features-of-the-interactive-shell
[6]:https://fedoramagazine.org/wp-content/uploads/2018/03/bpython1.png
[7]:https://fedoramagazine.org/wp-content/uploads/2018/03/bpython2.png
[8]:https://docs.bpython-interpreter.org/
[9]:https://unsplash.com/photos/d0CasEMHDQs?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[10]:https://unsplash.com/search/photos/python?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
