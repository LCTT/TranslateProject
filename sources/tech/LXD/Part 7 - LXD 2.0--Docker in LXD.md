Part 7 - LXD 2.0: Docker in LXD
==================================

This is the seventh blog post [in this series about LXD 2.0][0].

![](https://linuxcontainers.org/static/img/containers.png)

### Why run Docker inside LXD

As I briefly covered in the [first post of this series][1], LXD’s focus is system containers. That is, we run a full unmodified Linux distribution inside our containers. LXD for all intent and purposes doesn’t care about the workload running in the container. It just sets up the container namespaces and security policies, then spawns /sbin/init and waits for the container to stop.

Application containers such as those implemented by Docker or Rkt are pretty different in that they are used to distribute applications, will typically run a single main process inside them and be much more ephemeral than a LXD container.

Those two container types aren’t mutually exclusive and we certainly see the value of using Docker containers to distribute applications. That’s why we’ve been working hard over the past year to make it possible to run Docker inside LXD.

This means that with Ubuntu 16.04 and LXD 2.0, you can create containers for your users who will then be able to connect into them just like a normal Ubuntu system and then run Docker to install the services and applications they want.

### Requirements

There are a lot of moving pieces to make all of this working and we got it all included in Ubuntu 16.04:

- A kernel with CGroup namespace support (4.4 Ubuntu or 4.6 mainline)
- LXD 2.0 using LXC 2.0 and LXCFS 2.0
- A custom version of Docker (or one built with all the patches that we submitted)
- A Docker image which behaves when confined by user namespaces, or alternatively make the parent LXD container a privileged container (security.privileged=true)

### Running a basic Docker workload

Enough talking, lets run some Docker containers!

First of all, you need an Ubuntu 16.04 container which you can get with:

```
lxc launch ubuntu-daily:16.04 docker -p default -p docker
```

The “-p default -p docker” instructs LXD to apply both the “default” and “docker” profiles to the container. The default profile contains the basic network configuration while the docker profile tells LXD to load a few required kernel modules and set up some mounts for the container. The docker profile also enables container nesting.

Now lets make sure the container is up to date and install docker:

```
lxc exec docker -- apt update
lxc exec docker -- apt dist-upgrade -y
lxc exec docker -- apt install docker.io -y
```

And that’s it! You’ve got Docker installed and running in your container.
Now lets start a basic web service made of two Docker containers:

```
stgraber@dakara:~$ lxc exec docker -- docker run --detach --name app carinamarina/hello-world-app
Unable to find image 'carinamarina/hello-world-app:latest' locally
latest: Pulling from carinamarina/hello-world-app
efd26ecc9548: Pull complete 
a3ed95caeb02: Pull complete 
d1784d73276e: Pull complete 
72e581645fc3: Pull complete 
9709ddcc4d24: Pull complete 
2d600f0ec235: Pull complete 
c4cf94f61cbd: Pull complete 
c40f2ab60404: Pull complete 
e87185df6de7: Pull complete 
62a11c66eb65: Pull complete 
4c5eea9f676d: Pull complete 
498df6a0d074: Pull complete 
Digest: sha256:6a159db50cb9c0fbe127fb038ed5a33bb5a443fcdd925ec74bf578142718f516
Status: Downloaded newer image for carinamarina/hello-world-app:latest
c8318f0401fb1e119e6c5bb23d1e706e8ca080f8e44b42613856ccd0bf8bfb0d

stgraber@dakara:~$ lxc exec docker -- docker run --detach --name web --link app:helloapp -p 80:5000 carinamarina/hello-world-web
Unable to find image 'carinamarina/hello-world-web:latest' locally
latest: Pulling from carinamarina/hello-world-web
efd26ecc9548: Already exists 
a3ed95caeb02: Already exists 
d1784d73276e: Already exists 
72e581645fc3: Already exists 
9709ddcc4d24: Already exists 
2d600f0ec235: Already exists 
c4cf94f61cbd: Already exists 
c40f2ab60404: Already exists 
e87185df6de7: Already exists 
f2d249ff479b: Pull complete 
97cb83fe7a9a: Pull complete 
d7ce7c58a919: Pull complete 
Digest: sha256:c31cf04b1ab6a0dac40d0c5e3e64864f4f2e0527a8ba602971dab5a977a74f20
Status: Downloaded newer image for carinamarina/hello-world-web:latest
d7b8963401482337329faf487d5274465536eebe76f5b33c89622b92477a670f
```

With those two Docker containers now running, we can then get the IP address of our LXD container and access the service!

```
stgraber@dakara:~$ lxc list
+--------+---------+----------------------+----------------------------------------------+------------+-----------+
|  NAME  |  STATE  |         IPV4         |                      IPV6                    |    TYPE    | SNAPSHOTS |
+--------+---------+----------------------+----------------------------------------------+------------+-----------+
| docker | RUNNING | 172.17.0.1 (docker0) | 2001:470:b368:4242:216:3eff:fe55:45f4 (eth0) | PERSISTENT | 0         |
|        |         | 10.178.150.73 (eth0) |                                              |            |           |
+--------+---------+----------------------+----------------------------------------------+------------+-----------+

stgraber@dakara:~$ curl http://10.178.150.73
The linked container said... "Hello World!"
```

### Conclusion

That’s it! It’s really that simple to run Docker containers inside a LXD container.

Now as I mentioned earlier, not all Docker images will behave as well as my example, that’s typically because of the extra confinement that comes with LXD, specifically the user namespace.

Only the overlayfs storage driver of Docker works in this mode. That storage driver may come with its own set of limitation which may further limit how many images will work in this environment.

If your workload doesn’t work properly and you trust the user inside the LXD container, you can try:

```
lxc config set docker security.privileged true
lxc restart docker
```

That will de-activate the user namespace and will run the container in privileged mode.

Note however that in this mode, root inside the container is the same uid as root on the host. There are a number of known ways for users to escape such containers and gain root privileges on the host, so you should only ever do that if you’d trust the user inside your LXD container with root privileges on the host.

### Extra information

The main LXD website is at: <https://linuxcontainers.org/lxd>
Development happens on Github at: <https://github.com/lxc/lxd>
Mailing-list support happens on: <https://lists.linuxcontainers.org>
IRC support happens in: #lxcontainers on irc.freenode.net


--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/04/13/lxd-2-0-docker-in-lxd-712/

作者：[Stéphane Graber][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.stgraber.org/author/stgraber/
[0]: https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[1]: https://www.stgraber.org/2016/03/11/lxd-2-0-introduction-to-lxd-112/
[2]: https://linuxcontainers.org/lxd/try-it/
