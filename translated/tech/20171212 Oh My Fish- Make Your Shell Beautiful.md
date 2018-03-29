Oh My Fish! 让你的 Shell 漂亮起来
=====

![](https://www.ostechnix.com/wp-content/uploads/2017/12/oh-my-fish-720x340.jpg)

几天前，我们讨论了如何 [**安装** **Fish shell**][1]，一个健壮的，完全可用的 shell，带有许多很酷的功能，如自动建议，内置搜索功能，语法高亮显示，基于 web 配置等等。今天，我们将讨论如何使用 **Oh My Fish** (简称 **omf** ) 让我们的  Fish shell 变得漂亮且优雅。它是一个 Fishshell 框架，允许你安装扩展或更改 shell 外观的软件包。它简单易用，快速可扩展。使用 omf，你可以根据你的想法，很容易地安装主题，丰富你的外观和安装插件来调整你的 fish shell。

#### 安装 Oh My Fish

安装 omf 很简单。你要做的只是在你的 fish shell 中运行下面的命令。
```
curl -L https://get.oh-my.fish | fish
```

![][3]

一旦安装完成，你将看到提示已经自动更改，如上图所所示。另外，你会注意到当前时间在 shell 窗口的右边。

就是这样。让我们继续并调整我们的 fish shell。

#### 现在，让我们将 Fish Shell 变漂亮

列出所有的安装包，运行：
```
omf list
```

这条命令将显示已安装的主题和插件。请注意，包可以是主题或插件。安装包意味着安装主题和插件。

所有官方和社区支持的包（包括插件和主题）都托管在 [**Omf 主仓库**][4] 中。在这个主仓库中，你可以看到大量的仓库，其中包含大量的插件和主题。

现在让我们看一下可用的和已安装的主题列表。为此，运行：
```
omf theme
```

![][5]

如你所见，我们只有一个已安装的主题，这是默认的，但是还有大量可用的主题。在安装之前，你在[**这里**][6]可以预览所有可用的主题。这个页面包含了所有的主题细节，特性，每个主题的截图示例，以及哪个主题适合谁。

**安装一个新主题**

请允许我安装一个主题，例如 **clearance theme - **一个极简的 fish shell 主题，供那些经常使用 git 的人使用。为此，运行：
```
omf install clearance
```

![][7]

如上图所示，在安装新主题后，fish 的提示立即发生了变化。

让我浏览一下系统文件，看看它如何显示。

![][8]

看起来不坏！这是一个非常简单的主题。它将当前工作目录，文件夹和文件以不同的颜色区分开来。你可能会注意到，它还会在提示符的顶部显示当前工作目录。现在，**clearance** 是我的默认主题。

**改变主题**

就像我之前说的一样，这个主题在安装后被立即应用。如果你有多个主题，你可以使用以下命令切换到另一个不同的主题：
```
omf theme <theme-name>
```

例如：
```
omf theme agnoster
```

现在我正在使用 "agnoster" 主题。 agnoster 就是这样改变了我 shell 的外观。

![][9]

**安装插件**

例如，我想安装一个天气插件。为此，，只要运行：
```
omf install weather
```

天气插件依赖于 [jq][10]（LCTT 译注：jq 是一个轻量级且灵活的命令行JSON处理器）。所以，你可能也需要安装 jq。它通常在 Linux 发行版的默认仓库中存在。因此，你可以使用默认的包管理器来安装它。例如，以下命令将在  Arch Linux 及其衍生版中安装 jq。
```
sudo pacman -S jq
```

现在，在 fish shell 中使用以下命令查看天气：
```
weather
```

![][11]

**寻找包**

要搜索主题或插件，请执行以下操作：
```
omf search <search_string>
```

例如：
```
omf search nvm
```

为了限制搜索的主题范围，使用 **-t** 选项。
```
 omf search -t chain
```

这条命令只会搜索主题名字中包含 "chain" 的主题。

为了限制搜索的插件范围，使用 **-p** 选项。
```
 omf search -p emacs
```

**更新包**

要仅更新核心功能（omf 本身），运行：
```
omf update omf
```

如果是最新的，你会看到以下输出：
```
Oh My Fish is up to date.
You are now using Oh My Fish version 6.
Updating https://github.com/oh-my-fish/packages-main master... Done!
```

更新所有包：
```
omf update
```

要有选择地更新软件包，只需包含如下所示的包名称：
```
omf update clearance agnoster
```

**显示关于包的信息**

当你想知道关于一个主题或插件的信息时，使用以下命令：
```
omf describe clearance
```

这条命令将显示关于包的信息。
```
Package: clearance
Description: A minimalist fish shell theme for people who use git
Repository: https://github.com/oh-my-fish/theme-clearance
Maintainer:
```

**移除包**

移除一个包，例如 emacs，运行：
```
omf remove emacs
```

**管理仓库**

默认情况下，当你安装了 Oh My Fish 时，会自动添加官方仓库。这个仓库包含了开发人员构建的所有包。要管理用户安装的仓库包，使用这条命令：
```
omf repositories [list|add|remove]
```

列出所有安装的仓库，运行：
```
omf repositories list
```

添加一个仓库：
```
omf repositories add <URL>
```

例如：
```
omf repositories add https://github.com/ostechnix/theme-sk
```

移除一个仓库：
```
omf repositories remove <repository-name>
```

**Troubleshooting Oh My Fish**

如果出现了错误，omf 足够聪明来帮助你，它可以列出解决问题的方法。例如，我删除并安装了 clearance 包（这句不太理解，希望校正者注意），得到了文件冲突的错误。幸运的是，在继续之前，Oh My Fish 会指示我该怎么做。因此，我只是简单地运行了以下代码来了解如何修正错误。
```
omf doctor
```

通过运行以下命令来解决错误：
```
rm ~/.config/fish/functions/fish_prompt.fish
```

![][12]

无论你何时遇到问题，只要运行 'omf doctor' 命令，并尝试所有的建议方法。

**获取帮助**

显示帮助部分，运行：
```
omf -h
```

或者
```
omf --help
```

**卸载 Oh My Fish**

卸载 Oh My Fish，运行以下命令：
```
omf destroy
```

继续前进，开始自定义你的 fish shell。获取更多细节，请参考项目的 GitHub 页面。

这就是全部了。我很快将会在这里开始另一个有趣的指导。在此之前，请继续关注 OSTechNix!

干杯！


--------------------------------------------------------------------------------
via: https://www.ostechnix.com/oh-fish-make-shell-beautiful/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/install-fish-friendly-interactive-shell-linux/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2017/12/Oh-My-Fish-1-1.png()
[4]:https://github.com/oh-my-fish
[5]:http://www.ostechnix.com/wp-content/uploads/2017/12/Oh-My-Fish-5.png()
[6]:https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md
[7]:http://www.ostechnix.com/wp-content/uploads/2017/12/Oh-My-Fish-3.png()
[8]:http://www.ostechnix.com/wp-content/uploads/2017/12/Oh-My-Fish-4.png()
[9]:http://www.ostechnix.com/wp-content/uploads/2017/12/Oh-My-Fish-6.png()
[10]:https://stedolan.github.io/jq/
[11]:http://www.ostechnix.com/wp-content/uploads/2017/12/Oh-My-Fish-7.png()
[12]:http://www.ostechnix.com/wp-content/uploads/2017/12/Oh-My-Fish-8.png()
