[#]: subject: "List Upgradable Packages With apt Command in Ubuntu"
[#]: via: "https://itsfoss.com/apt-list-upgradable/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14861-1.html"

在 Ubuntu 中使用 apt 命令列出可升级的软件包
======

![](https://img.linux.net.cn/data/attachment/album/202207/24/230954qjko0c0sn55ohjf0.jpg)

[apt 命令][1] 用于 Debian 和 Ubuntu 中的包管理。虽然你可能已经熟悉安装和删除选项，但 `apt` 还提供了一些额外的功能。

其中之一是能够查看系统上所有可升级的软件包。要显示它们，你所要做的就是在终端中使用以下命令：

```
apt list --upgradable
```

如你所见，你甚至不需要使用 `sudo` 来列出可更新的包。它只是列出了可以更新的包，而不会更新它们。

实际上，当你运行 `sudo apt update` 命令更新本地包仓库缓存时，`apt` 命令会添加此提示。

```
Fetched 1,243 kB in 17s (71.4 kB/s)           
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
30 packages can be upgraded. Run 'apt list --upgradable' to see them.
```

我不记得在旧的 `apt-get` 命令中有任何类似的直接选项来列出所有可升级的包。这是 `apt` 在旧的 `apt-get` 命令之上添加的几个新功能之一。

让我们更详细地讨论一下。

### 列出所有可升级的包

你在这里应该知道的是**你只能列出通过 APT 包管理器可用的更新**。因此，如果你已将 PPA 或 [外部仓库][2] 添加到系统的 `sources.list`，你也将看到来自它们的更新。

但是你不会在这里获得 AppImage、Flatpak、Snap 或一些其他打包格式的更新。

换句话说，它只适用于 APT 包。

因此，要列出 Ubuntu 或 Debian 系统上的所有可升级包，你应该首先更新本地包缓存：

```
sudo apt update
```

然后你的系统将知道可用的软件包更新。`apt` 命令告诉你在 update 命令结束时可以升级多少个软件包：

![The apt command shows the number of upgradable packages at the bottom of the apt update command output][3]

要查看可以升级的软件包，请运行以下命令：

```
apt list --upgradable
```

你应该看到这样的输出：

```
~$ apt list --upgradable 
Listing... Done
apparmor/jammy-updates 3.0.4-2ubuntu2.1 amd64 [upgradable from: 3.0.4-2ubuntu2]
brave-browser/stable 1.40.113 amd64 [upgradable from: 1.40.107]
evolution-data-server-common/jammy-updates,jammy-updates 3.44.2-0ubuntu1 all [upgradable from: 3.44.1-0ubuntu2]
evolution-data-server/jammy-updates 3.44.2-0ubuntu1 amd64 [upgradable from: 3.44.1-0ubuntu2]
```

![Listing all the upgradable packages][4]

它**按字母顺序列出所有可升级的软件包**以及有关当前安装版本和新可用软件包版本的信息。

```
brave-browser/stable 1.40.113 amd64 [upgradable from: 1.40.107]
```

例如，这显示我系统上安装了 Brave 浏览器，版本 1.40.107，并且版本 1.40.113 可用。

你能用这些信息做什么？让我分享一些我能想到的事情。

### 升级所有包

这可能是大多数普通 Ubuntu 用户所做的。你可以使用以下命令升级所有可升级包：

```
sudo apt upgrade
```

它列出了将要升级的软件包，然后要求按回车或 `Y` 确认升级。

![Upgrade all packages][5]

如果你确定要升级所有软件包，则可以通过在命令中添加 `-y` 来跳过 “Do you want to continue” 部分。

```
sudo apt upgrade -y
```

### 模拟升级（但不升级任何包）

这是人们在 `apt list` 命令之前所做的。使用模拟选项，你实际上不会进行任何更改。它仅显示运行升级时将安装或升级的软件包。

```
apt -s upgrade
```

你不需要使用 `sudo`（即使我在下面的截图中使用了它）。

![Running an upgrade simulation with apt command][6]

### 仅升级选定的包

如果你正在管理一个 Ubuntu 服务器，并且你不想升级所有软件包，而只想升级少数选定的软件包中的一个（如 MySQL/Ngnix），你可以使用 `apt` 命令轻松完成。

```
sudo apt --only-upgrade install package_name
```

实际上，如果你在已安装且有可用更新的软件包上运行 `apt install` 命令，它将升级该软件包。

使用 `--only-upgrade` 标志，你可以确保**仅升级**软件包（如果已安装）。如果尚未安装，它将不会安装给定的包。

你还可以通过提供名称来升级选定的几个包：

```
sudo apt --only-upgrade install package1 package2
```

你也可以做相反的事情，[升级时保留选定的软件包][7]。

```
sudo apt-mark hold package_name
```

这样，当你升级所有系统包时，将不会升级给定的包。

你可以使用以下命令删除保留设置：

```
sudo apt-mark unhold package_name
```

### 是否显示内核升级？

这有点棘手。

当你运行 `apt list –upgradable` 命令时，它会显示所有可以升级的包。

但是如果有新的内核版本可用，它们可能不会显示，因为内核包名称以 `linux-headers-x-y` 开头。这是因为系统将它们视为新包，而不是对已安装的包 `linux-headers-a-b` 的升级。

但是，你仍然会在可升级包列表中看到 `linux-generic-hwe` 类型的包，因为该软件包将被升级（使用较新的内核）。

### 总结

列出可升级包的能力是 `apt` 命令为旧的 `apt-get` 命令带来的几个新功能之一。有关此主题的更多信息，你可以阅读我 [解释 apt 和 apt-get 命令之间的区别][8] 的文章。

作为桌面用户，我并不总是检查可以升级的软件包。我直接去升级。但是，当我管理服务器时，我更喜欢查看可用的更新，然后决定是否进行升级。

你呢？你觉得这个功能对你自己有用吗？

--------------------------------------------------------------------------------

via: https://itsfoss.com/apt-list-upgradable/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/apt-command-guide/
[2]: https://itsfoss.com/adding-external-repositories-ubuntu/
[3]: https://itsfoss.com/wp-content/uploads/2022/07/update-package-cache-ubuntu.png
[4]: https://itsfoss.com/wp-content/uploads/2022/07/apt-list-upgradable-packages-ubuntu.webp
[5]: https://itsfoss.com/wp-content/uploads/2022/07/upgrade-all-packages-ubuntu.webp
[6]: https://itsfoss.com/wp-content/uploads/2022/07/run-an-upgrade-simulation-apt-ubuntu.webp
[7]: https://itsfoss.com/prevent-package-update-ubuntu/
[8]: https://itsfoss.com/apt-vs-apt-get-difference/
