Terminix：一个很赞的基于 GTK3 的平铺式 Linux 终端模拟器
============================================================

现在，你可以很容易的找到[大量的 Linux 终端模拟器][1]，每一个都可以给用户留下深刻的印象。

但是，很多时候，我们会很难根据我们的喜好来找到一款心仪的日常使用的终端模拟器。这篇文章中，我们将会推荐一款叫做 Terminix 的令人激动的终端模拟机。

![](http://www.tecmint.com/wp-content/uploads/2016/07/Terminix-Terminal-Emulator-for-Linux.png)

*Terminix Linux 终端模拟器*

Terminix 是一个使用 VTE GTK+ 3 组件的平铺式终端模拟器。使用 GTK 3 开发的原因主要是为了符合 GNOME  HIG（人机接口 Human Interface Guidelines) 标准。另外，Terminix 已经在 GNOME 和 Unity 桌面环境下测试过了，也有用户在其他的 Linux 桌面环境下测试成功。

和其他的终端模拟器一样，Terminix 有着很多知名的特征，列表如下：

- 允许用户进行任意的垂直或者水平分屏
- 支持拖拽功能来进行重新排布终端
- 支持使用拖拽的方式终端从窗口中将脱离出来
- 支持终端之间的输入同步，因此，可以在一个终端输入命令，而在另一个终端同步复现
- 终端的分组配置可以保存在硬盘，并再次加载
- 支持透明背景
- 允许使用背景图片
- 基于主机和目录来自动切换配置
- 支持进程完成的通知信息
- 配色方案采用文件存储，同时支持自定义配色方案

### 如何在 Linux 系统上安装 Terminix

现在来详细说明一下在不同的 Linux 发行版本上安装 Terminix 的步骤。首先，在此列出 Terminix 在 Linux 所需要的环境需求。

#### 依赖组件

为了正常运行，该应用需要使用如下库：

- GTK 3.14 或者以上版本
- GTK VTE 0.42 或者以上版本
- Dconf
- GSettings
- Nautilus 的 iNautilus-Python 插件

如果你已经满足了如上的系统要求，接下来就是安装 Terminix 的步骤。

#### 在 RHEL/CentOS 7 或者 Fedora 22-24 上

首先，你需要通过新建文件 `/etc/yum.repos.d/terminix.repo` 来增加软件仓库，使用你最喜欢的文本编辑器来进行编辑：

```
# vi /etc/yum.repos.d/terminix.repo
```

然后拷贝如下的文字到我们刚新建的文件中：

```
[heikoada-terminix]
name=Copr repo for terminix owned by heikoada
baseurl=https://copr-be.cloud.fedoraproject.org/results/heikoada/terminix/fedora-$releasever-$basearch/
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://copr-be.cloud.fedoraproject.org/results/heikoada/terminix/pubkey.gpg
enabled=1
enabled_metadata=1
```

保存文件并退出。

然后更新你的系统，并且安装 Terminix，步骤如下：

```
---------------- On RHEL/CentOS 7 ---------------- 
# yum update
# yum install terminix

---------------- On Fedora 22-24 ---------------- 
# dnf update
# dnf install terminix
```

#### 在 Ubuntu 16.04-14.04 和 Linux Mint 18-17

虽然没有基于 Debian/Ubuntu 发行版本的官方的软件包，但是你依旧可以通过如下的命令手动安装。

```
$ wget -c https://github.com/gnunn1/terminix/releases/download/1.1.1/terminix.zip
$ sudo unzip terminix.zip -d / 
$ sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
```

#### 其它 Linux 发行版

OpenSUSE 用户可以从默认仓库中安装 Terminix，Arch Linux 用户也可以安装 [AUR Terminix 软件包][2]。

### Terminix 截图教程

![](http://www.tecmint.com/wp-content/uploads/2016/07/Terminix-Terminal.png)

*Terminix 终端*

![](http://www.tecmint.com/wp-content/uploads/2016/07/Terminix-Terminal-Settings.png)

*Terminix 终端设置*

![](http://www.tecmint.com/wp-content/uploads/2016/07/Terminix-Terminal-Tabs.png)

*Terminix 多终端界面*

### 如何卸载删除 Terminix


如果你是手动安装的 Terminix 并且想要删除它，那么你可以参照如下的步骤来卸载它。从 [Github 仓库][3]上下载 uninstall.sh，并且给它可执行权限并且执行它：

```
$ wget -c https://github.com/gnunn1/terminix/blob/master/uninstall.sh
$ chmod +x uninstall.sh
$ sudo sh uninstall.sh
```

但是如果你是通过包管理器安装的 Terminix，你可以使用包管理器来卸载它。

在这篇介绍中，我们在众多优秀的终端模拟器中发现了一个重要的 Linux 终端模拟器。你可以尝试着去体验下它的新特性，并且可以将它和你现在使用的终端进行比较。

重要的一点，如果你想得到更多信息或者有疑问，请使用评论区，而且不要忘了，给我一个关于你使用体验的反馈。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/terminix-tiling-terminal-emulator-for-linux/

作者：[Aaron Kili][a]
译者：[MikeCoder](https://github.com/MikeCoder)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: http://www.tecmint.com/linux-terminal-emulators/
[2]: https://aur.archlinux.org/packages/terminix
[3]: https://github.com/gnunn1/terminix
