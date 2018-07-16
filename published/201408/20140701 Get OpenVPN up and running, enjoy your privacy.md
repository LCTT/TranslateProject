十步搭建 OpenVPN，享受你的隐私生活
================================================================================
![](http://parabing.com/assets/uploads/2014/06/openVPN-featured.jpg)

> 我们支持保护隐私，不为我们有自己的秘密需要保护，只是我们认为保护隐私应该成为一项基本人权。所以我们坚信无论谁在什么时候行使这项权利，都应该不受拘束的获取必须的工具和服务。OpenVPN就是这样一种服务并且有多种工具(客户端) 来让我们利用并享受这种服务。

通过与一个[OpenVPN][1]服务器建立连接，我们基本上在我们的设备和远端运行OpenVPN的主机之间建立了一个安全的通信通道。尽管在两个端点之间的通信可能被截获，但是信息是经过高强度加密的所以实际上它对于攻击者没什么用。OpenVPN除了扮演加密通信通道的调解人，我们也可以通过设置使服务器扮演互联网网关的角色。通过这种方式，我们可以**连接任何不安全的Wifi**，然后迅速的链接到远程的OpenVPN服务器，然后在不需要考虑偷窥的人或者无聊的管理员的情况下运行需要上网的程序。(注意:OpenVPN服务器旁还是需要信任的管理员的。)

这篇文章将一步一步的教会你如何在[Ubuntu Server 14.04 LTS][2]上安装OpenVPN。OpenVPN所在的主机可能是云上的一台VPS，一台在我们家里某台电脑上运行的虚拟机，或者是一个老到你都快忘了的设备。

### 第一步 准备系统 ###

我们需要Ubuntu Server主机的一个命令行终端，比如通过SSH从远程访问它。首先需要更新它的本地仓库数据:

    sub0@delta:~$ sudo apt-get update

进行操作系统和已安装的包的升级，输入:

    sub0@delta:~$ sudo apt-get dist-upgrade

如果升级了新内核，那就需要重启。当更新完成后，就该安装OpenVPN了:

    sub0@delta:~$ sudo apt-get -y install openvpn easy-rsa dnsmasq

注意，我们用apt-get安装了三个包:

- openvpn提供了OpenVPN的核心
- easy-rsa包含了一些有用的密钥管理脚本
- dnsmasq是当我们的OpenVPN所在的主机将扮演客户端的路由器时会用到的域名服务器

### 第二步 生成证书和私钥 ###

这是安装OpenVPN中最重要和最关键的一步，目的是建立公钥基础设施(PKI)。包括如下内容:

- 为OpenVPN服务器创建一个证书(公钥)和一个私钥
- 为每个OpenVPN客户端创建证书和私钥
- 建立一个证书颁发机构(CA)并创建证书和私钥。这个私钥用来给OpenVPN服务器和客户端的证书签名

从最后一个做起，我们先建立一个目录:

    sub0@delta:~$ sudo mkdir /etc/openvpn/easy-rsa

然后把easy-rsa的文件拷过去:

    sub0@delta:~$ sudo cp -r /usr/share/easy-rsa/* /etc/openvpn/easy-rsa

在我们创建CA的私钥之前，我们先编辑/etc/openvpn/easy-rsa/vars(我们喜欢用nano编辑器，不过这只是我们的喜好，你爱用什么用什么):

    sub0@delta:~$ sudo nano /etc/openvpn/easy-rsa/vars

在文件的尾部，我们设置主证书和密钥的信息:

    export KEY_COUNTRY="GR"
    export KEY_PROVINCE="Central Macedonia"
    export KEY_CITY="Thessaloniki"
    export KEY_ORG="Parabing Creations"
    export KEY_EMAIL="nobody@parabing.com"
    export KEY_CN="VPNsRUS"
    export KEY_NAME="VPNsRUS"
    export KEY_OU="Parabing"
    export KEY_ALTNAMES="VPNsRUS"

你可以根据自己的情况设置不同的值。特别注意最后KEY_ALTNAMES这一行，尽管这不是原本vars文件中有的但是我们还是把它加到文件的尾部，不然build-ca脚本会运行失败。

保存更改，我们得按[CTRL+O]然后按[Enter]。想退出nano，请按[CTRL+X]。现在，我们要获得root访问权限，继续生成主证书和私钥(LCTT译注:请注意命令行账户发生了改变):

    sub0@delta:~$ sudo su
    root@delta:/home/sub0# cd /etc/openvpn/easy-rsa
    root@delta:/etc/openvpn/easy-rsa# source vars
    NOTE: If you run ./clean-all, I will be doing a rm -rf on /etc/openvpn/easy-rsa/keys
    root@delta:/etc/openvpn/easy-rsa# sh clean-all
    root@delta:/etc/openvpn/easy-rsa# sh build-ca
    Generating a 1024 bit RSA private key
    ...++++++
    ................++++++
    writing new private key to 'ca.key'
    -----
    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [GR]:
    State or Province Name (full name) [Central Macedonia]:
    Locality Name (eg, city) [Thessaloniki]:
    Organization Name (eg, company) [Parabing Creations]:
    Organizational Unit Name (eg, section) [Parabing]:
    Common Name (eg, your name or your server's hostname) [VPNsRUS]:
    Name [VPNsRUS]:
    Email Address [nobody@parabing.com]:
    root@delta:/etc/openvpn/easy-rsa#

在我们的例子中，所有问题的答案都选择了默认的。在运行了build-ca脚本后，我们就获得了主证书文件(keys/ca.crt)和对应的私钥(keys/ca.key)。私钥必须不计代价的保密。

### 第三步 生成OpenVPN服务器的证书和私钥 ###

在我们为OpenVPN服务器生成证书和密钥之前，我们得给他起个名。我决定把它叫"delta"，然后运行build-key-server脚本来获取证书和密钥:

    root@delta:/etc/openvpn/easy-rsa# sh build-key-server delta
    Generating a 1024 bit RSA private key
    ....++++++
    ...++++++
    writing new private key to 'delta.key'
    -----
    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [GR]:
    State or Province Name (full name) [Central Macedonia]:
    Locality Name (eg, city) [Thessaloniki]:
    Organization Name (eg, company) [Parabing Creations]:
    Organizational Unit Name (eg, section) [Parabing]:
    Common Name (eg, your name or your server's hostname) [delta]:
    Name [VPNsRUS]:deltaVPN
    Email Address [nobody@parabing.com]:
     
    Please enter the following 'extra' attributes
    to be sent with your certificate request
    A challenge password []:
    An optional company name []:
    Using configuration from /etc/openvpn/easy-rsa/openssl-1.0.0.cnf
    Check that the request matches the signature
    Signature ok
    The Subject's Distinguished Name is as follows
    countryName           :PRINTABLE:'GR'
    stateOrProvinceName   :PRINTABLE:'Central Macedonia'
    localityName          :PRINTABLE:'Thessaloniki'
    organizationName      :PRINTABLE:'Parabing Creations'
    organizationalUnitName:PRINTABLE:'Parabing'
    commonName            :PRINTABLE:'delta'
    name                  :PRINTABLE:'deltaVPN'
    emailAddress          :IA5STRING:'nobody@parabing.com'
    Certificate is to be certified until Apr  7 08:06:02 2024 GMT (3650 days)
    Sign the certificate? [y/n]:y
      
    1 out of 1 certificate requests certified, commit? [y/n]y
    Write out database with 1 new entries
    Data Base Updated
    root@delta:/etc/openvpn/easy-rsa#

当脚本成功运行完的时候，我们就得到了服务器的证书(keys/delta.crt)和私钥(keys/delta.key)。注意服务器证书被CA的私钥签名了。

### 第四步 生成Diffie-Hellman参数 ###

幸亏有了Diffie-Hellman参数，我们才能在不安全的通信通道里安全的交换密钥。为了生成它我们需要键入:

    root@delta:/etc/openvpn/easy-rsa# sh build-dh
    Generating DH parameters, 2048 bit long safe prime, generator 2
    This is going to take a long time
    .......................+.....................................+..
    ...........................+..+.....................+...........
    ..............................................+.................
    .......................+........................................
    ................................................+...............
    .......................................++*++*++*
    root@delta:/etc/openvpn/easy-rsa#

证书，私钥和包含Diffie-Hellman参数的文件已生成，它们都储存在/etc/openvpn/easy-rsa/keys，所以我们到现在为止已经有如下五个文件了:

1. **ca.crt** – 证书颁发机构(CA)的证书
2. **ca.key** – CA的私钥
3. **delta.crt** – OpenVPN服务器的证书
4. **delta.key** – OpenVPN服务器的私钥
5. **dh2048.pem** – Diffie-Hellman参数文件

你自己的OpenVPN服务器命名可能和我们的不同。现在我们需要拷贝除了ca.key的文件到/etc/openvpn:

    root@delta:/etc/openvpn/easy-rsa# cd keys
    root@delta:/etc/openvpn/easy-rsa/keys# cp ca.crt delta.crt delta.key dh2048.pem /etc/openvpn
    root@delta:/etc/openvpn/easy-rsa/keys# cd ..
    root@delta:/etc/openvpn/easy-rsa#

### 第五步 为OpenVPN客户端生成证书和私钥 ###

试想我们的笔记本要连接OpenVPN服务器。为了实现这个很常见的情况，我们首先需要为客户端(比如:我们的笔记本)生成证书和私钥，在/etc/openvpn/easy-rsa有一个脚本帮我们完成这项工作:

    root@delta:/etc/openvpn/easy-rsa# source vars
    NOTE: If you run ./clean-all, I will be doing a rm -rf on /etc/openvpn/easy-rsa/keys
    root@delta:/etc/openvpn/easy-rsa# ./build-key laptop
    Generating a 1024 bit RSA private key
    .......................................++++++
    ...................................................................................................++++++
    writing new private key to 'laptop.key'
    -----
    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [GR]:
    State or Province Name (full name) [Central Macedonia]:
    Locality Name (eg, city) [Thessaloniki]:
    Organization Name (eg, company) [Parabing Creations]:
    Organizational Unit Name (eg, section) [Parabing]:
    Common Name (eg, your name or your server's hostname) [laptop]:
    Name [VPNsRUS]:
    Email Address [nobody@parabing.com]:
      
    Please enter the following 'extra' attributes
    to be sent with your certificate request
    A challenge password []:
    An optional company name []:
    Using configuration from /etc/openvpn/easy-rsa/openssl-1.0.0.cnf
    Check that the request matches the signature
    Signature ok
    The Subject's Distinguished Name is as follows
    countryName           :PRINTABLE:'GR'
    stateOrProvinceName   :PRINTABLE:'Central Macedonia'
    localityName          :PRINTABLE:'Thessaloniki'
    organizationName      :PRINTABLE:'Parabing Creations'
    organizationalUnitName:PRINTABLE:'Parabing'
    commonName            :PRINTABLE:'laptop'
    name                  :PRINTABLE:'VPNsRUS'
    emailAddress          :IA5STRING:'nobody@parabing.com'
    Certificate is to be certified until Apr  7 18:00:51 2024 GMT (3650 days)
    Sign the certificate? [y/n]:y
      
    1 out of 1 certificate requests certified, commit? [y/n]y
    Write out database with 1 new entries
    Data Base Updated
    root@delta:/etc/openvpn/easy-rsa#

我们为密钥选取的名字是"laptop"，当build-key脚本运行完之后，我们就得到了在keys/laptop.crt的证书和在keys/laptop.key的私钥。有了这两个文件和CA的证书，我们得把这三个文件拷贝到用户有(比如用户sub0)权访问的地方。比如我们可以在用户的home目录中新建一个目录并把三个文件拷贝过去:

    root@delta:/etc/openvpn/easy-rsa# mkdir /home/sub0/ovpn-client
    root@delta:/etc/openvpn/easy-rsa# cd keys
    root@delta:/etc/openvpn/easy-rsa/keys# cp ca.crt laptop.crt laptop.key /home/sub0/ovpn-client
    root@delta:/etc/openvpn/easy-rsa/keys# chown -R sub0:sub0 /home/sub0/ovpn-client
    root@delta:/etc/openvpn/easy-rsa/keys# cd ..
    root@delta:/etc/openvpn/easy-rsa#

ovpn-client文件夹必须安全的拷贝到我们的笔记本电脑上。我们可以给多个客户端分发这三个文件。当然了，等我们需要一个不一样的证书-私钥对的时候只要再次运行build-key脚本即可。

### 第六步 -- OpenVPN服务器设置 ###

等会我们的OpenVPN服务器就要启动并运行了。但是开始的时候，我们需要更改一些设置。在/usr/share/doc/openvpn/examples/sample-config-files中有一个示例配置文件，它很适合我们的教程，这个文件叫server.conf.gz:

    root@delta:/etc/openvpn/easy-rsa# cd /etc/openvpn
    root@delta:/etc/openvpn# cp /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz .
    root@delta:/etc/openvpn# gunzip -d server.conf.gz
    root@delta:/etc/openvpn# mv server.conf delta.conf
    root@delta:/etc/openvpn#

如你所见，我们把server.conf.gz拷贝到/etc/openvpn，解压并重命名到delta.conf。你可以按个人喜好给OpenVPN服务器配置文件取名字，但是它必须有".conf"扩展名。我们现在用nano打开配置文件:

    root@delta:/etc/openvpn# nano delta.conf

下面是我们应该做出的更改。

- 首先，定位到这一行

    cert server.crt
    key server.key

确认OpenVPN服务器证书和私钥的位置和名称，在我们的例子中，这两行要改成

    cert delta.crt
    key delta.key

- 然后定位到这一行

    dh dh1024.pem

用"2048"代替"1024":

    dh dh2048.pem

- 在配置文件的末尾，我们添加下面这两行:

    push "redirect-gateway def1"
    push "dhcp-option DNS 10.8.0.1"

最后这两行指示客户端用OpenVPN作为默认的网关，并用10.8.0.1作为DNS服务器。注意10.8.0.1是OpenVPN启动时自动创建的隧道接口的IP。如果客户用别的域名解析服务，那么我们就得提防不安全的DNS服务器。为了避免这种泄露，我们建议所有OpenVPN客户端使用10.8.0.1作为DNS服务器。

我们以这种方式来开始运行OpenVPN服务器:

    root@delta:/etc/openvpn# service openvpn start

默认的，OpenVPN服务器监听1194/UDP端口。一种查看的方法是使用netstat工具:

    root@delta:/etc/openvpn# netstat -anup
    Active Internet connections (servers and established)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
    udp        0      0 0.0.0.0:54149           0.0.0.0:*                           555/dhclient
    udp        0      0 0.0.0.0:1194            0.0.0.0:*                           3024/openvpn
    udp        0      0 0.0.0.0:53              0.0.0.0:*                           2756/dnsmasq
    udp        0      0 0.0.0.0:68              0.0.0.0:*                           555/dhclient
    udp6       0      0 :::60622                :::*                                555/dhclient
    udp6       0      0 :::53                   :::*                                2756/dnsmasq

看起来一切运行的不错，但是我们还没设置DNS服务器呢。

### 第七步 为OpenVPN客户端搭建DNS ###

这就是为什么我们要安装dnsmasq的原因，打开它的配置文件。

    root@delta:/etc/openvpn# nano /etc/dnsmasq.conf

定位到这行:

    #listen-address=

把它换成下面这样:

    listen-address=127.0.0.1, 10.8.0.1

然后定位到这行:

    #bind-interfaces

把"#"删了:

    bind-interfaces

为了让dnsmasq应用这些更改，我们重启它:

    root@delta:/etc/openvpn# service dnsmasq restart
     * Restarting DNS forwarder and DHCP server dnsmasq [ OK ]
    root@delta:/etc/openvpn#

现在，dnamasq在本地回环(lo)和隧道(tun0)接口监听DNS请求。netstat的输出看起来是这个样子的:

    root@delta:/etc/openvpn# netstat -anup
    Active Internet connections (servers and established)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
    udp        0      0 0.0.0.0:57219           0.0.0.0:*                           638/dhclient
    udp        0      0 0.0.0.0:1194            0.0.0.0:*                           911/openvpn
    udp        0      0 127.0.0.1:53            0.0.0.0:*                           1385/dnsmasq
    udp        0      0 10.8.0.1:53             0.0.0.0:*                           1385/dnsmasq
    udp        0      0 0.0.0.0:68              0.0.0.0:*                           638/dhclient
    udp6       0      0 :::39148                :::*                                638/dhclient

### 第八步 路由功能 ###

我们希望在一些机器或虚拟机上运行的OpneVPN有路由的功能，这意味着要开启IP转发。为了打开它，我们用root账户键入:

    root@delta:/etc/openvpn# echo "1" > /proc/sys/net/ipv4/ip_forward

为了让这个设置重启也好用，我们编辑 /etc/sysctl.conf:

    root@delta:/etc/openvpn# nano /etc/sysctl.conf

编辑这行:

    #net.ipv4.ip_forward=1

把"#"删了:

    net.ipv4.ip_forward=1

还需要激活一些iptables相关的规则:

    root@delta:/etc/openvpn# iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
    root@delta:/etc/openvpn# iptables -A FORWARD -s 10.8.0.0/24 -j ACCEPT
    root@delta:/etc/openvpn# iptables -A FORWARD -j REJECT
    root@delta:/etc/openvpn# iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE
    root@delta:/etc/openvpn#

当然了，我们希望每次Ubuntu启动的时候，这些规则都好用。所以我们得把它们加到/etc/rc.local里:

    #!/bin/sh -e
    #
    # rc.local
    #
    # This script is executed at the end of each multiuser runlevel.
    # Make sure that the script will "exit 0" on success or any other
    # value on error.
    #
    # In order to enable or disable this script just change the execution
    # bits.
    #
    # By default this script does nothing.
      
    iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
    iptables -A FORWARD -s 10.8.0.0/24 -j ACCEPT
    iptables -A FORWARD -j REJECT
    iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE
      
    service dnsmasq restart
     
    exit 0

请注意倒数第二行:

service dnsmasq restart

> 这非常重要:在系统启动时，dnsmasq会尝试在OpenVPN之前启动。但是OpenVPN启动之前是没有隧道(tun0)接口的，所以dnsmasq自然就挂了。过了一阵，当/etc/rc.local读到隧道(tun0)接口出现时，它会在这时重启dnsmasq然后就一切如你所愿了。

### 第九步 客户端设置 ###

在第五步，我们在用户的home目录里我们建立了ovpn-client文件夹(在我们的例子里是/home/sub0)。在哪里有CA的证书和客户端证书和私钥。现在只缺客户端配置文件了，在/usr/share/doc/openvpn/examples/sample-config-files有一个示例配置文件:

    root@delta:/etc/openvpn# exit
    exit
    sub0@delta:~$ cd ~/ovpn-client
    sub0@delta:~/ovpn-client$ cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf .
    sub0@delta:~/ovpn-client$

我们需要编辑client.conf，定位到这一行:

    remote my-server-1 1194

"my-server-1"是一个占位符，现在我们要把它换成我们自己服务器的公网域名或IP。如果我们已经给服务器分配域名了，那只要把它填到my-server-1的位置。如果没有域名，那么得获取公网IP。如何获取呢?一种方式是键入下列命令:

    sub0@delta:~/ovpn-client$ curl ipecho.net/plain ; echo

(如果不是一个数字的IP地址， 或是发生错误，那就等会再试。)所以我们现在知道我们的服务器公网IP了，但是它是动态的还是静态的呢?当我们把服务器架设在家或者办公室的时候，极有可能就是动态IP。如果是动态IP的话，可以用免费的动态域名服务(DDNS)，比如[No-IP](http://www.noip.com)的服务。如果使用No-IP，假设我们选择了免费的域名dnsalias.net，那么这一行应该像这样填写:

    remote ovpn.dnsalias.net 1194

"ovpn"是我们给服务器起的主机名。如果我们的服务器在云上，那么它可能有一个静态IP。如果有静态IP的话，那么这一行应该是这样的:

    remote 1.2.3.4 1194

还要修改两行:

    cert client.crt
    key client.key

在我们的例子里，客户端的证书和密钥的名字分别是laptop.crt和laptop.key所以我们的client.conf要包含下面这两行:

    cert laptop.crt
    key laptop.key

在确认保存client.conf的修改之后，我们需要安全的把整个ovpn-client文件夹传输到客户端。一种方式是使用scp命令(安全拷贝或在SSH上拷贝)。另一种方式由优秀而免费的软件FileZilla提供，使用在SSH上运行的FTP(SFTP)。

### 第十步 连接并测试 ###

![](http://parabing.com/assets/uploads/2014/06/01-Firewall.png)


所以我们到底怎么样才能链接到远程的OpenVPN服务器的呢?它完全取决于我们手中现有的设备类型，当然也取决于所运行的操作系统。我们将在四种不同类别的操作系统上运行，Linux， Windows， OS X和iOS/Android。注意，无论在什么设备和系统上，我们都得在OpenVPN服务器的本地网络外才能连接成功。此外，如果在服务器前有防火墙，我们需要增加一条这样的规则:

*把所有从1194/UDP端口收到的包转发到服务器公网接口的1194/UDP端口。*

这是一个简单的防火墙规则。事不宜迟，让我们与我们难以置信的OpenVPN服务器建立第一个连接吧。

**Linux**: 我们只需安装openvpn包。一种连接远程OpenVPN服务器的方式是新建一个终端，切换到ovpn-client文件夹并以root身份或使用sudo来键入下列命令:

    /usr/sbin/openvpn --config client.conf

任何时候如果我们需要终止OpenVPN，按[CTRL+C]就行了。

**Windows**: 有一个免费的OpenVPN客户端软件叫做[OpenVPN Desktop Client][3]。 配置文件client.conf需要重命名成client.ovpn，这就是我们需要提供给OpenVPN Desktop Client的文件。程序会读取client.ovpn并给OpenVPN服务器生成一个新的连接配置。

![](http://parabing.com/assets/uploads/2014/06/02-Connected.jpg)

**OS X**: [tunnelblick][4]是一款可以连接OpenVPN的免费开源OS X软件。[Viscosity][5]也可以但它是商业软件，不过我们喜欢。Viscosity会读取client.conf并给OpenVPN服务器生成一个新的连接配置。

**iOS/Android**: OpenVPN connect是绝佳的选择。它是免费的且可以从[App Store][6]和[Google Play store][7]获得

不管是什么平台，有时我们想检验我们是否真的使用OpenVPN连接了。一种检验方法是完成下面这简单的4步:

在连接到OpenVPN服务器前我们需要…

- 打开[whatip.com][8]记录我们的公网IP
- 打开[dnsleaktest.com][10]，运行标准测试(standard test)，记录我们的域名解析服务器

![](http://parabing.com/assets/uploads/2014/06/03-DNS.png)

在连接到OpenVPN服务器后重复这两部。如果我们获取到两个不同的公网IP，这意味着我们的网络出口已在远端OpenVPN服务器那。此外，如果获取了两个不同的域名解析服务器，那么就不存在DNS泄露的问题了。

### 感言 ###

我用了三个不同的OpenVPN服务器，都是定制的。 一个运行在希腊Thessaloniki的家庭办公室的pfSense路由。当我不在办公室时，我用这个服务器安全的连接到局域网。剩下的两个服务器在两个不同的VPS上，一个在冰岛雷克雅未克，另一个在美国纽泽西州。当我在外面且需要任意用一个WiFi热点的时候，我不必考虑安全问题:我只需简单的连接到雷克雅未克的服务器然后正常上网。有时我想看看那些限制用户地理位置在美国的服务。在这种不太常见的情况下，新泽西的服务器就派上用场了，当我连接时，我就获得了美国的一个公网IP，这样就可以访问有地理位置限制的服务了。值得注意的是，一些服务会把一些知名的VPN公司的IP列入黑名单。这是在你选的VPS提供商建立自己的OpenVPN*十分重要*的一个优点:这不大可能被列入黑名单。

无论你的物理位置在哪， OpenVPN确保客户端和服务器之间的数据流是高度加密的。没有OpenVPN的数据则是另一种情况。 取决于不同的应用层协议，它可能仍然是加密的，但它也可能是未加密的。所以除非你对OpenVPN服务器和它的本地网络有绝对的控制权，你不能完全相信另一端的管理员。这种精神是显而易见的:如果你真的在乎你自己的隐私，那么你需要注意你的行为可能在破坏它。

一个例子是我们希望点对点传输。我们有一个在云上配置好的OpenVPN服务器。当需要任意用一个WiFi热点的时候，你没有丝毫的担心，因为你连在OpenVPN服务器上。然后你打开你最喜欢的电子邮件客户端从一个依然使用SMTP的老服务器收信。你猜会发生什么?你的用户名和密码以未加密的纯文本格式离开OpenVPN服务器。与此同时一个在你OpenVPN服务器附近的鬼鬼祟祟的管理员很容易就嗅探出你的证书并记录到他们越来越长的名叫"random happy people.txt"的列表。

所以你该做什么?很简单。你应该继续使用OpenVPN服务器，但不要使用应用了旧的或不安全的协议的应用程序。

享受你的OpenVPN服务器吧!

--------------------------------------------------------------------------------

via: http://parabing.com/2014/06/openvpn-on-ubuntu/

译者：[2q1w2007](https://github.com/2q1w2007) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://zh.wikipedia.org/wiki/Openvpn
[2]:http://www.ubuntu.com/server
[3]:http://swupdate.openvpn.net/downloads/openvpn-client.msi
[4]:https://code.google.com/p/tunnelblick
[5]:https://www.sparklabs.com/viscosity
[6]:https://itunes.apple.com/us/app/openvpn-connect/id590379981?mt=8
[7]:https://play.google.com/store/apps/details?id=net.openvpn.openvpn
[8]:http://www.whatip.com/
[9]:https://dnsleaktest.com/
