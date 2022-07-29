[#]: subject: "Update a Single Package With apt Command in Ubuntu and Debian"
[#]: via: "https://itsfoss.com/apt-upgrade-single-package/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Ubuntu 和 Debian 中使用 apt 命令更新单个软件包
======

你如何[在命令行中更新你的 Ubuntu 系统][1]？你使用 apt update（刷新包缓存）和 apt upgrade 命令。

```
sudo apt update && sudo apt upgrade
```

它会更新所有可以立即升级的已安装 apt 包。这也包括 Linux 内核版本。

这似乎是一件好事，尤其是对于桌面用户。对于运行关键 Web 服务的 Ubuntu 服务器用户而言，情况可能并非如此。

如果你想对更新有选择性并且**只想升级单个软件包**，请使用以下命令：

```
sudo apt install --only-upgrade package_name
```

让我们更详细地了解一下。

### 使用 apt 命令升级单个包

第一步是更新本地包仓库缓存，以便你的系统知道新包版本的可用性。

```
sudo apt update
```

**这是可选的**。检查你要升级的软件包是否在[可升级软件包列表][2]中。

```
apt list --upgradable
```

如果所需的软件包有可用的新版本，你可以选择使用以下命令仅升级该单个软件包：

```
sudo apt install --only-upgrade package_name
```

如果你对已安装的软件包运行 apt install 命令，它将升级到下一个可用版本。

但如果该软件包尚未安装，apt 命令也会安装它。

这就是为什么 `--only-upgrade` 部分是必要的。使用该选项，apt 命令只会升级已安装的软件包。如果尚未安装，它将不会安装该软件包。

这不是最适合 Ubuntu 服务器用户的示例，但你仍然可以在下面的截图中看到我如何只升级了七个可升级包中的一个。

![Update only a single package in Ubuntu][3]

### 仅升级选定的软件包

如果要升级选定的几个软件包，那么不必一一更新。只需使用前面提到的命令提供包名称。

```
sudo apt install --only-upgrade package1 package2 package3
```

这是一个例子。

![Upgrade selected packages in Ubuntu][4]

### 总结

当你面临必须升级选定软件包的情况时，你可以使用带有 –only-upgrade 选项的 apt install 命令。

我建议阅读[更有效地使用 apt 命令][5]。

--------------------------------------------------------------------------------

via: https://itsfoss.com/apt-upgrade-single-package/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/update-ubuntu/
[2]: https://itsfoss.com/apt-list-upgradable/
[3]: https://itsfoss.com/wp-content/uploads/2022/07/update-single-package-ubuntu-scaled.webp
[4]: https://itsfoss.com/wp-content/uploads/2022/07/upgrade-selected-packages-ubuntu.png
[5]: https://itsfoss.com/apt-command-guide/
