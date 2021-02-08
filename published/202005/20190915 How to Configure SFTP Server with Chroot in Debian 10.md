[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12186-1.html)
[#]: subject: (How to Configure SFTP Server with Chroot in Debian 10)
[#]: via: (https://www.linuxtechi.com/configure-sftp-chroot-debian10/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

如何在 Debian 10 中配置 Chroot 环境的 SFTP 服务
======

SFTP 意思是“<ruby>安全文件传输协议<rt>Secure File Transfer Protocol</rt></ruby>” 或 “<ruby>SSH 文件传输协议<rt>SSH File Transfer Protocol</rt></ruby>”，它是最常用的用于通过 `ssh` 将文件从本地系统安全地传输到远程服务器的方法，反之亦然。`sftp` 的主要优点是，除 `openssh-server` 之外，我们不需要安装任何额外的软件包，在大多数的 Linux 发行版中，`openssh-server` 软件包是默认安装的一部分。`sftp` 的另外一个好处是，我们可以允许用户使用 `sftp` ，而不允许使用 `ssh` 。

![](https://img.linux.net.cn/data/attachment/album/202005/05/223518ip4mbdi4nggbdtgu.jpg)

当前发布的 Debian 10 代号为 ‘Buster’，在这篇文章中，我们将演示如何在 Debian 10 系统中在 “监狱式的” Chroot 环境中配置 `sftp`。在这里，Chroot 监狱式环境意味着，用户不能超出各自的家目录，或者用户不能从各自的家目录更改目录。下面实验的详细情况：

* OS = Debian 10
* IP 地址 = 192.168.56.151

让我们跳转到 SFTP 配置步骤，

### 步骤 1、使用 groupadd 命令给 sftp 创建一个组

打开终端，使用下面的 `groupadd` 命令创建一个名为的 `sftp_users` 组：

```
root@linuxtechi:~# groupadd sftp_users
```

### 步骤 2、添加用户到组 sftp_users 并设置权限

假设你想创建新的用户，并且想添加该用户到 `sftp_users` 组中，那么运行下面的命令，

**语法：** 

```
#  useradd -m -G sftp_users <用户名>
```

让我们假设用户名是 `jonathan`：

```
root@linuxtechi:~# useradd -m -G sftp_users jonathan
```

使用下面的 `chpasswd` 命令设置密码：

```
root@linuxtechi:~# echo "jonathan:<输入密码>" | chpasswd
```

假设你想添加现有的用户到 `sftp_users` 组中，那么运行下面的 `usermod` 命令，让我们假设已经存在的用户名称是 `chris`：

```
root@linuxtechi:~# usermod -G sftp_users chris
```

现在设置用户所需的权限：

```
root@linuxtechi:~# chown root /home/jonathan /home/chris/
```

在各用户的家目录中都创建一个上传目录，并设置正确地所有权：

```
root@linuxtechi:~# mkdir /home/jonathan/upload
root@linuxtechi:~# mkdir /home/chris/upload
root@linuxtechi:~# chown jonathan /home/jonathan/upload
root@linuxtechi:~# chown chris /home/chris/upload
```

**注意:** 像 Jonathan 和 Chris 之类的用户可以从他们的本地系统上传文件和目录。

### 步骤 3、编辑 sftp 配置文件 /etc/ssh/sshd_config

正如我们已经陈述的，`sftp` 操作是通过 `ssh` 完成的，所以它的配置文件是 `/etc/ssh/sshd_config`，在做任何更改前，我建议首先备份文件，然后再编辑该文件，接下来添加下面的内容：

```
root@linuxtechi:~# cp /etc/ssh/sshd_config /etc/ssh/sshd_config-org
root@linuxtechi:~# vim /etc/ssh/sshd_config
......
#Subsystem      sftp    /usr/lib/openssh/sftp-server
Subsystem       sftp    internal-sftp

Match Group sftp_users
  X11Forwarding no
  AllowTcpForwarding no
  ChrootDirectory %h
  ForceCommand internal-sftp
......
```

保存并退出文件。

为使上述更改生效，使用下面的 `systemctl` 命令来重新启动 `ssh` 服务：

```
root@linuxtechi:~# systemctl restart sshd
```

在上面的 `sshd_config` 文件中，我们已经注释掉了以 `Subsystem` 开头的行，并添加了新的条目 `Subsystem       sftp    internal-sftp` 和新的行。而

`Match Group sftp_users`  –> 它意味着如果用户是 `sftp_users` 组中的一员，那么将应用下面提到的规则到这个条目。

`ChrootDierctory %h` –> 它意味着用户只能在他们自己各自的家目录中更改目录，而不能超出他们各自的家目录。或者换句话说，我们可以说用户是不允许更改目录的。他们将在他们的目录中获得监狱一样的环境，并且不能访问其他用户的目录和系统的目录。

`ForceCommand internal-sftp` –>  它意味着用户仅被限制到只能使用 `sftp` 命令。

### 步骤 4、测试和验证 sftp

登录到你的 `sftp` 服务器的同一个网络上的任何其它的 Linux 系统，然后通过我们放入 `sftp_users` 组中的用户来尝试 ssh 和 sftp 服务。

```
[root@linuxtechi ~]# ssh root@linuxtechi
root@linuxtechi's password:
Write failed: Broken pipe
[root@linuxtechi ~]# ssh root@linuxtechi
root@linuxtechi's password:
Write failed: Broken pipe
[root@linuxtechi ~]#
```

以上操作证实用户不允许 `ssh` ，现在使用下面的命令尝试 `sftp`：

```
[root@linuxtechi ~]# sftp root@linuxtechi
root@linuxtechi's password:
Connected to 192.168.56.151.
sftp> ls -l
drwxr-xr-x    2 root     1001         4096 Sep 14 07:52 debian10-pkgs
-rw-r--r--    1 root     1001          155 Sep 14 07:52 devops-actions.txt
drwxr-xr-x    2 1001     1002         4096 Sep 14 08:29 upload
```

让我们使用 sftp 的 `get` 命令来尝试下载一个文件：

```
sftp> get devops-actions.txt
Fetching /devops-actions.txt to devops-actions.txt
/devops-actions.txt                                                                               100%  155     0.2KB/s   00:00
sftp>
sftp> cd /etc
Couldn't stat remote file: No such file or directory
sftp> cd /root
Couldn't stat remote file: No such file or directory
sftp>
```

上面的输出证实我们能从我们的 sftp 服务器下载文件到本地机器，除此之外，我们也必须测试用户不能更改目录。

让我们在 `upload` 目录下尝试上传一个文件：

```
sftp> cd upload/
sftp> put metricbeat-7.3.1-amd64.deb
Uploading metricbeat-7.3.1-amd64.deb to /upload/metricbeat-7.3.1-amd64.deb
metricbeat-7.3.1-amd64.deb                                                                        100%   38MB  38.4MB/s   00:01
sftp> ls -l
-rw-r--r--    1 1001     1002     40275654 Sep 14 09:18 metricbeat-7.3.1-amd64.deb
sftp>
```

这证实我们已经成功地从我们的本地系统上传一个文件到 sftp 服务中。

现在使用 winscp 工具来测试 sftp 服务，输入 sftp 服务器 IP 地址和用户的凭证：

![][3]

在 “Login” 上单击，然后尝试下载和上传文件：

![][4]

现在，在 `upload` 文件夹中尝试上传文件：

![][5]

上面的窗口证实上传是完好地工作的，这就是这篇文章的全部。如果这些步骤能帮助你在 Debian 10 中使用 chroot 环境配置 SFTP 服务器s，那么请分享你的反馈和评论。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/configure-sftp-chroot-debian10/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Configure-sftp-debian10.jpg
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Winscp-sftp-debian10.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Download-file-winscp-debian10-sftp.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Upload-File-using-winscp-Debian10-sftp.jpg
