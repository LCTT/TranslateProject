[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to configure an SSH proxy server with Squid)
[#]: via: (https://fedoramagazine.org/configure-ssh-proxy-server/)
[#]: author: (Curt Warfield https://fedoramagazine.org/author/rcurtiswarfield/)

How to configure an SSH proxy server with Squid
======

![][1]

Sometimes you can’t connect to an SSH server from your current location. Other times, you may want to add an extra layer of security to your SSH connection. In these cases connecting to another SSH server via a proxy server is one way to get through.

[Squid][2] is a full-featured proxy server application that provides caching and proxy services. It’s normally used to help improve response times and reduce network bandwidth by reusing and caching previously requested web pages during browsing.

However for this setup you’ll configure Squid to be used as an SSH proxy server since it’s a robust trusted proxy server that is easy to configure.

### Installation and configuration

Install the squid package using [sudo][3]:

```
$ sudo dnf install squid -y
```

The squid configuration file is quite extensive but there are only a few things we need to configure. Squid uses access control lists to manage connections.

Edit the _/etc/squid/squid.conf_ file to make sure you have the two lines explained below.

First, specify your local IP network. The default configuration file already has a list of the most common ones but you will need to add yours if it’s not there. For example, if your local IP network range is 192.168.1.X, this is how the line would look:

```
acl localnet src 192.168.1.0/24
```

Next, add the SSH port as a safe port by adding the following line:

```
acl Safe_ports port 22
```

Save that file. Now enable and restart the squid proxy service:

```
$ sudo systemctl enable squid
$ sudo systemctl restart squid
```

4.) By default squid proxy listens on port 3128. Configure firewalld to allow for this:

```
$ sudo firewall-cmd --add-service=squid --perm
$ sudo firewall-cmd --reload
```

### Testing the ssh proxy connection

To connect to a server via ssh through a proxy server we’ll be using netcat.

Install _nmap-ncat_ if it’s not already installed:

```
$ sudo dnf install nmap-ncat -y
```

Here is an example of a standard ssh connection:

```
$ ssh user@example.com
```

Here is how you would connect to that same server using the squid proxy server as a gateway.

This example assumes the squid proxy server’s IP address is 192.168.1.63. You can also use the host-name or the FQDN of the squid proxy server:

```
$ ssh user@example.com -o "ProxyCommand nc --proxy 192.168.1.63:3128 %h %p"
```

Here are the meanings of the options:

  * _ProxyCommand_ – Tells ssh a proxy command is going to be used.


  * _nc_ – The command used to establish the connection to the proxy server. This is the netcat command.


  * ***%***_h_ – The placeholder for the proxy server’s host-name or IP address.


  * ***%***_p_ ******– The placeholder for the proxy server’s port number.



There are many ways to configure an SSH proxy server but this is a simple way to get started.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/configure-ssh-proxy-server/

作者：[Curt Warfield][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/rcurtiswarfield/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/07/squid_ssh_proxy-816x345.png
[2]: http://www.squid-cache.org/
[3]: https://fedoramagazine.org/howto-use-sudo/
