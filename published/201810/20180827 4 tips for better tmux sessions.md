更好利用 tmux 会话的 4 个技巧
======

![](https://fedoramagazine.org/wp-content/uploads/2018/08/tmux-4-tips-816x345.jpg)

tmux 是一个终端多路复用工具，它可以让你系统上的终端支持多面板。你可以排列面板位置，在每个面板运行不同进程，这通常可以更好的地利用你的屏幕。我们在 [这篇早期的文章][1] 中向读者介绍过这一强力工具。如果你已经开始使用 tmux 了，那么这里有一些技巧可以帮你更好地使用它。

本文假设你当前的前缀键是 `Ctrl+b`。如果你已重新映射该前缀，只需在相应位置替换为你定义的前缀即可。

### 设置终端为自动使用 tmux

使用 tmux 的一个最大好处就是可以随意的从会话中断开和重连。这使得远程登录会话功能更加强大。你有没有遇到过丢失了与远程系统的连接，然后好希望能够恢复在远程系统上做过的那些工作的情况？tmux 能够解决这一问题。

然而，有时在远程系统上工作时，你可能会忘记开启会话。避免出现这一情况的一个方法就是每次通过交互式 shell 登录系统时都让 tmux 启动或附加上一个会话。

在你远程系统上的 `~/.bash_profile` 文件中加入下面内容：

```
if [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi
```

然后注销远程系统，并使用 SSH 重新登录。你会发现你处在一个名为 `default` 的 tmux 会话中了。如果退出该会话，则下次登录时还会重新生成此会话。但更重要的是，若您正常地从会话中分离，那么下次登录时你会发现之前工作并没有丢失 - 这在连接中断时非常有用。

你当然也可以将这段配置加入本地系统中。需要注意的是，大多数 GUI 界面的终端并不会自动使用这个 `default` 会话，因此它们并不是登录 shell。虽然你可以修改这一行为，但它可能会导致终端嵌套执行附加到 tmux 会话这一动作，从而导致会话不太可用，因此当进行此操作时请一定小心。

### 使用缩放功能使注意力专注于单个进程

虽然 tmux 的目的就是在单个会话中提供多窗口、多面板和多进程的能力，但有时候你需要专注。如果你正在与一个进程进行交互并且需要更多空间，或需要专注于某个任务，则可以使用缩放命令。该命令会将当前面板扩展，占据整个当前窗口的空间。

缩放在其他情况下也很有用。比如，想象你在图形桌面上运行一个终端窗口。面板会使得从 tmux 会话中拷贝和粘帖多行内容变得相对困难。但若你缩放了面板，就可以很容易地对多行数据进行拷贝/粘帖。

要对当前面板进行缩放，按下 `Ctrl+b, z`。需要恢复的话，按下相同按键组合来恢复面板。

### 绑定一些有用的命令

tmux 默认有大量的命令可用。但将一些更常用的操作绑定到容易记忆的快捷键会很有用。下面一些例子可以让会话变得更好用，你可以添加到 `~/.tmux.conf` 文件中：

```
bind r source-file ~/.tmux.conf \; display "Reloaded config"
```

该命令重新读取你配置文件中的命令和键绑定。添加该条绑定后，退出任意一个 tmux 会话然后重启一个会话。现在你做了任何更改后，只需要简单的按下 `Ctrl+b, r` 就能将修改的内容应用到现有的会话中了。

```
bind V split-window -h
bind H split-window
```

这些命令可以很方便地对窗口进行横向切分（按下 `Shift+V`）和纵向切分（`Shift+H`）。

若你想查看所有绑定的快捷键，按下 `Ctrl+B, ?` 可以看到一个列表。你首先看到的应该是复制模式下的快捷键绑定，表示的是当你在 tmux 中进行复制粘帖时对应的快捷键。你添加的那两个键绑定会在<ruby>前缀模式<rt>prefix mode</rt></ruby>中看到。请随意把玩吧！

### 使用 powerline 更清晰

[如前文所示][2]，powerline 工具是对 shell 的绝佳补充。而且它也兼容在 tmux 中使用。由于 tmux 接管了整个终端空间，powerline 窗口能提供的可不仅仅是更好的 shell 提示那么简单。

[![Screenshot of tmux powerline in git folder](https://fedoramagazine.org/wp-content/uploads/2018/08/Screenshot-from-2018-08-25-19-36-53-1024x690.png)][3] 

如果你还没有这么做，按照 [这篇文章][4] 中的指示来安装该工具。然后[使用 sudo][5] 来安装附件：

```
sudo dnf install tmux-powerline
```

接着重启会话，就会在底部看到一个漂亮的新状态栏。根据终端的宽度，默认的状态栏会显示你当前会话 ID、打开的窗口、系统信息、日期和时间，以及主机名。若你进入了使用 git 进行版本控制的项目目录中还能看到分支名和用色彩标注的版本库状态。

当然，这个状态栏具有很好的可配置性。享受你新增强的 tmux 会话吧，玩的开心点。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-tips-better-tmux-sessions/

作者：[Paul W. Frields][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/pfrields/
[1]:https://fedoramagazine.org/use-tmux-more-powerful-terminal/
[2]:https://fedoramagazine.org/add-power-terminal-powerline/
[3]:https://fedoramagazine.org/wp-content/uploads/2018/08/Screenshot-from-2018-08-25-19-36-53.png
[4]:https://fedoramagazine.org/add-power-terminal-powerline/
[5]:https://fedoramagazine.org/howto-use-sudo/
