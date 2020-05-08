[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12195-1.html)
[#]: subject: (Upgrading Fedora 31 to Fedora 32)
[#]: via: (https://fedoramagazine.org/upgrading-fedora-31-to-fedora-32/)
[#]: author: (Adam Šamalík https://fedoramagazine.org/author/asamalik/)

将 Fedora 31 升级到 Fedora 32
======

![][1]

Fedora 32 [已经发布][2]。你可能想升级系统以获得 Fedora 中的最新功能。Fedora Workstation 有图形化的升级方法。另外，Fedora 提供了命令行方法，用于将 Fedora 31 升级到 Fedora 32。

升级前，请访问 [Fedora 32 个常见 bug 的维基页面][3]，查看是否存在可能影响升级的问题。尽管 Fedora 社区试图确保升级正常进行，但是无法为用户可能使用的每种软硬件组合提供保证。

### 将 Fedora 31 Workstation 升级到 Fedora 32

在新版本发布不久之后就会出现通知，告诉你有可用的升级。你可以单击该通知启动 “GNOME 软件”。或者，你可以从 GNOME Shell 中选择“软件”。

在 “GNOME 软件”中选择<ruby>更新<rt>Updates</rt></ruby>选项卡，你会看到一个页面通知你 Fedora 32 现在可用。

如果你在此页面看不到任何内容，请尝试使用左上方的重新加载按钮。发布后，所有系统可能都需要一段时间才能看到可用的升级。

选择<ruby>下载<rt>Download</rt></ruby>获取升级包。你可以继续做事直到下载完成。然后使用 “GNOME 软件”重启系统并应用升级。升级需要时间，因此你可能需要喝杯咖啡，稍后再回来。

### 使用命令行

如果你是从 Fedora 的先前版本升级的，那么你可能对 `dnf upgrade` 插件很熟悉。这个方法是推荐和受支持的从 Fedora 31 升级到 Fedora 32 的方法。使用此插件将使你轻松地升级到 Fedora 32。

#### 1、更新软件并备份系统

在开始升级过程之前，请确保你有 Fedora 31 的最新软件。如果你安装了<ruby>模块化软件<rt>modular software</rt></ruby>，这尤为重要。`dnf` 和 “GNOME 软件”的最新版本对某些模块化流的升级过程进行了改进。要更新软件，请使用 “GNOME 软件” 或在终端中输入以下命令。

```
sudo dnf upgrade --refresh
```

此外，在继续操作之前，请确保备份系统。有关备份的帮助，请参阅 Fedora Magazine 上的[备份系列][4]。

#### 2、安装 DNF 插件

接下来，打开终端并输入以下命令安装插件：

```
sudo dnf install dnf-plugin-system-upgrade
```

#### 3、使用 DNF 开始更新

现在，你的系统已更新、已备份、并且已安装 DNF 插件，你可以在终端中使用以下命令开始升级：

```
sudo dnf system-upgrade download --releasever=32
```

这个命令将开始在本地下载所有的升级包，为升级做准备。如果你在升级的时候因为没有更新的包、依赖关系破损或退役的包而出现问题，请在输入上述命令时添加 `--allowerasing` 标志。这将允许 DNF 移除可能阻碍系统升级的软件包。

#### 4、重启并升级

当上一个命令完成了所有升级包的下载，你的系统就可以重新启动了。要将系统引导至升级过程，请在终端中输入以下命令：

```
sudo dnf system-upgrade reboot
```

此后，系统将重启。在许多版本之前，`fedup` 工具会在内核选择/启动页上创建一个新选项。使用 `dnf-plugin-system-upgrade` 包，你的系统会重启进入 Fedora 31 当前安装的内核；这个是正常的。在选择内核之后，你的系统会立即开始升级过程。

现在可能是喝杯咖啡休息的好时机！完成后，系统将重启，你将能够登录到新升级的 Fedora 32 系统。

![][5]

### 解决升级问题

有时，升级系统时可能会出现意外问题。如果你遇到任何问题，请访问 [DNF 系统升级文档][6]，以获取有关故障排除的更多信息。

如果升级时遇到问题，并且系统上安装了第三方仓库，那么在升级时可能需要禁用这些仓库。对于 Fedora 不提供的仓库的支持，请联系仓库的提供者。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/upgrading-fedora-31-to-fedora-32/

作者：[Adam Šamalík][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/asamalik/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/04/31-32-816x345.png
[2]: https://linux.cn/article-12164-1.html
[3]: https://fedoraproject.org/wiki/Common_F32_bugs
[4]: https://fedoramagazine.org/taking-smart-backups-duplicity/
[5]: https://cdn.fedoramagazine.org/wp-content/uploads/2016/06/Screenshot_f23-ws-upgrade-test_2016-06-10_110906-1024x768.png
[6]: https://docs.fedoraproject.org/en-US/quick-docs/dnf-system-upgrade/#Resolving_post-upgrade_issues
