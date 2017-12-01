4 Ways to Speed Up SSH Connections in Linux 
===========================================

**SSH** is the most popular and secure method for managing Linux servers
remotely. One of the challenges with remote server management is
connection speeds, especially when it comes to session creation between
the remote and local machines.

There are several bottlenecks to this process, one scenario is when you
are connecting to a remote server for the first time; it normally takes
a few seconds to establish a session. However, when you try to start
multiple connections in succession, this causes an overhead (combination
of excess or indirect computation time, memory, bandwidth, or other
related resources to carry out the operation).

In this article, we will share four useful tips on how to speed up
remote SSH connections in Linux.

### 1. Force SSH Connection Over IPV4

OpenSSH supports both IPv4/IP6, but at times **IPv6** connections tend
to be slower. So you can consider forcing ssh connections over IPv4
only, using the syntax below:

```shell
# ssh -4 username@example.com
```

Alternatively, use the **AddressFamily** (specifies the address family
to use when connecting) directive in your ssh configuration file
**/etc/ssh/ssh\_config** (global configuration) or **\~/.ssh/config**
(user specific file).

The accepted values are "**any**", "**inet**" for IPv4 only, or"**inet6**".

```shell
$ vi ~.ssh/config 
```

![Disable SSH Connections on ipv6](https://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif)

![Disable SSH Connections on ipv6](https://www.tecmint.com/wp-content/uploads/2017/11/Disable-SSH-Connections-on-ipv6.png)


Here is a useful starter guide on configuring user specific ssh
configuration file:

1.  [How to Configure Custom SSH Connections to Simplify Remote Access](https://www.tecmint.com/configure-custom-ssh-connection-in-linux/)

Additionally, on the remote machine, you can also instruct the sshd
daemon to consider connections over IPv4 by using the above directive in
the **/etc/ssh/sshd\_config** file.

### 2. Disable DNS Lookup On Remote Machine

By default, sshd daemon looks up the remote host name, and also checks
that the resolved host name for the remote IP address maps back to the
very same IP address. This can result into delays in connection
establishment or session creation.

The **UseDNS** directive controls the above functionality; to disable
it, search and uncomment it in the **/etc/ssh/sshd\_config** file. If
it's not set, add it with the value `no`.

```conf
UseDNS  no
```

![Disable SSH DNS Lookup](https://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif)

![Disable SSH DNS Lookup](https://www.tecmint.com/wp-content/uploads/2017/11/Disable-SSH-DNS-Lookup.png)


### 3. Reuse SSH Connection

An ssh client program is used to establish connections to an sshd daemon
accepting remote connections. You can reuse an already-established
connection when creating a new ssh session and this can significantly
speed up subsequent sessions.

You can enable this in your **\~/.ssh/config** file.

```conf
Host *
ControlMaster auto
ControlPath  ~/.ssh/sockets/%[email protected]%h-%p
ControlPersist 600
```

The above configuration (**Host \***) will enable connection re-use for
all remote servers you connect to using these directives:

-   **ControlMaster** -- enables the sharing of multiple sessions over a
    single network connection.
-   **ControlPath** -- defines a path to the control socket used for
    connection sharing.
-   **ControlPersist** -- if used together with **ControlMaster**, tells
    ssh to keep the master connection open in the background (waiting
    for future client connections) once the initial client connection
    has been closed.

![Reuse SSH Connections](https://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif)

![Reuse SSH Connections](https://www.tecmint.com/wp-content/uploads/2017/11/Reuse-SSH-Connections.png)


You can enable this for connections to a specific remote server, for
instance:

```conf
Host server1
HostName   www.example.com
IdentityFile  ~/.ssh/webserver.pem
User username_here
ControlMaster auto
ControlPath  ~/.ssh/sockets/%[email protected]%h-%p
ControlPersist  600
```

This way you only suffer the connection overhead for the first
connection, and all subsequent connections will be much faster.

### 4. Use Specific SSH Authentication Method

Another way of speeding up ssh connections is to use a given
authentication method for all ssh connections, and here we recommend
configuring [ssh passwordless login](https://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/)
using ssh keygen in 5 easy steps.

Once that is done, use the **PreferredAuthentications** directive,
within **ssh\_config** files (global or user specific) above. This
directive defines the order in which the client should try
authentication methods (you can specify a command separated list to use
more than one method).

```conf
PreferredAuthentications=publickey 
```

![SSH Authentication Method](https://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif)

![SSH Authentication Method](https://www.tecmint.com/wp-content/uploads/2017/11/SSH-Authentication-Method.png)


Optionally, use this syntax below from the command line.

```shell
# ssh -o "PreferredAuthentications=publickey" [email protected]
```

If you prefer password authentication which is deemed unsecure, use
this.

```shell
# ssh -o "PreferredAuthentications=password" [email protected]
```

Finally, you need to restart your sshd daemon after making all the above
changes.

```shell
# systemctl restart sshd   #Systemd
# service sshd restart      #SysVInit
```

For more information about the directives used here, see the
**ssh\_config** and **sshd\_config** man pages.

```shell
# man ssh_config
# man sshd_config 
```

Also check out these useful guides for securing ssh on Linux systems:

1.  [5 Best Practices to Secure and Protect SSH
    Server](https://www.tecmint.com/5-best-practices-to-secure-and-protect-ssh-server/)
2.  [How to Disconnect Inactive or Idle SSH Connections in
    Linux](https://www.tecmint.com/auto-disconnect-inactive-or-idle-ssh-connections-in-linux/)

That's all for now! Do you have any tips/tricks for speeding up SSH
connections. We would love to hear of other ways of doing this. Use the
comment form below to share with us.

--------------------------------------------------------------------------------

via: https://www.tecmint.com/speed-up-ssh-connections-in-linux/

作者：[Aaron Kili ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

