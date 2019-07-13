一窥你安装的 Linux 软件包
======
> 这些最有用的命令可以让你了解安装在你的 Debian 类的 Linux 系统上的包的情况。

![](https://images.idgesg.net/images/article/2017/12/christmas-packages-100744371-large.jpg)

你有没有想过你的 Linux 系统上安装了几千个软件包？ 是的，我说的是“千”。 即使是相当一般的 Linux 系统也可能安装了上千个软件包。 有很多方法可以获得这些包到底是什么包的详细信息。

首先，要在基于 Debian 的发行版（如 Ubuntu）上快速得到已安装的软件包数量，请使用 `apt list --installed`， 如下：

```
$ apt list --installed | wc -l
2067
```

这个数字实际上多了一个，因为输出中包含了 “Listing ...” 作为它的第一行。 这个命令会更准确：

```
$ apt list --installed | grep -v "^Listing" | wc -l
2066
```

要获得所有这些包的详细信息，请按以下方式浏览列表：

```
$ apt list --installed | more
Listing...
a11y-profile-manager-indicator/xenial,now 0.1.10-0ubuntu3 amd64 [installed]
account-plugin-aim/xenial,now 3.12.11-0ubuntu3 amd64 [installed]
account-plugin-facebook/xenial,xenial,now 0.12+16.04.20160126-0ubuntu1 all [installed]
account-plugin-flickr/xenial,xenial,now 0.12+16.04.20160126-0ubuntu1 all [installed]
account-plugin-google/xenial,xenial,now 0.12+16.04.20160126-0ubuntu1 all [installed]
account-plugin-jabber/xenial,now 3.12.11-0ubuntu3 amd64 [installed]
account-plugin-salut/xenial,now 3.12.11-0ubuntu3 amd64 [installed]

```

这需要观察很多细节 —— 特别是让你的眼睛在所有 2000 多个文件中徘徊。 它包含包名称、版本等，以及更多但并不是以最易于我们人类解析的显示信息。 `dpkg-query` 使得描述更容易理解，但这些描述会塞满你的命令窗口，除非窗口非常宽。 因此，为了让此篇文章更容易阅读，下面的数据显示已经分成了左右两侧。

左侧：

```
$ dpkg-query -l | more
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name                                                 Version                                      
+++-==============================================-=================================-
ii  a11y-profile-manager-indicator                 0.1.10-0ubuntu3                              
ii  account-plugin-aim                             3.12.11-0ubuntu3                             
ii  account-plugin-facebook                        0.12+16.04.20160126-0ubuntu1                 
ii  account-plugin-flickr                          0.12+16.04.20160126-0ubuntu1                 
ii  account-plugin-google                          0.12+16.04.20160126-0ubuntu1                 
ii  account-plugin-jabber                          3.12.11-0ubuntu3                             
ii  account-plugin-salut                           3.12.11-0ubuntu3                             
ii  account-plugin-twitter                         0.12+16.04.20160126-0ubuntu1                 
rc  account-plugin-windows-live                    0.11+14.04.20140409.1-0ubuntu2               
```

右侧：

```
Architecture Description
============-=====================================================================
amd64        Accessibility Profile Manager - Unity desktop indicator
amd64        Messaging account plugin for AIM
all          GNOME Control Center account plugin for single signon - facebook
all          GNOME Control Center account plugin for single signon - flickr
all          GNOME Control Center account plugin for single signon
amd64        Messaging account plugin for Jabber/XMPP
amd64        Messaging account plugin for Local XMPP (Salut)
all          GNOME Control Center account plugin for single signon - twitter
all          GNOME Control Center account plugin for single signon - windows live
```

每行开头的 `ii` 和 `rc` 名称（见上文“左侧”）是包状态指示符。 第一个字母表示包的预期状态：

- `u` -- 未知
- `i` -- 安装
- `r` -- 移除/反安装
- `p` -- 清除（也包括配置文件）
- `h` -- 保留

第二个代表包的当前状态：

- `n` -- 未安装
- `i` -- 已安装
- `c` -- 配置文件（只安装了配置文件）
- `U` -- 未打包
- `F` -- 半配置（出于某些原因配置失败）
- `h` -- 半安装（出于某些原因配置失败）
- `W` -- 等待触发（该包等待另外一个包的触发器）
- `t` -- 待定触发（该包被触发）

在通常的双字符字段末尾添加的 `R` 表示需要重新安装。 你可能永远不会碰到这些。

快速查看整体包状态的一种简单方法是计算在不同状态中包含的包的数量：

```
$ dpkg-query -l | tail -n +6 | awk '{print $1}' | sort | uniq -c
 2066 ii
 134 rc
```

我从上面的 `dpkg-query` 输出中排除了前五行，因为这些是标题行，会混淆输出。

这两行基本上告诉我们，在这个系统上，应该安装了 2066 个软件包，而 134 个其他的软件包已被删除，但留下了配置文件。 你始终可以使用以下命令删除程序包的剩余配置文件：

```
$ sudo dpkg --purge xfont-mathml
```

请注意，如果程序包二进制文件和配置文件都已经安装了，则上面的命令将两者都删除。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3242808/linux/peeking-into-your-linux-packages.html

作者：[Sandra Henry-Stocker][a]
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
