[#]: subject: "How to Enable Minimize, Maximize Window Buttons in elementary OS"
[#]: via: "https://www.debugpoint.com/2021/08/enable-minimize-maximize-elementary/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 elementary OS 中启用最小化、最大化窗口按钮
======
这就是如何在 elementary OS 中启用最小化、最大化窗口按钮的方法。

许多人（大多数是 elementary OS 的新用户）在各种论坛上问这些问题：

1. 我怎样才能在 elementary OS 中启用最小化按钮？
2. 我如何启用还原、最小化、最大化？
3. 有可能恢复最小化和最大化按钮吗？

这些都是完全有效的问题，而且问问题也是可以的。对吗？这个指南可以帮助他们在 elementary OS 中获得这些按钮。

Elementary OS 所使用的 Pantheon 桌面并没有默认的标准窗口按钮。其原因主要是通过 Dock 和应用菜单处理用户行为和活动的不同概念。可以说，这种设计或实现的行为模仿了macOS。

也就是说，许多用户更喜欢窗口按钮，因为这是一个“肌肉记忆”的东西，有些人是从其他桌面环境迁移过来的，甚至是 Windows。

尽管 Elementary 没有为你提供这个默认设置，你仍然可以启用它。下面是方法。

### 启用最小化最大化按钮 - elementary OS

打开终端，安装添加 PPA 所需的 software-properties-common。默认情况下，这个包在 elementary OS 中没有安装（不要问我为什么，真的么？）

```
sudo apt install software-properties-common
```

#### elementary OS 6 Odin

Tweak 工具被重新命名，并正在单独开发。它被称为 [Pantheon Tweaks][1]。使用以下命令，你可以安装它。

```
sudo add-apt-repository -y ppa:philip.scott/pantheon-tweaks
sudo apt install -y pantheon-tweaks
```

#### elementary OS 5 Juno 及更低版本

如果你使用的是 elementary OS 5 June 及更低版本，你可以使用相同的 PPA 安装早期的 [elementary-tweaks][2]。在终端按照以下命令进行操作。

```
sudo add-apt-repository -y ppa:philip.scott/elementary-tweaks
sudo apt install -y elementary-tweaks
```

#### 更改设置

* 安装后，点击顶部栏的应用，打开系统设置。在系统设置窗口中，点击“个人”下的 Tweaks。
* 在 Tweaks 窗口中，进入“外观”。
* 在窗口控制下，选择布局：Windows。

![enable minimize maximize buttons elementary OS][3]

* 然后在顶部窗口栏的右侧应该有最小化、最大化和关闭按钮了。

也有其他组合，如Ubuntu、macOS等。你可以选择任何你觉得合适的：

![Other Options of Window buttons in elementary][4]

这一步就完成了指南。gsettings 中还有其他选项，你可以尝试使用，但窗口管理器 gala 最近删除了这些选项。因此，它们目前可能无法工作。

我希望这个指南能帮助你启用 elementary OS 的最小化最大化按钮。如果你需要任何帮助，请在下面的评论栏告诉我。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/08/enable-minimize-maximize-elementary/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://github.com/pantheon-tweaks/pantheon-tweaks
[2]: https://github.com/elementary-tweaks/elementary-tweaks
[3]: https://www.debugpoint.com/wp-content/uploads/2021/08/enable-minimize-maximize-buttons-elementary-OS.png
[4]: https://www.debugpoint.com/wp-content/uploads/2021/08/Other-Options-of-Window-buttons-in-elementary.jpg
