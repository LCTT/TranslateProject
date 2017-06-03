完全指南：如何在 CentOS 7 中安装、配置和安全加固 FTP 服务
============================================================

FTP（文件传输协议）是一种用于通过网络[在服务器和客户端之间传输文件][1]的传统并广泛使用的标准工具，特别是在不需要身份验证的情况下（允许匿名用户连接到服务器）。我们必须明白，默认情况下 FTP 是不安全的，因为它不加密传输用户凭据和数据。

在本指南中，我们将介绍在 CentOS/RHEL7 和 Fedora 发行版中安装、配置和保护 FTP 服务器（ VSFTPD 代表 “Very Secure FTP Daemon”）的步骤。

请注意，本指南中的所有命令将以 root 身份运行，如果你不使用 root 帐户操作服务器，请使用 [sudo命令][2] 获取 root 权限。

### 步骤 1：安装 FTP 服务器

1、 安装 vsftpd 服务器很直接，只要在终端运行下面的命令。

```
# yum install vsftpd
```

2、 安装完成后，服务先是被禁用的，因此我们需要手动启动，并设置在下次启动时自动启用：

```
# systemctl start vsftpd
# systemctl enable vsftpd
```

3、 接下来，为了允许从外部系统访问 FTP 服务，我们需要打开 FTP 守护进程监听的 21 端口：

```
# firewall-cmd --zone=public --permanent --add-port=21/tcp
# firewall-cmd --zone=public --permanent --add-service=ftp
# firewall-cmd --reload
```

### 步骤 2： 配置 FTP 服务器

4、 现在，我们会进行一些配置来设置并加密我们的 FTP 服务器，让我们先备份一下原始配置文件 `/etc/vsftpd/vsftpd.conf`：

```
# cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.orig
```

接下来，打开上面的文件，并将下面的选项设置相关的值：

```
anonymous_enable=NO             ### 禁用匿名登录
local_enable=YES		### 允许本地用户登录
write_enable=YES		### 允许对文件系统做改动的 FTP 命令
local_umask=022		        ### 本地用户创建文件所用的 umask 值
dirmessage_enable=YES	        ### 当用户首次进入一个新目录时显示一个消息
xferlog_enable=YES		### 用于记录上传、下载细节的日志文件
connect_from_port_20=YES        ### 使用端口 20 （ftp-data）用于 PORT 风格的连接
xferlog_std_format=YES          ### 使用标准的日志格式
listen=NO   			### 不要让 vsftpd 运行在独立模式
listen_ipv6=YES		        ### vsftpd 将监听 IPv6 而不是 IPv4
pam_service_name=vsftpd         ###  vsftpd 使用的 PAM 服务名
userlist_enable=YES  	        ### vsftpd 支持载入用户列表
tcp_wrappers=YES  		### 使用 tcp wrappers
```

5、 现在基于用户列表文件 `/etc/vsftpd.userlist` 来配置 FTP 来允许/拒绝用户的访问。

默认情况下，如果设置了 `userlist_enable=YES`，当 `userlist_deny` 选项设置为 `YES` 的时候，`userlist_file=/etc/vsftpd.userlist` 中列出的用户被拒绝登录。

然而， 更改配置为 `userlist_deny=NO`，意味着只有在 `userlist_file=/etc/vsftpd.userlist` 显式指定的用户才允许登录。

```
userlist_enable=YES                   ### vsftpd 将从 userlist_file 给出的文件中载入用户名列表
userlist_file=/etc/vsftpd.userlist    ### 存储用户名的文件
userlist_deny=NO   
```

这并不是全部，当用户登录到 FTP 服务器时，它们会进入 chroot jail 中，这是仅作为 FTP 会话主目录的本地根目录。

接下来，我们将介绍如何将 FTP 用户 chroot 到 FTP 用户的家目录（本地 root）中的两种可能情况，如下所述。

6、 接下来添加下面的选项来限制 FTP 用户到它们自己的家目录。

```
chroot_local_user=YES
allow_writeable_chroot=YES
```

`chroot_local_user=YES` 意味着用户可以设置 chroot jail，默认是登录后的家目录。

同样默认的是，出于安全原因，vsftpd 不会允许 chroot jail 目录可写，然而，我们可以添加 `allow_writeable_chroot=YES` 来覆盖这个设置。

保存并关闭文件。

### 步骤 3： 用 SELinux 加密 FTP 服务器

7、现在，让我们设置下面的 SELinux 布尔值来允许 FTP 能读取用户家目录下的文件。请注意，这原本是使用以下命令完成的：

```
# setsebool -P ftp_home_dir on
```

然而，由于这个 bug 报告：[https://bugzilla.redhat.com/show_bug.cgi?id=1097775][3]，`ftp_home_dir` 指令默认是禁用的。

现在，我们会使用 `semanage` 命令来设置 SELinux 规则来允许 FTP 读取/写入用户的家目录。

```
# semanage boolean -m ftpd_full_access --on
```

这时，我们需要重启 vsftpd 来使目前的设置生效：

```
# systemctl restart vsftpd
```

### 步骤 4： 测试 FTP 服务器

8、 现在我们会用 [useradd 命令][4]创建一个 FTP 用户来测试 FTP 服务器。

```
# useradd -m -c “Ravi Saive, CEO” -s /bin/bash ravi
# passwd ravi
```

之后，我们如下使用 [echo 命令][5]添加用户 ravi 到文件 `/etc/vsftpd.userlist` 中：

```
# echo "ravi" | tee -a /etc/vsftpd.userlist
# cat /etc/vsftpd.userlist
```

9、 现在是时候测试我们上面的设置是否可以工作了。让我们使用匿名登录测试，我们可以从下面的截图看到匿名登录没有被允许。

```
# ftp 192.168.56.10
Connected to 192.168.56.10  (192.168.56.10).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.10:root) : anonymous
530 Permission denied.
Login failed.
ftp>
```

[
 ![Test Anonymous FTP Login](http://www.tecmint.com/wp-content/uploads/2017/02/Test-Anonymous-FTP-Login.png) 
][6]

*测试 FTP 匿名登录*

10、 让我们也测试一下没有列在 `/etc/vsftpd.userlist` 中的用户是否有权限登录，下面截图是没有列入的情况：

```
# ftp 192.168.56.10
Connected to 192.168.56.10  (192.168.56.10).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.10:root) : aaronkilik
530 Permission denied.
Login failed.
ftp>
```
[
 ![FTP User Login Failed](http://www.tecmint.com/wp-content/uploads/2017/02/FTP-User-Login-Failed.png) 
][7]

*FTP 用户登录失败*

11、 现在最后测试一下列在 `/etc/vsftpd.userlist` 中的用户是否在登录后真的进入了他/她的家目录：

```
# ftp 192.168.56.10
Connected to 192.168.56.10  (192.168.56.10).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.10:root) : ravi
331 Please specify the password.
Password:
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> ls
```

[
 ![FTP User Login Successful](http://www.tecmint.com/wp-content/uploads/2017/02/FTP-User-Login.png) 
][8]

*用户成功登录*

警告：使用 `allow_writeable_chroot=YES` 有一定的安全隐患，特别是用户具有上传权限或 shell 访问权限时。

只有当你完全知道你正做什么时才激活此选项。重要的是要注意，这些安全性影响并不是 vsftpd 特定的，它们适用于所有提供了将本地用户置于 chroot jail 中的 FTP 守护进程。

因此，我们将在下一节中看到一种更安全的方法来设置不同的不可写本地根目录。

### 步骤 5： 配置不同的 FTP 家目录

12、 再次打开 vsftpd 配置文件，并将下面不安全的选项注释掉：

```
#allow_writeable_chroot=YES
```

接着为用户（`ravi`，你的可能不同）创建另外一个替代根目录，并将所有用户对该目录的可写权限移除：

```
# mkdir /home/ravi/ftp
# chown nobody:nobody /home/ravi/ftp
# chmod a-w /home/ravi/ftp
```

13、 接下来，在用户存储他/她的文件的本地根目录下创建一个文件夹：

```
# mkdir /home/ravi/ftp/files
# chown ravi:ravi  /home/ravi/ftp/files
# chmod 0700 /home/ravi/ftp/files/
```

接着在 vsftpd 配置文件中添加/修改这些选项：

```
user_sub_token=$USER         ### 在本地根目录下插入用户名
local_root=/home/$USER/ftp   ### 定义任何用户的本地根目录
```

保存并关闭文件。再说一次，有新的设置后，让我们重启服务：

```
# systemctl restart vsftpd
```

14、 现在最后在测试一次查看用户本地根目录就是我们在他的家目录创建的 FTP 目录。

```
# ftp 192.168.56.10
Connected to 192.168.56.10  (192.168.56.10).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.10:root) : ravi
331 Please specify the password.
Password:
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> ls
```
[
 ![FTP User Home Directory Login Successful](http://www.tecmint.com/wp-content/uploads/2017/02/FTP-User-Home-Directory-Login-Successful.png) 
][9]

*FTP 用户家目录登录成功*

就是这样了！在本文中，我们介绍了如何在 CentOS 7 中安装、配置以及加密的 FTP 服务器，使用下面的评论栏给我们回复，或者分享关于这个主题的任何有用信息。

**建议阅读：** [在 RHEL/CentOS 7 上安装 ProFTPD 服务器] [10]

在下一篇文章中，我们还将向你介绍如何在 CentOS 7 中[保护使用 SSL/TLS][11]连接的 FTP 服务器，再此之前，请继续关注 TecMint。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是一名 Linux 和 F.O.S.S 爱好者，即将从事 Linux 系统管理员和网页开发工作，他日前是 TecMint 技术网站的原创作者，非常喜欢使用电脑工作，坚信分享知识是一种美德。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-ftp-server-in-centos-7/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/scp-commands-examples/
[2]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[3]:https://bugzilla.redhat.com/show_bug.cgi?id=1097775
[4]:http://www.tecmint.com/add-users-in-linux/
[5]:http://www.tecmint.com/echo-command-in-linux/
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/Test-Anonymous-FTP-Login.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/FTP-User-Login-Failed.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/02/FTP-User-Login.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/02/FTP-User-Home-Directory-Login-Successful.png
[10]:https://linux.cn/article-8504-1.html
[11]:http://www.tecmint.com/secure-vsftpd-using-ssl-tls-on-centos/
