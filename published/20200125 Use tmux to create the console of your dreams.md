[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11900-1.html)
[#]: subject: (Use tmux to create the console of your dreams)
[#]: via: (https://opensource.com/article/20/1/tmux-console)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

使用 tmux 创建你的梦想主控台
======

> 使用 tmux 可以做很多事情，尤其是在将 tmuxinator 添加到其中时。在我们的二十篇系列文章的第十五期中查看它们，以在 2020 年实现开源生产力的提高。

![](https://img.linux.net.cn/data/attachment/album/202002/16/220832bd4l1ag4tlqxlpr4.jpg)

去年，我在 19 天里给你介绍了 19 个新（对你而言）的生产力工具。今年，我换了一种方式：使用你在使用或者还没使用的工具，构建一个使你可以在新一年更加高效的环境。

### 使用 tmux 和 tmuxinator 全部放到主控台上

到目前为止，在本系列文章中，我已经撰写了有关单个应用程序和工具的文章。从今天开始，我将把它们放在一起进行全面设置以简化操作。让我们从命令行开始。为什么使用命令行？简而言之，在命令行上工作可以使我能够从运行 SSH 的任何位置访问许多这些工具和功能。我可以 SSH 进入我的一台个人计算机，并在工作计算机上运行与我的个人计算机上所使用的相同设置。我要使用的主要工具是 [tmux][2]。

大多数人都只使用了 tmux 非常基础的功能，比如说在远程服务器上打开 tmux，然后启动进程，也许还会打开第二个会话以查看日志文件或调试信息，然后断开连接并在稍后返回。但是其实你可以使用 tmux 做很多工作。

![tmux][3]

首先，如果你有一个已有的 tmux 配置文件，请对其进行备份。tmux 的配置文件是 `~/.tmux.conf`。将其移动到另一个目录，例如 `~/tmp`。现在，用 Git 克隆 [Oh My Tmux][4] 项目。从该克隆目录中将 `.tmux.conf` 符号链接到你的家目录，并复制该克隆目录中的 `.tmux.conf.local` 文件到家目录中以进行调整：

```
cd ~
mkdir ~/tmp
mv ~/.tmux.conf ~/tmp/
git clone https://github.com/gpakosz/.tmux.git
ln -s ~/.tmux/.tmux.conf ./
cp ~/.tmux/.tmux.conf.local ./
```

`.tmux.conf.local` 文件包含了本地设置和覆盖的设置。例如，我稍微更改了默认颜色，然后启用了 [Powerline][5] 分隔线。下面的代码段仅显示了我更改过的内容：

```
tmux_conf_theme_24b_colour=true
tmux_conf_theme_focused_pane_bg='default'
tmux_conf_theme_pane_border_style=fat
tmux_conf_theme_left_separator_main='\uE0B0'
tmux_conf_theme_left_separator_sub='\uE0B1'
tmux_conf_theme_right_separator_main='\uE0B2'
tmux_conf_theme_right_separator_sub='\uE0B3'
#tmux_conf_battery_bar_symbol_full='◼'
#tmux_conf_battery_bar_symbol_empty='◻'
tmux_conf_battery_bar_symbol_full='♥'
tmux_conf_battery_bar_symbol_empty='·'
tmux_conf_copy_to_os_clipboard=true
set -g mouse on
```

请注意，你不需要安装 Powerline，你只需要支持 Powerline 符号的字体即可。我在与控制台相关的所有内容中几乎都使用 [Hack Nerd Font][6]，因为它易于阅读并且具有许多有用的额外符号。你还会注意到，我打开了操作系统剪贴板支持和鼠标支持。

现在，当 tmux 启动时，底部的状态栏会以吸引人的颜色提供更多信息。`Ctrl` + `b` 仍然是输入命令的 “引导” 键，但其他一些进行了更改。现在水平拆分（顶部/底部）窗格为 `Ctrl` + `b` + `-`，垂直拆分为 `Ctrl` + `b` + `_`。启用鼠标模式后，你可以单击以在窗格之间切换，并拖动分隔线以调整其大小。打开新窗口仍然是 `Ctrl` + `b` + `n`，你现在可以单击底部栏上的窗口名称在它们之间进行切换。同样，`Ctrl` + `b` + `e` 将打开 `.tmux.conf.local` 文件以进行编辑。退出编辑器时，tmux 将重新加载配置，而不会重新加载其他任何内容。这很有用。

到目前为止，我仅对功能和视觉显示进行了一些简单的更改，并增加了鼠标支持。现在，我将它设置为以一种有意义的方式启动我想要的应用程序，而不必每次都重新定位和调整它们的大小。为此，我将使用 [tmuxinator][7]。tmuxinator 是 tmux 的启动器，它允许你指定和管理布局以及使用 YAML 文件自动启动应用程序。要使用它，请启动 tmux 并创建要在其中运行程序的窗格。然后，使用 `Ctrl` + `b` + `n` 打开一个新窗口，并执行 `tmux list-windows`。你将获得有关布局的详细信息。

![tmux layout information][8]

请注意上面代码中的第一行，我在其中设置了四个窗格，每个窗格中都有一个应用程序。保存运行时的输出以供以后使用。现在，运行 `tmuxinator new 20days` 以创建名为 “20days” 的布局。这将显示一个带有默认布局文件的文本编辑器。它包含很多有用的内容，我建议你阅读所有选项。首先输入上方的布局信息以及所需的应用程序：

```
# /Users/ksonney/.config/tmuxinator/20days.yml
name: 20days
root: ~/
windows:
   - mail:
      layout: d9da,208x60,0,0[208x26,0,0{104x26,0,0,0,103x26,105,0,5},208x33,0,27{104x33,0,27,1,103x33,105,27,4}]] @0
      panes:
        - alot
        - abook
        - ikhal
        - todo.sh ls +20days
```

注意空格缩进！与 Python 代码一样，空格和缩进关系到文件的解释方式。保存该文件，然后运行 `tmuxinator 20days`。你应该会得到四个窗格，分别是 [alot][9] 邮件程序、[abook][10]、ikhal（交互式 [khal][11] 的快捷方式）以及 [todo.txt][12] 中带有 “+20days” 标签的任何内容。

![sample layout launched by tmuxinator][13]

你还会注意到，底部栏上的窗口标记为 “Mail”。你可以单击该名称（以及其他命名的窗口）以跳到该视图。漂亮吧？我在同一个文件中还设置了名为 “Social” 的第二个窗口，包括 [Tuir][14]、[Newsboat][15]、连接到 [BitlBee][16] 的 IRC 客户端和 [Rainbow Stream][17]。

tmux 是我跟踪所有事情的生产力动力之源，有了 tmuxinator，我不必在不断调整大小、放置和启动我的应用程序上费心。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/tmux-console

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hat drink at the computer)
[2]: https://github.com/tmux/tmux
[3]: https://opensource.com/sites/default/files/uploads/productivity_15-1.png (tumux)
[4]: https://github.com/gpakosz/.tmux
[5]: https://github.com/powerline/powerline
[6]: https://www.nerdfonts.com/
[7]: https://github.com/tmuxinator/tmuxinator
[8]: https://opensource.com/sites/default/files/uploads/productivity_15-2.png (tmux layout information)
[9]: https://opensource.com/article/20/1/organize-email-notmuch
[10]: https://opensource.com/article/20/1/sync-contacts-locally
[11]: https://opensource.com/article/20/1/open-source-calendar
[12]: https://opensource.com/article/20/1/open-source-to-do-list
[13]: https://opensource.com/sites/default/files/uploads/productivity_15-3.png (sample layout launched by tmuxinator)
[14]: https://opensource.com/article/20/1/open-source-reddit-client
[15]: https://opensource.com/article/20/1/open-source-rss-feed-reader
[16]: https://opensource.com/article/20/1/open-source-chat-tool
[17]: https://opensource.com/article/20/1/tweet-terminal-rainbow-stream
