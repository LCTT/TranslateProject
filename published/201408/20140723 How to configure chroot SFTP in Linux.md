在 Linux 中为非 SSH 用户配置 SFTP 环境
================================================================================
在**某些环境**中，系统管理员想要允许极少数用户在可以传输文件到Linux机器中，但是不允许使用 SSH。要实现这一目的，我们可以使用**SFTP**，并为其构建chroot环境。

### SFTP & chroot背景： ###

**SFTP**是指**SSH文件传输协议（SSH File Transfer protocol）或安全文件传输协议（Secure File Transfer Protocol）**，它提供了可信数据流下的文件访问、文件传输以及文件管理功能。当我们为SFTP配置chroot环境后，只有被许可的用户可以访问，并被限制到他们的**家目录**中，换言之：被许可的用户将处于牢笼环境中，在此环境中它们甚至不能切换它们的目录。

在本文中，我们将配置**RHEL 6.X** 和 **CentOS 6.X中的SFTP Chroot环境**。我们开启一个用户帐号‘**Jack**’，该用户将被允许在Linux机器上传输文件，但没有ssh访问权限。

### 步骤：1  创建组 ###

    [root@localhost ~]# groupadd  sftp_users

### 步骤：2 分配附属组(sftp_users)给用户 ###

如果用户在系统上不存在，使用以下命令创建（ LCTT 译注：这里给用户指定了一个不能登录的 shell，以防止通过 ssh 登录）：

    [root@localhost ~]# useradd  -G sftp_users  -s /sbin/nologin  jack
    [root@localhost ~]# passwd jack

对于**已经存在的用户**，使用以下usermod命令进行修改：

    [root@localhost ~]# usermod –G sftp_users  -s /sbin/nologin  jack

**注意**：如果你想要修改用户的**默认家目录**，那么可以在useradd和usermod命令中使用‘**-d**’选项，并设置**合适的权限**。

### 步骤：3 现在编辑配置文件 “/etc/ssh/sshd_config” ###

    # vi /etc/ssh/sshd_config
    #comment out the below line and add a line like below
    #Subsystem sftp /usr/libexec/openssh/sftp-server
    Subsystem sftp internal-sftp
    
    # add Below lines  at the end of file
      Match Group sftp_users
      X11Forwarding no
      AllowTcpForwarding no
      ChrootDirectory %h                      
      ForceCommand internal-sftp

#### 此处： ####

- **Match Group sftp_users** – 该参数指定以下的行将仅仅匹配sftp_users组中的用户
- **ChrootDirectory %h** – 该参数指定用户验证后用于chroot环境的路径（默认的用户家目录）。对于用户 Jack，该路径就是/home/jack。
- **ForceCommand internal-sftp** – 该参数强制执行内部sftp，并忽略任何~/.ssh/rc文件中的命令。

重启ssh服务

    # service sshd restart

### 步骤：4 设置权限： ###

    [root@localhost ~]# chmod 755 /home/jack
    [root@localhost ~]# chown root /home/jack
    [root@localhost ~]# chgrp -R sftp_users /home/jack

如果你想要允许jack用户上传文件，那么创建一个上传文件夹，设置权限如下：

    [root@localhost jack]# mkdir /home/jack/upload
    [root@localhost jack]# chown jack. /home/jack upload/

### 步骤：5  现在尝试访问系统并进行测试 ###

尝试通过ssh访问系统 

![](http://www.linuxtechi.com/wp-content/uploads/2014/07/ssh-try.png)

正如下图所示，用户jack通过SFTP登录，而且因为chroot环境不能切换目录。

![](http://www.linuxtechi.com/wp-content/uploads/2014/07/sftp-login.png)

现在进行**上传和下载**测试，如下图：

![](http://www.linuxtechi.com/wp-content/uploads/2014/07/sftp-upload-download.png)

正如上图所示，jack用户的上传下载功能都工作得很好。

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/configure-chroot-sftp-in-linux/

原文作者：[Pradeep Kumar][a]

译者：[GOLinux](https://github.com/GOLinux) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
