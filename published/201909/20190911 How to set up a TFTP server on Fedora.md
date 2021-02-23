[#]: collector: (lujun9972)
[#]: translator: (amwps290)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11371-1.html)
[#]: subject: (How to set up a TFTP server on Fedora)
[#]: via: (https://fedoramagazine.org/how-to-set-up-a-tftp-server-on-fedora/)
[#]: author: (Curt Warfield https://fedoramagazine.org/author/rcurtiswarfield/)

如何在 Fedora 上建立一个 TFTP 服务器
======

![][1]

TFTP 即<ruby>简单文本传输协议<rt>Trivial File Transfer Protocol</rt></ruby>，允许用户通过 [UDP][2] 协议在系统之间传输文件。默认情况下，协议使用的是 UDP 的 69 号端口。TFTP 协议广泛用于无盘设备的远程启动。因此，在你的本地网络建立一个 TFTP 服务器，这样你就可以对 [安装好的 Fedora][3] 和其他无盘设备做一些操作，这将非常有趣。

TFTP 仅仅能够从远端系统读取数据或者向远端系统写入数据，而没有列出远端服务器上文件的能力。它也没提供用户身份验证。由于安全隐患和缺乏高级功能，TFTP 通常仅用于局域网内部（LAN）。

### 安装 TFTP 服务器

首先你要做的事就是安装 TFTP 客户端和 TFTP 服务器：

```
dnf install tftp-server tftp -y
```

上述的这条命令会在 `/usr/lib/systemd/system` 目录下为 [systemd][4] 创建 `tftp.service` 和 `tftp.socket` 文件。

```
/usr/lib/systemd/system/tftp.service
/usr/lib/systemd/system/tftp.socket
```

接下来，将这两个文件复制到 `/etc/systemd/system` 目录下，并重新命名。

```
cp /usr/lib/systemd/system/tftp.service /etc/systemd/system/tftp-server.service
cp /usr/lib/systemd/system/tftp.socket /etc/systemd/system/tftp-server.socket
```

### 修改文件

当你把这些文件复制和重命名后，你就可以去添加一些额外的参数，下面是 `tftp-server.service` 刚开始的样子：

```
[Unit]
Description=Tftp Server
Requires=tftp.socket
Documentation=man:in.tftpd

[Service]
ExecStart=/usr/sbin/in.tftpd -s /var/lib/tftpboot
StandardInput=socket

[Install]
Also=tftp.socket
```

在 `[Unit]` 部分添加如下内容：

```
Requires=tftp-server.socket
```

修改 `[ExecStart]` 行：

```
ExecStart=/usr/sbin/in.tftpd -c -p -s /var/lib/tftpboot
```

下面是这些选项的意思：

  *  `-c` 选项允许创建新的文件
  *  `-p` 选项用于指明在正常系统提供的权限检查之上没有其他额外的权限检查
  *  `-s` 建议使用该选项以确保安全性以及与某些引导 ROM 的兼容性，这些引导 ROM 在其请求中不容易包含目录名。

默认的上传和下载位置位于 `/var/lib/tftpboot`。

下一步，修改 `[Install]` 部分的内容

```
[Install]
WantedBy=multi-user.target
Also=tftp-server.socket
```

不要忘记保存你的修改。

下面是 `/etc/systemd/system/tftp-server.service` 文件的完整内容：

```
[Unit]
Description=Tftp Server
Requires=tftp-server.socket
Documentation=man:in.tftpd

[Service]
ExecStart=/usr/sbin/in.tftpd -c -p -s /var/lib/tftpboot
StandardInput=socket

[Install]
WantedBy=multi-user.target
Also=tftp-server.socket
```

### 启动 TFTP 服务器

重新启动 systemd 守护进程：

```
systemctl daemon-reload
```

启动服务器：

```
systemctl enable --now tftp-server
```

要更改 TFTP 服务器允许上传和下载的权限，请使用此命令。注意 TFTP 是一种固有的不安全协议，因此不建议你在与其他人共享的网络上这样做。

```
chmod 777 /var/lib/tftpboot
```

配置防火墙让 TFTP 能够使用：

```
firewall-cmd --add-service=tftp --perm
firewall-cmd --reload
```

### 客户端配置

安装 TFTP 客户端

```
yum install tftp -y
```

运行 `tftp` 命令连接服务器。下面是一个启用详细信息选项的例子：

```
[client@thinclient:~ ]$ tftp 192.168.1.164
tftp> verbose
Verbose mode on.
tftp> get server.logs
getting from 192.168.1.164:server.logs to server.logs [netascii]
Received 7 bytes in 0.0 seconds [inf bits/sec]
tftp> quit
[client@thinclient:~ ]$
```

记住，因为 TFTP 没有列出服务器上文件的能力，因此，在你使用 `get` 命令之前需要知道文件的具体名称。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-set-up-a-tftp-server-on-fedora/

作者：[Curt Warfield][a]
选题：[lujun9972][b]
译者：[amwps290](https://github.com/amwps290)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/rcurtiswarfield/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/09/tftp-server-816x345.jpg
[2]: https://en.wikipedia.org/wiki/User_Datagram_Protocol
[3]: https://docs.fedoraproject.org/en-US/fedora/f30/install-guide/advanced/Network_based_Installations/
[4]: https://fedoramagazine.org/systemd-getting-a-grip-on-units/
[5]: https://unsplash.com/@laikanotebooks?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[6]: https://unsplash.com/search/photos/file-folders?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
