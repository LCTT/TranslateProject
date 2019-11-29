[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11541-1.html)
[#]: subject: (Upgrading Fedora 30 to Fedora 31)
[#]: via: (https://fedoramagazine.org/upgrading-fedora-30-to-fedora-31/)
[#]: author: (Ben Cotton https://fedoramagazine.org/author/bcotton/)

将 Fedora 30 升级到 Fedora 31
======

![][1]

Fedora 31 [日前发布了][2]。你也许想要升级系统来获得 Fedora 中的最新功能。Fedora 工作站有图形化的升级方式。另外，Fedora 提供了一种命令行方式来将 Fedora 30 升级到 Fedora 31。

### 将 Fedora 30 工作站升级到 Fedora 31

在该发布不久之后，就会有通知告诉你有可用升级。你可以点击通知打开 GNOME “软件”。或者在 GNOME Shell 选择“软件”。

在 GNOME 软件中选择*更新*，你应该会看到告诉你有 Fedora 31 更新的提示。

如果你在屏幕上看不到任何内容，请尝试使用左上方的重新加载按钮。在发布后，所有系统可能需要一段时间才能看到可用的升级。

选择*下载*以获取升级包。你可以继续工作，直到下载完成。然后使用 GNOME “软件”重启系统并应用升级。升级需要时间，因此你可能需要喝杯咖啡，稍后再返回系统。

### 使用命令行

如果你是从 Fedora 以前的版本升级的，那么你可能对 `dnf upgrade` 插件很熟悉。这是推荐且支持的从 Fedora 30 升级到 Fedora 31 的方法。使用此插件能让你轻松地升级到 Fedora 31。

#### 1、更新软件并备份系统

在开始升级之前，请确保你安装了 Fedora 30 的最新软件。如果你安装了模块化软件，这点尤为重要。`dnf` 和 GNOME “软件”的最新版本对某些模块化流的升级过程进行了改进。要更新软件，请使用 GNOME “软件” 或在终端中输入以下命令：

```
sudo dnf upgrade --refresh
```

此外，在继续操作之前，请确保备份系统。有关备份的帮助，请参阅 Fedora Magazine 上的[备份系列][3]。

#### 2、安装 DNF 插件

接下来，打开终端并输入以下命令安装插件：

```
sudo dnf install dnf-plugin-system-upgrade
```

#### 3、使用 DNF 开始更新

现在，你的系统是最新的，已经备份并且安装了 DNF 插件，你可以通过在终端中使用以下命令来开始升级：

```
sudo dnf system-upgrade download --releasever=31
```

该命令将开始在本地下载计算机的所有升级。如果由于缺乏更新包、损坏的依赖项或已淘汰的软件包而在升级时遇到问题，请在输入上面的命令时添加 `‐-allowerasing` 标志。这将使 DNF 删除可能阻止系统升级的软件包。

#### 4、重启并升级

上面的命令下载更新完成后，你的系统就可以重启了。要将系统引导至升级过程，请在终端中输入以下命令：

```
sudo dnf system-upgrade reboot
```

此后，你的系统将重启。在许多版本之前，`fedup` 工具会在内核选择/引导页面上创建一个新选项。使用 `dnf-plugin-system-upgrade` 软件包，你的系统将重新引导到当前 Fedora 30 使用的内核。这很正常。在内核选择页面之后不久，你的系统会开始升级过程。

现在也许可以喝杯咖啡休息下！升级完成后，系统将重启，你将能够登录到新升级的 Fedora 31 系统。

![][4]

### 解决升级问题

有时，升级系统时可能会出现意外问题。如果遇到任何问题，请访问 [DNF 系统升级文档][5]，以获取有关故障排除的更多信息。

如果升级时遇到问题，并且系统上安装了第三方仓库，那么在升级时可能需要禁用这些仓库。对于 Fedora 不提供的仓库的支持，请联系仓库的提供者。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/upgrading-fedora-30-to-fedora-31/

作者：[Ben Cotton][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/bcotton/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/10/f30-f31-816x345.jpg
[2]: https://linux.cn/article-11522-1.html
[3]: https://fedoramagazine.org/taking-smart-backups-duplicity/
[4]: https://cdn.fedoramagazine.org/wp-content/uploads/2016/06/Screenshot_f23-ws-upgrade-test_2016-06-10_110906-1024x768.png
[5]: https://docs.fedoraproject.org/en-US/quick-docs/dnf-system-upgrade/#Resolving_post-upgrade_issues
