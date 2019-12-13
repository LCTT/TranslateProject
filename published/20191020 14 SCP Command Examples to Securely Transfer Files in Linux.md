[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11669-1.html)
[#]: subject: (14 SCP Command Examples to Securely Transfer Files in Linux)
[#]: via: (https://www.linuxtechi.com/scp-command-examples-in-linux/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

在 Linux 上安全传输文件的 14 SCP 命令示例
======

![](https://img.linux.net.cn/data/attachment/album/201912/13/100239f31is1ios31vvoo3.jpg)

SCP（<ruby>安全复制<rt>Secure Copy</rt></ruby>）是 Linux 和 Unix 之类的系统中的命令行工具，用于通过网络安全地跨系统传输文件和目录。当我们使用 `scp` 命令将文件和目录从本地系统复制到远程系统时，则在后端与远程系统建立了 ssh 连接。换句话说，我们可以说 `scp` 在后端使用了相同的 SSH 安全机制，它需要密码或密钥进行身份验证。

![scp-command-examples-linux][2]

在本教程中，我们将讨论 14 个有用的 Linux `scp` 命令示例。

`scp` 命令语法：

```
# scp <选项> <文件或目录> 用户名@目标主机:/<文件夹>

# scp <选项> 用户名@目标主机:/文件 <本地文件夹>
```

`scp` 命令的第一个语法演示了如何将文件或目录从本地系统复制到特定文件夹下的目标主机。

`scp` 命令的第二种语法演示了如何将目标主机中的文件复制到本地系统中。

下面列出了 `scp` 命令中使用最广泛的一些选项，

* `-C` 启用压缩
* `-i` 指定识别文件或私钥
* `-l` 复制时限制带宽
* `-P` 指定目标主机的 ssh 端口号
* `-p` 复制时保留文件的权限、模式和访问时间
* `-q` 禁止 SSH 警告消息
* `-r` 递归复制文件和目录
* `-v` 详细输出

现在让我们跳入示例！

### 示例：1）使用 scp 将文件从本地系统复制到远程系统

假设我们要使用 `scp` 命令将 jdk 的 rpm 软件包从本地 Linux 系统复制到远程系统（172.20.10.8），请使用以下命令，

```
[root@linuxtechi ~]$ scp jdk-linux-x64_bin.rpm root@linuxtechi:/opt
root@linuxtechi's password:
jdk-linux-x64_bin.rpm                          100%   10MB  27.1MB/s   00:00
[root@linuxtechi ~]$
```

上面的命令会将 jdk 的 rpm 软件包文件复制到 `/opt` 文件夹下的远程系统。

### 示例：2）使用 scp 将文件从远程系统复制到本地系统

假设我们想将文件从远程系统复制到本地系统下的 `/tmp` 文件夹，执行以下 `scp` 命令，

```
[root@linuxtechi ~]$ scp root@linuxtechi:/root/Technical-Doc-RHS.odt /tmp
root@linuxtechi's password:
Technical-Doc-RHS.odt                         100% 1109KB  31.8MB/s   00:00
[root@linuxtechi ~]$ ls -l /tmp/Technical-Doc-RHS.odt
-rwx------. 1 pkumar pkumar 1135521 Oct 19 11:12 /tmp/Technical-Doc-RHS.odt
[root@linuxtechi ~]$
```

### 示例：3）使用 scp 传输文件时的详细输出（-v）

在 `scp` 命令中，我们可以使用 `-v` 选项启用详细输出。使用详细输出，我们可以轻松地发现后台确切发生了什么。这对于调试连接、认证和配置等问题非常有用。

```
root@linuxtechi ~]$ scp -v jdk-linux-x64_bin.rpm root@linuxtechi:/opt
Executing: program /usr/bin/ssh host 172.20.10.8, user root, command scp -v -t /opt
OpenSSH_7.8p1, OpenSSL 1.1.1 FIPS  11 Sep 2018
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: Reading configuration data /etc/ssh/ssh_config.d/05-redhat.conf
debug1: Reading configuration data /etc/crypto-policies/back-ends/openssh.config
debug1: /etc/ssh/ssh_config.d/05-redhat.conf line 8: Applying options for *
debug1: Connecting to 172.20.10.8 [172.20.10.8] port 22.
debug1: Connection established.
…………
debug1: Next authentication method: password
root@linuxtechi's password:
```

### 示例：4）将多个文件传输到远程系统

可以使用 `scp` 命令一次性将多个文件复制/传输到远程系统，在 `scp` 命令中指定多个文件，并用空格隔开，示例如下所示

```
[root@linuxtechi ~]$ scp install.txt index.html jdk-linux-x64_bin.rpm root@linuxtechi:/mnt
root@linuxtechi's password:
install.txt                                      100%    0     0.0KB/s   00:00
index.html                                       100%   85KB   7.2MB/s   00:00
jdk-linux-x64_bin.rpm                            100%   10MB  25.3MB/s   00:00
[root@linuxtechi ~]$
```

### 示例：5）在两个远程主机之间传输文件

使用 `scp` 命令，我们可以在两个远程主机之间复制文件和目录，假设我们有一个可以连接到两个远程 Linux 系统的本地 Linux 系统，因此从我的本地 Linux 系统中，我可以使用 `scp` 命令在这两个系统之间复制文件，

命令语法：

```
# scp 用户名@远程主机1:/<要传输的文件> 用户名@远程主机2:/<文件夹>
```

示例如下：

```
# scp root@linuxtechi:~/backup-Oct.zip root@linuxtechi:/tmp
# ssh root@linuxtechi "ls -l /tmp/backup-Oct.zip"
-rwx------. 1 root root 747438080 Oct 19 12:02 /tmp/backup-Oct.zip
```

### 示例：6）递归复制文件和目录（-r）

在 `scp` 命令中使用 `-r` 选项将整个目录从一个系统递归地复制到另一个系统，示例如下所示：

```
[root@linuxtechi ~]$ scp -r Downloads root@linuxtechi:/opt
```

使用以下命令验证 `Downloads` 文件夹是否已复制到远程系统，

```
[root@linuxtechi ~]$ ssh root@linuxtechi "ls -ld /opt/Downloads"
drwxr-xr-x. 2 root root 75 Oct 19 12:10 /opt/Downloads
[root@linuxtechi ~]$
```

### 示例：7）通过启用压缩来提高传输速度（-C）

在 `scp` 命令中，我们可以通过使用 `-C` 选项启用压缩来提高传输速度，它将自动在源主机上启用压缩并在目标主机上解压缩。

```
root@linuxtechi ~]$ scp -r -C Downloads root@linuxtechi:/mnt
```

在以上示例中，我们正在启用压缩的情况下传输下载目录。

### 示例：8）复制时限制带宽（-l）

在 `scp` 命令中使用 `-l` 选项设置复制时对带宽使用的限制。带宽以 Kbit/s 为单位指定，示例如下所示：

```
[root@linuxtechi ~]$ scp -l 500 jdk-linux-x64_bin.rpm  root@linuxtechi:/var
```

### 示例：9）在 scp 时指定其他 ssh 端口（-P）

在某些情况下，目标主机上的 ssh 端口会更改，因此在使用 `scp` 命令时，我们可以使用 `-P` 选项指定 ssh 端口号。

```
[root@linuxtechi ~]$ scp -P 2022 jdk-linux-x64_bin.rpm  root@linuxtechi:/var
```

在上面的示例中，远程主机的 ssh 端口为 “2022”。

### 示例：10）复制时保留文件的权限、模式和访问时间（-p）

从源复制到目标时，在 `scp` 命令中使用 `-p` 选项保留权限、访问时间和模式。

```
[root@linuxtechi ~]$ scp -p jdk-linux-x64_bin.rpm  root@linuxtechi:/var/tmp
jdk-linux-x64_bin.rpm                            100%   10MB  13.5MB/s   00:00
[root@linuxtechi ~]$
```

### 示例：11）在 scp 中以安静模式传输文件（-q）

在 `scp` 命令中使用 `-q` 选项可禁止显示 ssh 的传输进度、警告和诊断消息。示例如下所示：

```
[root@linuxtechi ~]$ scp -q -r Downloads root@linuxtechi:/var/tmp
[root@linuxtechi ~]$
```

### 示例：12）在传输时使用 scp 中的识别文件（-i）

在大多数 Linux 环境中，首选基于密钥的身份验证。在 `scp` 命令中，我们使用 `-i` 选项指定识别文件（私钥文件），示例如下所示：

```
[root@linuxtechi ~]$ scp -i my_key.pem -r Downloads root@linuxtechi:/root
```

在上面的示例中，`my_key.pem` 是识别文件或私钥文件。

### 示例：13）在 scp 中使用其他 ssh_config 文件（-F）

在某些情况下，你使用不同的网络连接到 Linux 系统，可能某些网络位于代理服务器后面，因此在这种情况下，我们必须具有不同的 `ssh_config` 文件。

通过 `-F` 选项在 `scp` 命令中指定了不同的 `ssh_config` 文件，示例如下所示：

```
[root@linuxtechi ~]$ scp -F /home/pkumar/new_ssh_config -r Downloads root@linuxtechi:/root
root@linuxtechi's password:
jdk-linux-x64_bin.rpm                     100%   10MB  16.6MB/s   00:00
backup-Oct.zip                            100%  713MB  41.9MB/s   00:17
index.html                                100%   85KB   6.6MB/s   00:00
[root@linuxtechi ~]$
```

### 示例：14）在 scp 命令中使用其他加密方式（-c）

默认情况下，`scp` 使用 AES-128 加密方式来加密文件。如果你想在 `scp` 命令中使用其他加密方式，请使用 `-c` 选项，后接加密方式名称。

假设我们要在用 `scp` 命令传输文件时使用 3des-cbc 加密方式，请运行以下 `scp` 命令：

```
[root@linuxtechi ~]# scp -c 3des-cbc -r Downloads root@linuxtechi:/root
```

使用以下命令列出 `ssh` 和 `scp` 支持的加密方式：

```
[root@linuxtechi ~]# ssh -Q cipher localhost | paste -d , -s -
3des-cbc,aes128-cbc,aes192-cbc,aes256-cbc,root@linuxtechi,aes128-ctr,aes192-ctr,aes256-ctr,root@linuxtechi,root@linuxtechi,root@linuxtechi
[root@linuxtechi ~]#
```

以上就是本教程的全部内容，要获取有关 `scp` 命令的更多详细信息，请参考其手册页。请在下面的评论部分中分享你的反馈和评论。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/scp-command-examples-in-linux/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/10/scp-command-examples-linux.jpg
[3]: https://www.linuxtechi.com/cdn-cgi/l/email-protection
