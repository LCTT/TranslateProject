[#]: subject: "Changing Linux System Language (Locales) From Command Line on Ubuntu and Debian Based Distros"
[#]: via: "https://itsfoss.com/change-locales-linux/"
[#]: author: "Marco Carmona https://itsfoss.com/author/marco/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在基于 Ubuntu 和 Debian 的发行版上通过命令行改 变Linux 系统语言（Locales）
======

_**简介：这是一个快速教程，展示了在 Ubuntu 和其他 Linux 发行版上从命令行改变语言的步骤。**_

我已经有一段时间没有在 It's FOSS 上写东西了。事实上，我一直在为 It’s FOSS 的西班牙语版本写文章。如果你没有访问过它并且/或你是一个讲西班牙语的人，请访问 [It's FOSS en Español][1] 并查看所有西班牙语的 Linux 内容。

你可能想知道我为什么要和你分享这个事实。 这是因为这篇文章以这个新页面为例。

在进行[你喜欢的 Linux 发行版][2]的干净安装时，系统会要求你选择一种主语言。尽管这并不频繁，但有些人后来还是考虑把这个语言改成新的，比如说我。

你看，我必须同时用西班牙语（为 It's FOSS en Español）和英语（为 It's FOSS）进行截屏。这就成了一个问题，因为我只有一台电脑，而更换用户对我来说不是一个快速的解决方案。

这就是为什么我想和你分享这个快速技巧，我将告诉你如何在终端中用两行简单的文字改变你的主系统语言。

让我们开始吧!

### 从终端改变 Linux 系统语言

假设你想把你的主语言从英语改为西班牙语。

确认你将哪种语言设置为默认语言（主语言）。为此，让我们使用 locale 命令。

```

    locale

```

你应该看到像这样的东西。

```

    [email protected]:~$ locale
    LANG=en_US.UTF-8
    LANGUAGE=
    LC_CTYPE="en_US.UTF-8"
    LC_NUMERIC="en_US.UTF-8"
    LC_TIME="en_US.UTF-8"
    LC_COLLATE="en_US.UTF-8"
    LC_MONETARY="en_US.UTF-8"
    LC_MESSAGES="en_US.UTF-8"
    LC_PAPER="en_US.UTF-8"
    LC_NAME="en_US.UTF-8"
    LC_ADDRESS="en_US.UTF-8"
    LC_TELEPHONE="en_US.UTF-8"
    LC_MEASUREMENT="en_US.UTF-8"
    LC_IDENTIFICATION="en_US.UTF-8"
    LC_ALL=

```

在这里你可以看到主语言是英语。现在要改变它，请按以下方式使用 dpkg 命令：

```

    sudo dpkg-reconfigure locales

```

当你运行之前的命令，你应该在终端看到下面的页面。

![sudo dpkg reconfigure locales][3]

在这里，你应该**使用向上和向下的箭头移动**直到你到达所需的语言。在我的例子中，我想要西班牙语，更具体地说，是墨西哥西班牙语，因为我是墨西哥人。

不是所有的语言都有这个选项，但如果你的语言有，请选择 [UTF-8][4]。

找到你的语言后，**按空格键来标记**，然后**回车**。

![Selecting your language][5]

最后，在最后一个窗口中，通过使用箭头键移动到该语言并按下**回车键**，选择该新语言作为你的默认语言。

![Setting new language as default][6]

完成后，你应该在你的终端看到这样的信息：

```

    Generating locales (this might take a while)...
      en_US.UTF-8... done
      es_MX.UTF-8... done
    Generation complete.

```

_**这就完成了**_！现在你能够直接从终端改变你的默认语言，次数不限。

如果你对这个话题有任何疑问，请在评论区告诉我们。_***好样的！***_

--------------------------------------------------------------------------------

via: https://itsfoss.com/change-locales-linux/

作者：[Marco Carmona][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/marco/
[b]: https://github.com/lujun9972
[1]: https://es.itsfoss.com/
[2]: https://itsfoss.com/best-linux-beginners/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/sudo_dpkg-reconfigure_locales.png?resize=1090%2C690&ssl=1
[4]: https://en.wikipedia.org/wiki/UTF-8
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/Selecting_your_language.png?resize=800%2C506&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/Setting_new_language_as_default-1.png?resize=800%2C506&ssl=1
