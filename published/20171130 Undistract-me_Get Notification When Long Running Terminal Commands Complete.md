Undistract-me：当长时间运行的终端命令完成时获取通知
============================================================

![Undistract-me](https://www.ostechnix.com/wp-content/uploads/2017/11/undistract-me-2-720x340.png)

前一段时间，我们发表了如何[在终端活动完成时获取通知][3]。今天，我发现了一个叫做 “undistract-me” 的类似工具，它可以在长时间运行的终端命令完成时通知你。想象这个场景。你运行着一个需要一段时间才能完成的命令。与此同时，你查看你的 Facebook，并参与其中。过了一会儿，你记得你几分钟前执行了一个命令。你回到终端，注意到这个命令已经完成了。但是你不知道命令何时完成。你有没有遇到这种情况？我敢打赌，你们大多数人遇到过许多次这种情况。这就是 “undistract-me” 能帮助的了。你不需要经常检查终端，查看命令是否完成。长时间运行的命令完成后，undistract-me 会通知你。它能在 Arch Linux、Debian、Ubuntu 和其他 Ubuntu 衍生版上运行。

### 安装 Undistract-me

Undistract-me 可以在 Debian 及其衍生版（如 Ubuntu）的默认仓库中使用。你要做的就是运行下面的命令来安装它。

```
sudo apt-get install undistract-me
```

Arch Linux 用户可以使用任何帮助程序从 AUR 安装它。

使用 [Pacaur][4]：

```
pacaur -S undistract-me-git
```

使用 [Packer][5]：

```
packer -S undistract-me-git
```

使用 [Yaourt][6]：

```
yaourt -S undistract-me-git
```

然后，运行以下命令将 “undistract-me” 添加到 Bash 中。

```
echo 'source /etc/profile.d/undistract-me.sh' >> ~/.bashrc
```

或者，你可以运行此命令将其添加到你的 Bash：

```
echo "source /usr/share/undistract-me/long-running.bash\nnotify_when_long_running_commands_finish_install" >> .bashrc
```

如果你在 Zsh shell 中，请运行以下命令：

```
echo "source /usr/share/undistract-me/long-running.bash\nnotify_when_long_running_commands_finish_install" >> .zshrc
```

最后让更改生效。

对于 Bash：

```
source ~/.bashrc
```

对于 Zsh：

```
source ~/.zshrc
```

### 配置 Undistract-me

默认情况下，Undistract-me 会将任何超过 10 秒的命令视为长时间运行的命令。你可以通过编辑 `/usr/share/undistract-me/long-running.bash` 来更改此时间间隔。

```
sudo nano /usr/share/undistract-me/long-running.bash
```

找到 `LONG_RUNNING_COMMAND_TIMEOUT` 变量并将默认值（`10` 秒）更改为你所选择的其他值。

[![](http://www.ostechnix.com/wp-content/uploads/2017/11/undistract-me-1.png)][7] 

保存并关闭文件。不要忘记让更改生效：

```
source ~/.bashrc
```

此外，你可以禁用特定命令的通知。为此，找到 `LONG_RUNNING_IGNORE_LIST` 变量并像下面那样用空格分隔命令。

默认情况下，只有当活动窗口不是命令运行的窗口时才会显示通知。也就是说，只有当命令在后台终端窗口中运行时，它才会通知你。如果该命令在活动窗口终端中运行，则不会收到通知。如果你希望无论终端窗口可见还是在后台都发送通知，你可以将 `IGNORE_WINDOW_CHECK` 设置为 `1` 以跳过窗口检查。

Undistract-me 的另一个很酷的功能是当命令完成时，你可以设置音频通知和可视通知。默认情况下，它只会发送一个可视通知。你可以通过在命令行上将变量 `UDM_PLAY_SOUND` 设置为非零整数来更改此行为。但是，你的 Ubuntu 系统应该安装 pulseaudio-utils 和 sound-theme-freedesktop 程序来启用此功能。

请记住，你需要运行以下命令来更新所做的更改。

对于 Bash：

```
source ~/.bashrc
```

对于 Zsh：

```
source ~/.zshrc
```

现在是时候来验证这是否真的有效。

### 在长时间运行的终端命令完成时获取通知

现在，运行任何需要超过 10 秒或者你在 Undistract-me 脚本中定义的时间的命令

我在 Arch Linux 桌面上运行以下命令：

```
sudo pacman -Sy
```

这个命令花了 32 秒完成。上述命令完成后，我收到以下通知。

[![](http://www.ostechnix.com/wp-content/uploads/2017/11/undistract-me-2.png)][8] 

请记住，只有当给定的命令花了超过 10 秒才能完成时，Undistract-me 脚本才会通知你。如果命令在 10 秒内完成，你将不会收到通知。当然，你可以按照上面的“配置”部分所述更改此时间间隔设置。

我发现这个工具非常有用。在我迷失在其他任务上时，它帮助我回到正事。我希望这个工具也能对你有帮助。

还有更多的工具。保持耐心！

干杯！

资源：

*   [Undistract-me GitHub 仓库][1]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/undistract-get-notification-long-running-terminal-commands-complete/

作者：[sk][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://github.com/jml/undistract-me
[2]:https://www.ostechnix.com/author/sk/
[3]:https://www.ostechnix.com/get-notification-terminal-task-done/
[4]:https://www.ostechnix.com/install-pacaur-arch-linux/
[5]:https://www.ostechnix.com/install-packer-arch-linux-2/
[6]:https://www.ostechnix.com/install-yaourt-arch-linux/
[7]:http://www.ostechnix.com/wp-content/uploads/2017/11/undistract-me-1.png
[8]:http://www.ostechnix.com/wp-content/uploads/2017/11/undistract-me-2.png
