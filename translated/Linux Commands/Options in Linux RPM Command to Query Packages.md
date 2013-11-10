[TODO|DOING|**DONE**] by FingerLiu
Linux rpm命令中用于查询包信息的选项
================================================================================
RPM，即RedHat Pachage Manager,被用来为基于Red Hat的Linux系统安装，卸载，更新和查询包信息。RHEL和基于RHEL的系统用rpm命令来进行这些操作。下面的例子展示了如何利用rpm通过几种不同的方式来查询rpm数据库，以及如何重置配置文件。


下面以SSH为例来进行说明。

### 查询RPM的数据库以及相关的包 ###

**1、 用下面的命令来查询所有安装的RPM包。**

    # rpm -qa
    plymouth-0.8.3-27.el6.x86_64
    pciutils-libs-3.1.10-2.el6.i686 
    netcf-libs-0.1.9-3.el6.x86_64
    ..
    …
    ..
    下略

**2、 通过grep命令来从上例的结果中筛选出和SSH相关的包。**

    # rpm -qa |grep ssh
    libssh2-1.4.2-1.el6.x86_64
    openssh-askpass-5.3p1-84.1.el6.x86_64
    libssh2-1.4.2-1.el6.i686
    openssh-server-5.3p1-84.1.el6.x86_64
    openssh-clients-5.3p1-84.1.el6.x86_64
    openssh-5.3p1-84.1.el6.x86_64

结果展示出了和ssh相关的许多包，但你还是无法确定究竟是从哪个包安装了SSH。为了进一步分析，请看下面的例子。

**3、 检查从哪个包安装了SSH a) 依据sshd守护进程进行查找  b) 依据配置文件进行查找。**

    # rpm -qf /etc/init.d/sshd
    openssh-server-5.3p1-84.1.el6.x86_64
    # rpm -qf /etc/ssh/sshd_config
    openssh-server-5.3p1-84.1.el6.x86_64

从上面的例子中你可以看到ssh是从 openssh-server-5.3p1-84.1.el6.x86_64 这个包安装的。我们既可以使用守护进程或配置文件作为rpm -qf的参数。两种方法都能找出程序安装包。

**4、 现在你知道了包的名字，你可能还行继续知道这个包中包含了哪些文件。使用rpm -ql来实现这个功能。**

    # rpm -ql openssh-server-5.3p1-84.1.el6.x86_64
    /etc/pam.d/ssh-keycat
    /etc/pam.d/sshd
    /etc/rc.d/init.d/sshd
    /etc/ssh/sshd_config
    /etc/sysconfig/sshd
    /usr/libexec/openssh/sftp-server
    /usr/libexec/openssh/ssh-keycat
    /usr/sbin/.sshd.hmac
    /usr/sbin/sshd
    /usr/share/doc/openssh-server-5.3p1
    /usr/share/doc/openssh-server-5.3p1/HOWTO.ssh-keycat
    /usr/share/man/man5/moduli.5.gz
    /usr/share/man/man5/sshd_config.5.gz
    /usr/share/man/man8/sftp-server.8.gz
    /usr/share/man/man8/sshd.8.gz
    /var/empty/sshd

上例的输出显示了这个包安装到系统中的所有文件。现在，你只想查看这个包提供的配置文件和说明文档。

**5、 用rpm -qc 来只显示配置文件。**

    # rpm -qc openssh-server-5.3p1-84.1.el6.x86_64
    /etc/pam.d/ssh-keycat
    /etc/pam.d/sshd
    /etc/ssh/sshd_config
    /etc/sysconfig/sshd

**6、 用rpm -qd 来只显示说明文档。**

    # rpm -qd openssh-server-5.3p1-84.1.el6.x86_64
    /usr/share/doc/openssh-server-5.3p1/HOWTO.ssh-keycat
    /usr/share/man/man5/moduli.5.gz
    /usr/share/man/man5/sshd_config.5.gz
    /usr/share/man/man8/sftp-server.8.gz
    /usr/share/man/man8/sshd.8.gz

考虑如下场景：你想要配置某项服务，但你不知道它的配置文件在哪儿。拿上面的例子来说，使用**rpm -qf /etc/init.d/sshd** 找到了包含有配置文件**/etc/ssh/sshd_config**的包 **openssh-server-5.3p1-84.1.el6.x8664** 。使用**rpm -ql  openssh-server-5.3p1-84.1.el6.x8664** 列出了这个包包含的文件。它列出了很多文件，但有些文件对我们来说并不是很有用。

现在使用** rpm -qc openssh-server-5.3p1-84.1.el6.x8664 **来仅显示这个包中的配置文件。命令的结果显示了4个文件，其中包括[/etc/ssh/sshd_config][1] 的绝对路径，下面你就可以通过编辑这个文件来配置sshd 服务了。


**7、 在不重新安装包的情况下，从RPM包中提取，恢复配置文件。**

如果由于某种原因一个文件损坏，或被系统删除了，你可以通过**rpm -qf**找出这个文件是从哪个包安装的。然后，使用 **rpm2cpio | cpio -idmv**把文件从包中提取出来。继续以ssh为例：

假设配置文件 **/etc/ssh/sshd_config**被删除了，而且你不想重装ssh，可按如下步骤恢复这个文件。

    * 使用命令 rpm -qf /etc/init.d/sshd This 找出这个文件来着包 openssh-server-5.3p1-84.1.el6.x86_64 
    
    * 下载openssh rpm包
    
    * 将包 openssh-server-5.3p1-84.1.el6.x86_64 复制到 /tmp 或其他地方
    
    * 使用命令 rpm2cpio |cpio -idmv 提取包中的文件。

上述命令会在/tmp文件夹下创建一个包含openssh-server-5.3p1-84.1.el6.x86_64 包中文件的子目录。现在，你可以把你需要的文件拷贝到它原来的地方。 

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/rpm-command-query/

译者：[FingerLiu](https://github.com/FingerLiu) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linoxide.com/how-tos/disable-ssh-direct-login/