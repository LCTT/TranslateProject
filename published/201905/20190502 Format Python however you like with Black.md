[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10864-1.html)
[#]: subject: (Format Python however you like with Black)
[#]: via: (https://opensource.com/article/19/5/python-black)
[#]: author: (Moshe Zadka  https://opensource.com/users/moshez/users/moshez/users/moshez)

使用 Black 自由格式化 Python
======

> 在我们覆盖 7 个 PyPI 库的系列文章中了解解决 Python 问题的更多信息。

![OpenStack source code \(Python\) in VIM](https://img.linux.net.cn/data/attachment/album/201905/16/220249ethkikh5h1uib5iy.jpg)

Python 是当今使用最多的[流行编程语言][2]之一，因为：它是开源的，它有广泛的用途（例如 Web 编程、业务应用、游戏、科学编程等等），它有一个充满活力和专注的社区支持它。这个社区可以让我们在 [Python Package Index][3]（PyPI）中有如此庞大、多样化的软件包，用以扩展和改进 Python 并解决不可避免的问题。

在本系列中，我们将介绍七个可以帮助你解决常见 Python 问题的 PyPI 库。在第一篇文章中，我们了解了 [Cython][4]。今天，我们将使用 [Black][5] 这个代码格式化工具。

### Black

有时创意可能是一件美妙的事情。有时它只是一种痛苦。我喜欢创造性地解决难题，但我希望我的 Python 格式尽可能一致。没有人对使用“有趣”缩进的代码印象深刻。

但是比不一致的格式更糟糕的是除了检查格式之外什么都没有做的代码审查。这对审查者来说很烦人，对于被审查者来说甚至更烦人。当你的 linter 告诉你代码缩进不正确时，但没有提示*正确*的缩进量，这也会令人气愤。

使用 Black，它不会告诉你*要*做什么，它是一个优良、勤奋的机器人：它将为你修复代码。

要了解它如何工作的，请随意写一些非常不一致的内容，例如：

```
def add(a, b): return a+b

def mult(a, b):
      return \
        a              *        b
```

Black 抱怨了么？并没有，它为你修复了！

```
$ black math 
reformatted math
All done! ✨ 🍰 ✨
1 file reformatted.
$ cat math 
def add(a, b):
    return a + b


def mult(a, b):
    return a * b
```

Black 确实提供了报错而不是修复的选项，甚至还有输出 diff 编辑样式的选项。这些选项在持续集成 （CI）系统中非常有用，可以在本地强制运行 Black。此外，如果 diff 输出被记录到 CI 输出中，你可以直接将其粘贴到 `patch` 中，以便在极少数情况下你需要修复输出，但无法本地安装 Black 使用。


```
$ black --check --diff bad 
--- math 2019-04-09 17:24:22.747815 +0000
+++ math 2019-04-09 17:26:04.269451 +0000
@@ -1,7 +1,7 @@
-def add(a, b): return a + b
+def add(a, b):
+    return a + b
 
 
 def mult(a, b):
-          return \
-                  a             *             b
+    return a * b
 
would reformat math
All done! 💥 💔 💥
1 file would be reformatted.
$ echo $?
1
```

在本系列的下一篇文章中，我们将介绍 attrs ，这是一个可以帮助你快速编写简洁、正确的代码的库。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/python-black

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez/users/moshez/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openstack_python_vim_1.jpg?itok=lHQK5zpm (OpenStack source code (Python) in VIM)
[2]: https://opensource.com/article/18/5/numbers-python-community-trends
[3]: https://pypi.org/
[4]: https://opensource.com/article/19/4/7-python-problems-solved-cython
[5]: https://pypi.org/project/black/
