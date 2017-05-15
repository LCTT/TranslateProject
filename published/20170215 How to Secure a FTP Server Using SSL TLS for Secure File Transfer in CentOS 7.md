如何在 CentOS 7 中使用 SSL/TLS 加固 FTP 服务器进行安全文件传输
============================================================

在一开始的设计中，FTP（文件传输协议）就是不安全的，意味着它不会加密两台机器之间传输的数据以及用户的凭据。这使得数据和服务器安全面临很大威胁。

在这篇文章中，我们会介绍在 CentOS/RHEL 7 以及 Fedora 中如何在 FTP 服务器中手动启用数据加密服务；我们会介绍使用 SSL/TLS 证书保护 VSFTPD（Very Secure FTP Daemon）服务的各个步骤。

#### 前提条件：

- 你必须已经[在 CentOS 7 中安装和配置 FTP 服务][1] 。

在我们开始之前，要注意本文中所有命令都以 root 用户运行，否则，如果现在你不是使用 root 用户控制服务器，你可以使用 [sudo 命令][2] 去获取 root 权限。

### 第一步：生成 SSL/TLS 证书和密钥

1、 我们首先要在 `/etc/ssl` 目录下创建用于保存 SSL/TLS 证书和密钥文件的子目录：

```
# mkdir /etc/ssl/private
```

2、 然后运行下面的命令为 vsftpd 创建证书和密钥并保存到一个文件中，下面会解析使用的每个选项。

1.	`req` - 是 X.509 Certificate Signing Request （CSR，证书签名请求）管理的一个命令。
2.	`x509` - X.509 证书数据管理。
3.	`days` - 定义证书的有效日期。
4.	`newkey` - 指定证书密钥处理器。
5.	`rsa:2048` - RSA 密钥处理器，会生成一个 2048 位的密钥。
6.	`keyout` - 设置密钥存储文件。
7.	`out` - 设置证书存储文件，注意证书和密钥都保存在一个相同的文件：/etc/ssl/private/vsftpd.pem。

```
# openssl req -x509 -nodes -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -days 365 -newkey rsa:2048
```

上面的命令会让你回答以下的问题，记住使用你自己情况的值。

```
Country Name (2 letter code) [XX]:IN
State or Province Name (full name) []:Lower Parel
Locality Name (eg, city) [Default City]:Mumbai
Organization Name (eg, company) [Default Company Ltd]:TecMint.com
Organizational Unit Name (eg, section) []:Linux and Open Source
Common Name (eg, your name or your server's hostname) []:tecmint
Email Address []:admin@tecmint.com
```

### 第二步：配置 VSFTPD 使用 SSL/TLS

3、 在我们进行任何 VSFTPD 配置之前，首先开放 990 和 40000-50000 端口，以便在 VSFTPD 配置文件中分别定义 TLS 连接的端口和被动端口的端口范围：

```
# firewall-cmd --zone=public --permanent --add-port=990/tcp
# firewall-cmd --zone=public --permanent --add-port=40000-50000/tcp
# firewall-cmd --reload
```

4、 现在，打开 VSFTPD 配置文件并在文件中指定 SSL 的详细信息：

```
# vi /etc/vsftpd/vsftpd.conf
```

找到 `ssl_enable` 选项把它的值设置为 `YES` 激活使用 SSL，另外，由于 TSL 比 SSL 更安全，我们会使用 `ssl_tlsv1_2` 选项让 VSFTPD 使用更严格的 TLS：

```
ssl_enable=YES
ssl_tlsv1_2=YES
ssl_sslv2=NO
ssl_sslv3=NO
```

5、 然后，添加下面的行来定义 SSL 证书和密钥文件的位置：

```
rsa_cert_file=/etc/ssl/private/vsftpd.pem
rsa_private_key_file=/etc/ssl/private/vsftpd.pem
```

6、 下面，我们要阻止匿名用户使用 SSL，然后强制所有非匿名用户登录使用安全的 SSL 连接进行数据传输和登录过程中的密码发送：

```
allow_anon_ssl=NO
force_local_data_ssl=YES
force_local_logins_ssl=YES
```

7、 另外，我们还可以添加下面的选项增强 FTP 服务器的安全性。当选项 `require_ssl_reuse` 被设置为 `YES` 时，要求所有 SSL 数据连接都会重用 SSL 会话；这样它们会知道控制通道的主密码。

因此，我们需要把它关闭。

```
require_ssl_reuse=NO
```

另外，我们还要用 `ssl_ciphers` 选项选择 VSFTPD 允许用于加密 SSL 连接的 SSL 算法。这可以极大地限制那些尝试发现使用存在缺陷的特定算法的攻击者：

```
ssl_ciphers=HIGH
```

8、 现在，设置被动端口的端口范围（最小和最大端口）。
```
pasv_min_port=40000
pasv_max_port=50000
```

9、 选择性启用 `debug_ssl` 选项以允许 SSL 调试，这意味着 OpenSSL 连接诊断会被记录到 VSFTPD 日志文件：

```
debug_ssl=YES
```

保存所有更改并关闭文件。然后让我们重启 VSFTPD 服务：

```
# systemctl restart vsftpd
```

### 第三步：用 SSL/TLS 连接测试 FTP 服务器

10、 完成上面的所有配置之后，像下面这样通过在命令行中尝试使用 FTP 测试 VSFTPD 是否使用 SSL/TLS 连接：

```
# ftp 192.168.56.10
Connected to 192.168.56.10  (192.168.56.10).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.10:root) : ravi
530 Non-anonymous sessions must use encryption.
Login failed.
421 Service not available, remote server has closed connection
ftp>
```

[
 ![验证 FTP SSL 安全连接](http://www.tecmint.com/wp-content/uploads/2017/02/Verify-FTP-Secure-Connection.png) 
][3]

*验证 FTP SSL 安全连接*

从上面的截图中，我们可以看到这里有个错误提示我们 VSFTPD 只允许用户从支持加密服务的客户端登录。

命令行并不会提供加密服务因此产生了这个错误。因此，为了安全地连接到服务器，我们需要一个支持 SSL/TLS 连接的 FTP 客户端，例如 FileZilla。

### 第四步：安装 FileZilla 以便安全地连接到 FTP 服务器

11、 FileZilla 是一个现代化、流行且重要的跨平台的 FTP 客户端，它默认支持 SSL/TLS 连接。

要在 Linux 上安装 FileZilla，可以运行下面的命令：

```
--------- On CentOS/RHEL/Fedora --------- 
# yum install epel-release filezilla
--------- On Debian/Ubuntu ---------
$ sudo apt-get install  filezilla   
```

12、 当安装完成后（或者你已经安装了该软件），打开它，选择 File => Sites Manager 或者按 `Ctrl + S` 打开 Site Manager 界面。

点击 New Site 按钮添加一个新的站点/主机连接详细信息。

[
 ![在 FileZilla 中添加新 FTP 站点](http://www.tecmint.com/wp-content/uploads/2017/02/Add-New-FTP-Site-in-Filezilla.png) 
][4]

*在 FileZilla 中添加新 FTP 站点*

13. 下一步，像下面这样设置主机/站点名称、添加 IP 地址、定义使用的协议、加密和登录类型（使用你自己情况的值）：

```
Host:  192.168.56.10
Protocol:  FTP – File Transfer Protocol
Encryption:  Require explicit FTP over   #recommended 
Logon Type: Ask for password	        #recommended 
User: username
```
[
 ![在 Filezilla 中添加 FTP 服务器详细信息](http://www.tecmint.com/wp-content/uploads/2017/02/Add-FTP-Server-Details-in-Filezilla.png) 
][5]

*在 Filezilla 中添加 FTP 服务器详细信息*

14、 然后点击 Connect，再次输入密码，然后验证用于 SSL/TLS 连接的证书，再一次点击 `OK` 连接到 FTP 服务器：

[
 ![验证 FTP SSL 证书](http://www.tecmint.com/wp-content/uploads/2017/02/Verify-FTP-SSL-Certificate.png) 
][6]

*验证 FTP SSL 证书*

到了这里，我们应该使用 TLS 连接成功地登录到了 FTP 服务器，在下面的界面中检查连接状态部分获取更多信息。

[
 ![通过 TLS/SSL 连接到 FTP 服务器](http://www.tecmint.com/wp-content/uploads/2017/02/connected-to-ftp-server-with-tls.png) 
][7]

*通过 TLS/SSL 连接到 FTP 服务器*

15、 最后，在文件目录尝试 [从本地传输文件到 FTP 服务器][8]，看 FileZilla 界面后面的部分查看文件传输相关的报告。

[
 ![使用 FTP 安全地传输文件](http://www.tecmint.com/wp-content/uploads/2017/02/Transfer-Files-Securely-Using-FTP.png) 
][9]

*使用 FTP 安全地传输文件*

就是这些。记住 FTP 默认是不安全的，除非我们像上面介绍的那样配置它使用 SSL/TLS 连接。在下面的评论框中和我们分享你关于这篇文章/主题的想法吧。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是一个 Linux 和 F.O.S.S 的爱好者，Linux 系统管理员，网络开发员，目前也是 TecMint 的内容创作者，他喜欢和电脑一起工作，并且坚信共享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/secure-vsftpd-using-ssl-tls-on-centos/

作者：[Aaron Kili][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/install-ftp-server-in-centos-7/
[2]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[3]:http://www.tecmint.com/wp-content/uploads/2017/02/Verify-FTP-Secure-Connection.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/02/Add-New-FTP-Site-in-Filezilla.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/02/Add-FTP-Server-Details-in-Filezilla.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/Verify-FTP-SSL-Certificate.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/connected-to-ftp-server-with-tls.png
[8]:http://www.tecmint.com/sftp-command-examples/
[9]:http://www.tecmint.com/wp-content/uploads/2017/02/Transfer-Files-Securely-Using-FTP.png
