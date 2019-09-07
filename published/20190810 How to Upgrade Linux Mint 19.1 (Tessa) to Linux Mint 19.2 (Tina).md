[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11298-1.html)
[#]: subject: (How to Upgrade Linux Mint 19.1 (Tessa) to Linux Mint 19.2 (Tina)?)
[#]: via: (https://www.2daygeek.com/upgrade-linux-mint-19-1-tessa-to-linux-mint-19-2-tina/)
[#]: author: (2daygeek http://www.2daygeek.com/author/2daygeek/)

如何升级 Linux Mint 19.1 为 Linux Mint 19.2
======

![](https://img.linux.net.cn/data/attachment/album/201909/02/231523na40npunm88z68ka.jpg)

Linux Mint 19.2 “Tina” 在 2019 年 8 月 2 日发布，它是一个基于 Ubuntu 18.04 LTS (Bionic Beaver) 的长期支持版本。它将被支持到 2023 年。它带来更新的软件和精细的改进和很多新的特色来使你的桌面使用地更舒适。

Linux Mint 19.2 特色有 Cinnamon 4.2 、Linux 内核 4.15 和 Ubuntu 18.04 基础软件包。

**注意：** 不要忘记备份你的重要数据。如果一些东西出错，在最新的安装后，你可以从备份中恢复数据。

备份可以通过 rsnapshot 或 timeshift 完成。

Linux Mint 19.2 “Tina” 发布日志可以在下面的链接中找到。

* [Linux Mint 19.2 (Tina) 发布日志][1]

这里有三种方法，能让我们升级为 Linux Mint 19.2 “Tina”。

  * 使用本地方法升级 Linux Mint 19.2 (Tina) 
  * 使用 Mintupgrade 实用程序方法升级 Linux Mint 19.2 (Tina)
  * 使用 GUI 升级 Linux Mint 19.2 (Tina)

### 如何从 Linux Mint 19.1 (Tessa) 升级为 Linux Mint 19.2 (Tina)？

升级 Linux Mint 系统是一项简单轻松的任务。有三种方法可以完成。

### 方法-1：使用本地方法升级 Linux Mint 19.2 (Tina)

这是执行升级 Linux Mint 系统的本地和标准的方法之一。为做到这点，遵循下面的程序步骤。

确保你当前 Linux Mint 系统是最新的。使用下面的命令来更新你现在的软件为最新可用版本。

#### 步骤-1：

通过运行下面的命令来刷新存储库索引。

```
$ sudo apt update
```

运行下面的命令来在系统上安装可用的更新。

```
$ sudo apt upgrade
```

运行下面的命令来在版本中执行可用的次要更新。

```
$ sudo apt full-upgrade
```

默认情况下，它将通过上面的命令来移除过时的软件包。但是，我建议你运行下面的命令。

```
$ sudo apt autoremove
$ sudo apt clean
```

如果安装一个新的内核，你可能需要重启系统。如果是这样，运行下面的命令。

```
$ sudo shutdown -r now
```

最后检查当前安装的版本。

```
$ lsb_release -a

No LSB modules are available.
Distributor ID: Linux Mint
Description:    Linux Mint 19.1 (Tessa)
Release:        19.1
Codename:       Tessa
```

#### 步骤-2：更新/修改 /etc/apt/sources.list 文件

在重启后，修改 `sources.list` 文件，并从 Linux Mint 19.1 (Tessa) 指向 Linux Mint 19.2 (Tina)。

首先，使用 `cp` 命令备份下面的配置文件。

```
$ sudo cp  /etc/apt/sources.list /root
$ sudo cp -r /etc/apt/sources.list.d/ /root
```

修改 `sources.list` 文件，并指向 Linux Mint 19.2 (Tina)。

```
$ sudo sed -i 's/tessa/tina/g' /etc/apt/sources.list
$ sudo sed -i 's/tessa/tina/g' /etc/apt/sources.list.d/*
```

通过运行下面的命令来刷新存储库索引。

```
$ sudo apt update
```

运行下面的命令来在系统上安装可用的更新。在升级过程中，你可用需要确认服务重启和配置文件替换，因此，只需遵循屏幕上的指令。

升级可能花费一些时间，具体依赖于更新的数量和你的网络速度。

```
$ sudo apt upgrade
```

运行下面的命令来执行一次完整的系统升级。

```
$ sudo apt full-upgrade
```

默认情况下，上面的命令将移除过时的软件包。但是，我建议你再次运行下面的命令。

```
$ sudo apt autoremove
$ sudo apt clean
```

最后重启系统来启动 Linux Mint 19.2 (Tina)。

```
$ sudo shutdown -r now
```

升级后的 Linux Mint 版本可以通过运行下面的命令验证。

```
$ lsb_release -a

No LSB modules are available.
Distributor ID: Linux Mint
Description:    Linux Mint 19.2 (Tina)
Release:        19.2
Codename:       Tina
```

### 方法-2：使用 Mintupgrade 实用程序升级 Linux Mint 19.2 (Tina) 

这是 Mint 官方实用程序，它允许我们对 Linux Mint 系统执行平滑升级。

使用下面的命令来安装 mintupgrade 软件包。

```
$ sudo apt install mintupgrade
```

确保你已经安装 mintupgrade 软件包的最新版本。

```
$ apt version mintupgrade
```

以一个普通用户来运行下面的命令以模拟一次升级，遵循屏幕上的指令。

```
$ mintupgrade check
```

使用下面的命令来下载需要的软件包来升级为 Linux Mint 19.2 (Tina) ，遵循屏幕上的指令。

```
$ mintupgrade download
```

运行下面的命令来运用升级，最新屏幕上的指令。

```
$ mintupgrade upgrade
```

在成功升级后，重启系统，并检查升级后的版本。

```
$ lsb_release -a

No LSB modules are available.
Distributor ID: Linux Mint
Description:    Linux Mint 19.2 (Tina)
Release:        19.2
Codename:       Tina
```

### 方法-3：使用 GUI 升级 Linux Mint 19.2 (Tina)

或者，我们可以通过 GUI 执行升级。

#### 步骤-1：

通过 Timeshift 创建一个系统快照。如果一些东西出错，你可以简单地恢复你的操作系统到它先前状态。

#### 步骤-2:

打开更新管理器，单击刷新按钮来检查 mintupdate 和 mint-upgrade-info 的任何新版本。如果有这些软件包的更新，应用它们。

通过单击 “编辑-> 升级到 Linux Mint 19.2 Tina”来启动系统升级。

![][3]

遵循屏幕上的指令。如果被询问是否保留或替换配置文件，选择替换它们。

![][4]

#### 步骤-3:

在升级完成后，重启你的电脑。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/upgrade-linux-mint-19-1-tessa-to-linux-mint-19-2-tina/

作者：[2daygeek][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.2daygeek.com/author/2daygeek/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechnews.com/linux-mint-19-2-tina-released-check-what-is-new-feature/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://www.2daygeek.com/wp-content/uploads/2019/08/linux-mint-19-2-tina-mintupgrade.png
[4]: https://www.2daygeek.com/wp-content/uploads/2019/08/linux-mint-19-2-tina-mintupgrade-1.png
