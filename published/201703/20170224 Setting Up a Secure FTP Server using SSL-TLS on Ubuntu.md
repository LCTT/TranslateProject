在 Ubuntu 上使用 SSL/TLS 搭建一个安全的 FTP 服务器
============================================================

在本教程中，我们将介绍如何使用 Ubuntu 16.04 / 16.10 中的 SSL / TLS 保护 FTP 服务器（FTPS）。

如果你想为基于 CentOS 的发行版安装一个安全的 FTP 服务器，你可以阅读 – [在 CentOS 上使用 SSL / TLS 保护 FTP 服务器][2]。

在遵循本指南中的各个步骤之后，我们将了解在 FTP 服务器中启用加密服务的基本原理，以确保安全的数据传输至关重要。


### 要求

- 你必须已经[在 Ubuntu 上安装和配置好一个 FTP 服务器][1]

在我们进行下一步之前，确保本文中的所有命令都将以root身份或者 [sudo 特权账号][3]运行。

### 第一步：在 Ubuntu 上为 FTP 生成 SSL/TLS 证书

1、我们将首先在 `/etc/ssl/` 下创建一个子目录来存储 SSL/TLS 证书和密钥文件，如果它不存在的话这样做：

```
$ sudo mkdir /etc/ssl/private
```

2、 现在我们在一个单一文件中生成证书和密钥，运行下面的命令：

```
$ sudo openssl req -x509 -nodes -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -days 365 -newkey rsa:2048
```

上面的命令将提示你回答以下问题，不要忘了输入合适于你情况的值：

```
Country Name (2 letter code) [XX]:IN
State or Province Name (full name) []:Lower Parel
Locality Name (eg, city) [Default City]:Mumbai
Organization Name (eg, company) [Default Company Ltd]:TecMint.com
Organizational Unit Name (eg, section) []:Linux and Open Source
Common Name (eg, your name or your server's hostname) []:tecmint
Email Address []:admin@tecmint.com
```

### 第二步：在 Ubuntu 上配置 vsftpd 来使用 SSL/TLS

3、在我们进行 vsftpd 配置之前，对于那些[已启用 UFW 防火墙][4]的用户，你们必须打开端口 `990` 和 `40000` - `50000`，来在 vsftpd 配置文件中分别启用 TLS 连接端口和被动端口的端口范围：

```
$ sudo ufw allow 990/tcp
$ sudo ufw allow 40000:50000/tcp
$ sudo ufw status
```

4、现在，打开 vsftpd 配置文件并定义 SSL 详细信息：

```
$ sudo vi /etc/vsftpd/vsftpd.conf
或
$ sudo nano /etc/vsftpd/vsftpd.conf
```

然后，添加或找到选项 `ssl_enable`，并将它的值设置为 `YES` 来激活使用 SSL ，同样，因为 TLS 比 SSL 更安全，我们将通过启用 `ssl_tlsv1` 选项限制 vsftpd 只使用 TLS：

```
ssl_enable=YES
ssl_tlsv1=YES
ssl_sslv2=NO
ssl_sslv3=NO
```

5、 接下来，使用 `＃` 字符注释掉下面的行，如下所示：

```
#rsa_cert_file=/etc/ssl/private/ssl-cert-snakeoil.pem
#rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
```

然后，添加以下行以定义 SSL 证书和密钥文件的位置（LCTT 译注：或径直修改也可）：

```
rsa_cert_file=/etc/ssl/private/vsftpd.pem
rsa_private_key_file=/etc/ssl/private/vsftpd.pem
```

6、现在，我们也可以阻止匿名用户使用 SSL 登录，并且迫使所有的非匿名登录使用安全的 SSL 链接来传输数据和在登录期间发送密码：

```
allow_anon_ssl=NO
force_local_data_ssl=YES
force_local_logins_ssl=YES
```

7、此外，我们可以使用以下选项在 FTP 服务器中添加更多的安全功能 。对于选项 `require_ssl_reuse=YES`，它表示所有的 SSL 数据链接都需重用已经建立的 SSL 会话（需要证明客户端拥有 FTP 控制通道的主密钥），但是一些客户端不支持它，如果没有客户端问题，出于安全原因不应该关闭（默认开启）。（LCTT 译注：原文此处理解有误，译者修改。）

```
require_ssl_reuse=NO
```

此外，我们可以通过 `ssl_ciphers` 选项来设置 vsftpd 允许使用那些加密算法。 这将有助于挫败攻击者使用那些已经发现缺陷的加密算法的尝试：

```
ssl_ciphers=HIGH
```

8、 然后，我们定义被动端口的端口范围（最小和最大端口）。

```
pasv_min_port=40000
pasv_max_port=50000
```

9、 要启用 SSL 调试，把 openSSL 连接诊断记录到 vsftpd 日志文件中，我们可以使用 `debug_ssl` 选项：

```
debug_ssl=YES
```

最后，保存配置文件并且关闭它。然后重启 vsftpd 服务：

```
$ systemctl restart vsftpd
```

### 第三步：在 Ubuntu 上使用 SSL / TLS 连接验证 FTP

10、 执行所有上述配置后，通过尝试[在命令行中使用 FTP] [5] 来测试 vsftpd 是否现在使用了 SSL / TLS 连接，如下所示。

从下面的输出来看，这里有一个错误的信息告诉我们 vsftpd 仅允许用户（非匿名用户）从支持加密服务的安全客户端登录。

```
$ ftp 192.168.56.10
Connected to 192.168.56.10  (192.168.56.10).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.10:root) : ravi
530 Non-anonymous sessions must use encryption.
Login failed.
421 Service not available, remote server has closed connection
ftp>
```

该命令不支持加密服务从而导致了上述错误。因此，要安全连接到启用了加密服务的 FTP 服务器，我们需要一个默认支持 SSL/TLS 连接的 FTP 客户端，例如 FileZilla。

### 第四步：在客户端上安装FileZillaStep来安全地连接FTP

11、FileZilla 是一个强大的，广泛使用的跨平台 FTP 客户端，支持在 SSL/TLS 上的 FTP。为了在 Linux 客户端机器上安装 FileZilla，使用下面的命令。

```
--------- On Debian/Ubuntu ---------
$ sudo apt-get install filezilla   
--------- On CentOS/RHEL/Fedora --------- 
# yum install epel-release filezilla
--------- On Fedora 22+ --------- 
$ sudo dnf install filezilla
```

12、 一旦安装完成，打开它然后点击File=>Sites Manager或者（按Ctrl+S）来获取下面的Site Manager。

[
 ![Filezilla Site Manager](http://www.tecmint.com/wp-content/uploads/2017/02/Filezilla-Site-Manager.png) 
][6]

*Filezilla Site Manager*

13、 现在，定义主机/站点名字，添加 IP 地址，定义使用的协议，加密和登录类型，如下面的屏幕（使用适用于你方案的值）：

点击 New Site 按钮来配置一个新的站点/主机连接。

- Host:  192.168.56.10
- Protocol:  FTP – File Transfer Protocol
- Encryption:  Require explicit FTP over   #推荐 
- Logon Type: Ask for password	        #推荐 
- User: 用户名

[
 ![在Filezilla上配置新的FTP站点](http://www.tecmint.com/wp-content/uploads/2017/02/Configure-New-FTP-Site-on-Filezilla.png) 
][7]

*在 Filezilla 上配置新的 FTP 站点*

14、 然后从上面的界面单击连接以输入密码，然后验证用于 SSL / TLS 连接的证书，并再次单击确定以连接到 FTP 服务器：

[
 ![验证FTP的SSL证书](http://www.tecmint.com/wp-content/uploads/2017/02/Verify-FTP-SSL-Certificate-1.png) 
][8]

*验证 FTP 的 SSL 证书*

15、现在，你应该通过 TLS 连接成功地登录到了 FTP 服务器，检查连接状态部分，来获取有关下面接口的更多信息。

[
 ![连接Ubuntu的FTP服务器](http://www.tecmint.com/wp-content/uploads/2017/02/Connected-Ubuntu-FTP-Server.png) 
][9]

*连接 Ubuntu 的 FTP 服务器*

16、 最后，让我们在文件夹中[从本地的机器传送文件到 FTP 服务器][10], 查看 FileZilla 界面的下端来查看有关文件传输的报告。

[
 ![使用Filezilla安全的传输FTP文件](http://www.tecmint.com/wp-content/uploads/2017/02/Transfer-Files-Securely-using-FTP.png) 
][11]

*使用 Filezilla 安全的传输 FTP 文件*

就这样！ 始终记住，安装 FTP 服务器而不启用加密服务具有某些安全隐患。 正如我们在本教程中解释的，您可以在  Ubuntu 16.04 / 16.10 中配置 FTP 服务器使用 SSL / TLS 连接来实现安全性。

如果你在 FTP 服务器上设置 SSL/TLS 遇到任何问题，请使用以下评论表单来分享您对本教程/主题的问题或想法。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，即将成为 Linux SysAdmin 和网络开发人员，目前是 TecMint 的内容创作者，他喜欢在电脑上工作，并坚信分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/secure-ftp-server-using-ssl-tls-on-ubuntu/

作者：[Aaron Kili][a]
译者：[DockerChen](https://github.com/DockerChen)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/install-ftp-server-in-ubuntu/
[2]:http://www.tecmint.com/axel-commandline-download-accelerator-for-linux/
[3]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[4]:http://www.tecmint.com/how-to-install-and-configure-ufw-firewall/
[5]:http://www.tecmint.com/sftp-command-examples/
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/Filezilla-Site-Manager.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/Configure-New-FTP-Site-on-Filezilla.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/02/Verify-FTP-SSL-Certificate-1.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/02/Connected-Ubuntu-FTP-Server.png
[10]:http://www.tecmint.com/sftp-command-examples/
[11]:http://www.tecmint.com/wp-content/uploads/2017/02/Transfer-Files-Securely-using-FTP.png
[12]:http://www.tecmint.com/author/aaronkili/
[13]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[14]:http://www.tecmint.com/free-linux-shell-scripting-books/