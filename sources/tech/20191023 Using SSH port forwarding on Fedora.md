[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using SSH port forwarding on Fedora)
[#]: via: (https://fedoramagazine.org/using-ssh-port-forwarding-on-fedora/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

Using SSH port forwarding on Fedora
======

![][1]

You may already be familiar with using the _[ssh][2]_ [command][2] to access a remote system. The protocol behind _ssh_ allows terminal input and output to flow through a [secure channel][3]. But did you know that you can also use _ssh_ to send and receive other data securely as well? One way is to use _port forwarding_, which allows you to connect network ports securely while conducting your _ssh_ session. This article shows you how it works.

### About ports

A standard Linux system has a set of network ports already assigned, from 0-65535. Your system reserves ports up to 1023 for system use. In many systems you can’t elect to use one of these low-numbered ports. Quite a few ports are commonly expected to run specific services. You can find these defined in your system’s _/etc/services_ file.

You can think of a network port like a physical port or jack to which you can connect a cable. That port may connect to some sort of service on the system, like wiring behind that physical jack. An example is the Apache web server (also known as _httpd_). The web server usually claims port 80 on the host system for HTTP non-secure connections, and 443 for HTTPS secure connections.

When you connect to a remote system, such as with a web browser, you are also “wiring” your browser to a port on your host. This is usually a random high port number, such as 54001. The port on your host connects to the port on the remote host, such as 443 to reach its secure web server.

So why use port forwarding when you have so many ports available? Here are a couple common cases in the life of a web developer.

### Local port forwarding

Imagine that you are doing web development on a remote system called _remote.example.com_. You usually reach this system via _ssh_ but it’s behind a firewall that allows very little additional access, and blocks most other ports. To try out your web app, it’s helpful to be able to use your web browser to point to the remote system. But you can’t reach it via the normal method of typing the URL in your browser, thanks to that pesky firewall.

Local forwarding allows you to tunnel a port available via the remote system through your _ssh_ connection. The port appears as a local port on your system (thus “local forwarding.”)

Let’s say your web app is running on port 8000 on the _remote.example.com_ box. To locally forward that system’s port 8000 to your system’s port 8000, use the _-L_ option with _ssh_ when you start your session:

```
$ ssh -L 8000:localhost:8000 remote.example.com
```

Wait, why did we use _localhost_ as the target for forwarding? It’s because from the perspective of _remote.example.com_, you’re asking the host to use its own port 8000. (Recall that any host usually can refer to itself as _localhost_ to connect to itself via a network connection.) That port now connects to your system’s port 8000. Once the _ssh_ session is ready, keep it open, and you can type _<http://localhost:8000>_ in your browser to see your web app. The traffic between systems now travels securely over an _ssh_ tunnel!

If you have a sharp eye, you may have noticed something. What if we used a different hostname than _localhost_ for the _remote.example.com_ to forward? If it can reach a port on another system on its network, it usually can forward that port just as easily. For example, say you wanted to reach a MariaDB or MySQL service on the _db.example.com_ box also on the remote network. This service typically runs on port 3306. So you could forward it with this command, even if you can’t _ssh_ to the actual _db.example.com_ host:

```
$ ssh -L 3306:db.example.com:3306 remote.example.com
```

Now you can run MariaDB commands against your _localhost_ and you’re actually using the _db.example.com_ box.

### Remote port forwarding

Remote forwarding lets you do things the opposite way. Imagine you’re designing a web app for a friend at the office, and want to show them your work. Unfortunately, though, you’re working in a coffee shop, and because of the network setup, they can’t reach your laptop via a network connection. However, you both use the _remote.example.com_ system at the office and you can still log in there. Your web app seems to be running well on port 5000 locally.

Remote port forwarding lets you tunnel a port from your local system through your _ssh_ connection, and make it available on the remote system. Just use the _-R_ option when you start your _ssh_ session:

```
$ ssh -R 6000:localhost:5000 remote.example.com
```

Now when your friend inside the corporate firewall runs their browser, they can point it at _<http://remote.example.com:6000>_ and see your work. And as in the local port forwarding example, the communications travel securely over your _ssh_ session.

By default the _sshd_ daemon running on a host is set so that **only** that host can connect to its remote forwarded ports. Let’s say your friend wanted to be able to let people on other _example.com_ corporate hosts see your work, and they weren’t on _remote.example.com_ itself. You’d need the owner of the _remote.example.com_ host to add **one** of these options to _/etc/ssh/sshd_config_ on that box:

```
GatewayPorts yes       # OR
GatewayPorts clientspecified
```

The first option means remote forwarded ports are available on all the network interfaces on _remote.example.com_. The second means that the client who sets up the tunnel gets to choose the address. This option is set to **no** by default.

With this option, you as the _ssh_ client must still specify the interfaces on which the forwarded port on your side can be shared. Do this by adding a network specification before the local port. There are several ways to do this, including the following:

```
$ ssh -R *:6000:localhost:5000                   # all networks
$ ssh -R 0.0.0.0:6000:localhost:5000             # all networks
$ ssh -R 192.168.1.15:6000:localhost:5000        # single network
$ ssh -R remote.example.com:6000:localhost:5000  # single network
```

### Other notes

Notice that the port numbers need not be the same on local and remote systems. In fact, at times you may not even be able to use the same port. For instance, normal users may not to forward onto a system port in a default setup.

In addition, it’s possible to restrict forwarding on a host. This might be important to you if you need tighter security on a network-connected host. The _PermitOpen_ option for the _sshd_ daemon controls whether, and which, ports are available for TCP forwarding. The default setting is **any**, which allows all the examples above to work. To disallow any port fowarding, choose **none**, or choose only a specific **host:port** setting to permit. For more information, search for _PermitOpen_ in the manual page for _sshd_ daemon configuration:

```
$ man sshd_config
```

Finally, remember port forwarding only happens as long as the controlling _ssh_ session is open. If you need to keep the forwarding active for a long period, try running the session in the background using the _-N_ option. Make sure your console is locked to prevent tampering while you’re away from it.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-ssh-port-forwarding-on-fedora/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/10/ssh-port-forwarding-816x345.jpg
[2]: https://en.wikipedia.org/wiki/Secure_Shell
[3]: https://fedoramagazine.org/open-source-ssh-clients/
