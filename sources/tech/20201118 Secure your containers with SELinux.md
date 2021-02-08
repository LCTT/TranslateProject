[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Secure your containers with SELinux)
[#]: via: (https://opensource.com/article/20/11/selinux-containers)
[#]: author: (Mike Calizo https://opensource.com/users/mcalizo)

Secure your containers with SELinux
======
Hack your system to understand why it's important to configure SELinux
to be your first line of container defense.
![Three closed doors][1]

When things aren't working correctly in your Linux environment, the easiest thing to do is disable Security-Enhanced Linux ([SELinux][2]). Things suddenly begin to work, and you forget about it—but this is a common pitfall that means you've lost a very powerful security tool.

Threats are rising alongside the rise of containers, microservices, and distributed architecture. This is due to an old, well-known issue: velocity. The advantage of containers is that they enable you to move fast, do more, and change quickly. This means container adoption has gone off the roof, but the speed it affords also means you will encounter more issues and vulnerabilities. This happens naturally when you're doing more things faster and quicker.

### How to mitigate threats

As Sun Tzu said, "The wise warrior avoids the battle." This quote really resonates when it comes to containers' basic defense. To avoid problems (battles), make sure that your container host is secure and that you can use SELinux as your first line of defense.

SELinux is an open source project released in 2000 and integrated into the Linux kernel in 2003. According to [Red Hat's explainer][3], "SELinux is a security architecture for [Linux systems][4] that allows administrators to have more control over who can access the system. It was originally developed by the United States National Security Agency (NSA) as a series of patches to the [Linux kernel][5] using Linux Security Modules (LSM)."

### Get started

When you think about containers, the first thing that probably comes into mind is [Docker][6]. Docker started a container adoption revolution after it emerged in 2013. It is one of the main reasons that containers exploded in popularity, but as mentioned above, the high level of adoption increased users' vulnerability to security risks.

Before you can secure your Docker containers with SELinux, you need to set some things up.

#### Prerequisites:

  * CentOS 8/RHEL 8 installed and configured
  * Docker CE installed and configured
  * Two accounts created: root and non-root (`mcalizo` in the examples below)



If you need to set up Docker on your RHEL 8/CentOS 8 server, you can follow these [instructions][7]. If you're running RHEL 8, you need to remove the pre-installed Podman and runc packages before beginning.

First, make sure SELinux is enabled:


```
[mcalizo@Rhel82 ~]$ sestatus
SELinux status:                 enabled
SELinuxfs mount:                /sys/fs/selinux
SELinux root directory:         /etc/selinux
Loaded policy name:             targeted
Current mode:                   enforcing
Mode from config file:          enforcing
Policy MLS status:              enabled
Policy deny_unknown status:     allowed
Memory protection checking:     actual (secure)
Max kernel policy version:      31
[mcalizo@Rhel82 ~]$
```

Then, verify your OS version and that Docker is running. Log in as root and run:


```
[root@rhel82 ~]# cat /etc/redhat-release
Red Hat Enterprise Linux release 8.2 (Ootpa)
[root@rhel82 ~]#

[root@rhel82 ~]# systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; vendor preset: disabled)
   Active: active (running) since Wed 2020-10-28 19:10:14 EDT; 15s ago
     Docs: <https://docs.docker.com>
 Main PID: 30768 (dockerd)
    Tasks: 8
   Memory: 39.0M
   CGroup: /system.slice/docker.service
           └─30768 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

Oct 28 19:10:13 rhel82.home.labs.com dockerd[30768]: time="2020-10-28T19:10:13.889602941-04:00" level=error msg="&gt;
Oct 28 19:10:13 rhel82.home.labs.com dockerd[30768]: time="2020-10-28T19:10:13.903413613-04:00" level=warning msg&gt;
Oct 28 19:10:13 rhel82.home.labs.com dockerd[30768]: time="2020-10-28T19:10:13.903427451-04:00" level=warning msg&gt;
Oct 28 19:10:13 rhel82.home.labs.com dockerd[30768]: time="2020-10-28T19:10:13.903538271-04:00" level=info msg="L&gt;
Oct 28 19:10:14 rhel82.home.labs.com dockerd[30768]: time="2020-10-28T19:10:14.132060506-04:00" level=info msg="D&gt;
Oct 28 19:10:14 rhel82.home.labs.com dockerd[30768]: time="2020-10-28T19:10:14.308943088-04:00" level=info msg="L&gt;
Oct 28 19:10:14 rhel82.home.labs.com dockerd[30768]: time="2020-10-28T19:10:14.319438549-04:00" level=info msg="D&gt;
Oct 28 19:10:14 rhel82.home.labs.com dockerd[30768]: time="2020-10-28T19:10:14.319570298-04:00" level=info msg="D&gt;
Oct 28 19:10:14 rhel82.home.labs.com dockerd[30768]: time="2020-10-28T19:10:14.333419209-04:00" level=info msg="A&gt;
Oct 28 19:10:14 rhel82.home.labs.com systemd[1]: Started Docker Application Container Engine
```

Check your Docker version:


```
[root@rhel82 ~]# docker --version
Docker version 19.03.13, build 4484c46d9d
```

### Hack your host

One of the best ways to understand a problem is to experience it. So, I'll show you how easy it is to inject malicious code into a Docker host if your security is not set up properly.

To be able to do something bad on the Docker host, the malicious non-root user (`mcalizo` in this tutorial) must be part of the group that can instantiate Docker containers.

First, confirm what group the `mcalizo` user belongs to:


```
[root@Rhel82 ~]# groups mcalizo
mcalizo : mcalizo
```

The output shows that `mcalizo` belongs only to its own group. This means `mcalizo` can't instantiate Docker containers and will get this error if it tries:


```
[mcalizo@Rhel82 ~]$ docker run -it --rm centos:latest /bin/sh
docker: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdocker.sock/v1.40/containers/create: dial unix /var/run/docker.sock: connect: permission denied.
See 'docker run --help'.
```

To allow `mcalizo` to instantiate the container, add the user to the `docker` group:


```
[root@Rhel82 ~]# usermod -G docker -a mcalizo
[root@Rhel82 ~]# groups mcalizo
mcalizo : mcalizo docker
```

Next, deploy a `fedora:latest` container and log into the instantiated container to explore it:


```
[mcalizo@Rhel82 ~]$ docker run -it --rm fedora:latest /bin/sh
Unable to find image 'fedora:latest' locally
latest: Pulling from library/fedora
ee7e89337106: Pull complete
Digest: sha256:b9ec86d36fca7b1d3de39cd7c258e8d90c377d312c21a7748071ce49069b8db4
Status: Downloaded newer image for fedora:latest
sh-5.0# cat /etc/redhat-release
Fedora release 33 (Thirty Three)
```

While you're logged into the newly created container, you can see you are automatically logged in as root:


```
sh-5.0# whoami
root
sh-5.0#
```

As `root` user, you can do anything in this container, which means you can exploit the container host and do a lot of damage. Because you can instantiate a container, you can do things to the host even if you are not part of the host's sudoers account.

Exit the container you just created, and create a new container to demonstrate the exploit:


```
[mcalizo@Rhel82 ~]$ docker run -it --rm -v /:/exploit fedora:latest /bin/bash
[root@131043f2e306 /]#
```

The [-v option][8] mounts the Docker host's `/` directory to the container under the `/exploit` directory:


```
[root@131043f2e306 /]#ls exploit/
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
```

Because it is mounted, you can do _anything_ on the Docker host. For example, you can delete files, edit specific configurations to harm the system, or even install a Trojan horse application or other malware to steal important information.

### Why does this happen?

You may be wondering why this is possible since SELinux is in enforcing mode. Dig deeper into SELinux to see where things went wrong.

Verify that SELinux has a [Docker context][9]:


```
[mcalizo@Rhel82 ~]$ ps -eZ | grep docker
system_u:system_r:container_runtime_t:s0 30768 ? 00:00:04 dockerd
[mcalizo@Rhel82 ~]$
```

As expected, it does. This means SELinux manages the Docker daemon. Inspect the Docker daemon to see if SELinux is enabled by default:


```
[mcalizo@Rhel82 ~]$ docker info | grep Security -A3
 Security Options:
  seccomp
   Profile: default
 Kernel Version: 4.18.0-193.el8.x86_64
```

SELinux is _not_ enabled by default. This is the problem! To fix it, enable SELinux to control and manage Docker by updating or creating the file `/etc/docker/daemon.json` as [documented here][10] (you must have root access to do this):


```
[root@Rhel82 ~]# cat /etc/docker/daemon.json
{
  "selinux-enabled": true
}
[root@Rhel82 ~]#
[root@Rhel82 ~]# systemctl restart docker
```

After creating or updating the file and restarting Docker, you should see that SELinux support is enabled in the Docker daemon:


```
[root@Rhel82 ~]# systemctl restart docker
[mcalizo@Rhel82 root]$ docker info | grep Security -A3
 Security Options:
  seccomp
   Profile: default
  selinux
[mcalizo@Rhel82 root]$
```

While it's still possible to mount a specific filesystem in your Docker host on your Docker container, updating or accessing the file is no longer allowed:


```
[mcalizo@Rhel82 root]$ docker run -it --rm -v /:/exploit fedora:latest /bin/bash
[root@ecb5836da1f6 /]# touch /exploit/etc/shadow.sh
touch: cannot touch '/exploit/etc/shadow.sh': Permission denied
[root@ecb5836da1f6 /]#
```

### Learn more

Your first line of defense in the container world depends on how strongly you set up your container hosts' operating system. There are numerous ways to implement Linux security, including options available on the market to augment your security posture.

SELinux is an additional layer of security that is built into [Linux distributions][11] by default. To take advantage of it and protect your system against compromise, make sure SELinux remains on.

If you want to learn more, see:

  * [How to install Docker CE on CentOS 8 / RH][7]
  * [Docker security cheat sheet][12]
  * [dockerd documentation][10]
  * [Use volumes documentation][8]
  * [What is SELinux?][3]



Few things in the Linux world evoke a strong reaction like SELinux , the security enhancement for...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/selinux-containers

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mcalizo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/EDU_UnspokenBlockers_1110_A.png?itok=x8A9mqVA (Three closed doors)
[2]: https://en.wikipedia.org/wiki/Security-Enhanced_Linux
[3]: https://www.redhat.com/en/topics/linux/what-is-selinux
[4]: https://www.redhat.com/en/topics/linux/what-is-linux
[5]: https://www.redhat.com/en/topics/linux/what-is-the-linux-kernel
[6]: https://opensource.com/resources/what-docker
[7]: https://www.linuxtechi.com/install-docker-ce-centos-8-rhel-8/
[8]: https://docs.docker.com/storage/volumes/
[9]: https://docs.docker.com/engine/reference/commandline/context/
[10]: https://docs.docker.com/engine/reference/commandline/dockerd/
[11]: https://www.redhat.com/en/topics/linux/whats-the-best-linux-distro-for-you
[12]: https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html
