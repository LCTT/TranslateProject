使用 Docker 的用户名字空间功能
======

<ruby>用户名字空间<rt>User Namespaces</rt></ruby> 于 Docker 1.10 版本正式纳入其中，该功能允许主机系统将自身的 `uid` 和 `gid` 映射为容器进程中的另一个 `uid` 和 `gid`。这对 Docker 的安全性来说是一项巨大的改进。下面我会通过一个案例来展示一下用户名字空间能够解决的问题，以及如何启用该功能。

### 创建一个 Docker Machine

如果你已经创建好了一台用来试验用户名字空间的 docker <ruby>机器<rt>Machine</rt></ruby>，那么可以跳过这一步。我在自己的 Macbook 上安装了 Docker Toolbox，因此我只需用 `docker-machine` 命令就很简单地创建一个基于 VirtualBox 的 Docker 机器（这里假设主机名为 `host1`）：

```
# Create host1
$ docker-machine create --driver virtualbox host1

# Login to host1
$ docker-machine ssh host1
```

### 理解在用户名字空间未启用的情况下，非 root 用户能做什么

在启用用户名字空间前，我们先来看一下会有什么问题。Docker 到底哪个地方做错了？首先，使用 Docker 的一大优势在于用户在容器中可以拥有 root 权限，因此用户可以很方便地安装软件包。但是在 Linux 容器技术中这也是一把双刃剑。只要经过少许操作，非 root 用户就能以 root 的权限访问主机系统中的内容，比如 `/etc`。下面是操作步骤。

```
# Run a container and mount host1's /etc onto /root/etc
$ docker run --rm -v /etc:/root/etc -it ubuntu

# Make some change on /root/etc/hosts
root@34ef23438542:/# vi /root/etc/hosts

# Exit from the container
root@34ef23438542:/# exit

# Check /etc/hosts
$ cat /etc/hosts
```

你可以看到，步骤简单到难以置信，很明显 Docker 并不适用于运行在多人共享的电脑上。但是现在，通过用户名字空间，Docker 可以避免这个问题。

### 启用用户名字空间

```
# Create a user called "dockremap"
$ sudo adduser dockremap

# Setup subuid and subgid
$ sudo sh -c 'echo dockremap:500000:65536 > /etc/subuid'
$ sudo sh -c 'echo dockremap:500000:65536 > /etc/subgid'
```

然后，打开 `/etc/init.d/docker`，并在 `/usr/local/bin/docker daemon` 后面加上 `--userns-remap=default`，像这样：

```
$ sudo vi /etc/init.d/docker

/usr/local/bin/docker daemon --userns-remap=default -D -g "$DOCKER_DIR" -H unix:// $DOCKER_HOST $EXTRA_ARGS >> "$DOCKER_LOGFILE" 2>&1 &
```

然后重启 Docker：

```
$ sudo /etc/init.d/docker restart
```

这就完成了！

**注意**：若你使用的是 CentOS 7，则你需要了解两件事。

1. 内核默认并没有启用用户名字空间。运行下面命令并重启系统，可以启用该功能。

    ```
    sudo grubby --args="user_namespace.enable=1" \
        --update-kernel=/boot/vmlinuz-3.10.0-XXX.XX.X.el7.x86_64
    ```

2. CentOS 7 使用 `systemctl` 来管理服务，因此你需要编辑的文件是 `/usr/lib/systemd/system/docker.service`。

### 确认用户名字空间是否正常工作

若一切都配置妥当，则你应该无法再在容器中编辑 host1 上的 `/etc` 了。让我们来试一下。

```
# Create a container and mount host1's /etc to container's /root/etc
$ docker run --rm -v /etc:/root/etc -it ubuntu

# Check the owner of files in /root/etc, which should be "nobody nogroup".
root@d5802c5e670a:/# ls -la /root/etc
total 180
drwxr-xr-x 11 nobody nogroup 1100 Mar 21 23:31 .
drwx------ 3 root root 4096 Mar 21 23:50 ..
lrwxrwxrwx 1 nobody nogroup 19 Mar 21 23:07 acpi -> /usr/local/etc/acpi
-rw-r--r-- 1 nobody nogroup 48 Mar 10 22:09 boot2docker
drwxr-xr-x 2 nobody nogroup 60 Mar 21 23:07 default

# Try creating a file in /root/etc
root@d5802c5e670a:/# touch /root/etc/test
touch: cannot touch '/root/etc/test': Permission denied

# Try deleting a file
root@d5802c5e670a:/# rm /root/etc/hostname
rm: cannot remove '/root/etc/hostname': Permission denied
```

好了，太棒了。这就是用户名字空间的工作方式。

---

via: https://coderwall.com/p/s_ydlq/using-user-namespaces-on-docker

作者：[Koji Tanaka][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[lujun9972](https://github.com/lujun9972)
校对：[pityonline](https://github.com/pityonline)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://coderwall.com/kjtanaka
