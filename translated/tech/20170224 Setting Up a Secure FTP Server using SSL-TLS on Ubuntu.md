

在Ubuntu上使用SSL/TLS搭建一个安全的FTP服务器
============================================================

 立即下载你的免费电子书 - [10本免费的Linux管理员电子书][13] | [4本免费的shell脚本电子书][14]

在本教程中，我们将介绍如何使用Ubuntu 16.04 / 16.10中的SSL / TLS保护FTP服务器（VSFTPD代表“非常安全的FTP守护进程”）。

如果你想为基于CentOS的发行版安装一个安全的FTP服务器，你可以阅读 – [在CentOS上使用SSL / TLS保护FTP服务器][2]

在遵循本指南中的各个步骤之后，我们将了解在FTP服务器中启用加密服务的基本原理，以确保安全的数据传输至关重要。


####要求

1.  你必须 [在Ubuntu上安装和配置一个FTP服务器][1]

在我们进行下一步之前，确保本文中的所有命令都将以root身份运行或者
Before we move further, make sure that all commands in this article will be run as root or [sudo特权账号][3].

### 第一步：在Ubuntu上为FTP生成SSL/TLS证书
1.我们将首先在/etc/ssl/下创建一个子目录，来存储SSL/TLS证书和密钥文件，如果它不存在：

```
$ sudo mkdir /etc/ssl/private
```

2. 现在我们在这个单一的文件中生成证书和密钥，通过运行下面的命令。

```
$ sudo openssl req -x509 -nodes -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -days 365 -newkey rsa:2048
```

上面的命令将提示你回答以下问题，不要忘了输入合适于脚本的值。
```
Country Name (2 letter code) [XX]:IN
State or Province Name (full name) []:Lower Parel
Locality Name (eg, city) [Default City]:Mumbai
Organization Name (eg, company) [Default Company Ltd]:TecMint.com
Organizational Unit Name (eg, section) []:Linux and Open Source
Common Name (eg, your name or your server's hostname) []:tecmint
Email Address []:admin@tecmint.com
```

### 第二步：在Ubuntu上配置VSFTPD来使用SSL/TLS

3.在我们进行VSFTPD配置之前，对于[UFW防火墙已启用][4]的用户，你们必须打开端口990和40000-50000，来允许在VSFTD配置文件中分别设置TLS连接和被动端口的端口范围：
```
$ sudo ufw allow 990/tcp
$ sudo ufw allow 40000:50000/tcp
$ sudo ufw status
```

4. 现在，打开VSFTPD配置文件并定义SSL详细信息：

```
$ sudo vi /etc/vsftpd/vsftpd.conf
OR
$ sudo nano /etc/vsftpd/vsftpd.conf
```

然后，添加或定位选项`ssl_enable`并将它的值设置为YES来激活SSL的使用，同样，因为TLS比SSL更安全，我们将通过启用`ssl_tlsv1`选项限制VSFTPD使用TLS：


```
ssl_enable=YES
ssl_tlsv1=YES
ssl_sslv2=NO
ssl_sslv3=NO
```

5. 接下来，使用`＃`字符注释掉下面的行，如下所示：

```
#rsa_cert_file=/etc/ssl/private/ssl-cert-snakeoil.pem
#rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
```

然后，添加以下行以定义SSL证书和密钥文件的位置：

```
rsa_cert_file=/etc/ssl/private/vsftpd.pem
rsa_private_key_file=/etc/ssl/private/vsftpd.pem
```

6.现在，我们也可以阻止匿名的用户使用SSL登陆，并且迫使所有的非匿名登陆使用一个安全的SSL链接来传输数据，而且在登陆的期间发送密码：

```
allow_anon_ssl=NO
force_local_data_ssl=YES
force_local_logins_ssl=YES
```

7.此外，我们可以使用以下选项在FTP服务器中添加更多的安全功能 。使用选项`require_ssl_reuse=YES`，所用的SSL数据链接都需要展示SSL会话重用；证明他们知道和控制信道相同的主秘密。所以，我们应该禁用它。


```
require_ssl_reuse=NO
```

此外，我们可以设置VSFTPD允许使用`ssl_ciphers`选项进行加密SSL连接的SSL密码。 这将有助于挫败攻击者的任何努力尝试强制得到一个特定的密码，来发现的漏洞：

```
ssl_ciphers=HIGH
```


8. 然后，我们定义被动端口的端口范围（最小和最大端口）。

```
pasv_min_port=40000
pasv_max_port=50000
```

9. 要启用SSL调试，意味着openSSL连接诊断记录到VSFTPD日志文件，我们可以使用`debug_ssl`选项：
```
debug_ssl=YES
```

最后，保存文件并且关闭它。然后重启VSFTPD服务：

```
$ systemctl restart vsftpd
```

### 第三步：在Ubuntu上使用SSL / TLS连接验证FTP

10. 执行所有上述配置后，通过尝试[使用命令行中的FTP] [5]测试VSFTPD是否现在使用SSL / TLS连接，如下所示。

从下面的输出来看，这里有一个错误的信息告诉我们VSFTPD仅允许用户（非匿名用户）从支持加密服务的安全客户端登陆。


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

这个命令行不支持加密服务从而导致了上述错误。因此，要安全连接到启用了加密服务的FTP服务器，我们需要一个默认支持SSL/TLS连接的FTP客户端，例如FileZilla。

### 第四步：在客户端上安装FileZillaStep来安全地连接FTP

FileZilla是一个强大的，广泛使用的跨平台FTP客户端，支持在SSL/TLS上的FTP。为了在Linux客户端机器上安装FileZilla，使用下面的命令。

```
--------- On Debian/Ubuntu ---------
$ sudo apt-get install filezilla   
--------- On CentOS/RHEL/Fedora --------- 
# yum install epel-release filezilla
--------- On Fedora 22+ --------- 
$ sudo dnf install filezilla
```

12. 一旦安装完成，打开它然后点击File=>Sites Manager或者（按Ctrl+S）来获取下面的Site Manager。

[
 ![Filezilla Site Manager](http://www.tecmint.com/wp-content/uploads/2017/02/Filezilla-Site-Manager.png) 
][6]

Filezilla Site Manager

13. 现在，定义主机/站点名字，添加IP地址，定义使用的协议，加密和登陆类型，如下面的屏幕（使用适用于你方案的值）：

点击New Site按钮来配置一个新的站点/主机连接。

```
Host:  192.168.56.10
Protocol:  FTP – File Transfer Protocol
Encryption:  Require explicit FTP over   #recommended 
Logon Type: Ask for password	        #recommended 
User: username
```
[
 ![在Filezilla上配置新的FTP站点](http://www.tecmint.com/wp-content/uploads/2017/02/Configure-New-FTP-Site-on-Filezilla.png) 
][7]

在Filezilla上配置新的FTP站点

14. 然后从上面的界面单击连接以输入密码，然后验证用于SSL / TLS连接的证书，并再次单击确定以连接到FTP服务器：
[
 ![验证FTP的SSL证书](http://www.tecmint.com/wp-content/uploads/2017/02/Verify-FTP-SSL-Certificate-1.png) 
][8]

验证FTP的SSL证书

15.现在，你应该通过TLS连接成功地登陆到FTP服务器，检查连接状态部分，来获取有关下面接口的更多信息。

[
 ![连接Ubuntu的FTP服务器](http://www.tecmint.com/wp-content/uploads/2017/02/Connected-Ubuntu-FTP-Server.png) 
][9]

连接Ubuntu的FTP服务器

16. 最后，让我们[从本地的机器传送文件到FTP服务器][10]在文件夹中, 查看FileZilla接口的下端来查看有关文件传输的报告。

[
 ![使用Filezilla安全的传输FTP文件](http://www.tecmint.com/wp-content/uploads/2017/02/Transfer-Files-Securely-using-FTP.png) 
][11]

使用Filezilla安全的传输FTP文件

就这样！ 始终记住，安装FTP服务器而不启用加密服务具有某些安全隐患。 正如我们在本教程中解释的，您可以配置FTP服务器使用SSL / TLS连接来实现Ubuntu 16.04 / 16.10中的安全性。

如果你在FTP服务器上设置SSL/TLS遇到任何问题，请使用以下注释表单来分享您对本教程/主题的问题或想法。

--------------------------------------------------------------------------------


作者简介：

Aaron Kili是Linux和F.O.S.S爱好者，即将推出的Linux SysAdmin网络开发人员，目前是TecMint的内容创作者，他喜欢与电脑合作，并坚信分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/secure-ftp-server-using-ssl-tls-on-ubuntu/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/DockerChen)
校对：[校对者ID](https://github.com/校对者ID)

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