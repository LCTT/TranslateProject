在Ubuntu 14.04中安装Webmin
================================================================================
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/webmin-790x586.jpg)

[Webmin][1]是一款开源的、基于web的、适合Unix/Linux的系统管理工具。使用Webmin，你可以通过任何一款现有的网页浏览器来设置和配置所有的系统服务，比如DNS、DHCP、Apache、NFS和Samba等。因此，你无需记住所有的命令或手动编辑任何的配置文件了。

### 使用官方仓库在Ubuntu 14.04 LTS上安装Webmin ###

添加webmin的官方库：

编辑文件**/etc/apt/sources.list**,

	sudo vi /etc/apt/sources.list

添加下列行内容：

    deb http://download.webmin.com/download/repository sarge contrib
    deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib

添加GPG密钥：

    sudo wget http://www.webmin.com/jcameron-key.asc
    sudo apt-key add jcameron-key.asc

更新软件列表：

    sudo apt-get update

使用下列命令安装webmin：

    sudo apt-get install webmin

如果你想远程访问webmin的控制台，则需要设置防火墙允许通过webmin的默认端口“10000”。
    
    sudo ufw allow 10000

### 访问Webmin控制台 ###

打开你的浏览器，转到这个地址**https://ip-address:10000/**。将会出现下面的画面，输入用户名和密码就可以登陆进webmin控制台了。

![Login to Webmin](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/Login-to-Webmin-Mozilla-Firefox_010.png)

这是我的Webmin控制面板的样子。

![Webmin 1.690 on server.unixmen.local (Ubuntu Linux 14.04)](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/Webmin-1.690-on-server.unixmen.local-Ubuntu-Linux-14.04-Mozilla-Firefox_011.png)

就是这样简单。现在你就可以图形化地管理和配置你的Ubuntu服务器了。欢呼吧！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-webmin-ubuntu-14-04/

译者：[KayGuoWhu](https://github.com/KayGuoWhu) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.webmin.com/