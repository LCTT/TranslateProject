Part 8 - LXD 2.0: LXD in LXD
==============================

This is the eighth blog post [in this series about LXD 2.0][0].

![](https://linuxcontainers.org/static/img/containers.png)

### Introduction

In the previous post I covered how to run [Docker inside LXD][1] which is a good way to get access to the portfolio of application provided by Docker while running in the safety of the LXD environment.

One use case I mentioned was offering a LXD container to your users and then have them use their container to run Docker. Well, what if they themselves want to run other Linux distributions inside their container using LXD, or even allow another group of people to have access to a Linux system by running a container for them?

Turns out, LXD makes it very simple to allow your users to run nested containers.

### Nesting LXD

The most simple case can be shown by using an Ubuntu 16.04 image. Ubuntu 16.04 cloud images come with LXD pre-installed. The daemon itself isn’t running as it’s socket-activated so it doesn’t use any resources until you actually talk to it.

So lets start an Ubuntu 16.04 container with nesting enabled:

```
lxc launch ubuntu-daily:16.04 c1 -c security.nesting=true
```

You can also set the security.nesting key on an existing container with:

```
lxc config set <container name> security.nesting true
```

Or for all containers using a particular profile with:

```
lxc profile set <profile name> security.nesting true
```

With that container started, you can now get a shell inside it, configure LXD and spawn a container:

```
stgraber@dakara:~$ lxc launch ubuntu-daily:16.04 c1 -c security.nesting=true
Creating c1
Starting c1

stgraber@dakara:~$ lxc exec c1 bash
root@c1:~# lxd init
Name of the storage backend to use (dir or zfs): dir

We detected that you are running inside an unprivileged container.
This means that unless you manually configured your host otherwise,
you will not have enough uid and gid to allocate to your containers.

LXD can re-use your container's own allocation to avoid the problem.
Doing so makes your nested containers slightly less safe as they could
in theory attack their parent container and gain more privileges than
they otherwise would.

Would you like to have your containers share their parent's allocation (yes/no)? yes
Would you like LXD to be available over the network (yes/no)? no
Do you want to configure the LXD bridge (yes/no)? yes
Warning: Stopping lxd.service, but it can still be activated by:
 lxd.socket
LXD has been successfully configured.

root@c1:~# lxc launch ubuntu:14.04 trusty
Generating a client certificate. This may take a minute...
If this is your first time using LXD, you should also run: sudo lxd init

Creating trusty
Retrieving image: 100%
Starting trusty

root@c1:~# lxc list
+--------+---------+-----------------------+----------------------------------------------+------------+-----------+
|  NAME  |  STATE  |         IPV4          |                     IPV6                     |    TYPE    | SNAPSHOTS |
+--------+---------+-----------------------+----------------------------------------------+------------+-----------+
| trusty | RUNNING | 10.153.141.124 (eth0) | fd7:f15d:d1d6:da14:216:3eff:fef1:4002 (eth0) | PERSISTENT | 0         |
+--------+---------+-----------------------+----------------------------------------------+------------+-----------+
root@c1:~#
```

It really is that simple!

### The online demo server

As this post is pretty short, I figured I would spend a bit of time to talk about the [demo server][2] we’re running. We also just reached the 10000 sessions mark earlier today!

That server is basically just a normal LXD running inside a pretty beefy virtual machine with a tiny daemon implementing the REST API used by our website.

When you accept the terms of service, a new LXD container is created for you with security.nesting enabled as we saw above. You are then attached to that container as you would when using “lxc exec” except that we’re doing it using websockets and javascript.

The containers you then create inside this environment are all nested LXD containers.
You can then nest even further in there if you want to.

We are using the whole range of [LXD resource limitations][3] to prevent one user’s actions from impacting the others and pretty closely monitor the server for any sign of abuse.

If you want to run your own similar server, you can grab the code for our website and the daemon with:

```
git clone https://github.com/lxc/linuxcontainers.org
git clone https://github.com/lxc/lxd-demo-server
```

### Extra information

The main LXD website is at: <https://linuxcontainers.org/lxd>
Development happens on Github at: <https://github.com/lxc/lxd>
Mailing-list support happens on: <https://lists.linuxcontainers.org>
IRC support happens in: #lxcontainers on irc.freenode.net


--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/04/14/lxd-2-0-lxd-in-lxd-812/

作者：[Stéphane Graber][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.stgraber.org/author/stgraber/
[0]: https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[1]: https://www.stgraber.org/2016/04/13/lxd-2-0-docker-in-lxd-712/
[2]: https://linuxcontainers.org/lxd/try-it/
[3]: https://www.stgraber.org/2016/03/26/lxd-2-0-resource-control-412/
