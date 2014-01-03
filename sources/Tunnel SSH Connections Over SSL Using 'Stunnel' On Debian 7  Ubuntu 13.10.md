Translating---------------geekpi



Tunnel SSH Connections Over SSL Using ‘Stunnel’ On Debian 7 / Ubuntu 13.10
================================================================================
**stunnel** is designed to work as an SSL encryption wrapper between remote client and local (inetd-startable) or remote server. It can be used to add SSL functionality to commonly used inetd daemons like POP2, POP3, and IMAP servers without any changes in the programs code. Stunnel uses the OpenSSL library for cryptography, so it supports whatever cryptographic algorithms are compiled into the library. In simple words, stunnel can be used to turn any insecure port to a secure encrypted port.

In this tutorial, i will describe how to tunnel SSH over SSL using stunnel. The setup is pretty simple. You’ll need stunnel installed on both your client PC and a remote PC with sshd already running.

I am using two systems as mentioned below.

Remote System:

    Operating System: Debian 7
    IP address: 192.168.1.200/24

Client(Local) System:

    Operating system: Ubuntu 13.04 desktop
    IP address: 192.168.1.100/24

#### Configure Remote System ####

Let us install stunnel package in our remote Debian 7 server.

    # apt-get install stunnel4

Now let us create a SSL certificate as shown below.

    # openssl genrsa 1024 > stunnel.key

Sample output:

    Generating RSA private key, 1024 bit long modulus
    ............................................++++++
    ...................++++++
    e is 65537 (0x10001)

    # openssl req -new -key stunnel.key -x509 -days 1000 -out stunnel.crt

You will be asked to answer for a couple of questions such as Country, State, company details etc.

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

Now we have to configure stunnel to tunnel **443(https)** to **22(ssh)**. This can be done by creating a new file **stunnel.conf** under **/etc/stunnel/** directory:

     # vi /etc/stunnel/stunnel.conf

Add the following lines:

    pid = /var/run/stunnel.pid
    cert = /etc/stunnel/stunnel.pem
    [ssh]
    accept = 192.168.1.200:443
    connect = 127.0.0.1:22

The above lines says stunnel that where to look for the certificate file and where to accept and forward ssh connections. In our case, stunnel will accept the incoming traffic on port 443 and forward it back to port 22.

Save and close the file.

Now let us enable stunnel service. To do that, edit file **/etc/default/stunnel4**:

    # vi /etc/default/stunnel4

Change the line **Enabled = 0** to **1**.

    # /etc/default/stunnel
    # Julien LEMOINE <speedblue@debian.org>
    # September 2003

    # Change to one to enable stunnel automatic startup
    ENABLED=1
    FILES="/etc/stunnel/*.conf"
    OPTIONS=""

    # Change to one to enable ppp restart scripts
    PPP_RESTART=0

Then start stunnel service with command:

    # service stunnel4 start

#### Configure Local System ####

Install stunnel with command:

    $ sudo apt-get install stunnel4

We need the same certificate file(stunnel.pem) from the remote system. Copy the remote system **stunnel.pem** file to our local system and save it in the same location(i.e /etc/stunnel).

creating a new file **stunnel.conf** under **/etc/stunnel/** directory:

    $ sudo vi /etc/stunnel/stunnel.conf

Add the following lines:

    pid = /var/run/stunnel.pid
    cert = /etc/stunnel/stunnel.pem
    client=yes
    [ssh]
    accept=443
    connect=192.168.1.200:443

Save and close the file. Here 192.168.1.200 is our remote system IP.

Now let us enable stunnel service. To do that, edit file **/etc/default/stunnel4**:

    $ sudo vi /etc/default/stunnel4

Change the line **Enabled = 0** to **1**.

    # /etc/default/stunnel
    # Julien LEMOINE <speedblue@debian.org>
    # September 2003

    # Change to one to enable stunnel automatic startup
    ENABLED=1
    FILES="/etc/stunnel/*.conf"
    OPTIONS=""

    # Change to one to enable ppp restart scripts
    PPP_RESTART=0

Then start stunnel service with command:

    $ sudo service stunnel4 start

#### Test SSH connection ####

Now we’re good to go. You’ll be able to connect to your remote machine using command:

    $ ssh sk@localhost -v -p 443

Sample output:

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

Or you can simply use the command:

    $ ssh -p 443 sk@localhost

Sample output:

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

Now you’ll be able to make ssh connection to your remote system, but all the traffic tunneled through SSL.

You’re done now! You can SSH to your remote system even when the ssh default 22 is blocked by any firewall.

Reference Links:

- **[stunnel homepage][1]**

--------------------------------------------------------------------------------

via: http://www.unixmen.com/tunnel-ssh-connections-ssl-using-stunnel-debian-7-ubuntu-13-10/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://www.stunnel.org/index.html