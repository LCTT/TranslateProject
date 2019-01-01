在 Ubuntu 18.04 LTS 上使用 KVM 配置无头虚拟化服务器
======

![](https://www.ostechnix.com/wp-content/uploads/2016/11/kvm-720x340.jpg)

我们已经讲解了 [在 Ubuntu 18.04 无头服务器上配置 Oracle VirtualBox][1] 。在本教程中，我们将讨论如何使用 **KVM** 去配置无头虚拟化服务器，以及如何从一个远程客户端去管理访客系统。正如你所知道的，KVM（**K**ernel-based **v**irtual **m**achine）是开源的，是 Linux 上的全虚拟化。使用 KVM，我们可以在几分钟之内，很轻松地将任意 Linux 服务器转换到一个完全的虚拟化环境中，以及部署不同种类的虚拟机，比如 GNU/Linux、*BSD、Windows 等等。

### 使用 KVM 配置无头虚拟化服务器

我在 Ubuntu 18.04 LTS 服务器上测试了本指南，但是它在其它的 Linux 发行版上也可以使用，比如，Debian、CentOS、RHEL 以及 Scientific Linux。这个方法完全适合哪些希望在没有任何图形环境的 Linux 服务器上，去配置一个简单的虚拟化环境。

基于本指南的目的，我将使用两个系统。

**KVM 虚拟化服务器：**

* **宿主机操作系统** – 最小化安装的 Ubuntu 18.04 LTS（没有 GUI）
* **宿主机操作系统的 IP 地址**：192.168.225.22/24
* **访客操作系统**（它将运行在 Ubuntu 18.04 的宿主机上）：Ubuntu 16.04 LTS server

**远程桌面客户端：**

* **操作系统** – Arch Linux

### 安装 KVM

首先，我们先检查一下我们的系统是否支持硬件虚拟化。为此，需要在终端中运行如下的命令：

```
$ egrep -c '(vmx|svm)' /proc/cpuinfo
```

假如结果是 `zero (0)`，说明系统不支持硬件虚拟化，或者在 BIOS 中禁用了虚拟化。进入你的系统 BIOS 并检查虚拟化选项，然后启用它。

假如结果是 `1` 或者 **更大的数**，说明系统将支持硬件虚拟化。然而，在你运行上面的命令之前，你需要始终保持 BIOS 中的虚拟化选项是启用的。

或者，你也可以使用如下的命令去验证它。但是为了使用这个命令你需要先安装 KVM。

```
$ kvm-ok
```

示例输出：

```
INFO: /dev/kvm exists
KVM acceleration can be used
```

如果输出的是如下这样的错误，你仍然可以在 KVM 中运行访客虚拟机，但是它的性能将非常差。

```
INFO: Your CPU does not support KVM extensions
INFO: For more detailed results, you should run this as root
HINT: sudo /usr/sbin/kvm-ok
```

当然，还有其它的方法来检查你的 CPU 是否支持虚拟化。更多信息参考接下来的指南。

- [如何知道 CPU 是否支持虚拟技术（VT）](https://www.ostechnix.com/how-to-find-if-a-cpu-supports-virtualization-technology-vt/)

接下来，安装 KVM 和在 Linux 中配置虚拟化环境所需要的其它包。

在 Ubuntu 和其它基于 DEB 的系统上，运行如下命令：

```
$ sudo apt-get install qemu-kvm libvirt-bin virtinst bridge-utils cpu-checker
```

KVM 安装完成后，启动 libvertd 服务（如果它没有启动的话）：

```
$ sudo systemctl enable libvirtd
$ sudo systemctl start libvirtd
```

### 创建虚拟机

所有的虚拟机文件和其它的相关文件都保存在 `/var/lib/libvirt/` 下。ISO 镜像的默认路径是  `/var/lib/libvirt/boot/`。

首先，我们先检查一下是否有虚拟机。查看可用的虚拟机列表，运行如下的命令：

```
$ sudo virsh list --all
```

示例输出：

```
Id Name State
----------------------------------------------------
```

![][3]

正如上面的截屏，现在没有可用的虚拟机。

现在，我们来创建一个。

例如，我们来创建一个有 512 MB 内存、1 个 CPU 核心、8 GB 硬盘的 Ubuntu 16.04 虚拟机。 

```
$ sudo virt-install --name Ubuntu-16.04 --ram=512 --vcpus=1 --cpu host --hvm --disk path=/var/lib/libvirt/images/ubuntu-16.04-vm1,size=8 --cdrom /var/lib/libvirt/boot/ubuntu-16.04-server-amd64.iso --graphics vnc
```

请确保在路径 `/var/lib/libvirt/boot/` 中有一个 Ubuntu 16.04 的 ISO 镜像文件，或者在上面命令中给定的其它路径中有相应的镜像文件。

示例输出：

```
WARNING Graphics requested but DISPLAY is not set. Not running virt-viewer.
WARNING No console to launch for the guest, defaulting to --wait -1

Starting install...
Creating domain... | 0 B 00:00:01
Domain installation still in progress. Waiting for installation to complete.
Domain has shutdown. Continuing.
Domain creation completed.
Restarting guest.
```

![][4]

我们来分别讲解以上的命令和看到的每个选项的作用。

  * `–name`：这个选项定义虚拟机名字。在我们的案例中，这个虚拟机的名字是 `Ubuntu-16.04`。
  * `–ram=512`：给虚拟机分配 512MB 内存。
  * `–vcpus=1`：指明虚拟机中 CPU 核心的数量。
  * `–cpu host`：通过暴露宿主机 CPU 的配置给访客系统来优化 CPU 属性。
  * `–hvm`：要求完整的硬件虚拟化。
  * `–disk path`：虚拟机硬盘的位置和大小。在我们的示例中，我分配了 8GB 的硬盘。
  * `–cdrom`：安装 ISO 镜像的位置。请注意你必须在这个位置真的有一个 ISO 镜像。
  * `–graphics vnc`：允许 VNC 从远程客户端访问虚拟机。

### 使用 VNC 客户端访问虚拟机

现在，我们在远程桌面系统上使用 SSH 登入到 Ubuntu 服务器上（虚拟化服务器），如下所示。

```
$ ssh sk@192.168.225.22
```

在这里，`sk` 是我的 Ubuntu 服务器的用户名，而 `192.168.225.22` 是它的 IP 地址。

运行如下的命令找出 VNC 的端口号。我们从一个远程系统上访问虚拟机需要它。

```
$ sudo virsh dumpxml Ubuntu-16.04 | grep vnc
```

示例输出：

```
<graphics type='vnc' port='5900' autoport='yes' listen='127.0.0.1'>

```

![][5]

记下那个端口号 `5900`。安装任意的 VNC 客户端应用程序。在本指南中，我们将使用 TigerVnc。TigerVNC 是 Arch Linux 默认仓库中可用的客户端。在 Arch 上安装它，运行如下命令：

```
$ sudo pacman -S tigervnc
```

在安装有 VNC 客户端的远程客户端系统上输入如下的 SSH 端口转发命令。

```
$ ssh sk@192.168.225.22 -L 5900:127.0.0.1:5900
```

再强调一次，`192.168.225.22` 是我的 Ubuntu 服务器（虚拟化服务器）的 IP 地址。

然后，从你的 Arch Linux（客户端）打开 VNC 客户端。

在 VNC 服务器框中输入 `localhost:5900`，然后点击 “Connect” 按钮。

![][6]

然后就像你在物理机上安装系统一样的方法开始安装 Ubuntu 虚拟机。

![][7]

![][8]

同样的，你可以根据你的服务器的硬件情况配置多个虚拟机。

或者，你可以使用 `virt-viewer` 实用程序在访客机器中安装操作系统。`virt-viewer` 在大多数 Linux 发行版的默认仓库中都可以找到。安装完 `virt-viewer` 之后，运行下列的命令去建立到虚拟机的访问连接。

```
$ sudo virt-viewer --connect=qemu+ssh://192.168.225.22/system --name Ubuntu-16.04
```

### 管理虚拟机

使用管理用户接口 `virsh` 从命令行去管理虚拟机是非常有趣的。命令非常容易记。我们来看一些例子。

查看运行的虚拟机，运行如下命令：

```
$ sudo virsh list
```

或者，

```
$ sudo virsh list --all
```

示例输出：

```
 Id Name State
----------------------------------------------------
 2 Ubuntu-16.04 running
```

![][9]

启动一个虚拟机，运行如下命令：

```
$ sudo virsh start Ubuntu-16.04
```

或者，也可以使用虚拟机 id 去启动它。

![][10]

正如在上面的截图所看到的，Ubuntu 16.04 虚拟机的 Id 是 2。因此，启动它时，你也可以像下面一样只指定它的 ID。

```
$ sudo virsh start 2
```

重启动一个虚拟机，运行如下命令：
```
$ sudo virsh reboot Ubuntu-16.04
```

示例输出：

```
Domain Ubuntu-16.04 is being rebooted
```

![][11]

暂停一个运行中的虚拟机，运行如下命令：

```
$ sudo virsh suspend Ubuntu-16.04
```

示例输出：

```
Domain Ubuntu-16.04 suspended
```

让一个暂停的虚拟机重新运行，运行如下命令：

```
$ sudo virsh resume Ubuntu-16.04
```

示例输出：

```
Domain Ubuntu-16.04 resumed
```

关闭一个虚拟机，运行如下命令：

```
$ sudo virsh shutdown Ubuntu-16.04
```

示例输出：

```
Domain Ubuntu-16.04 is being shutdown
```

完全移除一个虚拟机，运行如下的命令：

```
$ sudo virsh undefine Ubuntu-16.04
$ sudo virsh destroy Ubuntu-16.04
```

示例输出：

```
Domain Ubuntu-16.04 destroyed
```

![][12]

关于它的更多选项，建议你去查看 man 手册页：

```
$ man virsh
```

今天就到这里吧。开始在你的新的虚拟化环境中玩吧。对于研究和开发者、以及测试目的，KVM 虚拟化将是很好的选择，但它能做的远不止这些。如果你有充足的硬件资源，你可以将它用于大型的生产环境中。如果你还有其它好玩的发现，不要忘记在下面的评论区留下你的高见。

谢谢！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/setup-headless-virtualization-server-using-kvm-ubuntu/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/install-oracle-virtualbox-ubuntu-16-04-headless-server/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@ubuntuserver-_001.png
[4]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@ubuntuserver-_008-1.png
[5]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@ubuntuserver-_002.png
[6]:http://www.ostechnix.com/wp-content/uploads/2016/11/VNC-Viewer-Connection-Details_005.png
[7]:http://www.ostechnix.com/wp-content/uploads/2016/11/QEMU-Ubuntu-16.04-TigerVNC_006.png
[8]:http://www.ostechnix.com/wp-content/uploads/2016/11/QEMU-Ubuntu-16.04-TigerVNC_007.png
[9]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@ubuntuserver-_010-1.png
[10]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@ubuntuserver-_010-2.png
[11]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@ubuntuserver-_011-1.png
[12]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@ubuntuserver-_012.png
