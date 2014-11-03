在Debian上设置USB网络打印机和扫描仪服务器
================================================================================
假定你想要在你的家庭/办公网络中设置一台Linux打印服务器，而你手头上却只有USB打印机可用（因为他们比那些有着内建网络接口或无线模块的打印机要便宜得多）。此外，如果这些设备中有一台是一体化的，而你也想要通过网络共享其整合的扫描仪，这该怎么办？在本文中，我将介绍怎样安装并共享一台USB一体机（Epson CX3900喷墨打印机和扫描仪），一台USB激光打印机（Samsung ML-1640），以及作为锦上添花，配置一台PDF打印机。所有这一切，我们都将在GNU/Linux Debian 7.2 [Wheezy]服务器中实现。

尽管这些打印机看起来有点老旧了（我是在2007年买的Epson一体机，2009年买的激光打印机），但我仍然相信我从安装过程中学到的东西也一样能应用到该品牌的新产品和其它品牌中去：有一些预编译的.deb包驱动可用，而其它驱动可以从仓库中直接安装。毕竟，它是重要的基本原则。

### 先决条件 ###

要设置网络打印机和扫描仪，我们将使用[CUPS][1]，它是一个用于Linux/UNIX/OSX的开源打印系统。

    # aptitude install cups cups-pdf 

**排障提示**：根据你的系统状况（这个问题很可能在手动安装包失败后，或者缺少依赖包的时候会发生），在安装cups和cups-pdf前端包管理系统可能会提示你卸载许多包以尝试解决当前依赖问题。如果这种情况真的发生，你只有两个选择：

1）通过另外一个前端包管理系统安装包，如apt-get。注意，并不建议进行这样的处理，因为它不会解决当前的问题。

2）运行以下命令：aptitude update && aptitude upgrade。该命令会修复此问题，并同时更新包到最新版本。

### 配置CUPS ###

为了能够访问CUPS的网页接口，我们需要至少对cupsd.conf文件（用于CUPS的服务器配置文件）进行一次最低限度的修改。在进行修改前，让我们为cupsd.conf做个备份副本：

    # cp cupsd.conf cupsd.conf.bkp 

然后，编辑原始文件（下面只显示了最为有关联的部分）：

- **Listen**：监听指定的地址和端口，或者域套接口路径。
- **Location /path**：为该名字所代表的位置指定访问控制。
- **Order**：指定HTTP访问控制顺序（allow,deny或deny,allow）。Order allow,deny是说允许规则先于（并且优先处理）拒绝规则。
- **DefaultAuthType** (也可以用**AuthType**)： 指定默认使用的认证类型。Basic是指使用/etc/passwd文件来认证CUPS中的用户。
- **DefaultEncryption**：指定认证请求所使用的加密类型。
- **WebInterface**：指定是否启用网页接口。

---

    	# Listen for connections from the local machine
    	Listen 192.168.0.15:631
    
    	# Restrict access to the server
    	<Location />
      	  Order allow,deny
      	  Allow 192.168.0.0/24
    	</Location>
    
    	# Default authentication type, when authentication is required
    	DefaultAuthType Basic
   	 	DefaultEncryption IfRequested
    
    	# Web interface setting
    	WebInterface Yes
    
    	# Restrict access to the admin pages
    	<Location /admin>
      	  Order allow,deny
      	  Allow 192.168.0.0/24
    	</Location>

现在，让我们重启CUPS来应用修改：

    # service cups restart 

为了允许另外一个用户（除了root之外）修改打印机设置，我们必须像下面这样添加他/她到lp（授权对打印机硬件的访问并启用用户管理打印任务）和lpadmin（拥有打印优先）组。如果在你当前网络设置没有必要或不需要该设置，你可以不用理会该步骤。

    # adduser xmodulo lp
    # adduser xmodulo lpadmin 

![](https://farm4.staticflickr.com/3873/14705919960_9a25101098_o.png)

### 通过网页接口配置网络打印机 ###

1、 启动网页浏览器，并打开CUPS接口http://<Server IP>:Port，这里在我们的例子中是http://192.168.0.15:631：

![](https://farm4.staticflickr.com/3878/14889544591_284015bcb5_z.jpg)

2、 转到**管理**标签，然后点击*添加打印机*：

![](https://farm4.staticflickr.com/3910/14705919940_fe0a08a8f7_o.png)

3、 选择你的打印机；在本例中，**EPSON Stylus CX3900 @ debian (Inkjet Inkjet Printer)**，然后点击**继续**：

![](https://farm6.staticflickr.com/5567/14706059067_233fcf9791_z.jpg)

4、 是时候为打印机取个名字，并指定我们是否想要从当前工作站共享它：

![](https://farm6.staticflickr.com/5570/14705957499_67ea16d941_z.jpg)

5、 安装驱动——选择品牌并点击**继续**。

![](https://farm6.staticflickr.com/5579/14889544531_77f9f1258c_o.png)

6、 如果打印机如果不被CUPS支持（没有在下一页中列出来），我们必须从生产厂家的网站上下载驱动（如[http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX][2]），安装完后回到该页。

![](https://farm4.staticflickr.com/3896/14706058997_e2a2214338_z.jpg)

![](https://farm4.staticflickr.com/3874/14706000928_c9dc74c80e_z.jpg)

![](https://farm4.staticflickr.com/3837/14706058977_e494433068_o.png)

7、 注意，预编译的.deb文件必须从我们使用的机器上发送（例如，通过sftp或scp）到打印服务器（当然，如果我们有一个直接的下载链接就更加简单了，而不用下载按钮了）：

![](https://farm6.staticflickr.com/5581/14706000878_f202497d0a_z.jpg)

8、 在将.deb文件放到服务器上后，我们就可以安装了：

     # dpkg -i epson-inkjet-printer-escpr_1.4.1-1lsb3.2_i386.deb 

**排障提示**：如果lsb包（一个第三方Linux应用编写者可以依赖标准核心系统）没有安装，那么驱动会无法安装：

![](https://farm4.staticflickr.com/3840/14705919770_87e5803f95_z.jpg)

我们将安装lsb，然后尝试再次安装打印机驱动：

    # aptitude install lsb
    # dpkg -i epson-inkjet-printer-escpr_1.4.1-1lsb3.2_i386.deb

9、 现在，我们可以返回到第五步并安装打印机：

![](https://farm6.staticflickr.com/5569/14705957349_3acdc26f91_z.jpg)

### 配置网络扫描仪 ###

现在，我们将继续配置打印机服务器来共享扫描仪。首先，安装[xsane][3]，这是[SANE][4]——扫描仪快捷访问的前端：

    # aptitude install xsane 

接下来，让我们编辑/etc/default/saned文件以启用saned服务：

    # Set to yes to start saned                                                     
    RUN=yes

最后，我们将检查saned是否已经在运行了（很可能不在运行哦——那么我们将启动服务并再来检查）：

    # ps -ef | grep saned | grep -v grep
    # service saned start 

### 配置另一台网络打印机 ###

通过CUPS，你可以配置多台网络打印机。让我们通过CUPS配置一台额外的打印机：Samsung ML-1640，它是一台USB打印机。

splix包包含了单色（ML-15xx, ML-16xx, ML-17xx, ML-2xxx）和彩色（CLP-5xx, CLP-6xx）Samsung打印机驱动。此外，此包的详细信息中指出，一些新命名的Samsung打印机，如Xerox Phaser 6100也适用此驱动。

    # aptitude install splix 

然后我们将使用CUPS网页接口来安装打印机，就像前面一样：

![](https://farm4.staticflickr.com/3872/14705957329_4f38a94867_o.png)

### 安装PDF打印机 ###

接下来，让我们在打印服务器上配置一台PDF打印机。这样，你就可以将来自客户计算机的文档转换成PDF格式了。

由于我们已经安装了cups-pdf包，PDF打印机就已经自动安装好了，可以通过网页接口验证：

![](https://farm6.staticflickr.com/5558/14705919650_bc1a1e0b43_z.jpg)

当选定PDF打印机后，文档将被写入可配置目录（默认是~/PDF），或者也可以通过后续处理命令进行复制。

在下一篇文章中，我们将配置桌面客户端来通过网络访问打印机和扫描仪。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/usb-network-printer-and-scanner-server-debian.html

作者：[Gabriel Cánepa][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.gabrielcanepa.com.ar/
[1]:https://www.cups.org/
[2]:http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX
[3]:http://www.xsane.org/
[4]:http://www.sane-project.org/
