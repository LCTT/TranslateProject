[#]: subject: (How to get KDE Plasma 5.22 in Kubuntu 21.04 Hirsute Hippo)
[#]: via: (https://www.debugpoint.com/2021/06/plasma-5-22-kubuntu-21-04/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13621-1.html)

如何在 Kubuntu 21.04 中安装和升级 KDE Plasma 5.22
======

> KDE 团队启用了向后移植 PPA，你可以使用它在 Kubuntu 21.04 Hirsute Hippo 中安装和升级到 KDE Plasma 5.22。

![Kubnutu 21.04 running with KDE Plasma 5.22][1]

KDE 团队最近发布了 KDE Plasma 5.22，其中有相当多的增强功能、错误修复以及更新的 KDE 框架和应用版本。这个版本带来了一些改进，如面板的自适应透明度，文件操作弹出时的用户友好通知，“发现”中的软件包类型显示，各种 Wayland 的变化等。在 [这里][2] 查看更多关于功能细节。

如果你正在运行 Kubuntu 21.04 Hirsute Hippo，或者在 [Ubuntu 21.04 Hirsute Hippo][3] 中安装了自定义的 KDE Plasma，你可以通过以下步骤升级到最新版本。目前的 Hirsute Hippo 系列提供了先前版本 KDE Plasma 5.21.04 与 KDE Framework 5.80。

### 在 Kubuntu 21.04 Hirsute Hippo 中安装 KDE Plasma 5.22 的步骤

按照下面的步骤进行。

如果你想使用图形方法，那么在“发现”中将 `ppa:kubuntu-ppa/backports` 添加到软件源，然后点击“更新”。

或者，使用下面的终端方法，以加快安装速度。

  * **步骤 1**：打开一个终端，添加下面的 KDE Backports PPA。

    ```
    sudo add-apt-repository ppa:kubuntu-ppa/backports
    ```

  * **步骤 2**：然后运行以下程序来启动系统升级。这将在你的 Hirsute Hippo 系统中安装最新的 KDE Plasma 5.22。

    ```
    sudo apt update
    sudo apt full-upgrade
    ```

    ![Upgrade to Plasma 5.22][8]

  * **步骤 3**：更新后重新启动，你应该会看到一个更新的 KDE Plasma 5.22 桌面。

考虑到这是整个桌面环境的完整版本升级，安装可能需要一些时间。

### 在 Ubuntu 21.04 中安装 KDE Plasma 5.22

如果你正在运行基于 GNOME 的默认 Ubuntu 21.04 Hirsute Hippo 桌面，你可以使用这个 PPA 来安装最新的 KDE Plasma。下面是方法。

打开终端，添加 PPA（像上面的步骤那样）。

```
sudo add-apt-repository ppa:kubuntu-ppa/backports
```

然后，刷新软件包。

```
sudo apt update
```

然后运行下面的程序来安装 Kubuntu 桌面。

```
sudo apt install kubuntu-desktop
```

这将在 Ubuntu 21.04 中与 GNOME 一起安装 KDE Plasma 桌面。

### Ubuntu 20.04 LTS 中的 KDE Plasma 5.22

Ubuntu 20.04 LTS 版拥有早期的 KDE Plasma 5.18、KDE Framework 5.68、KDE Applications 19.12.3。所以，在它的整个生命周期中，它不会收到最新的 KDE 更新。所以，从技术上讲，你可以添加上述 PPA 并安装 KDE Plasma 5.22。但我不建议这样做，因为不兼容的软件包、框架可能会导致系统不稳定。

所以，建议你使用 Kubuntu 21.04 和上面的向后移植 PPA 或者使用 KDE neon 来体验最新的 Plasma 桌面。

### 卸载 KDE Plasma 5.22

如果你改变主意，想回到 KDE Plasma 的原始版本，那么安装 `ppa-purge` 并清除 PPA。这将使软件包降级，并启用仓库版本。

```
sudo apt install ppa-purge
sudo ppa-purge ppa:kubuntu-ppa/backports
sudo apt update
```

### 结束语

我希望这个快速指南能帮助你在 Kubuntu 21.04 Hirsute Hippo 中安装最新的 KDE Plasma 5.22。这可以让你体验到最新的 KDE 技术以及 KDE 框架和应用。然而，你应该知道，并不是所有的功能都应该在向后移植 PPA 中提供，它只有选定的功能和错误修复，这才能通过回归测试并安全使用。也就是说，你总是可以把 KDE Neon 安装成一个全新的系统来享受 KDE 的最新技术。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/06/plasma-5-22-kubuntu-21-04/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Kubutu-21.04-running-with-KDE-Plasma-5.22-1024x531.jpg
[2]: https://www.debugpoint.com/2021/06/kde-plasma-5-22-release/
[3]: https://www.debugpoint.com/2021/04/ubuntu-21-04-hirsute-hippo-release/
[4]: tmp.wazjcS11If#plasma-kubuntu-2104
[5]: tmp.wazjcS11If#plasma-ubuntu-2104
[6]: tmp.wazjcS11If#plasma-ubuntu-2004
[7]: tmp.wazjcS11If#uninstall-stock-version
[8]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Upgrade-to-Plasma-5.22.jpg