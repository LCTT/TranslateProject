[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11258-1.html)
[#]: subject: (How To Change Linux Console Font Type And Size)
[#]: via: (https://www.ostechnix.com/how-to-change-linux-console-font-type-and-size/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

如何更改 Linux 控制台字体类型和大小
======

![](https://img.linux.net.cn/data/attachment/album/201908/23/041741x6qiajjijupjyjsp.jpg)

如果你有图形桌面环境，那么就很容易更改文本的字体以及大小。但你如何在没有图形环境的 Ubuntu 无头服务器中做到？别担心！本指南介绍了如何更改 Linux 控制台的字体和大小。这对于那些不喜欢默认字体类型/大小或者喜欢不同字体的人来说非常有用。

### 更改 Linux 控制台字体类型和大小

如果你还不知道，这就是无头 Ubuntu Linux 服务器控制台的样子。

![][2]

*Ubuntu Linux 控制台*

据我所知，我们可以[列出已安装的字体][3]，但是没有办法可以像在 Linux 桌面终端仿真器中那样更改 Linux 控制台字体类型或大小。

但这并不意味着我们无法改变它。我们仍然可以更改控制台字体。

如果你正在使用 Debian、Ubuntu 和其他基于 DEB 的系统，你可以使用 `console-setup` 配置文件来设置 `setupcon`，它用于配置控制台的字体和键盘布局。该控制台设置的配置文件位于 `/etc/default/console-setup`。

现在，运行以下命令来设置 Linux 控制台的字体。

```
$ sudo dpkg-reconfigure console-setup
```

选择要在 Linux 控制台上使用的编码。只需保留默认值，选择 “OK” 并按回车继续。

![][4]

*选择要在 Ubuntu 控制台上设置的编码*

接下来，在列表中选择受支持的字符集。默认情况下，它是最后一个选项，即在我的系统中 **Guess optimal character set**（猜测最佳字符集）。只需保留默认值，然后按回车键。

![][5]

*在 Ubuntu 中选择字符集*

接下来选择控制台的字体，然后按回车键。我这里选择 “TerminusBold”。

![][6]

*选择 Linux 控制台的字体*

这里，我们为 Linux 控制台选择所需的字体大小。

![][7]

*选择 Linux 控制台的字体大小*

几秒钟后，所选的字体及大小将应用于你的 Linux 控制台。

这是在更改字体类型和大小之前，我的 Ubuntu 18.04 LTS 服务器中控制台字体的样子。

![][8]

这是更改之后。

![][9]

如你所见，文本更大、更好，字体类型也不同于默认。

你也可以直接编辑 `/etc/default/console-setup`，并根据需要设置字体类型和大小。根据以下示例，我的 Linux 控制台字体类型为 “Terminus Bold”，字体大小为 32。

```
ACTIVE_CONSOLES="/dev/tty[1-6]"
CHARMAP="UTF-8"
CODESET="guess"
FONTFACE="TerminusBold"
FONTSIZE="16x32"
```

### 附录：显示控制台字体

要显示你的控制台字体，只需输入：

```
$ showconsolefont
```

此命令将显示字体的字形或字母表。

![][11]

*显示控制台字体*

如果你的 Linux 发行版没有 `console-setup`，你可以从[这里][12]获取它。

在使用 Systemd 的 Linux 发行版上，你可以通过编辑 `/etc/vconsole.conf` 来更改控制台字体。

以下是德语键盘的示例配置。

```
$ vi /etc/vconsole.conf

KEYMAP=de-latin1
FONT=Lat2-Terminus16
```

希望这篇文章对你有用！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-change-linux-console-font-type-and-size/

作者：[sk][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[2]: https://www.ostechnix.com/wp-content/uploads/2019/08/Ubuntu-Linux-console.png
[3]: https://www.ostechnix.com/find-installed-fonts-commandline-linux/
[4]: https://www.ostechnix.com/wp-content/uploads/2019/08/Choose-encoding-to-set-on-the-console.png
[5]: https://www.ostechnix.com/wp-content/uploads/2019/08/Choose-character-set-in-Ubuntu.png
[6]: https://www.ostechnix.com/wp-content/uploads/2019/08/Choose-font-for-Linux-console.png
[7]: https://www.ostechnix.com/wp-content/uploads/2019/08/Choose-font-size-for-Linux-console.png
[8]: https://www.ostechnix.com/wp-content/uploads/2019/08/Linux-console-tty-ubuntu-1.png
[9]: https://www.ostechnix.com/wp-content/uploads/2019/08/Ubuntu-Linux-TTY-console.png
[10]: https://www.ostechnix.com/how-to-switch-between-ttys-without-using-function-keys-in-linux/
[11]: https://www.ostechnix.com/wp-content/uploads/2019/08/show-console-fonts.png
[12]: https://software.opensuse.org/package/console-setup
