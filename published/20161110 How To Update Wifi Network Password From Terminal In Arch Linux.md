怎样在 Arch Linux 终端上更改 WiFi 密码
============================================================

 ![Update Wifi Network Password From Terminal In Arch Linux](https://www.ostechnix.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 

自从修改了我的路由器的 WiFi 网络密码后，我的 Arch Linux 测试机就不能连接到网络了。由于我的 Arch Linux 测试机没有图形化桌面环境，我不得不在终端上更改 WiFi 密码。在图形化操作界面中，更改 WiFi 密码是很容易的。我仅仅需要打开网络管理器，就能很快更改 WiFi 网络密码。但是，我从来没有在 Arch Linux 终端上用命令行来更改 WiFi 密码。我开始在 google 上搜索相关资料，并且在 Arch Linux 论坛找到了一个好的解决办法。如果你也面临同样的问题，读完这篇文章吧，这个方法并没有那么难。

### 在终端更改 WiFi 网络密码

修改了路由器的 WiFi 密码之后，我尝试运行 `wifi-menu` 命令来更新 WiFi 密码，但是它一直报如下错误。

```
sudo wifi-menu
```

它显示了可用的 WiFi 列表。

[
 ![](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_001-1.png) 
][2]

我的 WiFi 网络名为 Murugs9376。我选中了我的 WiFi 网络，然后在 OK 处按下回车。它没有让我输入新的 WiFi 密码（我以为它会先问我是否密码已经更改），却显示了下面的错误。

```
Interface 'wlp9s0' is controlled by netctl-auto
WPA association/authentication failed for interface 'wlp9s0'
```

[
 ![](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_002-1.png) 
][3]

在 Arch 发行版上，我没有太多的经验。因此我去了 Arch Linux 论坛希望能找到解决方法。感天谢地，之前有人发了同样问题的帖子并从一位 Arch 老司机那里得到了解决办法。

网络相关的配置文件都是存放在 `/etc/netctl/` 文件夹下。例如，下面是我的 Arch Linux 测试机上该文件夹下的内容：

```
ls /etc/netctl/

Sample Output:

examples    ostechnix         'wlp9s0-Chendhan Cell Service'  wlp9s0-Pratheesh
hooks       wlp9s0            wlp9s0-Murugu9376
interfaces  wlp9s0-AndroidAP  wlp9s0-none
```

[
 ![](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_003-1.png) 
][4]

我如果想要更改密码，只需要删除我的 WiFi 网络配置文件 (这里是 `wlp9s0-Murugs9376`) 并且重新运行 `wifi-menu` 命令。 

因此，用下面的命令来删除原来的 WiFi 配置文件:

```
sudo rm /etc/netctl/wlp9s0-Murugu9376
```

删除配置文件之后，运行 `wifi-menu` 命令来更新 WiFi 密码。

```
sudo wifi-menu
```

选择 WiFi 网络，并且按回车键。

[
 ![](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_004-1.png) 
][5]


为新配置文件输入一个新名字。

[
 ![](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_005-1.png) 
][6]

最后，输入 WiFi 新密码到配置文件中，并且按下回车键。

[
 ![](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_006-1.png) 
][7]


这样就完成了。现在，我们已经更新了我们的 WiFi 网络密码。像你所看到的一样，在 Arch Linux 终端里面更新 WiFi 密码并不是件很难的事情。任何人都能在几秒钟以内完成它。

如果您觉得这个教程很有帮助，希望您能分享到您的社交网络中来支持我们。

谢谢！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/update-wifi-network-password-terminal-arch-linux/

作者：[SK][a]
译者：[chenzhijun](https://github.com/chenzhijun)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:http://ostechnix.tradepub.com/free/w_pacb38/prgm.cgi?a=1
[2]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_001-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_002-1.png
[4]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_003-1.png
[5]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_004-1.png
[6]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_005-1.png
[7]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_006-1.png
