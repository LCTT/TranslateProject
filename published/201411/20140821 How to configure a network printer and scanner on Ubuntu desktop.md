
如何在ubuntu桌面配置一个网络打印机和扫描仪
================================================================================

在[之前的文章中][1], 我们讨论过如何在Linux服务器安装各种各样的打印机（当然也包括网络扫描仪）。今天我们将来处理另一端：如何通过桌面客户端来访问网络打印机/扫描仪。


### 网络环境 ###

在这个安装教程中，我们的服务器（Debian Wheezy 7.2版本）的IP地址是192.168.0.10，我们的客户端(Ubuntu 12.04版本)的IP地址是192.168.0.105.注意这两台机器是在同一个网段（192.168.0.0/24).如果我们想允许打印机访问其它网段，我们需要在服务器上修改cupsd.conf文件的以下部分：

    <Location />
      Order allow,deny
      Allow localhost
      Allow from XXX.YYY.ZZZ.*
    </Location>


（在上述例子中，我们授予打印机从本地或者任何系统能够访问打印机，这些系统的IPv4地址以XXX.YYY.ZZZ开始。

为了验证哪些打印机可以在我们的服务器上适用，我们也可以在服务器上使用lpstat命令，或者浏览网页https://192.168.0.10:631/printers page.

    root@debian:~# lpstat -a 

----------

    EPSON_Stylus_CX3900 accepting requests since Mon 18 Aug 2014 10:49:33 AM WARST
    PDF accepting requests since Mon 06 May 2013 04:46:11 PM WARST
    SamsungML1640Series accepting requests since Wed 13 Aug 2014 10:13:47 PM WARST

![](https://farm4.staticflickr.com/3903/14777969919_7b7b25a4a4_z.jpg)

### 在Ubuntu桌面安装网络打印机 ###

在我们的Ubuntu 12.04的客户端，我们将打开"Printing"菜单(Dash -> Printing).你会注意到在其它发行版中，这个名字也许会有一点差别（例如会叫做"Printers" 或者 "Print & Fax"）:

![](https://farm4.staticflickr.com/3837/14964314992_d8bd0c0d04_o.png)

还没有打印机添加到我们的客户端：

![](https://farm4.staticflickr.com/3887/14941655516_80430529b5_o.png)

下面是在Ubuntu桌面客户端安装一台网络打印机的一些步骤。

**1)** “Add”按钮将弹出 "New Printer" 菜单。我们将选择"Network printer" -> "Find Network Printer"并输入我们服务器的IP地址，接着点击"Find":

![](https://farm6.staticflickr.com/5581/14777977730_74c29a99b2_z.jpg)

**2)** 在最下面我们将会看到可使用的打印机的名称。我们来选择这台三星打印机并按"Forward":

![](https://farm6.staticflickr.com/5585/14941655566_c1539a3ea0.jpg)

**3)** 我们将会被要求填写一些关于我们打印机的信息。当我们输入完成时，将点击 "Apply"按钮。

![](https://farm4.staticflickr.com/3908/14941655526_0982628fc9_z.jpg)

**4)** 我们接下来将被询问是否打印一张测试页。让我们点击"Print test page"吧:

![](https://farm4.staticflickr.com/3853/14964651435_cc83bb35aa.jpg)

这个打印任务将被创建为本地id 2：

![](https://farm6.staticflickr.com/5562/14777977760_b01c5338f2.jpg)


5)适用我们服务器上的CUPS网络借口，我们可以观察到打印任务已经提交成功了（打印机 -> SamsungML1640系列 -> 显示完成任务):

![](https://farm4.staticflickr.com/3887/14778110127_359009cbbc_z.jpg)


我们也可以通过在打印机服务器上运行以下命令显示同样信息：

     root@debian:~# cat /var/log/cups/page_log | grep -i samsung 

----------

    SamsungML1640Series root 27 [13/Aug/2014:22:15:34 -0300] 1 1 - localhost Test Page - -
    SamsungML1640Series gacanepa 28 [18/Aug/2014:11:28:50 -0300] 1 1 - 192.168.0.105 Test Page - -
    SamsungML1640Series gacanepa 29 [18/Aug/2014:11:45:57 -0300] 1 1 - 192.168.0.105 Test Page - -

这个page_log日志显示每一页被打印过的信息，只包括哪些用户发送这些打印任务，打印日期&时间，以及客户端的IPv4地址。

要安装Epson喷墨和PDF打印机，我们只需重复第1-5的步骤即可，并每一次选择左边的打印队列。例如，在下图中选择PDF打印机：

![](https://farm4.staticflickr.com/3926/14778046648_c094c8422c_o.png)

然而，请注意到根据[CUPS-PDF 文档中][2]，根据默认：

>PDF文件将会被放置在打印作业的所有者命名的子目录内。在这个案例中，打印作业的所有者不能被识别（i.e.不会存在服务器中）输出的内容被放置在匿名操作的文件中。
 

这些默认的文件夹可以通过改变在/etc/cups/cups-pdf目录中的**Out**值和**AnonDirName**变量来修改。这里，${HOME}被扩展到用户的家目录中：

    Out ${HOME}/PDF
    AnonDirName /var/spool/cups-pdf/ANONYMOUS



### 网络打印实例 ###

#### 实例 #1 ####

从Ubuntu12.04中打印，通常在本地用gacanepa（具有相同名字存在打印机服务器上）。

![](https://farm4.staticflickr.com/3845/14778046698_57b6e552f3_z.jpg)

打印到PDF打印机之后，让我们来检查打印机服务器上的/home/gacanepa/PDF目录下的内容：

    root@debian:~# ls -l /home/gacanepa/PDF 

----------

    total 368
    -rw------- 1 gacanepa gacanepa 279176 Aug 18 13:49 Test_Page.pdf
    -rw------- 1 gacanepa gacanepa   7994 Aug 18 13:50 Untitled1.pdf
    -rw------- 1 gacanepa gacanepa  74911 Aug 18 14:36 Welcome_to_Conference_-_Thomas_S__Monson.pdf


这个PDF文件被创建时的，权限已经设置为600(-rw-------)，这意味着只有打印任务的所有者(在这个例子中是gacanepa )可以访问它们。我们可以通过修改the /etc/cups/cups-pdf.conf文件**UserUMask**变量的值来改变这种行为。例如，0033的umask值将可以使PDF打印者以及其它所有者拥有创建文件的权限，但是只读权限也会赋予给其它所有者。

     root@debian:~# grep -i UserUMask /etc/cups/cups-pdf.conf 

----------

    ### Key: UserUMask
    UserUMask 0033



对于那些不熟悉umask（有名用户文件创建模式掩码），它作为一组可以用于控制那些为新文件创建时修改默认权限。给予特定的umask值，在计算最终文件的许可权限时，在文件基本权限(0666)和umask的单项按位补码之间进行按位布尔 AND 运算。因此，如果设置一个umask值为0033，那么新文件默认的权限将不是（0033）AND 0666 = 644的值（文件拥有者具有读/写/执行的权限，其他人拥有只读权限）。


### 实例 #2 ###


在Ubuntu12.04执行打印，本地登录用户为jdoe（同样的帐号名称但是服务器上是不存在的）。

![](https://farm4.staticflickr.com/3907/14964315142_a71d8a8aef_z.jpg)

     root@debian:~# ls -l /var/spool/cups-pdf/ANONYMOUS 

----------

    total 5428
    -rw-rw-rw- 1 nobody nogroup 5543070 Aug 18 15:57 Linux_-_Wikipedia__the_free_encyclopedia.pdf


这个PDF被创建时赋予的权限是666(-rw-rw-rw-)，这意味着每个人都可以访问它们。我们可以通过编辑在/etc/cups/cups-pdf.conf文件中的**AnonUMask**值来改变这种行为。


在这一点上，你也许会疑惑：为什么同样安装一台网络打印机，大多数（当然不是全部）当前的Linux桌面发行版都会内置一个"打印到文件"的功能来允许用户动态创建PDF文件？


使用一台网络PDF打印机有以下好处：


- 一个网络打印机（任何类型的）允许你直接从命令行直接打印，无需首先打开文件。

- 在其它操作系统上安装一个网络客户端，一个PDF网络打印机备件，于是系统管理员不必再单独需要安装PDF创建者实用程序（也避免了最终用户安装这些工具存在的风险）。

- 网络PDF打印机允许通过配置权限直接打印一个网络共享，如我们所见的例子。

### 在Ubuntu桌面安装一个网络扫描仪 ###

这里是通过Ubuntu桌面客户端安装和访问一台网络扫描仪的一些步骤。假设网络扫描仪服务器已经启动并运行所述[here][3].


**1)**让我们第一步来检查在我们的Ubuntu客户端主机上是否存在一台可用的扫描仪。没有先前的安装，你将会看到信息提示"没有识别到扫描仪."
     $ scanimage -L 

![](https://farm4.staticflickr.com/3906/14777977850_1ec7994324_z.jpg)


**2)** 现在我们需要启用saned进程，用来预装Ubuntu桌面。要启用它，我们需要编辑/etc/default/saned文件，并设置RUN变量为yes：

    $ sudo vim /etc/default/saned 

----------

    # Set to yes to start saned
    RUN=yes


**3)** 让我们编辑/etc/sane.d/net.conf文件，并在扫描仪安装后添加服务器IP地址：

![](https://farm6.staticflickr.com/5581/14777977880_c865b0df95_z.jpg)



**4)** 重启saned进程：

    $ sudo service saned restart 



**5)** 现在让我们来看看扫描仪是否可用：
![](https://farm4.staticflickr.com/3839/14964651605_241482f856_z.jpg)


现在我们可以打开"Simple Scan"（或者其它扫描工具）并开始扫描文件。我们可以旋转，修剪，和保存生成的图片：

![](https://farm6.staticflickr.com/5589/14777970169_73dd0e98e3_z.jpg)


### 总结 ###
 

拥有一或多台网络打印机或扫描仪在任何办公和家庭网络中都是非常方便适用的，并同时提供了许多好处。例举如下：

- 多用户（从不同的平台/地方）都能够向打印机发送打印作业的队列。

- 由于硬件共享达到了节约成本和维护的作用。

我希望这篇文章可以帮助你更充分地利用这些有点。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/configure-network-printer-scanner-ubuntu-desktop.html

作者：[Gabriel Cánepa][a]
译者：[disylee](https://github.com/disylee)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:http://linux.cn/article-4139-1.html
[2]:http://www.cups-pdf.de/documentation.shtml
[3]:http://xmodulo.com/2014/08/usb-network-printer-and-scanner-server-debian.html#scanner
