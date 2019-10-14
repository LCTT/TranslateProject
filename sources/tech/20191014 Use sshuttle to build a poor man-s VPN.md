[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use sshuttle to build a poor man’s VPN)
[#]: via: (https://fedoramagazine.org/use-sshuttle-to-build-a-poor-mans-vpn/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

Use sshuttle to build a poor man’s VPN
======

![][1]

Nowadays, business networks often use a VPN (virtual private network) for [secure communications with workers][2]. However, the protocols used can sometimes make performance slow. If you can reach reach a host on the remote network with SSH, you could set up port forwarding. But this can be painful, especially if you need to work with many hosts on that network. Enter **sshuttle** — which lets you set up a quick and dirty VPN with just SSH access. Read on for more information on how to use it.

The sshuttle application was designed for exactly the kind of scenario described above. The only requirement on the remote side is that the host must have Python available. This is because sshuttle constructs and runs some Python source code to help transmit data.

### Installing sshuttle

The sshuttle application is packaged in the official repositories, so it’s easy to install. Open a terminal and use the following command [with sudo][3]:

```
$ sudo dnf install sshuttle
```

Once installed, you may find the manual page interesting:

```
$ man sshuttle
```

### Setting up the VPN

The simplest case is just to forward all traffic to the remote network. This isn’t necessarily a crazy idea, especially if you’re not on a trusted local network like your own home. Use the _-r_ switch with the SSH username and the remote host name:

```
$ sshuttle -r username@remotehost 0.0.0.0/0
```

However, you may want to restrict the VPN to specific subnets rather than all network traffic. (A complete discussion of subnets is outside the scope of this article, but you can read more [here on Wikipedia][4].) Let’s say your office internally uses the reserved Class A subnet 10.0.0.0 and the reserved Class B subnet 172.16.0.0. The command above becomes:

```
$ sshuttle -r username@remotehost 10.0.0.0/8 172.16.0.0/16
```

This works great for working with hosts on the remote network by IP address. But what if your office is a large network with lots of hosts? Names are probably much more convenient — maybe even required. Never fear, sshuttle can also forward DNS queries to the office with the _–dns_ switch:

```
$ sshuttle --dns -r username@remotehost 10.0.0.0/8 172.16.0.0/16
```

To run sshuttle like a daemon, add the _-D_ switch. This also will send log information to the systemd journal via its syslog compatibility.

Depending on the capabilities of your system and the remote system, you can use sshuttle for an IPv6 based VPN. You can also set up configuration files and integrate it with your system startup if desired. If you want to read even more about sshuttle and how it works, [check out the official documentation][5]. For a look at the code, [head over to the GitHub page][6].

* * *

_Photo by _[_Kurt Cotoaga_][7]_ on _[_Unsplash_][8]_._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-sshuttle-to-build-a-poor-mans-vpn/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/10/sshuttle-816x345.jpg
[2]: https://en.wikipedia.org/wiki/Virtual_private_network
[3]: https://fedoramagazine.org/howto-use-sudo/
[4]: https://en.wikipedia.org/wiki/Subnetwork
[5]: https://sshuttle.readthedocs.io/en/stable/index.html
[6]: https://github.com/sshuttle/sshuttle
[7]: https://unsplash.com/@kydroon?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[8]: https://unsplash.com/s/photos/shuttle?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
