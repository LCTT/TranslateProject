如何在 Ubuntu 下安装和配置 FTP 服务器
============================================================

FTP（文件传输协议）是一个较老且最常用的标准网络协议，用于在两台计算机之间通过网络上传/下载文件。然而， FTP 最初的时候并不安全，因为它仅通过用户凭证（用户名和密码）传输数据，没有进行加密。

警告：如果你打算使用 FTP， 需要考虑通过 SSL/TLS（将在下篇文章中讨论）配置 FTP 连接。否则，使用安全 FTP，比如 [SFTP][1] 会更好一些。

**推荐阅读：**[如何在 CentOS 7 中安装并保护 FTP 服务器][2]

在这个教程中，我将向你们展示如何在 Ubuntu 中安装、配置并保护 FTP 服务器（VSFTPD 的全称是 “Very Secure FTP Deamon”），从而拥有强大的安全性，能够防范 FTP 漏洞。

### 第一步：在 Ubuntu 中安装 VSFTPD 服务器

1、首先，我们需要更新系统安装包列表，然后像下面这样安装 VSFTPD 二进制包：

```
$ sudo apt-get update
$ sudo apt-get install vsftpd
```

2、一旦安装完成，初始情况下服务被禁用。因此，我们需要手动开启服务，同时，启动它使得在下次开机时能够自动开启服务：

```
------------- On SystemD -------------
# systemctl start vsftpd
# systemctl enable vsftpd
------------- On SysVInit -------------
# service vsftpd start
# chkconfig --level 35 vsftpd on
```

3、接下来，如果你在服务器上启用了 [UFW 防火墙][3]（默认情况下不启用），那么需要打开端口 20 和 21 —— FTP 守护进程正在监听它们——从而才能允许从远程机器访问 FTP 服务，然后，像下面这样添加新的防火墙规则：

```
$ sudo ufw allow 20/tcp
$ sudo ufw allow 21/tcp
$ sudo ufw status
```

### 第二步：在 Ubuntu 中配置并保护 VSFTPD 服务器

4、让我们进行一些配置来设置和保护 FTP 服务器。首先，我们像下面这样创建一个原始配置文件 `/etc/vsftpd/vsftpd.conf` 的备份文件：

```
$ sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.orig
```

接下来，打开 vsftpd 配置文件。

```
$ sudo vi /etc/vsftpd.conf
OR
$ sudo nano /etc/vsftpd.conf
```

把下面的这些选项添加/改成所展示的值：

```
anonymous_enable=NO             # 关闭匿名登录
local_enable=YES		# 允许本地用户登录
write_enable=YES		# 启用可以修改文件的 FTP 命令
local_umask=022		        # 本地用户创建文件的 umask 值
dirmessage_enable=YES	        # 当用户第一次进入新目录时显示提示消息
xferlog_enable=YES		# 一个存有详细的上传和下载信息的日志文件
connect_from_port_20=YES        # 在服务器上针对 PORT 类型的连接使用端口 20（FTP 数据）
xferlog_std_format=YES          # 保持标准日志文件格式
listen=NO   			# 阻止 vsftpd 在独立模式下运行
listen_ipv6=YES		        # vsftpd 将监听 ipv6 而不是 IPv4，你可以根据你的网络情况设置
pam_service_name=vsftpd         # vsftpd 将使用的 PAM 验证设备的名字
userlist_enable=YES  	        # 允许 vsftpd 加载用户名字列表
tcp_wrappers=YES  		# 打开 tcp 包装器
```

5、现在，配置 VSFTPD ，基于用户列表文件 `/etc/vsftpd.userlist` 来允许或拒绝用户访问 FTP。

注意，在默认情况下，如果通过 `userlist_enable=YES` 启用了用户列表，且设置 `userlist_deny=YES` 时，那么，用户列表文件 `/etc/vsftpd.userlist` 中的用户是不能登录访问的。

但是，选项 `userlist_deny=NO` 则反转了默认设置，这种情况下只有用户名被明确列出在 `/etc/vsftpd.userlist` 中的用户才允许登录到 FTP 服务器。

```
userlist_enable=YES                   # vsftpd 将会从所给的用户列表文件中加载用户名字列表
userlist_file=/etc/vsftpd.userlist    # 存储用户名字的列表
userlist_deny=NO
```

重要的是，当用户登录 FTP 服务器以后，他们将进入 chrooted 环境，即当在 FTP 会话时，其 root 目录将是其 home 目录。

接下来，我们来看一看两种可能的途径来设置 chrooted（本地 root）目录，正如下面所展示的。

6、这时，让我们添加/修改/取消这两个选项来[将 FTP 用户限制在其 home 目录][4]

```
chroot_local_user=YES
allow_writeable_chroot=YES
```

选项 `chroot_local_user=YES` 意味着本地用户将进入 chroot 环境，当登录以后默认情况下是其 home 目录。

并且我们要知道，默认情况下，出于安全原因，VSFTPD 不允许 chroot 目录具有可写权限。然而，我们可以通过选项 `allow_writeable_chroot=YES` 来改变这个设置

保存文件然后关闭。现在我们需要重启 VSFTPD 服务从而使上面的这些更改生效：

```
------------- On SystemD -------------
# systemctl restart vsftpd
------------- On SysVInit -------------
# service vsftpd restart
```

### 第三步：在 Ubuntu 上测试 VsFTP 服务器

7、现在，我们通过使用下面展示的 [useradd 命令][5]创建一个 FTP 用户来测试 FTP 服务器：

```
$ sudo useradd -m -c "Aaron Kili, Contributor" -s /bin/bash aaronkilik
$ sudo passwd aaronkilik
```

然后，我们需要像下面这样使用 [echo 命令][6]和 tee 命令来明确地列出文件 `/etc/vsftpd.userlist` 中的用户 aaronkilik：

```
$ echo "aaronkilik" | sudo tee -a /etc/vsftpd.userlist
$ cat /etc/vsftpd.userlist
```

8、现在，是时候来测试上面的配置是否具有我们想要的功能了。我们首先测试匿名登录；我们可以从下面的输出中很清楚的看到，在这个 FTP 服务器中是不允许匿名登录的：

```
# ftp 192.168.56.102
Connected to 192.168.56.102  (192.168.56.102).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.102:aaronkilik) : anonymous
530 Permission denied.
Login failed.
ftp> bye
221 Goodbye.
```

9、接下来，我们将测试，如果用户的名字没有在文件 `/etc/vsftpd.userlist` 中，是否能够登录。从下面的输出中，我们看到，这是不可以的：

```
# ftp 192.168.56.102
Connected to 192.168.56.102  (192.168.56.102).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.10:root) : user1
530 Permission denied.
Login failed.
ftp> bye
221 Goodbye.
```

10、现在，我们将进行最后一项测试，来确定列在文件 `/etc/vsftpd.userlist` 文件中的用户登录以后，是否实际处于 home 目录。从下面的输出中可知，是这样的：

```
# ftp 192.168.56.102
Connected to 192.168.56.102  (192.168.56.102).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.102:aaronkilik) : aaronkilik
331 Please specify the password.
Password:
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> ls
```

[
 ![Verify FTP Login in Ubuntu](http://www.tecmint.com/wp-content/uploads/2017/02/Verify-FTP-Login-in-Ubuntu.png)
][7]

*在 Ubuntu 中确认 FTP 登录*

警告：设置选项 `allow_writeable_chroot=YES` 是很危险的，特别是如果用户具有上传权限，或者可以 shell 访问的时候，很可能会出现安全问题。只有当你确切的知道你在做什么的时候，才可以使用这个选项。

我们需要注意，这些安全问题不仅会影响到 VSFTPD，也会影响让本地用户进入 chroot 环境的 FTP daemon。

因为这些原因，在下一步中，我将阐述一个更安全的方法，来帮助用户设置一个非可写本地 root 目录。

### 第四步：在 Ubuntu 中配置 FTP 用户的 Home 目录

11、现在，再次打开 VSFTPD 配置文件。

```
$ sudo vi /etc/vsftpd.conf
OR
$ sudo nano /etc/vsftpd.conf
```

然后像下面这样用 `#` 把不安全选项注释了：

```
#allow_writeable_chroot=YES
```

接下来，为用户创建一个替代的本地 root 目录（aaronkilik，你的可能和这不一样），然后设置目录权限，取消其他所有用户对此目录的写入权限：

```
$ sudo mkdir /home/aaronkilik/ftp
$ sudo chown nobody:nogroup /home/aaronkilik/ftp
$ sudo chmod a-w /home/aaronkilik/ftp
```

12、然后，在本地 root 目录下创建一个具有合适权限的目录，用户将在这儿存储文件：

```
$ sudo mkdir /home/aaronkilik/ftp/files
$ sudo chown -R aaronkilk:aaronkilik /home/aaronkilik/ftp/files
$ sudo chmod -R 0770 /home/aaronkilik/ftp/files/
```

之后，将 VSFTPD 配置文件中的下面这些选项添加/修改为相应的值：

```
user_sub_token=$USER          # 在本地 root 目录中插入用户名
local_root=/home/$USER/ftp    # 定义各个用户的本地 root 目录
```

保存文件并关闭。然后重启 VSFTPD 服务来使上面的设置生效：

```
------------- On SystemD -------------
# systemctl restart vsftpd
------------- On SysVInit -------------
# service vsftpd restart
```

13、现在，让我们来最后检查一下，确保用户的本地 root 目录是我们在他的 Home 目录中创建的 FTP 目录。

```
# ftp 192.168.56.102
Connected to 192.168.56.102  (192.168.56.102).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.10:aaronkilik) : aaronkilik
331 Please specify the password.
Password:
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> ls
```
[
 ![FTP User Home Directory Login](http://www.tecmint.com/wp-content/uploads/2017/02/FTP-User-Home-Directory-Login.png)
][8]

*FTP 用户 Home 目录登录*

就是这样的！记得通过下面的评论栏来分享你关于这篇指导的想法，或者你也可以提供关于这一话题的任何重要信息。

最后但不是不重要，请不要错过我的下一篇文章，在下一篇文章中，我将阐述如何[使用 SSL/TLS 来保护连接到 Ubuntu 16.04/16.10 的 FTP 服务器][9]，在那之前，请始终关注我们。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，即将成为 Linux SysAdmin 和网络开发人员，目前是 TecMint 的内容创作者，他喜欢在电脑上工作，并坚信分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-ftp-server-in-ubuntu/

作者：[Aaron Kili][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/sftp-command-examples/
[2]:http://www.tecmint.com/install-ftp-server-in-centos-7/
[3]:http://www.tecmint.com/how-to-install-and-configure-ufw-firewall/
[4]:http://www.tecmint.com/restrict-sftp-user-home-directories-using-chroot/
[5]:http://www.tecmint.com/add-users-in-linux/
[6]:http://www.tecmint.com/echo-command-in-linux/
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/Verify-FTP-Login-in-Ubuntu.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/02/FTP-User-Home-Directory-Login.png
[9]:http://www.tecmint.com/secure-ftp-server-using-ssl-tls-on-ubuntu/
[10]:http://www.tecmint.com/author/aaronkili/
[11]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[12]:http://www.tecmint.com/free-linux-shell-scripting-books/
