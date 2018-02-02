How to use lxc remote with the LXD snap
======
**Background** : LXD is a hypervisor that manages machine containers on Linux distributions. You install LXD on your Linux distribution and then you can launch machine containers into your distribution running all sort of (other) Linux distributions.

You have installed the LXD snap and you are happy using it. However, you are developing LXD and you would like to use your freshly compiled LXD client (executable: **lxc** ) on the LXD snap.

Let’s run our compile lxc executable.
```
$ ./lxc list
LXD socket not found; is LXD installed and running?
Exit 1

```

By default it cannot access the LXD server from the snap. We need to [set up a remote LXD host][1] and then configure the client to be able to connect to that remote LXD server.

### Configuring the remote LXD server (snap)

We run the following on the LXD snap,
```
$ which lxd
/snap/bin/lxd

$ sudo lxd init
Do you want to configure a new storage pool (yes/no) [default=yes]? no
Would you like LXD to be available over the network (yes/no) [default=no]? yes
Address to bind LXD to (not including port) [default=all]: press_enter_to_accept_default
Port to bind LXD to [default=8443]: press_enter_to_accept_default
Trust password for new clients: type_a_password
Again: type_the_same_password
Do you want to configure the LXD bridge (yes/no) [default=yes]? no
LXD has been successfully configured.

$

```

Now the snap LXD server is configured to accept remote connections, and the clients much be configured with the correct trust password.

### Configuring the client (compiled lxc)

Let’s configure now the compiled lxc client.

First, here is how the unconfigured compiled lxc client would react,
```
$ ./lxc list
LXD socket not found; is LXD installed and running?
Exit 1

```

Now we add the remote, given the name **lxd.snap** , which binds on localhost (127.0.0.1). It asks to verify the certificate fingerprint. I am not aware how to view the fingerprint from inside the snap. We type the one-time password that we set earlier and we are good to go.
```
$ lxc remote add lxd.snap 127.0.0.1
Certificate fingerprint: 2c5829064cf795e29388b0d6310369fcf693257650b5c90c922a2d10f542831e
ok (y/n)? y
Admin password for lxd.snap: type_that_password
Client certificate stored at server: lxd.snap

$ lxc remote list
+-----------------|------------------------------------------|---------------|-----------|--------|--------+
| NAME | URL | PROTOCOL | AUTH TYPE | PUBLIC | STATIC |
+-----------------|------------------------------------------|---------------|-----------|--------|--------+
| images | https://images.linuxcontainers.org | simplestreams | | YES | NO |
+-----------------|------------------------------------------|---------------|-----------|--------|--------+
| local (default) | unix:// | lxd | tls | NO | YES |
+-----------------|------------------------------------------|---------------|-----------|--------|--------+
| lxd.snap | https://127.0.0.1:8443 | lxd | tls | NO | NO |
+-----------------|------------------------------------------|---------------|-----------|--------|--------+
| ubuntu | https://cloud-images.ubuntu.com/releases | simplestreams | | YES | YES |
+-----------------|------------------------------------------|---------------|-----------|--------|--------+
| ubuntu-daily | https://cloud-images.ubuntu.com/daily | simplestreams | | YES | YES |
+-----------------|------------------------------------------|---------------|-----------|--------|--------+

```

Still, the default remote is **local**. That means that **./lxc** will not work yet. We need to make **lxd.snap** the default remote.
```
$ ./lxc list
LXD socket not found; is LXD installed and running?
Exit 1

$ ./lxc remote set-default lxd.snap

$ ./lxc list
... now it works ...

```

### Conclusion

We saw how to get a client to access a LXD server. A more advanced scenario would be to have two LXD servers, and set them up so that each one can connect to the other.


--------------------------------------------------------------------------------

via: https://blog.simos.info/how-to-use-lxc-remote-with-the-lxd-snap/

作者：[Simos Xenitellis][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.simos.info/author/simos/
[1]:https://stgraber.org/2016/04/12/lxd-2-0-remote-hosts-and-container-migration-612/
