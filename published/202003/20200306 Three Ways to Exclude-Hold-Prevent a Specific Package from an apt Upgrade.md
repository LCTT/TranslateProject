[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11992-1.html)
[#]: subject: (Three Ways to Exclude/Hold/Prevent a Specific Package from an apt Upgrade)
[#]: via: (https://www.2daygeek.com/debian-ubuntu-exclude-hold-prevent-packages-from-apt-get-upgrade/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

从 apt 升级中排除/保留/阻止特定软件包的三种方法
======

![](https://img.linux.net.cn/data/attachment/album/202003/13/103902tfyv8eeuo5jf9ifo.jpg)

有时，由于某些应用依赖性，你可能会意外更新不想更新的软件包。这在全系统更新或自动包升级时经常会发生。如果发生这种情况，可能会破坏应用的功能。这会造成严重的问题，你需要花费大量时间来解决问题。

如何避免这种情况？如何从 `apt-get` 更新中排除软件包？

> 如果你要[从 Yum Update 中排除特定软件包][1]，请参考这篇。

是的，可以在 Debian 和 Ubuntu 系统上使用以下三种方法来完成。

* [apt-mark 命令][2]
* [dpkg 命令][3]
* aptitude 命令

我们将分别详细展示。

### 方法 1：如何使用 apt-mark 命令排除 Debian/Ubuntu 系统上的软件包更新

`apt-mark` 用于将软件包标记/取消标记为自动安装。

`hold` 选项用于将软件包标记为保留，以防止软件包被自动安装、升级或删除。

`unhold` 选项用于取消先前面的设置，以允许重复执行所有操作。

运行以下命令以使用 `apt-mark` 命令保留指定的软件包。

```
$ sudo apt-mark hold nano
nano set on hold.
```

保留软件包后，请运行以下 `apt-mark` 命令查看它们。

```
$ sudo apt-mark showhold
nano
```

这表明在执行完整的系统更新时，不会升级 nano 包。

```
$ sudo apt update

Reading package lists… Done
Building dependency tree
Reading state information… Done
Calculating upgrade… Done
The following packages have been kept back:
  nano
0 upgraded, 0 newly installed, 0 to remove and 1 not upgraded.
```

运行以下命令，使用 `apt-mark` 命令取消保留 nano 包。

```
$ sudo apt-mark unhold nano
Canceled hold on nano.
```

### 方法 2：如何使用 dpkg 命令在 Debian/Ubuntu 系统上排除软件包更新

`dpkg` 命令是一个 CLI 工具，用于安装、构建、删除和管理 Debian 软件包。`dpkg` 的主要且更用户友好的前端是 `aptitude`。

运行以下命令使用 `dpkg` 命令阻止给定的软件包。

语法：

```
$ echo "package_name hold" | sudo dpkg --set-selections
```

运行以下 `dpkg` 命令以保留 apache2 包。

```
$ echo "apache2 hold" | sudo dpkg --set-selections
```

保留软件包后，请运行以下命令查看它们。

```
$ sudo dpkg --get-selections | grep "hold"
apache2                        hold
```

它会显示在执行完整的系统更新时，不会升级 apache2包。

```
$ sudo apt update

Reading package lists… Done
Building dependency tree
Reading state information… Done
Calculating upgrade… Done
The following packages have been kept back:
  apache2
0 upgraded, 0 newly installed, 0 to remove and 1 not upgraded.
```

运行以下命令，使用 `dpkg` 命令取消对指定软件包的保留。

语法：

```
$ echo "package_name install" | sudo dpkg --set-selections
```

运行以下命令，使用 `dpkg` 命令取消保留 apache2 包。

```
$ echo "apache2 install" | sudo dpkg --set-selections
```

### 方法 3：如何使用 aptitude 命令排除 Debian/Ubuntu 系统上的软件包更新

`aptitude` 命令是 Debian 及其衍生版本的基于文​​本的软件包管理界面。

它允许用户查看软件包列表并执行软件包管理任务，例如安装、升级和删除软件包。它可以从可视界面或命令行执行操作。

运行以下命令，使用 `aptitude` 命令保留指定的软件包。

```
$ sudo aptitude hold python3
```

保留某些软件包后，请运行以下命令查看它们。

```
$ sudo dpkg --get-selections | grep "hold"
或者
$ sudo apt-mark showhold

python3
```

这表明在执行完整的系统更新时，不会升级 python3 软件包。

```
$ sudo apt update

Reading package lists… Done
Building dependency tree
Reading state information… Done
Calculating upgrade… Done
The following packages have been kept back:
  python3
0 upgraded, 0 newly installed, 0 to remove and 1 not upgraded.
```

使用 `aptitude ` 命令运行以下命令以解除对 python3 软件包的保留。

```
$ sudo aptitude unhold python3
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/debian-ubuntu-exclude-hold-prevent-packages-from-apt-get-upgrade/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/redhat-centos-yum-update-exclude-specific-packages/
[2]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[3]: https://www.2daygeek.com/dpkg-command-to-manage-packages-on-debian-ubuntu-linux-mint-systems/
