[#]: subject: (How to Install elementary Tweaks Tool)
[#]: via: (https://www.debugpoint.com/2021/07/elementary-tweaks-install/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: (imgradeone)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

如何安装 elementary 优化工具
======

> 这篇快速教程演示了如何安装 elementary / Pantheon 优化工具。

elementary 优化工具（elementary Tweaks Tool）是专为 [elementary OS][1] 设计的实用工具。它提供了一些用于修改 elementary 设置的选项。虽然 elementary 已经提供了绝大多数选项，但还有一小部分的 Pantheon 桌面优化是不能直接通过普通设置修改的，因此这个工具才得以诞生。这个工具与 GNOME 中的 [GNOME Tweaks][2] 有些相似。

也就是说，安装这个工具其实十分简单，只是 [elementary OS 6 Odin][3] 与早期版本（例如 elementary OS 5 Juno）存在一些区别。在 elementary OS 6 Odin 和更新的版本中，这个工具已经重命名为 Pantheon 优化工具（Pantheon Tweaks Tool）。接下来是安装步骤。

### 安装 elementary 优化工具

elementary OS 并没有内置用于添加 PPA 的 software-properties-common 软件包。如果您还没有安装此软件包，请使用如下命令安装。

```
sudo apt install software-properties-common
```

#### elementary OS 6 Odin

该版本的优化工具已经改名，并且单独开发。它的名称是 [Pantheon Tweaks][4]。您可以使用如下命令安装它。

```
sudo add-apt-repository -y ppa:philip.scott/pantheon-tweaks
sudo apt install -y pantheon-tweaks
```

#### elementary OS 5 Juno and below

如果您正在使用 elementary OS 5 June 或者更旧的版本，您可以使用同一 PPA 安装早期的 [elementary-tweaks][5]。在终端输入以下命令即可安装。

```
sudo add-apt-repository -y ppa:philip.scott/elementary-tweaks
sudo apt install -y elementary-tweaks
```

### 使用方法

安装完成后，您可以在 `应用程序菜单 > 系统设置 > Tweaks` 中使用此工具。

![设置中的 Tweaks（优化）选项][6]

在 Tweaks 窗口，您可以修改一些选项，配置您的 elementary 桌面。

![安装完成后的 elementary 优化工具 —— 选项][7]

额外供您参考，这款工具仅仅是 elementary 桌面设置的前端。如果您知道准确的名称或属性，您可以直接在终端中修改配置。您在这款优化工具中获得的选项也可以在 `dconf` 编辑器中查找 `io.elementary` 路径以修改。

如果您在安装或使用优化工具时遇到了一些问题，您可以在评论区留言。

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/07/elementary-tweaks-install/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[imgradeone](https://github.com/imgradeone)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/tag/elementary
[2]: https://www.debugpoint.com/2018/05/customize-your-ubuntu-desktop-using-gnome-tweak/
[3]: https://www.debugpoint.com/2020/09/elementary-os-6-odin-new-features-release-date/
[4]: https://github.com/pantheon-tweaks/pantheon-tweaks
[5]: https://github.com/elementary-tweaks/elementary-tweaks
[6]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/tweak-in-settings.png
[7]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/elementary-tweaks-after-install-options.png
[8]: https://www.debugpoint.com/2019/12/elementary-os-hera-released/
