在 Ubuntu Mate 16.04 上通过 PPA  升级 Mate 1.14
=================================================================

Mate 桌面环境 1.14 现在可以在 Ubuntu Mate 16.04 ("Xenial Xerus") 上使用了。根据这个[发布版本][1]的描述，为了全面测试 Mate 1.14，所以 Mate 桌面环境 1.14 已经在 PPA 上发布 2 个月了。因此，你不太可能遇到安装的问题。

![](https://2.bp.blogspot.com/-v38tLvDAxHg/V1k7beVd5SI/AAAAAAAAX7A/1X72bmQ3ia42ww6kJ_61R-CZ6yrYEBSpgCLcB/s400/mate114-ubuntu1604.png)

**现在 PPA 提供 Mate 1.14.1 包含如下改变（Ubuntu Mate 16.04 默认安装的是 Mate 1.12.x）：**

- 客户端的装饰应用现在可以正确的在所有主题中渲染；
- 触摸板配置现在支持边缘操作和双指滚动；
- 在 Caja 中的 Python 扩展可以被单独管理；
- 所有三个窗口焦点模式都是可选的；
- Mate Panel 中的所有菜单栏图标和菜单图标可以改变大小；
- 音量和亮度 OSD 目前可以启用和禁用；
- 更多的改进和 bug 修改；

Mate 1.14 同时改进了整个桌面环境中对 GTK+ 3 的支持，包括各种 GTK+3 小应用。但是，Ubuntu MATE 的博客中提到：PPA 的发行包使用 GTK+ 2 编译是“为了确保对 Ubuntu MATE 16.04 还有各种各样的第三方 MATE 应用、插件、扩展的支持"。

MATE 1.14 的完整修改列表[点击此处][2]阅读。

### 在 Ubuntu MATE 16.04 中升级 MATE 1.14.x

在 Ubuntu MATE 16.04 中打开终端，并且输入如下命令，来从官方的 Xenial MATE PPA 中升级最新的 MATE 桌面环境:

```
sudo apt-add-repository ppa:ubuntu-mate-dev/xenial-mate
sudo apt update
sudo apt dist-upgrade
```

**注意**: mate-netspeed 应用将会在升级中删除。因为该应用现在已经是 mate-applets 应用报的一部分，所以它依旧是可以使用的。

一旦升级完成，请重启你的系统，享受全新的 MATE!

### 如何回滚这次升级

如果你并不满意 MATE 1.14, 比如你遭遇了一些 bug 。或者你想回到 MATE 的官方源版本，你可以使用如下的命令清除 PPA，并且下载降级包。

```
sudo apt install ppa-purge
sudo ppa-purge ppa:ubuntu-mate-dev/xenial-mate
```

在所有的 MATE 包降级之后，重启系统。

via [Ubuntu MATE blog][3]

--------------------------------------------------------------------------------

via: http://www.webupd8.org/2016/06/install-mate-114-in-ubuntu-mate-1604.html

作者：[Andrew][a]
译者：[MikeCoder](https://github.com/MikeCoder)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.webupd8.org/p/about.html
[1]: https://ubuntu-mate.org/blog/mate-desktop-114-for-xenial-xerus/
[2]: http://mate-desktop.com/blog/2016-04-08-mate-1-14-released/
[3]: https://ubuntu-mate.org/blog/mate-desktop-114-for-xenial-xerus/
