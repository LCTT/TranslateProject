Installing Telnet In CentOS/RHEL/Scientific Linux 6 & 7
================================================================================
#### Disclaimer: ####

Before installing and using Telnet, keep the following in mind.

- Using Telnet in public network(WAN) is very very bad idea. It transmits login data in the clear format. Everything will be sent in plain text.
- If you still need Telnet, It is highly recommended use it in the local area network only.
- Alternatively, you can use **SSH**. But make sure you’ve disabled root login in SSH.

### What Is Telnet? ###

[Telnet][1] is a network protocol which is used to connect to remote computers over TCP/IP network. Once you establish a connection to the remote computer, it becomes a virtual terminal and will allow you to communicate with the remote host from your local system.

In this brief tutorial, let us see how to install Telnet, and how to access remote systems via Telnet.

### Installation ###

Open your terminal and type the following command to install telnet:

    yum install telnet telnet-server -y

Now, the telnet has been installed in your server. Next, edit the telnet configuration file **/etc/xinetd.d/telnet**;

    vi /etc/xinetd.d/telnet

Set **disable = no**:

    # default: on
    # description: The telnet server serves telnet sessions; it uses \
    #       unencrypted username/password pairs for authentication.
    service telnet
    {
            flags           = REUSE
            socket_type     = stream
            wait            = no
            user            = root
            server          = /usr/sbin/in.telnetd
            log_on_failure  += USERID
            disable         = no
    }

Save and quit the file. Be mindful that you don’t have do this step in CentOS 7.

Now restart the telnet service using the following command:

On CentOS 6.x systems:

    service xinetd start

Make this service to start automatically on every reboot:

On CentOS 6:

    chkconfig telnet on
    chkconfig xinetd on

On CentOS 7:

    systemctl start telnet.socket
    systemctl enable telnet.socket

Allow the telnet default port **23** through your firewall and Router. To allow the telnet port through firewall, Edit file **/etc/sysconfig/iptables** on CentOS 6.x systems:

    vi /etc/sysconfig/iptables

Add the line as shown in red color:

    # Firewall configuration written by system-config-firewall
    # Manual customization of this file is not recommended.
    *filter
    :INPUT ACCEPT [0:0]
    :FORWARD ACCEPT [0:0]
    :OUTPUT ACCEPT [0:0]
    -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
    -A INPUT -p icmp -j ACCEPT
    -A INPUT -i lo -j ACCEPT
    -A INPUT -p tcp -m state --state NEW --dport 23 -j ACCEPT
    -A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
    -A INPUT -j REJECT --reject-with icmp-host-prohibited
    -A FORWARD -j REJECT --reject-with icmp-host-prohibited
    COMMIT

Save and exit the file. Restart iptables service:

    service iptables restart

On CentOS 7, run the following commands to enable telnet service through firewall.

    firewall-cmd --permanent --add-port=23/tcp
    firewall-cmd --reload

Thats it. Now telnet server is ready to use.

#### Creating users ####

Create a test user, for example “**sk**” with password “**centos**“:

    useradd sk
    passwd sk

#### Client Side Configuration ####

Install telnet package:

    yum install telnet

On DEB based systems:

    sudo apt-get install telnet

Now, open Terminal, and try to access your server(remote host).

If your client is Linux system, open the terminal and type the following command to connect to telnet server.

    telnet 192.168.1.150

Enter username and password which we have created in the server:

Sample output:

    Trying 192.168.1.150...
    Connected to 192.168.1.150.
    Escape character is '^]'.
    
    Kernel 3.10.0-123.13.2.el7.x86_64 on an x86_64
    server1 login: sk
    Password: 
    [sk@server1 ~]$

As you see in the above output, the remote system has been successfully accessed from the local machine.

If your client is windows system, then go to **Start -> Run -> Command Prompt**.

In the command prompt, type the command:

    telnet 192.168.1.150

Where **192.168.1.150** is remote host IP address.

Now you will be able to connect to your server.

That’s it.

Cheers!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/installing-telnet-centosrhelscientific-linux-6-7/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:http://en.wikipedia.org/wiki/Telnet