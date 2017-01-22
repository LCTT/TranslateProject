OpenSSL 在 Apache 和 Dovecot 下的使用：第一部分
============================================================

 ![OpenSSL](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/openssl.jpg?itok=RWoqdCAI "OpenSSL") 
在这有两部分的系列中，Carla Schroder 会向你展示如何创建自己的 OpenSSL 证书以及如何配置 Apache 和 Dovecot 来使用它们。

[Creative Commons Zero][1]Pixabay


这么长时间之后，我的读者们，这里是我给你们承诺的在 Apache 中使用 OpenSSL 的方法，下周你会看到在 Dovecot 中使用 SSL。 在这个分为两部分的系列中，我们将学习如何创建自己的 OpenSSL 证书，以及如何配置 Apache 和 Dovecot 来使用它们。

这些例子基于这些教程：

*   [给初学者看的在 Ubuntu Linux 上使用 Apache][3]
*   [给初学者看的在 Ubuntu Linux 上使用 Apache：第2部分][4]
*   [给初学者看的在 CentOS Linux 上使用 Apache][5]

### 创建你的证书

Debian/Ubuntu/Mint 存储私钥和符号链接到位于 `/etc/ssl` 中的证书中。与系统捆绑的证书保存在 `/usr/share/ca-certificates` 中。你安装或创建的证书在 `/usr/local/share/ca-certificates/` 中。

这个例子是对 Debian 而言。创建私钥和公用证书，将证书转换为正确的格式，并将其符号链接到正确的目录：

```

$ sudo openssl req -x509 -days 365 -nodes -newkey rsa:2048 \
   -keyout /etc/ssl/private/test-com.key -out \
   /usr/local/share/ca-certificates/test-com.crt
Generating a 2048 bit RSA private key
.......+++
......................................+++
writing new private key to '/etc/ssl/private/test-com.key'
-----
You are about to be asked to enter information that will 
be incorporated into your certificate request.
What you are about to enter is what is called a Distinguished 
Name or a DN. There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:US
State or Province Name (full name) [Some-State]:WA
Locality Name (eg, city) []:Seattle
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Alrac Writing Sweatshop
Organizational Unit Name (eg, section) []:home dungeon
Common Name (e.g. server FQDN or YOUR name) []:www.test.com
Email Address []:admin@test.com

$ sudo update-ca-certificates
Updating certificates in /etc/ssl/certs...
1 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...

Adding debian:test-com.pem
done.
done.
```

CentOS/Fedora 使用不同的文件结构，并不使用 `update-ca-certificates`，使用这个命令：

```

$ sudo openssl req -x509 -days 365 -nodes -newkey rsa:2048 \
   -keyout /etc/httpd/ssl/test-com.key -out \
   /etc/httpd/ssl/test-com.crt
```

最重要的条目是 Common Name，它必须与你的完全限定域名完全匹配。 这一切都是任意的。 用 `-nodes` 创建一个无密码的证书，这是Apache所必需的。用 `-days` 定义过期日期。这是一个麻烦的更新证书的方法，但它应该能够提供一些额外的安全。参见[ 90 天证书有效期的利弊][10]，以便进行良好的讨论。

### 配置 Apache

现在配置 Apache 以使用你的新证书。如果你遵循[给初学者看的在 Ubuntu Linux 上使用 Apache：第2部分][11]，你所要做的就是修改虚拟主机配置中的 `SSLCertificateFile` 和 `SSLCertificateKeyFile`，以指向你的新私钥和公共证书。本教程中的 `test.com` 示例现在看起来像这样：

```

SSLCertificateFile /etc/ssl/certs/test-com.pem
SSLCertificateKeyFile /etc/ssl/private/test-com.key
```

CentOS 用户，请参阅在 CentOS wiki 中[使用 CentOS 设置 SSL 加密的 Web 服务器][12]。过程是类似的，wiki 会告诉如何处理 SELinux。

### 测试 Apache SSL

一个简单的方法是将你的网络浏览器指向 [https://yoursite.com][13]，看看它是否可以正常工作。在第一次这样做时，你会在你过度保护的 web 浏览器中看到可怕的警告说网站是不安全的，因为它使用的是自签名证书。请忽略你的浏览器并单击屏幕创建永久性异常。 如果你遵循在[给初学者看的在 Ubuntu Linux 上使用 Apache：第2部分][14]上的示例虚拟主机配置，那么即使你的网站访问者尝试使用纯 HTTP，你的网站的所有流量都将被迫通过 HTTPS。

一个很好测试方法是使用OpenSSL。是的，有一个漂亮的命令来测试这些东西。试下这个：

```

$ openssl s_client -connect www.test.com:443
CONNECTED(00000003)
depth=0 C = US, ST = WA, L = Seattle, O = Alrac Writing Sweatshop, 
OU = home dungeon, CN = www.test.com, emailAddress = admin@test.com
verify return:1
---
Certificate chain
 0 s:/C=US/ST=WA/L=Seattle/O=Alrac Writing Sweatshop/OU=home 
     dungeon/CN=www.test.com/emailAddress=admin@test.com
   i:/C=US/ST=WA/L=Seattle/O=Alrac Writing Sweatshop/OU=home 
     dungeon/CN=www.test.com/emailAddress=admin@test.com
---
Server certificate
-----BEGIN CERTIFICATE-----
[...]
```

这里输出了大量的信息。这里有很多关于 `openssl s_client` 的有趣信息; 现在足够我们知道我们的 web 服务器是否使用了正确的 SSL 证书。

### 创建一个证书签名请求

如果你决定使用第三方证书颁发机构（CA），那么就必须创建证书签名请求（CSR）。你将它发送给你的新 CA，他们将签署并将其发送给您。他们可能有自己的要求来创建你的 CSR; 这是如何创建一个新的私钥和 CSR 的示例：

```

$ openssl req -newkey rsa:2048 -nodes \
   -keyout yourdomain.key -out yourdomain.csr
```

你可以从一个已经存在的 key 中创建一个 CSR：

```

$ openssl req  -key yourdomain.key \
   -new -out domain.csr
```

今天就是这样了。下周我们将[学习如何正确地在 Dovecot 中设置 OpenSSL][15]。

### 额外的教程

[消灭让人害怕的 web 浏览器 SSL 警告][16]
[如何在 Linux 上使用 OpenVPN 设置安全远程网络：第一部分][17]
[如何在 Linux 上使用 OpenVPN 设置安全远程网络：第一部分][18]

_提高你的系统管理职业生涯吧！查看Linux基金会的[ ][6][系统管理的要点][7][ ][8]课程。_

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/sysadmin/openssl-apache-and-dovecot

作者：[CARLA SCHRODER][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/openssljpg
[3]:https://www.linux.com/learn/apache-ubuntu-linux-beginners
[4]:https://www.linux.com/learn/apache-ubuntu-linux-beginners-part-2
[5]:https://www.linux.com/learn/apache-centos-linux-beginners
[6]:https://training.linuxfoundation.org/linux-courses/system-administration-training/essentials-of-system-administration
[7]:https://training.linuxfoundation.org/linux-courses/system-administration-training/essentials-of-system-administration
[8]:https://training.linuxfoundation.org/linux-courses/system-administration-training/essentials-of-system-administration
[9]:https://www.addtoany.com/share#url=https%3A%2F%2Fwww.linux.com%2Flearn%2Fsysadmin%2Fopenssl-apache-and-dovecot&title=OpenSSL%20For%20Apache%20and%20Dovecot%20
[10]:https://community.letsencrypt.org/t/pros-and-cons-of-90-day-certificate-lifetimes/4621
[11]:https://www.linux.com/learn/apache-ubuntu-linux-beginners-part-2
[12]:https://wiki.centos.org/HowTos/Https
[13]:https://yoursite.com/
[14]:https://www.linux.com/learn/apache-ubuntu-linux-beginners-part-2
[15]:https://www.linux.com/learn/intro-to-linux/openssl-apache-and-dovecot-part-2
[16]:https://www.linux.com/learn/quieting-scary-web-browser-ssl-alerts
[17]:https://www.linux.com/learn/how-set-secure-remote-networking-openvpn-linux-part-1
[18]:https://www.linux.com/learn/how-set-secure-remote-networking-openvpn-linux-part-2
