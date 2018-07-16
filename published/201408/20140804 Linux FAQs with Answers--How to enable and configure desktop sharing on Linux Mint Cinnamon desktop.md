Linux有问必答：如何在Linux Mint Cinnamon启用桌面共享
================================================================================

>**问题**：我试着在Linux Mint 17 Cinnamon桌面上通过Vino VNC服务器（vino-server）启用桌面共享。但是，我发现用来配置vino-server（如，共享选项，安全，通知开/关）的vino首选项工具已经不复存在了。同时，我也的Cinnamon桌面上也找不到共享菜单。我怎样才能在最新的Linux Mint 17 Cinnamon桌面上通过vino-server配置桌面共享？

最新的Linux Mint 17 Cinnamon桌面附带了预安装用于VNC桌面共享的vino-server，但是它报告说桌面共享菜单丢失了。

一个配置vino-server并启用桌面共享的可选方式，是使用dconf-editor的图形界面。

首先安装dconf-editor：

    $ sudo apt-get install dconf-editor

启动dconf-editor。

    $ dconf-editor

在dconf-editor的左边面板中导航到“org->gnome->desktop->remote-access”，然后你将会看到各种各样的桌面共享选项。

![](https://farm4.staticflickr.com/3916/14843965473_e68598b01b_z.jpg)

最重要的是，点击“enabled”来激活桌面远程访问。除此之外，你还可以自定义其它选项。

例如，你可以通过修改以下字段来启用VNC密码验证：

- **authentication-methods**: 设置为 ['vnc']
- **vnc-password**: 将你喜欢的密码修改为Base64编码的字符串。

在本例中，我们选择“password”为VNC密码，它的Base64编码字符串为“cGFzc3dvcmQ=”。

你也可以选择启用其它选项：

- notify-on-connect: 当vino-server接收到连接请求时显示桌面通知。
- prompt-enabled: 远程用户不允许通过VNC工具访问桌面，除非VNC请求被该桌面的拥有者许可。

### 排障 ###

1. 当启动vino-server时，我碰到了下面的错误。

    ** (vino-server:4280): WARNING **: The desktop sharing service is not enabled, so it should not be run.

要启用桌面共享服务，请使用上面讲过的dconf-editor。
也可以选择运行以下命令：

     # gsettings set org.gnome.Vino enabled true 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/enable-configure-desktop-sharing-linux-mint-cinnamon-desktop.html

译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
