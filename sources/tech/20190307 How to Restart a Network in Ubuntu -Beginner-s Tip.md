[#]: collector: (lujun9972)
[#]: translator: (bodhix)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Restart a Network in Ubuntu [Beginner’s Tip])
[#]: via: (https://itsfoss.com/restart-network-ubuntu)
[#]: author: (Sergiu https://itsfoss.com/author/sergiu/)

如何在 Ubuntu 中重启网络服务 [新手提示]
======

你 [是否正在使用基于 Ubuntu 的系统，然后发现无法连接网络][1]？你一定会很惊讶，很多很多的问题都可以简单地通过重启服务解决。

在这篇文章中，我会介绍在 Ubuntu 或者其他 Linux 发行版中重启网络的几种方法，你可以根据自身需要选择对应的方法。这些方法基本分为两类：

![Ubuntu Restart Network][2]

### 通过命令行方式重启网络

如果你使用的 Ubuntu 服务器版，那么你已经在使用命令行终端了。如果你使用的是桌面版，那么你可以通过快捷键 Ctrl+Alt+T [Ubuntu 键盘快捷键][3] 打开命令行终端。

在 Ubuntu 中，你有多个命令可以重启网络。这些命令，一部分或者说大部分，也适用于在 Debian 或者其他的 Linux 发行版中重启网络。

#### 1\. network manager service

这是通过命令行方式重启网络最简单的方法. 它相当于是通过图形化界面重启网络（重启 Network-Manager 服务）。

```
sudo service network-manager restart
```

此时，网络图标会消失一会儿然后重新显示。

#### 2\. systemd

**service** 命令仅仅是该命令的一个封装命令（同样的还有 init.d 系列脚本和 Upstart 相关命令）。 **systemctl** 命令的功能远多于 **service** 命令。通常我更喜欢使用这个命令。

```
sudo systemctl restart NetworkManager.service
```

这时，网络图标又会消失一会儿。 如果你想了解 **systemctl** 的其他选项, 可以参考 man 帮助文档。

#### 3\. nmcli

这是 Linux 上可以管理网络的另一个工具。这是一个功能强大而且实用的工具。很多系统管理员都喜欢使用该工具，因为它非常容易使用。

这种方法有两个操作步骤：关闭网络，再开启网络。

```
sudo nmcli networking off
```

这样就会关闭网络，网络图标会消失。接下来，再开启网络：

```
sudo nmcli networking on
```

你可以通过 man 帮助文档了解 nmcli 的更多用法。

#### 4\. ifup & ifdown

这两个命令是直接操作网口，将网口状态xxx。这是 [Linux 中最应该了解的网络命令][4] 之一。

使用 ifdown 关闭所有网口，再使用 ifup 重新启用网口。

通常推荐的做法是将这两个命令一起使用。

```
sudo ifdown -a && sudo ifup -a
```

**注意：** 这种方法不会让网络图标从系统托盘中消失，另外，你也无法进行网络连接。

**Bonus tool: nmtui (click to expand)**

这是系统管理员们常用的另外一种方法。它是在命令行终端中管理网络的文本菜单工具。

```
nmtui
```

这样就会打开如下菜单：

![nmtui Menu][5]

**注意** 在 **nmtui** 中，你可以通过 **up** 和 **down 方向键** 选择选项。

选择 **Activate a connection** :

![nmtui Menu Select "Activate a connection"][6]

按下 **Enter** 键，打开 **connections** 菜单。

![nmtui Connections Menu][7]

接下来，选择前面带 **星号 （*）** 的网络。在这个例子中，就是 MGEO72 。

![Select your connection in the nmtui connections menu.][8]

按下 **Enter** 键。这样就 **关闭** 你的网络连接。

![nmtui Connections Menu with no active connection][9]

选择你要连接的网络：

![Select the connection you want in the nmtui connections menu.][10]

按下 **Enter** 键。这样就重启了所选择的网络连接。

![nmtui Connections Menu][11]

双击 **Tab** 键，选择 **Back** ：

![Select "Back" in the nmtui connections menu.][12]

按下 **Enter** 键。这样就会回到 **nmtui** 的主菜单。

![nmtui Main Menu][13]

选择 **Quit** ：

![nmtui Quit Main Menu][14]

这样就会退出该界面，返回到命令行终端。

就这样，你已经成功重启网络了。

### 通过图形化界面重启网络

This is, of course, the easiest way of restarting the network for Ubuntu desktop users. If this one doesn’t work, you can of course check the command line options mentioned in the previous section.

NM-applet is the system tray applet indicator for [NetworkManager][15]. That’s what we’re going to use to restart our network.

First of all, check out your top panel. You should find a network icon in your system tray (in my case, it is a Wi-Fi icon, since that’s what I use).

Go ahead and click on that icon (or the sound or battery icon). This will open up the menu. Select “Turn Off” here.

![Restart network in Ubuntu][16]Turn off your network

The network icon should now disappear from the top panel. This means the network has been successfully turned off.

Click again on your systray to reopen the menu. Select “Turn On”.

![Restarting network in Ubuntu][17]Turn the network back on

Congratulations! You have now restarted your network.

#### Bonus Tip: Refresh available network list

Suppose you are connected to a network already but you want to connect to another network. How do you refresh the WiFi to see what other networks are available? Let me show you that.

Ubuntu doesn’t have a ‘refresh wifi networks’ option directly. It’s sort of hidden.

You’ll have to open the setting menu again and this time, click on “Select Network”.

![Refresh wifi network list in Ubuntu][18]Select Network to change your WiFi connection

Now, you won’t see the list of available wireless networks immediately. When you open the networks list, it takes around 5 seconds to refresh and show up other available wireless networks.

![Select another wifi network in Ubuntu][19]Wait for around 5- seconds to see other available networks

And here, you can select the network of your choice and click connect. That’s it.

**Wrapping Up**

Restarting your network or connection is something that every Linux user has to go through at some point in their experience.

We hope that we helped you with plenty of methods for handling such issues!

What do you use to restart/handle your network? Is there something we missed? Leave us a comment below.


--------------------------------------------------------------------------------

via: https://itsfoss.com/restart-network-ubuntu

作者：[Sergiu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sergiu/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/fix-no-wireless-network-ubuntu/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/ubuntu-restart-network.png?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/ubuntu-shortcuts/
[4]: https://itsfoss.com/basic-linux-networking-commands/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmtui_menu.png?fit=800%2C602&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmtui_menu_select_option.png?fit=800%2C579&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmui_connection_menu_on.png?fit=800%2C585&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmui_select_connection_on.png?fit=800%2C576&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmui_connection_menu_off.png?fit=800%2C572&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmui_select_connection_off.png?fit=800%2C566&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmui_connection_menu_on-1.png?fit=800%2C585&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmui_connection_menu_back.png?fit=800%2C585&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmtui_menu_select_option-1.png?fit=800%2C579&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmui_menu_quit.png?fit=800%2C580&ssl=1
[15]: https://wiki.gnome.org/Projects/NetworkManager
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/restart-network-ubuntu-1.jpg?resize=800%2C400&ssl=1
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/restart-network-ubuntu-2.jpg?resize=800%2C400&ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/select-wifi-network-ubuntu.jpg?resize=800%2C400&ssl=1
[19]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/select-wifi-network-ubuntu-1.jpg?resize=800%2C400&ssl=1
[20]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/ubuntu-restart-network.png?fit=800%2C450&ssl=1
