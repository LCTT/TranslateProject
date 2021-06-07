[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11095-1.html)
[#]: subject: (Manage your shell environment)
[#]: via: (https://fedoramagazine.org/manage-your-shell-environment/)
[#]: author: (Eduard Lucena https://fedoramagazine.org/author/x3mboy/)

管理你的 shell 环境
======

![][1]

前段时间，Fedora Magazine 发表了一篇 [介绍 ZSH][2] 的文章，它是 Fedora 默认的 bash shell 的替代品。这一次，我们将着重定制它来更有效地使用它。本文中显示的所有概念也适用于其他 shell，例如 bash。

### 别名

别名是命令的快捷方式。为那些需要经常执行，但需要很长时间输入的长命令创建快捷方式很有用。语法是：

```
$ alias yourAlias='complex command with arguments'
```

它们并不总是用来缩短长命令。重要的是，你将它们用于你经常执行的任务。可能的例子：

```
$ alias dnfUpgrade='dnf -y upgrade'
```

这样，为了进行系统升级，我只需输入 `dnfUpgrade` 而不用输入完整的 `dnf` 命令。

在终端中设置别名的问题是，一旦终端会话关闭，别名就会丢失。要永久设置它们，请使用资源文件。

### 资源文件

资源文件（即 rc 文件）是在会话或进程开始时（每个用户在开启新终端窗口或启动 vim 等新程序时）加载的配置文件。对于 ZSH，资源文件是 `.zshrc`，对于 bash，它是 `.bashrc`。

要使别名成为永久别名，你可以将它们放入资源文件中。你可以使用你选择的文本编辑器编辑资源文件。这里使用 vim：

```
$ vim $HOME/.zshrc
```

或者对于 bash：

```
$ vim $HOME/.bashrc
```

请注意，资源文件的位置是相对于家目录指定的。这是 ZSH（或 bash）默认为每个用户查找该文件的位置。

还有一种是将你的配置放在任何其他文件中，然后读取它：

```
$ source /path/to/your/rc/file
```

同样，在会话中直接读取它只会将其应用于会话，因此要使其永久化，请将 `source` 命令添加到资源文件中。将文件放在不同位置的优点是你可以随时读取它。这在共享环境中很有用。

### 环境变量

环境变量是分配了特定名称的值，你可以在脚本和命令中调用它们。它们以美元符号（`$`）开始。其中最常见的是指向主目录的 `$HOME`。

顾名思义，环境变量是你环境的一部分。使用以下语法设置变量：

```
$ http_proxy="http://your.proxy"
```

要使其成为环境变量，请使用以下命令将其导出：

```
$ export $http_proxy
```

要查看当前设置的所有环境变量，请使用 `env` 命令：

```
$ env
```

该命令输出会话中可用的所有变量。要演示如何在命令中使用它们，请尝试运行以下 `echo` 命令：

```
$ echo $PWD
/home/fedora
$ echo $USER
fedora
```

这里发生了变量扩展，即存储在变量中的值在命令中使用。

另一个有用的变量是 `$PATH`，它定义了 shell 查找二进制文件的目录。

### $PATH 变量

有许多对于操作系统很重要的目录或文件夹（在图形环境中调用它们的方式）。某些目录设置为保存可直接在 shell 中使用的二进制文件。这些目录在 `$PATH` 变量中定义。

```
$ echo $PATH
/usr/lib64/qt-3.3/bin:/usr/share/Modules/bin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/usr/libexec/sdcc:/usr/libexec/sdcc:/usr/bin:/bin:/sbin:/usr/sbin:/opt/FortiClient
```

当你希望在 shell 中访问自己的二进制文件（或脚本）时，这会有帮助。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/manage-your-shell-environment/

作者：[Eduard Lucena][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/x3mboy/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/05/manage-shell-env-816x345.jpg
[2]: https://fedoramagazine.org/set-zsh-fedora-system/
