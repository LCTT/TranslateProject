如何使用 syslog-ng 从远程 Linux 机器上收集日志
======

![linuxhero.jpg][1]

如果你的数据中心全是 Linux 服务器，而你就是系统管理员。那么你的其中一项工作内容就是查看服务器的日志文件。但是，如果你在大量的机器上去查看日志文件，那么意味着你需要挨个去登入到机器中来阅读日志文件。如果你管理的机器很多，仅这项工作就可以花费你一天的时间。

另外的选择是，你可以配置一台单独的 Linux 机器去收集这些日志。这将使你的每日工作更加高效。要实现这个目的，有很多的不同系统可供你选择，而 syslog-ng 就是其中之一。

syslog-ng 的不足是文档并不容易梳理。但是，我已经解决了这个问题，我可以通过这种方法马上进行安装和配置 syslog-ng。下面我将在 Ubuntu Server 16.04 上示范这两种方法：

* UBUNTUSERVERVM 的 IP 地址是 192.168.1.118 ，将配置为日志收集器
* UBUNTUSERVERVM2 将配置为一个客户端，发送日志文件到收集器

现在我们来开始安装和配置。

### 安装

安装很简单。为了尽可能容易，我将从标准仓库安装。打开一个终端窗口，运行如下命令：

```
sudo apt install syslog-ng
```

你必须在收集器和客户端的机器上都要运行上面的命令。安装完成之后，你将开始配置。

### 配置收集器

现在，我们开始日志收集器的配置。它的配置文件是 `/etc/syslog-ng/syslog-ng.conf`。syslog-ng 安装完成时就已经包含了一个配置文件。我们不使用这个默认的配置文件，可以使用 `mv /etc/syslog-ng/syslog-ng.conf /etc/syslog-ng/syslog-ng.conf.BAK` 将这个自带的默认配置文件重命名。现在使用 `sudo nano /etc/syslog/syslog-ng.conf` 命令创建一个新的配置文件。在这个文件中添加如下的行：

```
@version: 3.5
@include "scl.conf"
@include "`scl-root`/system/tty10.conf"
    options {
        time-reap(30);
        mark-freq(10);
        keep-hostname(yes);
        };
    source s_local { system(); internal(); };
    source s_network {
        syslog(transport(tcp) port(514));
        };
    destination d_local {
    file("/var/log/syslog-ng/messages_${HOST}"); };
    destination d_logs {
        file(
            "/var/log/syslog-ng/logs.txt"
            owner("root")
            group("root")
            perm(0777)
            ); };
    log { source(s_local); source(s_network); destination(d_logs); };
```

需要注意的是，syslog-ng 使用 514 端口，你需要确保在你的网络上它可以被访问。

保存并关闭这个文件。上面的配置将转存期望的日志文件（由 `system()` 和 `internal()` 指出）到 `/var/log/syslog-ng/logs.txt` 中。因此，你需要使用如下的命令去创建所需的目录和文件：

```
sudo mkdir /var/log/syslog-ng
sudo touch /var/log/syslog-ng/logs.txt
```

使用如下的命令启动和启用 syslog-ng：

```
sudo systemctl start syslog-ng
sudo systemctl enable syslog-ng
```

### 配置客户端

我们将在客户端上做同样的事情（移动默认配置文件并创建新配置文件）。拷贝下列文本到新的客户端配置文件中：

```
@version: 3.5
@include "scl.conf"
@include "`scl-root`/system/tty10.conf"
source s_local { system(); internal(); };
destination d_syslog_tcp {
              syslog("192.168.1.118" transport("tcp") port(514)); };
log { source(s_local);destination(d_syslog_tcp); };
```

请注意：请将 IP 地址修改为收集器的 IP 地址。

保存和关闭这个文件。与在配置为收集器的机器上一样的方法启动和启用 syslog-ng。

## 查看日志文件

回到你的配置为收集器的服务器上，运行这个命令 `sudo tail -f /var/log/syslog-ng/logs.txt`。你将看到包含了收集器和客户端的日志条目的输出（图 A）。

![图 A][3]

恭喜你！syslog-ng 已经正常工作了。你现在可以登入到你的收集器上查看本地机器和远程客户端的日志了。如果你的数据中心有很多 Linux 服务器，在每台服务器上都安装上 syslog-ng 并配置它们作为客户端发送日志到收集器，这样你就不需要登入到每个机器去查看它们的日志了。

--------------------------------------------------------------------------------

via: https://www.techrepublic.com/article/how-to-use-syslog-ng-to-collect-logs-from-remote-linux-machines/

作者：[Jack Wallen][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:
[1]:https://tr1.cbsistatic.com/hub/i/r/2017/01/11/51204409-68e0-49b8-a637-01af26be85f6/resize/770x/688dfedad4ed30ec4baf548c2adb8cd4/linuxhero.jpg
[3]:https://tr4.cbsistatic.com/hub/i/2018/01/09/6a24e5c0-6a29-46d3-8a66-bc72747b5beb/6f94d3e6c6c2121fab6223ed9d8c6aa6/syslognga.jpg
