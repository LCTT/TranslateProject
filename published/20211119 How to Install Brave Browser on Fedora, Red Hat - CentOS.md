[#]: subject: "How to Install Brave Browser on Fedora, Red Hat & CentOS"
[#]: via: "https://itsfoss.com/install-brave-browser-fedora/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14028-1.html"

如何在 Fedora Linux 上安装 Brave 浏览器
======

![](https://img.linux.net.cn/data/attachment/album/202111/28/102349idh316xz3bslr6ps.jpg)

[Brave][1] 是一个越来越 [流行于 Linux][2] 和其他操作系统的网页浏览器。对默认情况下阻止广告和跟踪的关注，以及对 Chrome 扩展的支持，使 Brave 成为 Linux 用户的热门选择。

在本教程中，你将学习如何在 Fedora Linux 上安装 Brave。你还将学习如何更新和删除它。

本教程已经在 Fedora 上进行了测试，但它也应该适用于基于 Red Hat 的其他发行版，如 CentOS、Alma Linux 和 Rocky Linux。

### 在 Fedora Linux 上安装 Brave 浏览器

你需要在这里用命令行的方式来安装 Brave。

作为先决条件，请确保 `dnf-plugin-core` 已经安装。

```
sudo dnf install dnf-plugins-core
```

下一步是将 Brave 仓库添加到你的系统中：

```
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
```

你还应该导入并添加仓库密钥，这样你的系统就会信任来自这个新添加的仓库的软件包：

```
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
```

![Adding Brave Browser repository in Fedora Linux][3]

现在可以开始了。用这个命令安装 Brave：

```
sudo dnf install brave-browser
```

**当被要求确认你的选择时按 `Y`**。根据你的网速，这应该需要几秒钟或几分钟的时间。如果 DNF 的缓存最近没有更新，甚至可能需要更长时间。

![Installing Brave Browser in Fedora][4]

安装完成后，在系统菜单中寻找 Brave 并从那里启动。

![Start Brave browser in Fedora Linux][5]

### 在 Fedora Linux 上更新 Brave 浏览器

你已经为浏览器添加了一个仓库，并且导入了它的密钥。你的系统信任来自这个仓库的软件包。

因此，当有新的 Brave 浏览器发布并提供给这个仓库时，你会通过常规的系统升级得到它。

换句话说，你不需要做任何特别的事情。只要保持你的 Fedora 系统更新，如果有 Brave 的新版本，它应该会随着系统更新自动安装。

### 从 Fedora Linux 中删除 Brave 浏览器

![Brave Browser in Fedora Linux][6]

如果你因为某些原因不喜欢 Brave，你可以从你的系统中删除它。只需使用 `dnf remove` 命令：

```
sudo dnf remove brave-browser
```

当询问时按 `Y`：

![Removing Brave browser from Fedora Linux][7]

你也可以选择禁用 `brave-browser-rpm-release.s3.brave.com_x86_64_.repo` 或者从 `/etc/yum/repos.d` 中完全删除这个文件，虽然这并不是必须的。

我希望这个快速提示对你有帮助。如果你有任何问题或建议，请让我知道。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-brave-browser-fedora/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://brave.com/
[2]: https://itsfoss.com/best-browsers-ubuntu-linux/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/adding-Brave-browser-repository-in-Fedora.png?resize=800%2C300&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/Installing-Brave-Browser-Fedora.png?resize=800%2C428&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/start-brave-fedora-linux.png?resize=759%2C219&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/Brave-Browser-in-Fedora-Linux.png?resize=800%2C530&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/removing-Brave-browser-Fedora-Linux.png?resize=800%2C399&ssl=1
