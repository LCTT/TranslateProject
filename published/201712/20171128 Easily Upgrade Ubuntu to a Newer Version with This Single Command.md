一行命令轻松升级 Ubuntu
======

![Upgrade Ubuntu to a newer version with a single command][3]

[zzupdate][1] 是一个开源的命令行程序，通过将几个更新命令组合到一个命令中，使得将 Ubuntu 桌面和服务器版本升级到更新版本的任务变得容易一些。

将 Ubuntu 系统升级到更新的版本并不是一项艰巨的任务。无论是使用 GUI 还是使用几个命令，都可以轻松地将系统升级到最新版本。

另一方面，Gianluigi 'Zane' Zanettini 写的 `zzupdate` 只需一个命令就可以在 Ubuntu 中清理、更新、自动删除、版本升级、该工具自我更新。

它会清理本地缓存，更新可用的软件包信息，然后执行发行版升级。接着，它会更新该工具并删除未使用的软件包。

该脚本必须以 root 用户身份运行。

### 安装 zzupdate 将 Ubuntu 升级到更新的版本

要安装 `zzupdate`，请在终端中执行以下命令。

```
curl -s https://raw.githubusercontent.com/TurboLabIt/zzupdate/master/setup.sh | sudo sh
```

然后将提供的示例配置文件复制到 `zzupdate.conf` 并设置你的首选项。

```
sudo cp /usr/local/turbolab.it/zzupdate/zzupdate.default.conf /etc/turbolab.it/zzupdate.conf
```

完成后，只要使用下面的命令，它就会开始升级你的 Ubuntu 系统到一个更新的版本（如果有的话）。

```
sudo zzupdate
```

请注意，在普通版本（非 LTS 版本）下，zzupdate 会将系统升级到下一个可用的版本。但是，当你运行 Ubuntu 16.04 LTS 时，它将尝试仅搜索下一个长期支持版本，而不是可用的最新版本。

如果你想退出 LTS 版本并升级到最新版本，你将需要更改一些选项。

对于 Ubuntu 桌面，打开 **软件和更新** 和下面 **更新** 选项卡，并更改通知我新的 Ubuntu 版本选项为 “**对于任何新版本**”。

![Software Updater in Ubuntu][4]

对于 Ubuntu 服务版，编辑 `release-upgrades` 文件。

```
vi /etc/update-manager/release-upgrades

Prompt=normal
```

### 配置 zzupdate [可选]

`zzupdate` 要配置的选项：

```
REBOOT=1
```

如果值为 1，升级后系统将重启。

```
REBOOT_TIMEOUT=15
```

将重启超时设置为 900 秒，因为某些硬件比其他硬件重启需要更长的时间。

```
VERSION_UPGRADE=1
```

如果升级可用，则执行版本升级。

```
VERSION_UPGRADE_SILENT=0
```

自动显示版本进度。

```
COMPOSER_UPGRADE=1
```

值为 “1” 会自动升级该工具。

```
SWITCH_PROMPT_TO_NORMAL=0
```

此功能将 Ubuntu 版本更新为普通版本，即如果你运行着 LTS 发行版，`zzupdate` 将不会将其升级到 Ubuntu 17.10（如果其设置为 0）。它将仅搜索 LTS 版本。相比之下，无论你运行着 LTS 或者普通版，“1” 都将搜索最新版本。

完成后，你要做的就是在控制台中运行一个完整的 Ubuntu 系统更新。

```
sudo zzupdate
```

### 最后的话

尽管 Ubuntu 的升级过程本身就很简单，但是 zzupdate 将它简化为一个命令。不需要编码知识，这个过程完全是配置文件驱动。我个人发现这是一个很好的更新几个 Ubuntu 系统的工具，而无需单独关心不同的事情。

你愿意试试吗？

--------------------------------------------------------------------------------

via: https://itsfoss.com/zzupdate-upgrade-ubuntu/

作者：[Ambarish Kumar][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com
[1]:https://github.com/TurboLabIt/zzupdate
[2]:data:image/gif;base64,R0lGODdhAQABAPAAAP///wAAACwAAAAAAQABAEACAkQBADs=
[3]:https://itsfoss.com/wp-content/uploads/2017/11/upgrade-ubuntu-single-command-featured-800x450.jpg
[4]:https://itsfoss.com/wp-content/uploads/2017/11/software-update-any-new-version-800x378.jpeg
