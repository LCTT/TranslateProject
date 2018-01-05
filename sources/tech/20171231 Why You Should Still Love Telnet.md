Why You Should Still Love Telnet
======
Telnet, the protocol and the command line tool, were how system administrators used to log into remote servers. However, due to the fact that there is no encryption all communication, including passwords, are sent in plaintext meant that Telnet was abandoned in favour of SSH almost as soon as SSH was created.

For the purposes of logging into a remote server, you should never, and probably have never considered it. This does not mean that the `telnet` command is not a very useful tool when used for debugging remote connection problems.

In this guide, we will explore using `telnet` to answer the all too common question, "Why can't I ###### connect‽".

This frustrated question is usually encountered after installing a application server like a web server, an email server, an ssh server, a Samba server etc, and for some reason, the client won't connect to the server.

`telnet` isn't going to solve your problem but it will, very quickly, narrow down where you need to start looking to fix your problem.

`telnet` is a very simple command to use for debugging network related issues and has the syntax:
```
telnet <hostname or IP> <port>

```

Because `telnet` will initially simply establish a connection to the port without sending any data it can be used with almost any protocol including encrypted protocols.

There are four main errors that you will encounter when trying to connect to a problem server. We will look at all four, explore what they mean and look at how you should fix them.

For this guide we will assume that we have just installed a [Samba][1] server at `samba.example.com` and we can't get a local client to connect to the server.

### Error 1 - The connection that hangs forever

First, we need to attempt to connect to the Samba server with `telnet`. This is done with the following command (Samba listens on port 445):
```
telnet samba.example.com 445

```

Sometimes, the connection will get to this point stop indefinitely:
```
telnet samba.example.com 445
Trying 172.31.25.31...

```

This means that `telnet` has not received any response to its request to establish a connection. This can happen for two reasons:

  1. There is a router down between you and the server.
  2. There is a firewall dropping your request.



In order to rule out **1.** run a quick [`mtr samba.example.com`][2] to the server. If the server is accessible then it's a firewall (note: it's almost always a firewall).

Firstly, check if there are any firewall rules on the server itself with the following command `iptables -L -v -n`, if there are none then you will get the following output:
```
iptables -L -v -n
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target prot opt in out source destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target prot opt in out source destination

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target prot opt in out source destination

```

If you see anything else then this is likely the problem. In order to check, stop `iptables` for a moment and run `telnet samba.example.com 445` again and see if you can connect. If you still can't connect see if your provider and/or office has a firewall in place that is blocking you.

### Error 2 - DNS problems

A DNS issue will occur if the hostname you are using does not resolve to an IP address. The error that you will see is as follows:
```
telnet samba.example.com 445
Server lookup failure: samba.example.com:445, Name or service not known

```

The first step here is to substitute the IP address of the server for the hostname. If you can connect to the IP but not the hostname then the problem is the hostname.

This can happen for many reasons (I have seen all of the following):

  1. Is the domain registered? Use `whois` to find out if it is.
  2. Is the domain expired? Use `whois` to find out if it is.
  3. Are you using the correct hostname? Use `dig` or `host` to ensure that the hostname you are using resolves to the correct IP.
  4. Is your **A** record correct? Check that you didn 't accidentally create an **A** record for something like `smaba.example.com`.



Always double check the spelling and the correct hostname (is it `samba.example.com` or `samba1.example.com`) as this will often trip you up especially with long, complicated or foreign hostnames.

### Error 3 - The server isn't listening on that port

This error occurs when `telnet` is able to reach to the server but there is nothing listening on the port you specified. The error looks like this:
```
telnet samba.example.com 445
Trying 172.31.25.31...
telnet: Unable to connect to remote host: Connection refused

```

This can happen for a couple of reasons:

  1. Are you **sure** you 're connecting to the right server?
  2. Your application server is not listening on the port you think it is. Check exactly what it's doing by running `netstat -plunt` on the server and see what port it is, in fact, listening on.
  3. The application server isn't running. This can happen when the application server exits immediately and silently after you start it. Start the server and run `ps auxf` or `systemctl status application.service` to check it's running.



### Error 4 - The connection was closed by the server

This error happens when the connection was successful but the application server has a build in security measure that killed the connection as soon as it was made. This error looks like:
```
telnet samba.example.com 445
Trying 172.31.25.31...
Connected to samba.example.com.
Escape character is '^]'.
��Connection closed by foreign host.

```

The last line `Connection closed by foreign host.` indicates that the connection was actively terminated by the server. In order to fix this, you need to look at the security configuration of the application server to ensure your IP or user is allowed to connect to it.

### A successful connection

This is what a successful `telnet` connection attempt looks like:
```
telnet samba.example.com 445
Trying 172.31.25.31...
Connected to samba.example.com.
Escape character is '^]'.

```

The connection will stay open for a while depending on the timeout of the application server you are connected to.

A telnet connection is closed by typing `CTRL+]` and then when you see the `telnet>` prompt, type "quit" and hit ENTER i.e.:
```
telnet samba.example.com 445
Trying 172.31.25.31...
Connected to samba.example.com.
Escape character is '^]'.
^]
telnet> quit
Connection closed.

```

### Conclusion

There are a lot of reasons that a client application can't connect to a server. The exact reason can be difficult to establish especially when the client is a GUI that offers little or no error information. Using `telnet` and observing the output will allow you to very rapidly narrow down where the problem lies and save you a whole lot of time.

--------------------------------------------------------------------------------

via: https://bash-prompt.net/guides/telnet/

作者：[Elliot Cooper][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://bash-prompt.net
[1]:https://www.samba.org/
[2]:https://www.systutorials.com/docs/linux/man/8-mtr/
