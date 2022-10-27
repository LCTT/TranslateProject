[#]: collector: (lujun9972)
[#]: translator: (hwlife)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14524-1.html)
[#]: subject: (Automate setup and delivery for virtual machines in the cloud)
[#]: via: (https://opensource.com/article/21/1/testcloud-virtual-machines)
[#]: author: (Sumantro Mukherjee https://opensource.com/users/sumantro)

在云端自动化设置和交付虚拟机
======

> 通过使用 Testcloud 自动化设置过程并交付一个准备运行的虚拟机，在几分钟之内准备好一个云镜像。

![](https://img.linux.net.cn/data/attachment/album/202204/30/130336l2l1a77p7m8hwp28.jpg)

如果你是一个在云端使用 Fedora [qcow2 镜像][2] 的开发者或者爱好者，在一个镜像准备使用之前，你总是不得不做一大堆初始化设置。我对此深有体会，所以我很想找到一种使设置过程更加简单的方法。碰巧，整个 Fedora 质量保证团队也有同感，所以我们开发了 [Testcloud][3] 。

Testcloud 是一个可以轻松的在几分钟之内准备云镜像测试的工具。它用几个命令就可以在云端自动化设置并交付准备运行的虚拟机（VM）。

Testcloud：

  1. 下载 qcow2 镜像
  2. 用你选择的名称创建实例
  3. 创建一个密码为 `passw0rd`，用户名为 `fedora` 的用户
  4. 分配一个 IP 地址，以便于你之后用 SSH 登录到云端
  5. 启动、停止、删除和列出一个实例

### 安装 Testcloud

要开始你的旅程，首先你必须安装 Testcloud 软件包。你可以通过终端或者“软件”应用来安装它。在这两种情况下，软件包的名字都是 `testcloud` 。用以下命令安装：

```
$ sudo dnf install testcloud -y
```

一旦安装完成，将你所需要的用户添加到 `testcloud` 用户组，这有助于 Testcloud 自动完成设置过程的剩余部分。执行这两个命令，添加你的用户到 `testcloud` 用户组，并通过提升组权限重启会话：

```
$ sudo usermod -a -G testcloud $USER
$ su - $USER
```

![添加用户到 testcloud 组][4]

### 像老手一样玩转云镜像

一旦你的用户获得了所需的组权限，创建一个实例：

```
$ testcloud instance create <instance name> -u <url for qcow2 image>
```

或者，你可以使用 `fedora:latest/fedora:XX`（`XX` 是你的 Fedora 发行版本）来代替 完整的 URL 地址：

```
$ testcloud instance create <instance name> -u fedora:latest
```

这将返回你的虚拟机的 IP 地址：

```
$ testcloud instance create testcloud272593 -u https://download.fedoraproject.org/pub/fedora/linux/releases/33/Cloud/x86_64/images/Fedora-Cloud-Base-33-1.2.x86_64.qcow2  
[...]
INFO:Successfully booted instance testcloud272593
The IP of vm testcloud272593:  192.168.122.202
------------------------------------------------------------
To connect to the VM, use the following command (password is 'passw0rd'):
ssh fedora@192.168.122.202
```

你可以用默认用户 `fedora` 登录，密码是 `passw0rd`（注意是零）。你可以使用 `ssh`、`virt-manager` 或者支持连接到 libvirt 虚拟机方式来连接到它。

另一种创建 Fedora 云的方式是：

```
$ testcloud instance create testcloud193 -u fedora:33
 
WARNING:Not proceeding with backingstore cleanup because there are some testcloud instances running.
You can fix this by following command(s):
testcloud instance stop testcloud272593

DEBUG:Local downloads will be stored in /var/lib/testcloud/backingstores.
DEBUG:successfully changed SELinux context for image /var/lib/testcloud/backingstores/Fedora-Cloud-Base-33-1.2.x86_64.qcow2
DEBUG:Creating instance directories
DEBUG:creating seed image /var/lib/testcloud/instances/testcloud193/testcloud193-seed.img
INFO:Seed image generated successfully
INFO:Successfully booted instance testcloud193
The IP of vm testcloud193:  192.168.122.225
------------------------------------------------------------
To connect to the VM, use the following command (password is 'passw0rd'):
ssh fedora@192.168.122.225
------------------------------------------------------------
```

### 玩转实例

Testcloud 可以用来管理实例。这包括像列出镜像或者停止和启动一个实例等活动。

要列出实例，使用 `list` 子命令：

```
$ testcloud instance list                
Name                            IP                      State    
------------------------------------------------------------
testcloud272593                 192.168.122.202         running    
testcloud193                    192.168.122.225         running    
testcloud252793                 192.168.122.146         shutoff    
testcloud93                     192.168.122.152         shutoff
```

要停止一个运行的实例：

```
$ testcloud instance stop testcloud193  
DEBUG:stop instance: testcloud193
DEBUG:stopping instance testcloud193.
```

要删除一个实例：

```
$ testcloud instance destroy testcloud193  
DEBUG:remove instance: testcloud193
DEBUG:removing instance testcloud193 from libvirt.
DEBUG:Unregistering instance from libvirt.
DEBUG:removing instance /var/lib/testcloud/instances/testcloud193 from disk
```

要重启一个运行中的实例：

```
$ testcloud instance reboot testcloud93                                                                                        
DEBUG:stop instance: testcloud93
[...]
INFO:Successfully booted instance testcloud93
The IP of vm testcloud93:  192.168.122.152
usage: testcloud [-h] {instance,image} ...
```

尝试一下 Testcloud ，在评论中让我知道你的想法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/testcloud-virtual-machines

作者：[Sumantro Mukherjee][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tips_map_guide_ebook_help_troubleshooting_lightbulb_520.png?itok=L0BQHgjr (Looking at a map)
[2]: https://en.wikipedia.org/wiki/Qcow
[3]: https://pagure.io/testcloud
[4]: https://opensource.com/sites/default/files/uploads/adduser.png (Add user to testcloud group)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
