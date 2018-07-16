在Debian 7/Ubuntu 13.10 上使用隧道封装SSH连接
================================================================================

**隧道** 被设计用于远端客户端和本地(可通过inetd启动)或远端服务器间的SSL加密封装。它可以用于为inetd进程增加SSL功能，像POP2（译注：厄，POP2这个服务还有人用么？），POP3和IMAP服务而不必改变程序代码。隧道使用OpenSSL库用于加密，因此它支持任何被编译进库的加密算法。简而言之，隧道可以使任何一个不安全的端口变得安全加密。

在本篇中，我会描述如何通过SSL水稻封装SSH。这个步骤非常简单。你需要在你的客户端PC和远程PC都已经安装运行了sshd。

我正在使用下面提到的两个系统。

远程系统:

    操作系统: Debian 7
    IP 地址: 192.168.1.200/24

客户端(本地) 系统:

    操作系统: Ubuntu 13.04 desktop
    IP 地址: 192.168.1.100/24

#### 配置远程系统 ####

让我们在远程Debian 7服务器上安装stunnel包。

    # apt-get install stunnel4

现在让我们像下面那样创建一个SSL证书。

    # openssl genrsa 1024 > stunnel.key

示例输出:

    Generating RSA private key, 1024 bit long modulus
    ............................................++++++
    ...................++++++
    e is 65537 (0x10001)

    # openssl req -new -key stunnel.key -x509 -days 1000 -out stunnel.crt

你会被询问若干个问题如国家、州、公司细节等。

    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [AU]:IN
    State or Province Name (full name) [Some-State]:Tamilnadu
    Locality Name (eg, city) []:Erode
    Organization Name (eg, company) [Internet Widgits Pty Ltd]:unixmen
    Organizational Unit Name (eg, section) []:Technical
    Common Name (e.g. server FQDN or YOUR name) []:server.unixmen.com
    Email Address []:sk@unixmen.com

    # cat stunnel.crt stunnel.key > stunnel.pem
    # mv stunnel.pem /etc/stunnel/

现在我们需要配置stunnel来将 **443(https)**隧道到**22(ssh)**。这可以通过在**/etc/stunnel/**目录下创建**stunnel.conf**文件来实现：

     # vi /etc/stunnel/stunnel.conf

并加入下面的行:

    pid = /var/run/stunnel.pid
    cert = /etc/stunnel/stunnel.pem
    [ssh]
    accept = 192.168.1.200:443
    connect = 127.0.0.1:22

上面的几行说明了stunnel在哪里寻找证书文件和哪里接收和转发ssh链接。在本例中，stunnel会接收来自443端口的流量并会转发给22端口。

保存并关闭文件。

现在让我们启用stunnel服务。要这么做，编辑文件 **/etc/default/stunnel4**:

    # vi /etc/default/stunnel4

改变行从 **ENABLED = 0** 到 **1**。

    # /etc/default/stunnel
    # Julien LEMOINE <speedblue@debian.org>
    # September 2003

    # Change to one to enable stunnel automatic startup
    ENABLED=1
    FILES="/etc/stunnel/*.conf"
    OPTIONS=""

    # Change to one to enable ppp restart scripts
    PPP_RESTART=0

接着使用命令启用stunnel服务:

    # service stunnel4 start

#### 配置本地系统 ####

用这个命令安装stunnel:

    $ sudo apt-get install stunnel4

我们需要远程系统上相同的证书文件(stunnel.pem)。复制远程系统上的 **stunnel.pem**文件到我们本地系统中并在相同的位置保存(也就是 /etc/stunnel)。

在 **/etc/stunnel/**目录下创建新的文件**stunnel.conf**：

    $ sudo vi /etc/stunnel/stunnel.conf

加入下面的行:

    pid = /var/run/stunnel.pid
    cert = /etc/stunnel/stunnel.pem
    client=yes
    [ssh]
    accept=443
    connect=192.168.1.200:443

保存并关闭文件。这里的192.168.1.200是我们的远程系统IP。

现在让我们启用stunnel服务。要这么做，编辑文件**/etc/default/stunnel4**:

    $ sudo vi /etc/default/stunnel4

改变行从 **ENABLED = 0** 到 **1**.

    # /etc/default/stunnel
    # Julien LEMOINE <speedblue@debian.org>
    # September 2003

    # Change to one to enable stunnel automatic startup
    ENABLED=1
    FILES="/etc/stunnel/*.conf"
    OPTIONS=""

    # Change to one to enable ppp restart scripts
    PPP_RESTART=0

接着使用命令启用stunnel服务:

    $ sudo service stunnel4 start

#### 测试SSH连接 ####

现在这样已经很好了，你可以使用命令连接到你的远程机器上了：

    $ ssh sk@localhost -v -p 443

示例输出:

    OpenSSH_6.1p1 Debian-4, OpenSSL 1.0.1c 10 May 2012
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: /etc/ssh/ssh_config line 19: Applying options for *
    debug1: Connecting to localhost [127.0.0.1] port 443.
    debug1: Connection established.
    debug1: identity file /home/sk/.ssh/id_rsa type -1
    debug1: identity file /home/sk/.ssh/id_rsa-cert type -1
    debug1: identity file /home/sk/.ssh/id_dsa type -1
    debug1: identity file /home/sk/.ssh/id_dsa-cert type -1
    debug1: identity file /home/sk/.ssh/id_ecdsa type -1
    debug1: identity file /home/sk/.ssh/id_ecdsa-cert type -1
    debug1: Remote protocol version 2.0, remote software version OpenSSH_6.0p1 Debian-4
    debug1: match: OpenSSH_6.0p1 Debian-4 pat OpenSSH*
    debug1: Enabling compatibility mode for protocol 2.0
    debug1: Local version string SSH-2.0-OpenSSH_6.1p1 Debian-4
    debug1: SSH2_MSG_KEXINIT sent
    debug1: SSH2_MSG_KEXINIT received
    debug1: kex: server->client aes128-ctr hmac-md5 none
    debug1: kex: client->server aes128-ctr hmac-md5 none
    debug1: sending SSH2_MSG_KEX_ECDH_INIT
    debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
    debug1: Server host key: ECDSA 78:05:ba:1b:73:02:75:86:10:33:8c:0f:21:61:d4:de
    debug1: Host '[localhost]:443' is known and matches the ECDSA host key.
    debug1: Found key in /home/sk/.ssh/known_hosts:12
    debug1: ssh_ecdsa_verify: signature correct
    debug1: SSH2_MSG_NEWKEYS sent
    debug1: expecting SSH2_MSG_NEWKEYS
    debug1: SSH2_MSG_NEWKEYS received
    debug1: Roaming not allowed by server
    debug1: SSH2_MSG_SERVICE_REQUEST sent
    debug1: SSH2_MSG_SERVICE_ACCEPT received
    debug1: Authentications that can continue: publickey,password
    debug1: Next authentication method: publickey
    debug1: Trying private key: /home/sk/.ssh/id_rsa
    debug1: Trying private key: /home/sk/.ssh/id_dsa
    debug1: Trying private key: /home/sk/.ssh/id_ecdsa
    debug1: Next authentication method: password
    sk@localhost's password: #   ## Enter your remote system user password
    debug1: Authentication succeeded (password).
    Authenticated to localhost ([127.0.0.1]:443).
    debug1: channel 0: new [client-session]
    debug1: Requesting no-more-sessions@openssh.com
    debug1: Entering interactive session.
    debug1: Sending environment.
    debug1: Sending env LC_PAPER = en_IN.UTF-8
    debug1: Sending env LC_ADDRESS = en_IN.UTF-8
    debug1: Sending env LC_MONETARY = en_IN.UTF-8
    debug1: Sending env LC_NUMERIC = en_IN.UTF-8
    debug1: Sending env LC_TELEPHONE = en_IN.UTF-8
    debug1: Sending env LC_IDENTIFICATION = en_IN.UTF-8
    debug1: Sending env LANG = en_US.UTF-8
    debug1: Sending env LC_MEASUREMENT = en_IN.UTF-8
    debug1: Sending env LC_TIME = en_IN.UTF-8
    debug1: Sending env LC_NAME = en_IN.UTF-8
    Linux server 3.2.0-4-486 #1 Debian 3.2.51-1 i686

    The programs included with the Debian GNU/Linux system are free software;
    the exact distribution terms for each program are described in the
    individual files in /usr/share/doc/*/copyright.

    Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
    permitted by applicable law.
    You have new mail.
    Last login: Mon Dec 30 15:12:22 2013 from localhost
    sk@server:~$

或者你可以简单地使用下面的命令:

    $ ssh -p 443 sk@localhost

示例输出:

    sk@localhost's password: 
    Linux server 3.2.0-4-486 #1 Debian 3.2.51-1 i686

    The programs included with the Debian GNU/Linux system are free software;
    the exact distribution terms for each program are described in the
    individual files in /usr/share/doc/*/copyright.

    Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
    permitted by applicable law.
    You have new mail.
    Last login: Mon Dec 30 15:22:08 2013 from localhost
    sk@server:~$

现在你可以用ssh连接到你的远程机器上了，但是所有的流量通过SSL隧道。

你已经完成了！即使ssh的默认端口被防火墙阻止了，你仍然可以使用SSH到你的远程系统。

参考链接:

- **[stunnel 主页][1]**

--------------------------------------------------------------------------------

via: http://www.unixmen.com/tunnel-ssh-connections-ssl-using-stunnel-debian-7-ubuntu-13-10/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://www.stunnel.org/index.html