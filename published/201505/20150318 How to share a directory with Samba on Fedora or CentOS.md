如何在Fedora或CentOS上使用Samba共享文件夹
================================================================================
如今，无论在家里或者是办公场所，不同的电脑之间共享文件夹已不是什么新鲜事了。在这种趋势下，现代操作系统通过网络文件系统的方式使得电脑间数据的交换变得简单而透明。如果您工作的环境中既有微软的Windows又有Linux，那么，一个共享文件及目录的方式便是通过一个跨平台网络文件共享协议：SMB/CIFS。Windows原生的支持SMB/CIFS，Linux也通过开源的软件Samba实现了SMB/CIFS协议。

在这篇文章中，我们将展示**如何使用Samba共享文件夹**。我们使用的Linux平台是**Fedora或CentOS**。这篇文章分为四部分。首先，我们在Fedora/CentOS环境下安装Sambe。接着，我们讨论如何调整SELinux和防火墙配置以允许Samba的文件共享。最后我们介绍如何使用Samba来共享文件夹。

### 步骤1：在Fedora和CentOS上安装Samba ###

首先，安装Samba以及进行一些基本的配置。

检验Samba是否已经安装在您的系统中：

    $ rpm -q samba samba-common samba-client 

如果上面的命令没有任何输出，这意味着Samba并未安装。这时，应使用下面的命令来安装Samba。

    $ sudo yum install samba samba-common samba-client 

接下来，创建一个用于在网络中共享的本地文件夹。这个文件夹应该以Samba共享的方式导出到远程的用户。在这个指南中，我们会在顶层文件夹'/'中创建这个文件夹，因此，请确保您有相应的权限。

    $ sudo mkdir /shared 

如果您想在您的home文件夹内创建共享文件夹（例如，~/shared），您必须激活SELinux中Samba的home文件夹共享选项，具体将在后面提到。

在创建/shared文件夹后，设置文件夹权限以保证其余用户可以访问它。

    $ sudo chmod o+rw /shared 

如果您不想其他用户对该文件夹拥有写权限，您需要移除命令中的'w'选项。

    $ sudo chmod o+r /shared 

接下来，创建一个空文件来测试。这个文件可以被用来验证Samba的共享已经被挂载。

    $ sudo touch /shared/file1 

### 步骤2：为Samba配置SELinux ###

接下来，我们需要再次配置SELinux。在Fedora和CentOS发行版中SELinux是默认开启的。SELinux仅在正确的安全配置下才允许Samba读取和修改文件或文件夹。（例如，加上'samba_share_t'属性标签）。

下面的命令为文件的配置添加必要的标签：

    $ sudo semanage fcontext -a -t samba_share_t "<directory>(/.*)?" 

将<directory>替换为我们之前为Samba共享创建的本地文件夹（例如，/shared）：

    $ sudo semanage fcontext -a -t samba_share_t "/shared(/.*)?" 

我们必须执行restorecon命令来激活修改的标签，命令如下：

    $ sudo restorecon -R -v /shared 

![](https://farm9.staticflickr.com/8584/16652774078_2055f45f70_b.jpg)

为了通过Samba共享在我们home文件夹内的文件夹，我们必须在SELinux中开启共享home文件夹的选项，该选项默认被关闭。下面的命令能达到该效果。如果您并未共享您的home文件夹，那么您可以跳过该步骤。

    $ sudo setsebool -P samba_enable_home_dirs 1 

### 步骤3：为Samba配置防火墙 ###

下面的命令用来打开防火墙中Samba共享所需的TCP/UDP端口。

如果您在使用firewalld（例如，在Fedora和CentOS7下），接下来的命令将会永久的修改Samba相关的防火墙规则。

    $ sudo firewall-cmd --permanent --add-service=samba 

如果您在防火墙中使用iptables（例如，CentOS6或者更早的版本），可以使用下面的命令来打开Samba必要的向外的端口。

    $ sudo vi /etc/sysconfig/iptables 

----------

    -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 445 -j ACCEPT
    -A RH-Firewall-1-INPUT -m state --state NEW -m udp -p udp --dport 445 -j ACCEPT
    -A RH-Firewall-1-INPUT -m state --state NEW -m udp -p udp --dport 137 -j ACCEPT
    -A RH-Firewall-1-INPUT -m state --state NEW -m udp -p udp --dport 138 -j ACCEPT
    -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 139 -j ACCEPT

然后重启iptables服务：

    $ sudo service iptables restart 

### 步骤4：更改Samba配置 ###

后面的步骤用来配置Samba以将本地文件夹导出为Samba共享文件夹。

使用文件编辑器打开Samba配置文件，并将下面的行添加到文件的末尾。

    $ sudo nano /etc/samba/smb.conf 

----------

    [myshare]
    comment=my shared files
    path=/shared
    public=yes
    writeable=yes

上面在括号内的文本（例如，"myshare"）是Samba共享的资源的名字，它被用来从远程主机存取Samba共享。

创建Samba用户帐户，这是挂载和导出Samba文件系统所必须的。我们可以使用smbpasswd工具来创建一个Samba用户。注意，Samba用户帐户必须是已有的Linux用户。如果您尝试使用smbpasswd添加一个不存在的用户，它会返回一个错误的消息。

如果您不想使用任何已存在的Linux用户作为Samba用户，您可以在您的系统中创建一个新的用户。为安全起见，设置新用户的登录脚本为/sbin/nologin，并且不创建该用户的home文件夹。

在这个例子中，我们创建了一个名叫"sambaguest"的用户，如下：

    $ sudo useradd -M -s /sbin/nologin sambaguest
    $ sudo passwd sambaguest 

![](https://farm9.staticflickr.com/8702/16814479366_53f540d3ba_b.jpg)

在创建一个新用户后，使用smbpasswd命令添加Samba用户。当这个命令询问一个密码时，您可以键入一个与其用户密码不同的密码。

    $ sudo smbpasswd -a sambaguest

激活Samba服务，并检测Samba服务是否在运行。

    $ sudo systemctl enable smb.service
    $ sudo systemctl start smb.service
    $ sudo systemctl is-active smb 

![](https://farm8.staticflickr.com/7607/16652984770_622f24bccc_b.jpg)

使用下面的命令来查看Samba中共享的文件夹列表。

    $ smbclient -U sambaguest -L localhost 

![](https://farm8.staticflickr.com/7281/16220411103_06bf585901_b.jpg)

接下来是在Thunar文件管理器中访问Samba共享文件夹以及对file1进行拷贝复制的截图。注意，Samba的共享内容可以通过在Thunar中通过 `smb://<samba-server-IP-address>/myshare` 这个地址来访问。

![](https://farm8.staticflickr.com/7644/16218011174_c8b34fcedc_b.jpg)

--------------------------------------------------------------------------------

via: http://xmodulo.com/share-directory-samba-fedora-centos.html

作者：[Kristophorus Hadiono][a]
译者：[wwy-hust](https://github.com/wwy-hust)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/kristophorus
