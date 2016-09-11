LXDE、Xfce 及 MATE 桌面环境下的又一系统监视器应用：Multiload-ng
======

[Multiload-ng][1] 是一个 GTK2 图形化系统监视器应用，可集成到 Xfce、LXDE 及 MATE 的桌面面板中， 它 fork 自原来的 GNOME Multiload 应用。它也可以运行在一个独立的窗口中。

![](https://2.bp.blogspot.com/-U8CFzhSPJho/V7GigDbcLWI/AAAAAAAAYS0/pJMM6Rt5-HkbKljmxzP4-v0oGGxjvH8AgCLcB/s1600/multiload-ng-lxde.png)

Multiload-ng 的特点有：

- 支持图形化： CPU，内存，网络，交换空间，平均负载，磁盘以及温度；
- 高度可定制；
- 支持配色方案；
- 自动适应容器（面板或窗口）的改变；
- 极低的 CPU 和内存占用；
- 提供基本或详细的提示信息；
- 可自定义双击触发的动作。

相比于原来的 Multiload 应用，Multiload-ng 含有一个额外的图形块（温度），更多独立的图形自定义选项，例如独立的边框颜色，支持配色方案，可根据自定义的动作对鼠标的点击做出反应，图形块的方向可以被设定为与面板的方向无关。

它也可以运行在一个独立的窗口中，而不需要面板：

![](https://1.bp.blogspot.com/-hHoipwFlHrg/V7Gw2s107zI/AAAAAAAAYTQ/fS5OtiL7VvwDEzr6qO_gdEA_qB9YvJa5gCLcB/s400/multiload-ng-standalone.png)

另外，它的 GitHub page 上说还会带来更多的图形块支持。

下图展示的是在带有一个垂直面板的 Xubuntu 16.04 中，该应用分别处于水平和垂直方向的效果：

![](https://3.bp.blogspot.com/-xa0OML8T-lg/V7Gixksbt8I/AAAAAAAAYS4/Jxo-MukDh3sYlOOk9A1YGtARmte490g8ACLcB/s400/multiload-ng-xfce-horizontal.png)

![](https://1.bp.blogspot.com/-WAD5MdDObD8/V7GixgVU0DI/AAAAAAAAYS8/uMhHJri1GJccRWvmf_tZkYeenVdxiENQwCLcB/s400/multiload-ng-xfce-vertical.png)

这个应用的偏好设置窗口虽然不是非常好看，但有很多方式去改进它：

![](https://2.bp.blogspot.com/-P-ophDpc-gI/V7Gi_54b7JI/AAAAAAAAYTA/AHQck_JF_RcwZ1KbgHbaO2JRt24ZZdO3gCLcB/s320/multiload-ng-preferences.png)

Multiload-ng 当前使用的是 GTK2，所以它不能在构建自 GTK3 下的 Xfce 或 MATE 桌面环境（面板）下工作。

对于 Ubuntu 系统而言，只有 Ubuntu MATE 16.10 使用 GTK3。但是鉴于 MATE 的系统监视器应用也是 Multiload GNOME 的一个分支，所以它们共享大多数的特点（除了 Multiload-ng 提供的额外自定义选项和温度图形块）。

该应用的 [愿望清单][2] 中提及到了计划支持 GTK3 的集成以及各种各样的改进，例如温度块资料的更多来源，能够显示十进制(KB, MB, GB...)或二进制(KiB, MiB, GiB...)单位等等。

### 安装 Multiload-ng

请注意因为依赖的关系， Multiload-ng 不能在 Lubuntu 14.04 上构建。

Multiload-ng 可在  WebUpd8 的主 PPA （针对 Ubuntu 14.04 - 16.04 / Linux Mint 17.x 和 18）中获取到。可以使用下面的命令来添加 PPA 并更新软件源：

```
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt update
```

然后可以使用下面的命令来安装这个应用：

- 对于 LXDE (Lubuntu)：

```
sudo apt install lxpanel-multiload-ng-plugin
```

- 对于 Xfce (Xubuntu，Linux Mint Xfce)：

```
sudo apt install xfce4-multiload-ng-plugin
```

- 对于 MATE (Ubuntu MATE，Linux Mint MATE)：

```
sudo apt install mate-multiload-ng-applet
```

- 独立安装 (不需要集成到面板)：

```
sudo apt install multiload-ng-standalone
```

一旦安装完毕，便可以像其他应用那样添加到桌面面板中了。需要注意的是在 LXDE 中，Multiload-ng 不能马上出现在面板清单中，除非面板被重新启动。你可以通过重启会话（登出后再登录）或者使用下面的命令来重启面板：

```
lxpanelctl restart
```

独立的 Multiload-ng 应用可以像其他正常应用那样从菜单中启动。

如果要下载源码或报告 bug 等，请看 Multiload-ng 的 [GitHub page][3]。
--------------------------------------------------------------------------------

via: http://www.webupd8.org/2016/08/alternative-system-monitor-applet-for.html

作者：[Andrew][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.webupd8.org/p/about.html
[1]: https://github.com/udda/multiload-ng
[2]: https://github.com/udda/multiload-ng/wiki/Wishlist
[3]: https://github.com/udda/multiload-ng
