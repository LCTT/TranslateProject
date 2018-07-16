在Ubuntu 14.04上安装 Webmin
================================================================================
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/webmin-790x586.jpg)

[Webmin][1]是一个开源的基于网页的Unix/Linux系统管理工具。通过使用Webmin，你可以在浏览器上设置和安装所有的系统服务，包括:DNS、DHCP、Apache、NFS和Samba等等。因此，有了这个，你就再也不需要去记住所有的修改配置的命令了。


### 使用官方软件源在Ubuntu 14.04 LTS上安装Webmin ###

添加webmin的官方仓库:

修改 **/etc/apt/sources.list**,

    sudo vi /etc/apt/sources.list

添加如下内容:

    deb http://download.webmin.com/download/repository sarge contrib
    deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib

添加GPG密钥:

    sudo wget http://www.webmin.com/jcameron-key.asc
    sudo apt-key add jcameron-key.asc

更新软件源:

    sudo apt-get update

通过如下命令安装webmin:

    sudo apt-get install webmin

如果你想从远程系统访问webmin的控制台，就在防火墙里开启webmin的默认端口“10000”

    sudo ufw allow 10000

### 访问Webmin控制界面 ###

打开浏览器并访问URL** https://ip-address:10000/**。应该会出现如下的场景。在此输入用户名和密码来登录webmin的控制台。

![Login to Webmin](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/Login-to-Webmin-Mozilla-Firefox_010.png)

这是我的Webmin面板。

![Webmin 1.690 on server.unixmen.local (Ubuntu Linux 14.04)](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/Webmin-1.690-on-server.unixmen.local-Ubuntu-Linux-14.04-Mozilla-Firefox_011.png)

就是这样。现在，你就可以管理和配置你的Ubuntu服务器图形。享受吧！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-webmin-ubuntu-14-04/

译者：[MikeCoder](https://github.com/MikeCoder) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.webmin.com/