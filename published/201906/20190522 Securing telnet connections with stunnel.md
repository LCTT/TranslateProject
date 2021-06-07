[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10945-1.html)
[#]: subject: (Securing telnet connections with stunnel)
[#]: via: (https://fedoramagazine.org/securing-telnet-connections-with-stunnel/)
[#]: author: (Curt Warfield https://fedoramagazine.org/author/rcurtiswarfield/)

使用 stunnel 保护 telnet 连接
======

![][1]

Telnet 是一种客户端-服务端协议，通过 TCP 的 23 端口连接到远程服务器。Telnet 并不加密数据，因此它被认为是不安全的，因为数据是以明文形式发送的，所以密码很容易被嗅探。但是，仍有老旧系统需要使用它。这就是用到 **stunnel** 的地方。

stunnel 旨在为使用不安全连接协议的程序增加 SSL 加密。本文将以 telnet 为例介绍如何使用它。

### 服务端安装

[使用 sudo][2] 安装 stunnel 以及 telnet 的服务端和客户端：

```
sudo dnf -y install stunnel telnet-server telnet
```

添加防火墙规则，在提示时输入你的密码：

```
firewall-cmd --add-service=telnet --perm
firewall-cmd --reload
```

接下来，生成 RSA 私钥和 SSL 证书：

```
openssl genrsa 2048 > stunnel.key
openssl req -new -key stunnel.key -x509 -days 90 -out stunnel.crt
```

系统将一次提示你输入以下信息。当询问 `Common Name` 时，你必须输入正确的主机名或 IP 地址，但是你可以按回车键跳过其他所有内容。

```
You are about to be asked to enter information that will be
incorporated into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [XX]:
State or Province Name (full name) []:
Locality Name (eg, city) [Default City]:
Organization Name (eg, company) [Default Company Ltd]:
Organizational Unit Name (eg, section) []:
Common Name (eg, your name or your server's hostname) []:
Email Address []
```

将 RSA 密钥和 SSL 证书合并到单个 `.pem` 文件中，并将其复制到 SSL 证书目录：

```
cat stunnel.crt stunnel.key > stunnel.pem
sudo cp stunnel.pem /etc/pki/tls/certs/
```

现在可以定义服务和用于加密连接的端口了。选择尚未使用的端口。此例使用 450 端口进行隧道传输 telnet。编辑或创建 `/etc/stunnel/telnet.conf`：

```
cert = /etc/pki/tls/certs/stunnel.pem
sslVersion = TLSv1
chroot = /var/run/stunnel
setuid = nobody
setgid = nobody
pid = /stunnel.pid
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
[telnet]
accept = 450
connect = 23
```

`accept` 选项是服务器将监听传入 telnet 请求的接口。`connect` 选项是 telnet 服务器的内部监听接口。

接下来，创建一个 systemd 单元文件的副本来覆盖原来的版本：

```
sudo cp /usr/lib/systemd/system/stunnel.service /etc/systemd/system
```

编辑 `/etc/systemd/system/stunnel.service` 来添加两行。这些行在启动时为服务创建 chroot 监狱。

```
[Unit]
Description=TLS tunnel for network daemons
After=syslog.target network.target

[Service]
ExecStart=/usr/bin/stunnel
Type=forking
PrivateTmp=true
ExecStartPre=-/usr/bin/mkdir /var/run/stunnel
ExecStartPre=/usr/bin/chown -R nobody:nobody /var/run/stunnel

[Install]
WantedBy=multi-user.target
```

接下来，配置 SELinux 以在你刚刚指定的新端口上监听 telnet：

```
sudo semanage port -a -t telnetd_port_t -p tcp 450
```

最后，添加新的防火墙规则：

```
firewall-cmd --add-port=450/tcp --perm
firewall-cmd --reload
```

现在你可以启用并启动 telnet 和 stunnel。

```
systemctl enable telnet.socket stunnel@telnet.service --now
```

要注意 `systemctl` 命令是有顺序的。systemd 和 stunnel 包默认提供额外的[模板单元文件][3]。该模板允许你将 stunnel 的多个配置文件放到 `/etc/stunnel` 中，并使用文件名启动该服务。例如，如果你有一个 `foobar.conf` 文件，那么可以使用 `systemctl start stunnel@foobar.service` 启动该 stunnel 实例，而无需自己编写任何单元文件。

如果需要，可以将此 stunnel 模板服务设置为在启动时启动：

```
systemctl enable stunnel@telnet.service
```

### 客户端安装

本文的这部分假设你在客户端系统上以普通用户（[拥有 sudo 权限][2]）身份登录。安装 stunnel 和 telnet 客户端：

```
dnf -y install stunnel telnet
```

将 `stunnel.pem` 从远程服务器复制到客户端的 `/etc/pki/tls/certs` 目录。在此例中，远程 telnet 服务器的 IP 地址为 `192.168.1.143`。

```
sudo scp myuser@192.168.1.143:/etc/pki/tls/certs/stunnel.pem
/etc/pki/tls/certs/
```

创建 `/etc/stunnel/telnet.conf`：

```
cert = /etc/pki/tls/certs/stunnel.pem
client=yes
[telnet]
accept=450
connect=192.168.1.143:450
```

`accept` 选项是用于 telnet 会话的端口。`connect` 选项是你远程服务器的 IP 地址以及监听的端口。

接下来，启用并启动 stunnel：

```
systemctl enable stunnel@telnet.service --now
```

测试你的连接。由于有一条已建立的连接，你会 `telnet` 到 `localhost` 而不是远程 telnet 服务器的主机名或者 IP 地址。

```
[user@client ~]$ telnet localhost 450
Trying ::1...
telnet: connect to address ::1: Connection refused
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.

Kernel 5.0.9-301.fc30.x86_64 on an x86_64 (0)
server login: myuser
Password: XXXXXXX
Last login: Sun May  5 14:28:22 from localhost
[myuser@server ~]$
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/securing-telnet-connections-with-stunnel/

作者：[Curt Warfield][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/rcurtiswarfield/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/05/stunnel-816x345.jpg
[2]: https://fedoramagazine.org/howto-use-sudo/
[3]: https://fedoramagazine.org/systemd-template-unit-files/
