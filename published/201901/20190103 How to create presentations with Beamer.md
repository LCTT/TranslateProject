[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10439-1.html)
[#]: subject: (How to create presentations with Beamer)
[#]: via: (https://opensource.com/article/19/1/create-presentations-beamer)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

如何使用 Beamer 创建演示文稿
======

> Beamer 将 LaTeX 强大的排版功能和生态系统带进创建幻灯片中。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus_presentation.png?itok=CQeyO61b)

[Beamer][1] 是用于生成幻灯片的 LaTeX 包。它最棒的功能之一是它可以利用 LaTeX 强大的排版系统和其生态系统中的所有其他软件包。例如，我经常在包含代码的 Beamer 演示文稿中使用 LaTeX 的 [listings][2] 包。

### 创建演示文稿

要创建一个 Beamer 文档，输入：

```
\documentclass{beamer}
```

与任何其他 LaTeX 文档一样，添加你要使用的任何包。例如，要使用 `listings` 包，请输入：

```
\usepackage{listings}
```

将所有内容放在 `document` 环境中：

```
\begin{document}
```

Beamer 文档通常时是一系列的 `frame` 环境。包含代码的 `frame` 应该被标记为 `fragile`：

```
\begin{frame}[fragile]
```

使用标题开始你的 `frame`：

```
\frametitle{Function to Do Stuff}
```

### 开始演示前测试你的代码

世上最糟糕的感受之一你在演讲中说到代码时，突然发现了一个 bug —— 也许是拼错了关键词或者漏掉了括号。

解决方法之一就是测试演示的代码。在多数演示环境中，这意味着创建一个单独的文件、编写测试接着拷贝和粘贴。

然而，在 Beamer 中有一种更好的方法。想象一下，你有一个名为 `do_stuff.py` 的文件，其中包含代码。你可以在第二个文件中编写 `do_stuff.py` 代码的测试，你可以将其命名为 `test_do_stuff.py`，并且可以使用 [pytest][3] 测试。但是，`do_stuff.py` 中的大多数行都缺乏教学价值，比如定义辅助函数。

要简化你受众看到的东西，你可在演示文稿中只导入你要讨论的行到 frame 中：

```
\lstinputlisting[
    language=Python,
    firstline=8,
    lastline=15
]{do_stuff.py}
```

由于你会对这几行（从 8 到 15）进行讨论，因此幻灯片上不需要任何其他内容。结束 `frame`：

```
\end{frame}
```

在下一张幻灯片中，你想展示刚才的 `do_stuff()` 函数的用法示例：

```
\begin{frame}[fragile]
\frametitle{Calling Function to Do Stuff}
\lstinputlisting[
    language=Python,
    firstline=17,
    lastline=19
]{do_stuff.py}
\end{frame}
```

你使用相同的文件，但这次显示调用该函数的行。最后，结束 `document`：

```
\end{document}
```

假设你在 `do_stuff.py` 中有一个合适的 Python 文件，这将生成一个含有 2 页的幻灯片。

Beamer 还支持必要的功能如渐进式演示，每次给观众展示一部分以免受到前面的打扰。在行中放入 `\pause` 会将页面分成不同的部分：

```
\begin{frame}
Remember:
\begin{itemize}
\item This will show up on the first slide. \pause
\item This will show up on the
      second slide, as well as the preceding point. \pause
\item Finally, on the third slide,
       all three bullets will show up.
\end{frame}
```

### 创建讲义

Beamer 中我最喜欢的功能是可以用 `\documentclass[ignorenonframetext]{beamer}` 设置忽略 `frame` 外的所有内容。当我准备演示文稿时，我离开顶部（声明文档类的位置）并自动生成它的两个版本：我的演示稿使用 Beamer 忽略任何 `frame` 之外的所有文本，另一个含有类似这样的头：

```
\documentclass{article}
\usepackage{beamerarticle}
```

这会生成一份讲义：一份含有所有 `frame` 和它们之间文字的 PDF。

当会议组织者要求我发布我的幻灯片时，我会包含原始幻灯片作为参考，但我希望人们拿到的是讲义，它包含了所有我不想在幻灯片上写的解释部分。

在创建幻灯片时，人们经常会考虑是为演讲优化讲稿还是为之后想要阅读它的人们优化。幸运的是，Beamer 提供了两全其美的办法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/create-presentations-beamer

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://www.overleaf.com/learn/latex/Beamer
[2]: https://www.overleaf.com/learn/latex/Code_listing
[3]: https://docs.pytest.org/en/latest/
