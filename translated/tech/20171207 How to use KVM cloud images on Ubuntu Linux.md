如何在 Ubuntu Linux 上使用 KVM 云镜像
=====

基于内核的虚拟机（KVM）时 Linux 内核的虚拟化模块，可将其转变为虚拟机管理程序。你可以使用 Ubuntu 虚拟化前端为 libvirt 和 KVM 在命令行中使用 KVM 创建 Ubuntu 云镜像。

如何下载并使用运行在 Ubuntu Linux 服务器上的 KVM 云镜像？如何在 Ubuntu Linux 16.04 LTS 服务器上无需完整安装即可创建虚拟机？基于内核的虚拟机（KVM）时 Linux 内核的虚拟化模块，可将其转变为虚拟机管理程序。你可以使用 Ubuntu 虚拟化前端为 libvirt 和 KVM 在命令行中使用 KVM 创建 Ubuntu 云镜像。

这个快速教程展示了如何安装和使用 uvtool，它为 Ubuntu 云镜像下载，libvirt 和 clout_int 提供了统一的集成虚拟机前端。

### 步骤 1 - 安装 KVM

你必须安装并配置 KVM。使用 [apt 命令][1]/[apt-get 命令][2]，如下所示：
```
$ sudo apt install qemu-kvm libvirt-bin virtinst bridge-utils cpu-checker
$ kvm-ok
## [configure bridged networking as described here][3]
$ sudo vi /etc/network/interfaces
$ sudo systemctl restart networking
$ sudo brctl show
```

参阅[如何在 Ubuntu 16.04 LTS Headless 服务器上安装 KVM][4] 以获得更多信息。（译注：Headless 服务器是指没有本地接口的计算设备，专用于向其他计算机及其用户提供服务。）

### 步骤 2 - 安装 uvtool

键入以下 [apt 命令][1]/[apt-get 命令][2]：
```
$ sudo apt install uvtool
```

示例输出：
```
[sudo] password for vivek: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  gksu libgksu2-0 libqt5designer5 libqt5help5 libqt5printsupport5 libqt5sql5 libqt5sql5-sqlite libqt5xml5 python3-dbus.mainloop.pyqt5 python3-notify2 python3-pyqt5 python3-sip
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  cloud-image-utils distro-info python-boto python-pyinotify python-simplestreams socat ubuntu-cloudimage-keyring uvtool-libvirt
Suggested packages:
  cloud-utils-euca shunit2 python-pyinotify-doc
The following NEW packages will be installed:
  cloud-image-utils distro-info python-boto python-pyinotify python-simplestreams socat ubuntu-cloudimage-keyring uvtool uvtool-libvirt
0 upgraded, 9 newly installed, 0 to remove and 0 not upgraded.
Need to get 1,211 kB of archives.
After this operation, 6,876 kB of additional disk space will be used.
Get:1 http://in.archive.ubuntu.com/ubuntu artful/main amd64 distro-info amd64 0.17 [20.3 kB]
Get:2 http://in.archive.ubuntu.com/ubuntu artful/universe amd64 python-boto all 2.44.0-1ubuntu2 [740 kB]
Get:3 http://in.archive.ubuntu.com/ubuntu artful/main amd64 python-pyinotify all 0.9.6-1 [24.6 kB]
Get:4 http://in.archive.ubuntu.com/ubuntu artful/main amd64 ubuntu-cloudimage-keyring all 2013.11.11 [4,504 B]
Get:5 http://in.archive.ubuntu.com/ubuntu artful/main amd64 cloud-image-utils all 0.30-0ubuntu2 [17.2 kB]
Get:6 http://in.archive.ubuntu.com/ubuntu artful/universe amd64 python-simplestreams all 0.1.0~bzr450-0ubuntu1 [29.7 kB]
Get:7 http://in.archive.ubuntu.com/ubuntu artful/universe amd64 socat amd64 1.7.3.2-1 [342 kB]
Get:8 http://in.archive.ubuntu.com/ubuntu artful/universe amd64 uvtool all 0~git122-0ubuntu1 [6,498 B]
Get:9 http://in.archive.ubuntu.com/ubuntu artful/universe amd64 uvtool-libvirt all 0~git122-0ubuntu1 [26.9 kB]
Fetched 1,211 kB in 3s (393 kB/s)        
Selecting previously unselected package distro-info.
(Reading database ... 199933 files and directories currently installed.)
Preparing to unpack .../0-distro-info_0.17_amd64.deb ...
Unpacking distro-info (0.17) ...
Selecting previously unselected package python-boto.
Preparing to unpack .../1-python-boto_2.44.0-1ubuntu2_all.deb ...
Unpacking python-boto (2.44.0-1ubuntu2) ...
Selecting previously unselected package python-pyinotify.
Preparing to unpack .../2-python-pyinotify_0.9.6-1_all.deb ...
Unpacking python-pyinotify (0.9.6-1) ...
Selecting previously unselected package ubuntu-cloudimage-keyring.
Preparing to unpack .../3-ubuntu-cloudimage-keyring_2013.11.11_all.deb ...
Unpacking ubuntu-cloudimage-keyring (2013.11.11) ...
Selecting previously unselected package cloud-image-utils.
Preparing to unpack .../4-cloud-image-utils_0.30-0ubuntu2_all.deb ...
Unpacking cloud-image-utils (0.30-0ubuntu2) ...
Selecting previously unselected package python-simplestreams.
Preparing to unpack .../5-python-simplestreams_0.1.0~bzr450-0ubuntu1_all.deb ...
Unpacking python-simplestreams (0.1.0~bzr450-0ubuntu1) ...
Selecting previously unselected package socat.
Preparing to unpack .../6-socat_1.7.3.2-1_amd64.deb ...
Unpacking socat (1.7.3.2-1) ...
Selecting previously unselected package uvtool.
Preparing to unpack .../7-uvtool_0~git122-0ubuntu1_all.deb ...
Unpacking uvtool (0~git122-0ubuntu1) ...
Selecting previously unselected package uvtool-libvirt.
Preparing to unpack .../8-uvtool-libvirt_0~git122-0ubuntu1_all.deb ...
Unpacking uvtool-libvirt (0~git122-0ubuntu1) ...
Setting up distro-info (0.17) ...
Setting up ubuntu-cloudimage-keyring (2013.11.11) ...
Setting up cloud-image-utils (0.30-0ubuntu2) ...
Setting up socat (1.7.3.2-1) ...
Setting up python-pyinotify (0.9.6-1) ...
Setting up python-boto (2.44.0-1ubuntu2) ...
Setting up python-simplestreams (0.1.0~bzr450-0ubuntu1) ...
Processing triggers for doc-base (0.10.7) ...
Processing 1 added doc-base file...
Setting up uvtool (0~git122-0ubuntu1) ...
Processing triggers for man-db (2.7.6.1-2) ...
Setting up uvtool-libvirt (0~git122-0ubuntu1) ...
```

### 步骤 3 - 下载 Ubuntu 云镜像

你需要使用 uvt-simplestreams-libvirt 命令。它维护一个 libvirt 容量存储池，作为一个简单流源的图像子集的本地镜像，比如 Ubuntu 云镜像。要使用当前所有 amd64 镜像更新 uvtool 的 libvirt 容量存储此，运行：
`$ uvt-simplestreams-libvirt sync arch=amd64`
要更新/获取 Ubuntu 16.04 LTS (xenial/amd64) 镜像，运行：
`$ uvt-simplestreams-libvirt --verbose sync release=xenial arch=amd64`

示例输出：
```
Adding: com.ubuntu.cloud:server:16.04:amd64 20171121.1
```

通过 query 选项查询本地镜像：
`$ uvt-simplestreams-libvirt query`
示例输出：
```
release=xenial arch=amd64 label=release (20171121.1)
```

现在，我为 Ubuntu xenial 创建了一个镜像，接下来我会创建虚拟机。

### 步骤 4 - 创建 SSH 密钥

你需要使用 SSH 密钥才能登录到 KVM 虚拟机。如果你根本没有任何密钥，请使用 ssh-keygen 命令创建一个新的密钥。
`$ ssh-keygen`
参阅“[如何在 Linux / Unix 系统上设置 SSH 密钥][5]” 和 “[Linux / UNIX: 生成 SSH 密钥][6]” 以获取更多信息。

### 步骤 5 - 创建 VM

是时候创建虚拟机了，它叫 vm1，即创建一个 Ubuntu Linux 16.04 LTS 虚拟机:
`$ uvt-kvm create vm1`

默认情况下 vm1 使用以下配置创建：

  1. RAM/memory : 512M
  2. Disk size: 8GiB
  3. CPU: 1 vCPU core

要控制 ram，disk，cpu 和其他配置，使用以下语法：
```
$ uvt-kvm create vm1 \
--memory MEMORY \
--cpu CPU \
--disk DISK \
--bridge BRIDGE \
--ssh-public-key-file /path/to/your/SSH_PUBLIC_KEY_FILE \
--packages PACKAGES1, PACKAGES2, .. \
--run-script-once RUN_SCRIPT_ONCE \
--password PASSWORD
```

其中

 1.  **\--password PASSWORD** : 设置 ubuntu 用户的密码和允许使用 ubuntu 的用户登录（不推荐使用 ssh 密钥）。
 2.  **\--run-script-once RUN_SCRIPT_ONCE** : 第一次启动时，在虚拟机上以 root 身份运行 RUN_SCRIPT_ONCE 脚本，但再也不会运行。这里给出完整的路径。这对于在虚拟机上运行自定义任务时非常有用，例如设置安全性或其他内容。
 3.  **\--packages PACKAGES1, PACKAGES2, ..** : 在第一次启动时安装逗号分隔的软件包。

要获取帮助，运行：
```
$ uvt-kvm -h
$ uvt-kvm create -h
```

#### 如何删除虚拟机？

要销毁/删除名为 vm1 的虚拟机，运行（请小心使用以下命令，因为没有确认框）：
`$ uvt-kvm destroy vm1`

#### 获取 vm1 的 IP 地址，运行：

`$ uvt-kvm ip vm1`
192.168.122.52

#### 列出所有运行的虚拟机

`$ uvt-kvm list`
示例输出：
```
vm1
freebsd11.1
```

### 步骤 6 - 如何登录 vm1

语法是：
`$ uvt-kvm ssh vm1`
示例输出：
```
Welcome to Ubuntu 16.04.3 LTS (GNU/Linux 4.4.0-101-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

0 packages can be updated.
0 updates are security updates.


Last login: Thu Dec  7 09:55:06 2017 from 192.168.122.1

```

另一个选择是从 macOS/Linux/Unix/Windows 客户端使用常规的 ssh 命令：
```
$ ssh ubuntu@192.168.122.52
$ ssh -i ~/.ssh/id_rsa ubuntu@192.168.122.52
```
（上面的是根据原文修改的）
示例输出：
[![Connect to the running VM using ssh][8]][8]

一旦创建了 vim，你可以照常使用 virsh 命令：
`$ virsh list`


--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-use-kvm-cloud-images-on-ubuntu-linux/

作者：[Vivek Gite][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[2]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[3]:https://www.cyberciti.biz/faq/how-to-create-bridge-interface-ubuntu-linux/
[4]:https://www.cyberciti.biz/faq/installing-kvm-on-ubuntu-16-04-lts-server/
[5]:https://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/
[6]:https://www.cyberciti.biz/faq/linux-unix-generating-ssh-keys/
[7]:https://www.cyberciti.biz/cdn-cgi/l/email-protection
[8]:https://www.cyberciti.biz/media/new/faq/2017/12/connect-to-the-running-VM-using-ssh.jpg
