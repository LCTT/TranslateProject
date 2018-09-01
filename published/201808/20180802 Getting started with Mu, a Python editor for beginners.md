Mu 入门：一个面向初学者的 Python 编辑器
======
> 相识 Mu —— 一个可以使学生学习 Python 更轻松的开源编辑器。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy)

Mu 是一个给初学者的 Python 编辑器，它旨在使学习体验更加愉快。它使学生​​能够在早期体验成功，这在你学习任何新知识的时候都很重要。

如果你曾试图教年轻人如何编程，你会立即把握到 [Mu][1] 的重要性。大多数编程工具都是由开发人员为开发人员编写的，不管他们的年龄如何，它们并不适合初学者。然而，Mu 是由老师为学生写的。

### Mu 的起源

Mu 是 [Nicholas Tollervey][2] 的心血结晶（我听过他 5 月份在 PyCon2018 上发言）。Nicholas 是一位受过古典音乐训练的音乐家，在担任音乐老师期间，他在职业生涯早期就开始对 Python 和开发感兴趣。他还写了 [Python in Education][3]，这是一本可以从 O'Reilly 下载的免费书。

Nicholas 曾经寻找过一个更简单的 Python 编程界面。他想要一些没有其他编辑器（甚至是 Python 附带的 IDLE3 编辑器 ）复杂性的东西，所以他与 Raspberry Pi 基金会（赞助他的工作）的教育总监 [Carrie Ann Philbin][4] 合作开发了 Mu 。

Mu 是一个用 Python 编写的开源程序（在 [GNU GPLv3][5] 许可证下）。它最初是为 [Micro:bit][6] 迷你计算机开发的，但是其他老师的反馈和请求促使他将 Mu 重写为通用的 Python 编辑器。

### 受音乐启发

Nicholas 对 Mu 的启发来自于他教授音乐的方法。他想知道如果我们按照教授音乐的方式教授编程会如何，并立即看出了差别。与编程不同，我们没有音乐训练营，我们也不会书上学习如何演奏乐器，比如说如何演奏长笛。

Nicholas 说，Mu “旨在成为真实的东西”，因为没有人可以在 30 分钟内学习 Python。当他开发 Mu 时，他与老师一起工作，观察编程俱乐部，并观看中学生使用 Python。他发现少即多，保持简单可以改善成品的功能。Nicholas 说，Mu 只有大约 3,000 行代码。

### 使用 Mu

要尝试它，[下载][7] Mu 并按照 [Linux、Windows 和 Mac OS] [8]的简易安装说明进行操作。如果像我一样，你想[在 Raspberry Pi 上安装] [9]，请在终端中输入以下内容：

```
$ sudo apt-get update
$ sudo apt-get install mu
```

从编程菜单启动 Mu。然后你就可以选择如何使用 Mu。

![](https://opensource.com/sites/default/files/uploads/mu_selectmode.png)

我选择了Python 3，它启动了编写代码的环境。Python shell 直接在下面，它允许你查看代码执行。

![](https://opensource.com/sites/default/files/uploads/mu_writecode.png)

菜单使用和理解非常简单，这实现了 Mu 的目标 —— 让编写代码对初学者简单。

在 Mu 用户的网站上可找到[教程][10]和其他资源。在网站上，你还可以看到一些帮助开发 Mu 的[志愿者][11]的名字。如果你想成为其中之一并[为 Mu 的发展做出贡献][12]，我们非常欢迎您。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/getting-started-mu-python-editor-beginners

作者：[Don Watkins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:https://codewith.mu
[2]:https://us.pycon.org/2018/speaker/profile/194/
[3]:https://www.oreilly.com/programming/free/python-in-education.csp
[4]:https://uk.linkedin.com/in/carrie-anne-philbin-a20649b7
[5]:https://mu.readthedocs.io/en/latest/license.html
[6]:http://microbit.org/
[7]:https://codewith.mu/en/download
[8]:https://codewith.mu/en/howto/install_with_python
[9]:https://codewith.mu/en/howto/install_raspberry_pi
[10]:https://codewith.mu/en/tutorials/
[11]:https://codewith.mu/en/thanks
[12]:https://mu.readthedocs.io/en/latest/contributing.html
