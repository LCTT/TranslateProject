[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11182-1.html)
[#]: subject: (Enable ‘Tap to click’ on Ubuntu Login Screen [Quick Tip])
[#]: via: (https://itsfoss.com/enable-tap-to-click-on-ubuntu-login-screen/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Ubuntu 登录屏幕上启用轻击
======

> <ruby>轻击<rt>tap to click</rt></ruby>选项在 Ubuntu 18.04 GNOME 桌面的登录屏幕上不起作用。在本教程中，你将学习如何在 Ubuntu 登录屏幕上启用“轻击”。

安装 Ubuntu 后我做的第一件事就是确保启用了轻击功能。作为笔记本电脑用户，我更喜欢轻击触摸板进行左键单击。这比使用触摸板上的左键单击按钮更方便。

我登录并使用操作系统时可以轻击。但是，如果你在登录屏幕上，轻击不起作用，这是一个烦恼。

在 Ubuntu（或使用 GNOME 桌面的其他发行版）的 [GDM 登录屏幕][1]上，你必须单击用户名才能显示密码字段。现在，如果你习惯了轻击，即使你已启用了它并在登录系统后可以使用，它也无法在登录屏幕上运行。

这是一个轻微的烦恼，但仍然是一个烦恼。好消息是你可以解决这个烦恼。让我告诉你如何在这个快速提示中做到这一点。

### 在 Ubuntu 登录屏幕上启用轻击

![][2]

你必须在这里使用终端和一些命令。我希望你能够适应。

[在 Ubuntu 中使用 Ctrl + Alt + T 快捷键打开终端][3]。由于 Ubuntu 18.04 仍在使用 X 显示服务器，因此需要启用它才能连接到 [X 服务器][4]。为此，你可以将 `gdm` 添加到访问控制列表中。

首先切换到 `root` 用户。这是必需的，因为你必须稍后切换为 `gdm` 用户，而不能以非 `root` 用户身份执行此操作。

```
sudo -i
```

[在 Ubuntu 中没有为 root 用户设置密码][5]。你可以使用管理员用户帐户访问它。因此，当要求输入密码时，请使用你自己的密码。输入密码时，屏幕上不会显示任何输入内容。

```
xhost +SI:localuser:gdm
```

这是我的输出：

```
xhost +SI:localuser:gdm
localuser:gdm being added to access control list
```

现在运行此命令，以便 `gdm` 用户具有正确的轻击设置。

```
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
```

如果你看到这样的警告：`(process:6339): dconf-WARNING **: 19:52:21.217: Unable to open /root/.local/share/flatpak/exports/share/dconf/profile/user: Permission denied`。别担心。忽略它就行。

[][6]

这将使你能够轻击登录屏幕。为什么在系统设置中进行更改之前无法使用轻击？这是因为在登录屏幕上，你还没有选择用户名。只有在屏幕上选择用户时才能使用你的帐户。这就是你必须使用用户 `gdm` 并使用它添加正确设置的原因。

重新启动 Ubuntu，你会看到现在可以使用轻击来选择你的用户帐户。

#### 还原改变

如果你因为某些原因不喜欢在 Ubuntu 登录界面轻击，可以还原更改。

你必须执行上一节中的所有步骤：切换到 `root`，将 `gdm` 与 X 服务器连接，切换到 `gdm` 用户。但是，你需要运行此命令，而不是上一个命令：

```
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
```

就是这样。

正如我所说，这是一件小事。我的意思是你可以轻松地点击左键而不是轻击。这只是一次单击的问题。但是，当你在几次轻击后被迫使用左键单击时，它会打破操作“连续性”。

我希望你喜欢这个快速的小调整。如果你知道其他一些很酷的调整，请与我们分享。

--------------------------------------------------------------------------------

via: https://itsfoss.com/enable-tap-to-click-on-ubuntu-login-screen/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://wiki.archlinux.org/index.php/GDM
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/07/tap-to-click-on-ubuntu-login.jpg?ssl=1
[3]: https://itsfoss.com/ubuntu-shortcuts/
[4]: https://en.wikipedia.org/wiki/X.Org_Server
[5]: https://itsfoss.com/change-password-ubuntu/
[6]: https://itsfoss.com/change-hostname-ubuntu/
