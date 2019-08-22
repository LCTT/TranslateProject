[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10854-1.html)
[#]: subject: (Upgrading Fedora 29 to Fedora 30)
[#]: via: (https://fedoramagazine.org/upgrading-fedora-29-to-fedora-30/)
[#]: author: (Ryan Lerch https://fedoramagazine.org/author/ryanlerch/)

将 Fedora 29 升级到 Fedora 30
======

![][1]

Fedora 30 [已经发布了][2]。你可能希望将系统升级到最新版本的 Fedora。Fedora 工作站版本有图形化升级的方法。另外，Fedora 也提供了一个命令行方法，用于将 Fedora 29 升级到 Fedora 30。

### 将 Fedora 29 工作站版本升级到 Fedora 30

在发布不久后，桌面会显示一条通知告诉你可以升级。你可以单击通知启动 “GNOME 软件” 应用。或者你可以从 GNOME Shell 中选择“软件”。

在 “GNOME 软件” 中选择*更新*选项卡，你会看到一个页面通知你可以更新 Fedora 30。

如果你在屏幕上看不到任何内容，请尝试点击左上角的重新加载按钮。发布后，所有系统都可能需要一段时间才能看到可用的升级。

选择“下载”获取升级包。你可以继续做其他的事直到下载完成。然后使用 “GNOME 软件” 重启系统并应用升级。升级需要时间，因此你可以喝杯咖啡，稍后再回来。

### 使用命令行

如果你过去升级过 Fedora 版本，你可能熟悉 `dnf upgrade` 插件。这是从 Fedora 29 升级到 Fedora 30 的推荐和支持的方式。使用这个插件将使你的 Fedora 30 升级简单易行。

#### 1、更新软件并备份系统

在你执行任何操作之前，你需要确保在开始升级之前拥有 Fedora 29 的最新软件。要更新软件，请使用  “GNOME 软件” 或在终端中输入以下命令。

```
sudo dnf upgrade --refresh
```

此外，请确保在继续之前备份系统。关于备份的帮助，请参阅 Fedora Magazine 上的[备份系列][3]。

#### 2、安装 DNF 插件

接下来，打开终端并输入以下命令来安装插件：

```
sudo dnf install dnf-plugin-system-upgrade
```

#### 3、使用 DNF 开始更新

现在你的系统是最新的，完成了备份，并且已安装 DNF 插件，你可以在终端中使用以下命令开始升级：

```
sudo dnf system-upgrade download --releasever=30
```

此命令将开始在本地下载所有升级文件以准备升级。如果你因为没有更新包、错误的依赖，或过时的包在升级时遇到问题，请在输入上面的命令时添加 `-- allowerasing` 标志。这将允许 DNF 删除可能阻止系统升级的软件包。

#### 4、重启并升级

当前面的命令完成下载所有升级文件后，你的系统就可以重启了。要将系统引导至升级过程，请在终端中输入以下命令：

```
sudo dnf system-upgrade reboot
```

此后你的系统将重启。在许多版本之前，`fedup` 工具将在内核选择/引导页面上创建一个新选项。使用 `dnf-plugin-system-upgrade` 包，你的系统将使用当前 Fedora 29 安装的内核重启。这个是正常的。在内核选择页面后不久，系统开始升级过程。

现在可以休息一下了！完成后你的系统将重启，你就可以登录新升级的 Fedora 30 了。

![][4]

### 解决升级问题

升级系统时偶尔可能会出现意外问题。如果你遇到任何问题，请访问 [DNF 系统升级的维基页面][5]，以获取有关出现问题时的故障排除的更多信息。

如果你在升级时遇到问题并在系统上安装了第三方仓库，那么可能需要在升级时禁用这些仓库。有关 Fedora 对未提供仓库的支持，请与仓库的提供商联系。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/upgrading-fedora-29-to-fedora-30/

作者：[Ryan Lerch][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/ryanlerch/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/04/29-30-816x345.jpg
[2]: https://fedoramagazine.org/announcing-fedora-30/
[3]: https://fedoramagazine.org/taking-smart-backups-duplicity/
[4]: https://cdn.fedoramagazine.org/wp-content/uploads/2016/06/Screenshot_f23-ws-upgrade-test_2016-06-10_110906-1024x768.png
[5]: https://fedoraproject.org/wiki/DNF_system_upgrade#Resolving_post-upgrade_issues
