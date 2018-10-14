如何在 Linux 中切换相同程序的不同版本
======

![](https://www.ostechnix.com/wp-content/uploads/2018/08/alt-tool-720x340.png)

几天前，我们曾经讨论[如何在不同的 PHP 版本之间进行切换][1]。在那篇文章中，我们使用 `update-alternatives` 命令实现从一个 PHP 版本切换到另一个 PHP 版本。也就是说，`update-alternatives` 命令可以将<ruby>系统范围<rt>system wide</rt></ruby>默认使用的 PHP 版本设置为我们希望的版本。通俗的来说，你可以通过 `update-alternatives` 命令从系统范围设置程序的版本。如果你希望可以在不同目录动态设置不同的程序版本，该如何完成呢？在这种情况下，`alt` 工具可以大显身手。`alt` 是一个命令行工具，可以让你在类 Unix 系统中切换相同程序的不同版本。该工具简单易用，是 Rust 语言编写的自由、开源软件。

### 安装

安装 `alt` 工具十分简单。

运行如下命令，即可在 Linux 主机上安装 `alt`：

```
$ curl -sL https://github.com/dotboris/alt/raw/master/install.sh | bash -s
```

下一步，将 `shims` 目录添加到你的 PATH 环境变量中，具体操作取决于你使用的 Shell。

对于 Bash：

```
$ echo 'export PATH="$HOME/.local/alt/shims:$PATH"' >> ~/.bashrc
$ source ~/.bashrc
```

对于 Zsh：

```
$ echo 'export PATH="$HOME/.local/alt/shims:$PATH"' >> ~/.zshrc
$ source ~/.zshrc
```

对于 Fish：

```
$ echo 'set -x PATH "$HOME/.local/alt/shims" $PATH' >> ~/.config/fish/config.fish
```

现在 `alt` 已经安装完毕！

### 使用 alt 工具在 Linux 系统中切换相同程序的不同版本

如我之前所述，alt 只影响当前目录。换句话说，当你进行版本切换时，只在当前目录生效，而不是整个系统范围。

下面举例说明。我在我的 Ubuntu 系统中安装了两个版本的 PHP，分别为 PHP 5.6 和 PHP 7.2；另外，在 `myproject` 目录中包含一些 PHP 应用。

首先，通过命令查看系统范围默认的 PHP 版本：

```
$ php -v
```

示例输出：

![查找 PHP 版本][3]

如截图中所示，我系统中默认的 PHP 版本为 PHP 7.2。

然后，我将进入放置 PHP 应用的 `myproject` 目录。

```
$ cd myproject
```

使用如下命令扫描可用的 PHP 版本：

```
$ alt scan php
```

示例输出：

![扫描 PHP 版本][4]

可见，我有两个 PHP 版本，即 PHP 5.6 和 PHP 7.2。按下 `<空格>` 键选中当前可用的版本。选中全部可用版本后，你可以看到图中所示的<ruby>叉号<rt>cross mark</rt></ruby>。使用上下方向键在版本间移动，点击回车即可保存变更。

![选取 PHP 版本][5]

下面运行该命令并选取我们希望在 `myproject` 目录中使用的 PHP 版本：

```
$ alt use php
```

我希望使用 PHP5.6 版本，故我（使用方向键）选取该版本并点击回车键。

![设置 PHP 版本][6]

现在，你可以在 `/home/sk/myproject` 目录下使用 PHP 5.6 版本啦。

让我们检查一下，在 `myproject` 目录下是否默认使用 PHP 5.6 版本：

```
$ php -v
```

示例输出：

![检查 PHP 版本][7]

只要你不设置成其它版本，（在该目录下）将一直使用 PHP 5.6 版本。清楚了吗？很好！请注意，我们仅在这个目录下使用 PHP 5.6 版本。在系统范围内（LCTT 译注：当然是没单独设置过其它版本的目录下），PHP 7.2 仍是默认的版本。让我们检验一下，请看下图。

![比对 PHP 版本][8]

从上面的截图中可以看出，我有两个版本的 PHP：在 `myproject` 目录下，使用的版本为 PHP 5.6；在 `myproject` 外的其它目录，使用的版本为 PHP 7.2。

同理，你可以为每个目录设置你希望的程序版本。我这里使用 PHP 仅用于说明操作，但方法适用于任何你打算使用的软件，例如 NodeJS 等。

下面是 NodeJS 的示例视频。

![][9]

如果你希望在不同软件包版本下测试你的应用，那么 `alt` 是你不错的选择。

本次分享到此结束。后续还有更多内容，敬请期待！

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-switch-between-different-versions-of-commands-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[pinewall](https://github.com/pinewall)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/how-to-switch-between-multiple-php-versions-in-ubuntu/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2018/08/Find-PHP-version.png
[4]:http://www.ostechnix.com/wp-content/uploads/2018/08/alt-scan-php.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/08/Select-php-version.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/08/set-php-version.png
[7]:http://www.ostechnix.com/wp-content/uploads/2018/08/Check-PHP-version.png
[8]:http://www.ostechnix.com/wp-content/uploads/2018/08/Check-PHP-version-1.png
[9]:http://www.ostechnix.com/wp-content/uploads/2018/08/Alt-NodeJS-demo.gif
