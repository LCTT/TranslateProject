如何使用cloud-init来预配置LXD容器
======
当你正在创建LXD容器的时候，你希望它们能被预先配置好。例如在容器一启动就自动执行 **apt update**来安装一些软件包，或者运行一些命令。
这篇文章将讲述如何用[**cloud-init**][1]来对[LXD容器进行进行早期初始化][2]。
接下来，我们将创建一个包含cloud-init指令的LXD profile，然后启动一个新的容器来使用这个profile。 

### 如何创建一个新的LXD profile

查看已经存在的profile：

```shell
$ lxc profile list
+---------|---------+
| NAME    | USED BY |
+---------|---------+
| default | 11      |
+---------|---------+
```

我们把名叫default的profile复制一份，然后在其内添加新的指令：

```shell
$ lxc profile copy default devprofile

$ lxc profile list
+------------|---------+
| NAME       | USED BY |
+------------|---------+
| default    | 11      |
+------------|---------+
| devprofile | 0       |
+------------|---------+
```

我们就得到了一个新的profile： **devprofile**。下面是它的详情：

```yaml
$ lxc profile show devprofile
config:
 environment.TZ: ""
description: Default LXD profile
devices:
 eth0:
 nictype: bridged
 parent: lxdbr0
 type: nic
 root:
 path: /
 pool: default
 type: disk
name: devprofile
used_by: []
```

注意这几个部分： **config:** ， **description:** ， **devices:** ， **name:** 和 **used_by:**，当你修改这些内容的时候注意不要搞错缩进。（译者注：因为这些内容是YAML格式的，缩进是语法的一部分）

### 如何把cloud-init添加到LXD profile里

[cloud-init][1]可以添加到LXD profile的 **config** 里。当这些指令将被传递给容器后，会在容器第一次启动的时候执行。
下面是用在示例中的指令：

```yaml
 package_upgrade: true
 packages:
 - build-essential
 locale: es_ES.UTF-8
 timezone: Europe/Madrid
 runcmd:
 - [touch, /tmp/simos_was_here]
```

**package_upgrade: true** 是指当容器第一次被启动时，我们想要**cloud-init** 运行 **sudo apt upgrade**。
**packages:** 列出了我们想要自动安装的软件。然后我们设置了**locale** and **timezone**。在Ubuntu容器的镜像里，root用户默认的 locale 是**C.UTF-8**，而**ubuntu** 用户则是 **en_US.UTF-8**。此外，我们把时区设置为**Etc/UTC**。
最后，我们展示了[如何使用**runcmd**来运行一个Unix命令][3]。

我们需要关注如何将**cloud-init**指令插入LXD profile。

我首选的方法是：

```
$ lxc profile edit devprofile
```

它会打开一个文本编辑器，以便你将指令粘贴进去。[结果应该是这样的][4]：

```yaml
$ lxc profile show devprofile
config:
  environment.TZ: ""
  user.user-data: |
    #cloud-config
    package_upgrade: true
    packages:
      - build-essential
    locale: es_ES.UTF-8
    timezone: Europe/Madrid
    runcmd:
      - [touch, /tmp/simos_was_here]
description: Default LXD profile
devices:
  eth0:
    nictype: bridged
    parent: lxdbr0
    type: nic
  root:
    path: /
    pool: default
    type: disk
name: devprofile
used_by: []
```

### 如何使用LXD profile启动一个容器

使用profile **devprofile**来启动一个新容器：

```
$ lxc launch --profile devprofile ubuntu:x mydev
```

然后访问该容器来查看我们的的指令是否生效：

```shell
$ lxc exec mydev bash
root@mydev:~# ps ax
 PID TTY STAT TIME COMMAND
 1 ? Ss 0:00 /sbin/init
 ...
 427 ? Ss 0:00 /usr/bin/python3 /usr/bin/cloud-init modules --mode=f
 430 ? S 0:00 /bin/sh -c tee -a /var/log/cloud-init-output.log
 431 ? S 0:00 tee -a /var/log/cloud-init-output.log
 432 ? S 0:00 /usr/bin/apt-get --option=Dpkg::Options::=--force-con
 437 ? S 0:00 /usr/lib/apt/methods/http
 438 ? S 0:00 /usr/lib/apt/methods/http
 440 ? S 0:00 /usr/lib/apt/methods/gpgv
 570 ? Ss 0:00 bash
 624 ? S 0:00 /usr/lib/apt/methods/store
 625 ? R+ 0:00 ps ax
root@mydev:~#
```

如果我们连接得够快，通过**ps ax**将能够看到系统正在更新软件。我们可以从/var/log/cloud-init-output.log看到完整的日志：

```
Generating locales (this might take a while)...
 es_ES.UTF-8... done
Generation complete.
```

以上可以看出locale已经被更改了。root 用户还是保持默认的**C.UTF-8**，只有非root用户**ubuntu**使用了新的locale。

```
Hit:1 http://archive.ubuntu.com/ubuntu xenial InRelease
Get:2 http://archive.ubuntu.com/ubuntu xenial-updates InRelease [102 kB]
Get:3 http://security.ubuntu.com/ubuntu xenial-security InRelease [102 kB]
```

以上是安装软件包之前执行的**apt update**。

```
The following packages will be upgraded:
 libdrm2 libseccomp2 squashfs-tools unattended-upgrades
4 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 211 kB of archives.
```
以上是在执行**package_upgrade: true**和安装软件包。

```
The following NEW packages will be installed:
 binutils build-essential cpp cpp-5 dpkg-dev fakeroot g++ g++-5 gcc gcc-5
 libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl
```
以上是我们安装**build-essential**软件包的指令。

**runcmd** 执行的结果如何？

```
root@mydev:~# ls -l /tmp/
total 1
-rw-r--r-- 1 root root 0 Jan 3 15:23 simos_was_here
root@mydev:~#
```

可见它已经生效了！

### 结论

当我们启动LXD容器的时候，我们常常需要默认启用一些配置，并且希望能够避免重复工作。通常解决这个问题的方法是创建LXD profile，然后把需要的配置添加进去。最后，当我们启动新的容器时，只需要应用该LXD profile即可。

--------------------------------------------------------------------------------

via: https://blog.simos.info/how-to-preconfigure-lxd-containers-with-cloud-init/

作者：[Simos Xenitellis][a]
译者：[kaneg](https://github.com/kaneg)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.simos.info/author/simos/
[1]:http://cloudinit.readthedocs.io/en/latest/index.html
[2]:https://github.com/lxc/lxd/blob/master/doc/cloud-init.md
[3]:http://cloudinit.readthedocs.io/en/latest/topics/modules.html#runcmd
[4]:https://paste.ubuntu.com/26313399/