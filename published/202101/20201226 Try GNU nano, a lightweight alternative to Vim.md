[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12982-1.html)
[#]: subject: (Try GNU nano, a lightweight alternative to Vim)
[#]: via: (https://opensource.com/article/20/12/gnu-nano)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

试试 GNU nano，一个轻量级的 Vim 替代品
======

> 轻巧而直接，nano 提供了一个简单、直观的编辑器，没有额外的麻烦。

![](https://img.linux.net.cn/data/attachment/album/202101/04/124300oklykg26z6wyhjey.jpg)

许多 Linux 发行版都捆绑了 [Vim][2] 作为默认的文本编辑器。这吸引了很多长期使用 Linux 的用户，反正那些不喜欢它的用户也可以在安装后及时更换。不过 Vim 是一个很有趣的编辑器，因为它是少数几个打开时的模式不允许输入文字的编辑器之一。这对任何用户来说都是一个令人费解的选择，对一个新用户来说也是很困惑的。

多亏了 GNU nano，才有了 Vim 之外的另一种轻量级终端文本编辑器，而且使用起来非常方便 —— 它的窗口底部列出了最重要的命令。

![Black nano terminal with white text][3]

### 安装

在 Linux 和 macOS 上，你可能已经安装了 GNU nano。你可以用 `which` 命令来验证：

```
$ which nano
/bin/nano
```

如果你没有安装它，你可以从你的软件库中安装，或者你可以自己[下载它的源代码并编译][4]。

在 Windows 上，你可以使用 [Chocolatey][6] 来 [安装 GNU nano][5]。

### 启动 nano

从终端启动 nano，要么单独打开它：

```
$ nano
```

或者你也可以在你的命令后面加上一个文件的路径来打开一个特定的文件。如果你命名的文件还不存在，它就会被创建：

```
$ nano example.txt
```

### 使用 nano

nano，是个只要稍看一下，就会发现它是一个非常自明的东西。当你启动它的时候，nano 会打开一个空的缓冲区或者你要打开的文件。在屏幕下方，有一个功能列表和相应的键盘快捷键。更多的功能可以按 `Ctrl+G` 获取帮助。

以下是最重要的应用程序命令：

  * `Ctrl+S` 保存你的工作
  * `Ctrl+W` 另存为
  * `Ctrl+R` 加载文件（读取）
  * `Ctrl+X` 退出
  * `Ctrl+G` 获得帮助

以下是最常用的编辑命令：

  * `Alt+A` 选择（标记）一个区域
  * `Ctrl+K` 剪切标记的文字
  * `Ctrl+U` 粘贴（不剪切）
  * `Alt+F` 撤销
  * `Alt+E` 重做

### 可定制

nano 不像 Emacs 或 Vim 那样可扩展，但你可以在一个名为 `~/.nanorc` 的文件中进行一些重要的定制。在这个文件中，你可以设置全局的偏好，包括文字折行设置、颜色方案、行号等。你也可以创建你自己的键绑定，所以如果你想用 `Ctrl+V` 来代替 nano 默认的 `Ctrl+U` 来粘贴，你可以改变分配给 `paste` 函数的绑定。
 
```
bind ^V paste all
```

你可以在 [GNU nano 文档][7]中获得所有可用函数的列表。

### 简单而有效

GNU nano 是一款简单明了的文本编辑器。它易于使用，并提供了你所期望的所有文本编辑器的功能。试试吧，享受直观编辑的简单性。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/gnu-nano

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-docdish-typewriter-pink.png?itok=OXJBtyYf (A pink typewriter)
[2]: https://opensource.com/article/20/12/vi-text-editor
[3]: https://opensource.com/sites/default/files/uploads/nano-31_days-nano-opensource.png (Black nano terminal with white text)
[4]: http://nano-editor.org
[5]: https://opensource.com/article/20/12/%C2%A0https://chocolatey.org/packages/nano
[6]: https://opensource.com/article/20/3/chocolatey
[7]: https://www.nano-editor.org/dist/latest/nanorc.5.html
