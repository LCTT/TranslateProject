怎样设置Samba文件服务器以使用Windows客户端
================================================================================
根据[Samba][1]项目网站所述，Samba是一个开源/自由软件套件，提供了到SMB/CIFS客户端的无缝文件和打印服务。不同于其它SMB/CIFS网络协议部署（如HP-UX的LM服务器，OS/2的LAN服务器，或者VisionFS），Samba（及其源代码）是可以自由获取的（终端用户无需付费），允许在Linux/Unixt服务器和Windows/Unix/Linux客户端之间互操作。

出于这些理由，Samba在不同操作系统（除了Linux）共存的网络中首选的文件服务器解决方案——最常见的结构是多个微软Windows客户端访问安装有Samba的Linux服务器，该情形也是本文将要解决的问题。

请注意，另外一方面，如果我们的网络仅仅是由基于Unix的客户端（如Linux，AIX，或者Solaris，等等）组成，我们可以考虑使用NFS（尽管在此种情况下Samba仍然是可选方案），它可以提供更快的速度。 

### 在Debian和CentOS中安装Samba ###

在我们开始安装之前，我们可以使用操作系统中的包管理系统查询Samba的信息：

在Debian上：

    # aptitude show samba

在CentOS上：

    # yum info samba

在下面的屏幕截图中，我们可以看到‘aptitude show samba’的输出（‘yum info samba’会产生类似的结果）：

![](https://farm4.staticflickr.com/3868/14837993244_0fa525eb35_z.jpg)

现在让我们来安装Samba吧（下面的截图来自Debian 7[Wheezy]服务器上的安装）： 

在Debian上：

    # aptitude install samba

在CentOS上：

    # yum install samba

### 添加用户到Samba ###

对于4.x之前的版本，需要建立一个本地Unix帐号以便将其添加到Samba：

    # adduser <username> 

![](https://farm6.staticflickr.com/5574/14837266181_fed68bddf2_o.png)

接下来，我们需要添加用户到Samba，使用带有‘-a’选项的smbpasswd命令来完成，该命令指出后面的用户名将被添加到本地smbpasswd文件中。我们将被提示输入密码（该密码无需和本地Unix帐号的密码相同）：

    # smbpassword -a <username> 

![](https://farm6.staticflickr.com/5555/14653711099_578f8613ca.jpg)

最后，我们将赋予用户xmodulo到我们系统上某个目录的访问权限，该目录将被用于作为此用户的Samba共享（如有需要，也可以共享给其它用户）。要完成该工作，请使用文本编辑器（如Vim）打开/etc/samba/smb.conf文件，导航到文件末，然后创建一个带有描述名称的区块（使用方括号将其括起来），如[xmodulo]：

    # SAMBA SHARE
    [xmodulo]
    path = /home/xmodulo
    available = yes
    valid users = xmodulo
    read only = no
    browseable = yes
    public = yes
    writeable = yes

我们现在必须重启Samba—以防万一—使用testparm命令来检查smb.conf文件的语法错误：

    # service samba restart
    # testparm 

![](https://farm6.staticflickr.com/5589/14653655390_becb4f4981_z.jpg)

如果有错误，在testparm结束后会报告。

### 在Windows 7计算机上将Samba共享映射为一个网络驱动器 ###

在计算机上右击，然后选择“映射网络驱动器”：

![](https://farm6.staticflickr.com/5571/14837993154_981b73ea92.jpg)

输入安装了Samba的机器的IP地址，后跟共享名（就是smb.conf文件中方括号括起来的那个名称），然后确保选中了“使用不同的凭据连接”：

![](https://farm4.staticflickr.com/3881/14839997172_d67ec98933_o.png)

输入先前用‘**smbpasswd -a**’设置的用户名和密码：

![](https://farm6.staticflickr.com/5563/14653711029_ddfea53bd6_o.png)

进入计算机，然后检查网络驱动器是否被正确添加：

![](https://farm6.staticflickr.com/5584/14837993124_c664728039_o.png)

作为测试，让我们从Samba的手册页创建一个pdf文件，然后保存到/home/xmodulo目录：

![](https://farm6.staticflickr.com/5593/14860219723_e8380f0d0f_o.png)

接下来，我们可以验证该文件是否可以从Windows读取：

![](https://farm4.staticflickr.com/3869/14817386696_74a12dfdcd_o.png)

然后检查我们是否能够用默认的pdf阅读器打开它：

![](https://farm6.staticflickr.com/5584/14653655350_8a243b1493_z.jpg)

最后，让我们看看我们是否能在Windows中刚刚映射的驱动器上保存文件。我们将打开change.log文件，该文件列出了Notepad++的功能：

![](https://farm6.staticflickr.com/5565/14817386676_18c1d7bc60_o.png)

然后试着将它作为普通文本文件（.txt扩展名）保存到Z:\；然后让我们看看该文件是否能在Linux中看到：

![](https://farm4.staticflickr.com/3841/14817386656_fb09a95a65_o.png)

### 启用磁盘配额 ###

作为第一步，我们需要验证当前内核是否已经编译为支持配额：

    # cat /boot/config-$(uname -r) | grep 

![](https://farm4.staticflickr.com/3867/14837993054_081dc9b0dc_z.jpg)

每个文件系统最多有5种类型，能够强制使用的配额限制：用户软限制，用户硬限制，组软限制，组硬限制，以及宽限期限。

我们现在将为/home文件系统启用磁盘配额，在/etc/fstab文件对应的/home文件系统行现存的默认选项后添加usrquota和grpquto挂载选项，然后重新挂载文件系统以令修改生效：

![](https://farm6.staticflickr.com/5561/14653806067_b8b0dc2333_z.jpg)

接下来，我们需要在**/home**目录创建两个文件以用于作为用户和组配额的数据库文件：**aquota.user**和**aquota.group**。然后，我们将生成启用配额后每个文件系统的当前磁盘使用表：

    # quotacheck -cug /home
    # quotacheck -avugm 

![](https://farm6.staticflickr.com/5584/14837265971_654e8f3bc0_o.png)

尽管已经为/home文件系统启用磁盘配额，我们还没有给任何用户或组设置权限。检查现有用户/组的配额信息：

    # quota -u <username>
    # quota -g <groupname> 

![](https://farm6.staticflickr.com/5582/14653735848_8de88d69c4_o.png)

在这最后几步中，使用quotatool命令来为每个用户和/或组来分配磁盘配额（注意，该任务也可以使用edquota来完成，但是quotatool更为直接，更不易犯错）。

要为用户xmodulo设置软限制为4MB，硬限制为5MB，xmodulo组为10MB/15MB：

    # quotatool -u xmodulo -bq 4M -l '5 Mb' /home
    # quotatool -g xmodulo -bq 10M -l '15 Mb' /home 

![](https://farm4.staticflickr.com/3888/14653806037_5438b5034e_z.jpg)

我们可以在Windows 7中看到结果（4.00MB中有3.98MB空闲）：

![](https://farm4.staticflickr.com/3919/14653805967_c2b1551869_o.png)

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/samba-file-server-windows-clients.html

作者：[Gabriel Cánepa][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:http://www.samba.org/
