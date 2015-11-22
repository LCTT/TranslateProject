在 Ubuntu 15.04 上配置 OpenVPN 服务器和客户端
================================================================================
虚拟专用网（VPN）常指几种通过其它网络建立连接技术。它之所以被称为“虚拟”，是因为各个节点间的连接不是通过物理线路实现的，而“专用”是指如果没有网络所有者的正确授权是不能被公开访问到。

![](http://blog.linoxide.com/wp-content/uploads/2015/05/vpn_custom_illustration.jpg)

[OpenVPN][1]软件借助TUN/TAP驱动使用TCP和UDP协议来传输数据。UDP协议和TUN驱动允许NAT后的用户建立到OpenVPN服务器的连接。此外，OpenVPN允许指定自定义端口。它提供了更多的灵活配置，可以帮助你避免防火墙限制。

OpenVPN中，由OpenSSL库和传输层安全协议（TLS）提供了安全和加密。TLS是SSL协议的一个改进版本。

OpenSSL提供了两种加密方法：对称和非对称。下面，我们展示了如何配置OpenVPN的服务器端，以及如何配置使用带有公共密钥基础结构（PKI）的非对称加密和TLS协议。

### 服务器端配置 ###

首先，我们必须安装OpenVPN软件。在Ubuntu 15.04和其它带有‘apt’包管理器的Unix系统中，可以通过如下命令安装：

    sudo apt-get install openvpn

然后，我们必须配置一个密钥对，这可以通过默认的“openssl”工具完成。但是，这种方式十分难。这也是我们使用“easy-rsa”来实现此目的的原因。接下来的命令会将“easy-rsa”安装到系统中。

    sudo apt-get unstall easy-rsa

**注意**： 所有接下来的命令要以超级用户权限执行，如在使用`sudo -i`命令后执行，或者你可以使用`sudo -E`作为接下来所有命令的前缀。

开始之前，我们需要拷贝“easy-rsa”到openvpn文件夹。

    mkdir /etc/openvpn/easy-rsa
    cp -r /usr/share/easy-rsa /etc/openvpn/easy-rsa
    mv /etc/openvpn/easy-rsa/easy-rsa /etc/openvpn/easy-rsa/2.0

然后进入到该目录

    cd /etc/openvpn/easy-rsa/2.0

这里，我们开始密钥生成进程。

首先，我们编辑一个“vars”文件。为了简化生成过程，我们需要在里面指定数据。这里是“vars”文件的一个样例：

    export KEY_COUNTRY="CN"
    export KEY_PROVINCE="BJ"
    export KEY_CITY="Beijing"
    export KEY_ORG="Linux.CN"
    export KEY_EMAIL="open@vpn.linux.cn"
    export KEY_OU=server

希望这些字段名称对你而言已经很清楚，不需要进一步说明了。

其次，我们需要拷贝openssl配置。另外一个版本已经有现成的配置文件，如果你没有特定要求，你可以使用它的上一个版本。这里是1.0.0版本。

    cp openssl-1.0.0.cnf openssl.cnf

第三，我们需要加载环境变量，这些变量已经在前面一步中编辑好了。

    source ./vars

生成密钥的最后一步准备工作是清空旧的证书和密钥，以及生成新密钥的序列号和索引文件。可以通过以下命令完成。

    ./clean-all

现在，我们完成了准备工作，准备好启动生成进程了。让我们先来生成证书。

    ./build-ca

在对话中，我们可以看到默认的变量，这些变量是我们先前在“vars”中指定的。我们可以检查一下，如有必要进行编辑，然后按回车几次。对话如下

    Generating a 2048 bit RSA private key
    .............................................+++
    ...................................................................................................+++
    writing new private key to 'ca.key'
    -----
    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [CN]:
    State or Province Name (full name) [BJ]:
    Locality Name (eg, city) [Beijing]:
    Organization Name (eg, company) [Linux.CN]:
    Organizational Unit Name (eg, section) [Tech]:
    Common Name (eg, your name or your server's hostname) [Linux.CN CA]:
    Name [EasyRSA]:
    Email Address [open@vpn.linux.cn]:

接下来，我们需要生成一个服务器密钥

    ./build-key-server server

该命令的对话如下：

    Generating a 2048 bit RSA private key
    ........................................................................+++
    ............................+++
    writing new private key to 'server.key'
    -----
    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [CN]:
    State or Province Name (full name) [BJ]:
    Locality Name (eg, city) [Beijing]:
    Organization Name (eg, company) [Linux.CN]:
    Organizational Unit Name (eg, section) [Tech]:
    Common Name (eg, your name or your server's hostname) [Linux.CN server]:
    Name [EasyRSA]:
    Email Address [open@vpn.linux.cn]:

    Please enter the following 'extra' attributes
    to be sent with your certificate request
    A challenge password []:
    An optional company name []:
    Using configuration from /etc/openvpn/easy-rsa/2.0/openssl-1.0.0.cnf
    Check that the request matches the signature
    Signature ok
    The Subject's Distinguished Name is as follows
    countryName :PRINTABLE:'CN'
    stateOrProvinceName :PRINTABLE:'BJ'
    localityName :PRINTABLE:'Beijing'
    organizationName :PRINTABLE:'Linux.CN'
    organizationalUnitName:PRINTABLE:'Tech'
    commonName :PRINTABLE:'Linux.CN server'
    name :PRINTABLE:'EasyRSA'
    emailAddress :IA5STRING:'open@vpn.linux.cn'
    Certificate is to be certified until May 22 19:00:25 2025 GMT (3650 days)
    Sign the certificate? [y/n]:y
    1 out of 1 certificate requests certified, commit? [y/n]y
    Write out database with 1 new entries
    Data Base Updated

这里，最后两个关于“签署证书”和“提交”的问题，我们必须回答“yes”。

现在，我们已经有了证书和服务器密钥。下一步，就是去省城Diffie-Hellman密钥。执行以下命令，耐心等待。在接下来的几分钟内，我们将看到许多点和加号。

    ./build-dh

该命令的输出样例如下

    Generating DH parameters, 2048 bit long safe prime, generator 2
    This is going to take a long time
    ................................+................<许多的点>

在漫长的等待之后，我们可以继续生成最后的密钥了，该密钥用于TLS验证。命令如下：

    openvpn --genkey --secret keys/ta.key

现在，生成完毕，我们可以移动所有生成的文件到最后的位置中。

    cp -r /etc/openvpn/easy-rsa/2.0/keys/ /etc/openvpn/

最后，我们来创建OpenVPN配置文件。让我们从样例中拷贝过来吧：

    cp /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz /etc/openvpn/
    cd /etc/openvpn
    gunzip -d /etc/openvpn/server.conf.gz

然后编辑

    vim /etc/openvpn/server.conf

我们需要指定密钥的自定义路径

    ca /etc/openvpn/keys/ca.crt
    cert /etc/openvpn/keys/server.crt
    key /etc/openvpn/keys/server.key # This file should be kept secret
    dh /etc/openvpn/keys/dh2048.pem

一切就绪。在重启OpenVPN后，服务器端配置就完成了。

    service openvpn restart

### Unix的客户端配置 ###

假定我们有一台装有类Unix操作系统的设备，比如Ubuntu 15.04，并安装有OpenVPN。我们想要连接到前面建立的OpenVPN服务器。首先，我们需要为客户端生成密钥。为了生成该密钥，请转到服务器上的对应目录中：

    cd /etc/openvpn/easy-rsa/2.0

加载环境变量

    source vars

然后创建客户端密钥

    ./build-key client

我们将看到一个与先前关于服务器密钥生成部分的章节描述一样的对话，填入客户端的实际信息。

如果需要密码保护密钥，你需要运行另外一个命令，命令如下

    ./build-key-pass client

在此种情况下，在建立VPN连接时，会提示你输入密码。

现在，我们需要将以下文件从服务器拷贝到客户端/etc/openvpn/keys/文件夹。

服务器文件列表：

- ca.crt,
- dh2048.pem,
- client.crt,
- client.key,
- ta.key.

在此之后，我们转到客户端，准备配置文件。配置文件位于/etc/openvpn/client.conf，内容如下

    dev tun
    proto udp

    # 远程 OpenVPN 服务器的 IP 和 端口号
    remote 111.222.333.444 1194

    resolv-retry infinite

    ca /etc/openvpn/keys/ca.crt
    cert /etc/openvpn/keys/client.crt
    key /etc/openvpn/keys/client.key
    tls-client
    tls-auth /etc/openvpn/keys/ta.key 1
    auth SHA1
    cipher BF-CBC
    remote-cert-tls server
    comp-lzo
    persist-key
    persist-tun

    status openvpn-status.log
    log /var/log/openvpn.log
    verb 3
    mute 20

在此之后，我们需要重启OpenVPN以接受新配置。

    service openvpn restart

好了，客户端配置完成。

### 安卓客户端配置 ###

安卓设备上的OpenVPN配置和Unix系统上的十分类似，我们需要一个含有配置文件、密钥和证书的包。文件列表如下：

- 配置文件 (扩展名 .ovpn),
- ca.crt,
- dh2048.pem,
- client.crt,
- client.key.

客户端密钥生成方式和先前章节所述的一样。

配置文件内容如下

    client tls-client
    dev tun
    proto udp

    # 远程 OpenVPN 服务器的 IP 和 端口号
    remote 111.222.333.444 1194

    resolv-retry infinite
    nobind
    ca ca.crt
    cert client.crt
    key client.key
    dh dh2048.pem
    persist-tun
    persist-key

    verb 3
    mute 20

所有这些文件我们必须移动我们设备的SD卡上。

然后，我们需要安装一个[OpenVPN Connect][2] 应用。

接下来，配置过程很是简单：

- 打开 OpenVPN 并选择“Import”选项
- 选择“Import Profile from SD card”
- 在打开的窗口中导航到我们放置好文件的目录，并选择那个 .ovpn 文件
- 应用会要求我们创建一个新的配置文件
- 点击“Connect”按钮并稍等一下

搞定。现在，我们的安卓设备已经通过安全的VPN连接连接到我们的专用网。

### 尾声 ###

虽然OpenVPN初始配置花费不少时间，但是简易的客户端配置为我们弥补了时间上的损失，也提供了从任何设备连接的能力。此外，OpenVPN提供了一个很高的安全等级，以及从不同地方连接的能力，包括位于NAT后面的客户端。因此，OpenVPN可以同时在家和企业中使用。

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/configure-openvpn-server-client-ubuntu-15-04/

作者：[Ivan Zabrovskiy][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/ivanz/
[1]:https://openvpn.net/
[2]:https://play.google.com/store/apps/details?id=net.openvpn.openvpn
