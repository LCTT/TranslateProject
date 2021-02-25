[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13152-1.html)
[#]: subject: (Starship: Open-Source Customizable Prompt for Any Shell)
[#]: via: (https://itsfoss.com/starship/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Starship：跨 shell 的可定制的提示符
======

![](https://img.linux.net.cn/data/attachment/album/202102/25/142817taqq2ahab0t61zss.jpg)

> 如果你很在意你的终端的外观的话，一个跨 shell 的提示符可以让你轻松地定制和配置 Linux 终端提示符。

虽然我已经介绍了一些帮助你 [自定义终端外观][1] 的技巧，但我也发现了一些有趣的跨 shell 提示符的建议。

### Starship：轻松地调整你的 Linux Shell 提示符

![][2]

[Starship][3] 是一个用 [Rust][4] 编写的开源项目，它可以帮助你建立一个精简、快速、可定制的 shell 提示符。

无论你是使用 bash、fish、还是 Windows 上的 PowerShell，抑或其他 shell，你都可以利用Starship 来定制外观。

请注意，你必须了解它的 [官方文档][5] 才能对所有你喜欢的东西进行高级配置，但在这里，我将包括一个简单的示例配置，以有一个良好的开端，以及一些关于 Startship 的关键信息。

Startship 专注于为你提供一个精简的、快速的、有用的默认 shell 提示符。它甚至会记录并显示执行一个命令所需的时间。例如，这里有一张截图：

![][6]

不仅如此，根据自己的喜好定制提示符也相当简单。下面是一张官方 GIF，展示了它的操作：

![][7]

让我帮你设置一下。我是在 Ubuntu 上使用 bash shell 来测试的。你可以参考我提到的步骤，或者你可以看看 [官方安装说明][8]，以获得在你的系统上安装它的更多选择。

### Starship 的亮点

  * 跨平台
  * 跨 shell 支持
  * 能够添加自定义命令
  * 定制 git 体验
  * 定制使用特定编程语言时的体验
  * 轻松定制提示符的每一个方面，而不会对性能造成实质影响

### 在 Linux 上安装 Starship

> 安装 Starship 需要下载一个 bash 脚本，然后用 root 权限运行该脚本。
>
> 如果你不习惯这样做，你可以使用 snap。
>
> ```
> sudo snap install starship
> ```

**注意**：你需要安装 [Nerd 字体][9] 才能获得完整的体验。

要开始使用，请确保你安装了 [curl][10]。你可以通过键入如下命令来轻松安装它：

```
sudo apt install curl
```

完成后，输入以下内容安装 Starship：

```
curl -fsSL https://starship.rs/install.sh | bash
```

这应该会以 root 身份将 Starship 安装到 `usr/local/bin`。你可能会被提示输入密码。看起来如下：

![][11]

### 在 bash 中添加 Starship

如截图所示，你会在终端本身得到设置的指令。在这里，我们需要在 `.bashrc` 用户文件的末尾添加以下一行：

```
eval "$(starship init bash)"
```

要想轻松添加，只需键入：

```
nano .bashrc
```

然后，通过向下滚动导航到文件的末尾，并在文件末尾添加如下图所示的行：

![][12]

完成后，只需重启终端或重启会话即可看到一个精简的提示符。对于你的 shell 来说，它可能看起来有点不同，但默认情况下应该是一样的。

![][13]

设置好后，你就可以继续自定义和配置提示符了。让我给你看一个我做的配置示例：

### 配置 Starship 提示符：基础

开始你只需要在 `.config` 目录下制作一个配置文件（[TOML文件][14]）。如果你已经有了这个目录，直接导航到该目录并创建配置文件。

下面是创建目录和配置文件时需要输入的内容：

```
mkdir -p ~/.config && touch ~/.config/starship.toml
```

请注意，这是一个隐藏目录。所以，当你试图使用文件管理器从主目录访问它时，请确保在继续之前 [启用查看隐藏文件][15]。

接下来如果你想探索一些你喜欢的东西，你应该参考配置文档。

举个例子，我配置了一个简单的自定义提示，看起来像这样：

![][16]

为了实现这个目标，我的配置文件是这样的：

![][17]

根据他们的官方文档，这是一个基本的自定义格式。但是，如果你不想要自定义格式，只是想用一种颜色或不同的符号来自定义默认的提示，那就会像这样：

![][18]

上述定制的配置文件是这样的：

![][19]

当然，这不是我能做出的最好看的提示符，但我希望你能理解其配置方式。

你可以通过包括图标或表情符来定制目录的外观，你可以调整变量、格式化字符串、显示 git 提交，或者根据使用特定编程语言而调整。

不仅如此，你还可以创建在你的 shell 中使用的自定义命令，让事情变得更简单或舒适。

你可以在他们的 [官方网站][3] 和它的 [GitHub 页面][20] 中探索更多的信息。

- [Starship.rs][3]

### 结论

如果你只是想做一些小的调整，这文档可能会太复杂了。但是，即使如此，它也可以让你用很少的努力实现一个自定义的提示符或精简的提示符，你可以应用于任何普通的 shell 和你正在使用的系统。

总的来说，我不认为它非常有用，但有几个读者建议使用它，看来人们确实喜欢它。我很想看看你是如何 [自定义 Linux 终端][1] 以适应不同的使用方式。

欢迎在下面的评论中分享你的看法，如果你喜欢的话。

--------------------------------------------------------------------------------

via: https://itsfoss.com/starship/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/customize-linux-terminal/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/starship-screenshot.png?resize=800%2C577&ssl=1
[3]: https://starship.rs/
[4]: https://www.rust-lang.org/
[5]: https://starship.rs/config/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/starship-time.jpg?resize=800%2C281&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/starship-demo.gif?resize=800%2C501&ssl=1
[8]: https://starship.rs/guide/#%F0%9F%9A%80-installation
[9]: https://www.nerdfonts.com
[10]: https://curl.se/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/install-starship.png?resize=800%2C534&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/startship-bashrc-file.png?resize=800%2C545&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/starship-prompt.png?resize=800%2C552&ssl=1
[14]: https://en.wikipedia.org/wiki/TOML
[15]: https://itsfoss.com/hide-folders-and-show-hidden-files-in-ubuntu-beginner-trick/
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/starship-custom.png?resize=800%2C289&ssl=1
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/starship-custom-config.png?resize=800%2C320&ssl=1
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/starship-different-symbol.png?resize=800%2C224&ssl=1
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/starship-symbol-change.jpg?resize=800%2C167&ssl=1
[20]: https://github.com/starship/starship
