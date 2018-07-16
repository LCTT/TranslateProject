Linux 下用来查询安装包信息的RPM选项
================================================================================

RPM是RedHat的包管理器，用来安装、卸载、升级和查询基于RedHat Linux的安装包。RHEL和基于它的系统使用rpm命令来完成这些功能。以下是一些例子来演示rpm的查询功能，和展示了用不同的方法来查询rpm数据库和还原配置文件。

我在示例命令中使用SSH包来做说明。

## 查询RPM数据库和包 ###

###1、 在整个RPM数据库中查询，使用下面的命令

    # rpm -qa
    plymouth-0.8.3-27.el6.x86_64
    pciutils-libs-3.1.10-2.el6.i686 
    netcf-libs-0.1.9-3.el6.x86_64
    ..
    ...
    ..
    Output Truncated

###2、 你可以通过grep命令来确定上面的例子中有哪些SSH包已经安装

    # rpm -qa |grep ssh
    libssh2-1.4.2-1.el6.x86_64
    openssh-askpass-5.3p1-84.1.el6.x86_64
    libssh2-1.4.2-1.el6.i686
    openssh-server-5.3p1-84.1.el6.x86_64
    openssh-clients-5.3p1-84.1.el6.x86_64
    openssh-5.3p1-84.1.el6.x86_64

输出显示了一些关于SSH的包，但是你仍需确定哪个包真正安装了SSH。为了更近一步，请看下面的示例。

###3、 检查已安装的SSH包 a) 通过sshd守护进程 b) 通过它的配置文件

    # rpm -qf /etc/init.d/sshd
    openssh-server-5.3p1-84.1.el6.x86_64
    # rpm -qf /etc/ssh/sshd_config
    openssh-server-5.3p1-84.1.el6.x86_64

如你所见，ssh是通过openssh-server-5.3p1-84.1.el6.x86_64包安装的，你可以在守护进程或者配置文件中使用rpm -qf命令（查询ssh包所包含的任一文件来查询）。两者都会输出从那个软件包安装的。

###4、 现在你有了包名，你可能想要了解更多，并想要知道包中包含了哪些不同的文件。这种情况下，使用rpm -ql命令

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

上面的输出显示了所有该包在系统中安装的文件。现在让我们更进一步，我们只想要看到该包提供的配置文件和文档。

###5、 只列出其中的配置文件，使用rpm -qc命令

    # rpm -qc openssh-server-5.3p1-84.1.el6.x86_64
    /etc/pam.d/ssh-keycat
    /etc/pam.d/sshd
    /etc/ssh/sshd_config
    /etc/sysconfig/sshd

###6、 只列出其中的帮助文档，使用rpm -qd命令

    # rpm -qd openssh-server-5.3p1-84.1.el6.x86_64
    /usr/share/doc/openssh-server-5.3p1/HOWTO.ssh-keycat
    /usr/share/man/man5/moduli.5.gz
    /usr/share/man/man5/sshd_config.5.gz
    /usr/share/man/man8/sftp-server.8.gz
    /usr/share/man/man8/sshd.8.gz

考虑一种情况，你想要配置一个服务，但是你不知道哪里找到配置文件。举例来说，如上面的例子：使用**rpm -qf rpm -qf /etc/init.d/sshd**来找出 **/etc/ssh/sshd_config**这个文件源于哪个包。这应该会给你显示**openssh-server-5.3p1-84.1.el6.x86_64**包。使用**rpm -ql openssh-server-5.3p1-84.1.el6.x86_64**来显示包中所含的所有文件。如你所见，许多文件名显示了出来，但是输出并不很有用。

现在使用**rpm -qc openssh-server-5.3p1-84.1.el6.x86_64** 来只显示这个包的配置文件。这只会显示4个文件并给出了[/etc/ssh/sshd_config file][1]的绝对路径，可以用来开始配置服务。

###7、 从PRM包还原配置文件，而不重新安装包。

如果由于一些原因文件损坏或者从系统中删除了，你可以以**rpm -qf**开头来找出文件存在于哪个包。接下来使用**rpm2cpio | cpio -idmv**来从包中解压出文件。用ssh的例子。

假设**/etc/ssh/sshd_config**文件已经删除并且你不希望重装ssh，按以下步骤来还原文件。

 * 使用rpm -qf /etc/init.d/sshd 这个命令会显示文件来自于openssh-server-5.3p1-84.1.el6.x86_64包。
 * 从它的源中下载Openssh的rpm包。
 * 复制openssh-server-5.3p1-84.1.el6.x86_64包到/tmp目录或者其他任何你选择的目录。
 * 使用rpm2cpio |cpio -idmv解压包。

上面步骤中你使用的命令会在/tmp下面创建一个子目录。你现在可以复制到它的原始目录。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/rpm-command-query/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linoxide.com/how-tos/disable-ssh-direct-login/
