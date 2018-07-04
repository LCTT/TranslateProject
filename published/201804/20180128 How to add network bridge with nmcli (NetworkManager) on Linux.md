如何在 Linux 里使用 nmcli 添加网桥
======

Q：我正在电脑上使用 Debian Linux 9 “stretch”。 我想用 NetworkManager 来建网桥。但是根本就没有添加 br0的选项。我该如何在 Linux 里使用 nmcli 来为 NetworkManager 创建或者添加网桥呢？

网桥没什么特别的，只是把两个网络连在一起。它工作在数据链路层，即 OSI 模型的第二层。网桥经常用在虚拟机或别的一些软件中。为了使用网桥而关闭桌面 Linux 上的 NetworkManager 显然是不明智的。`nmcli` 可以创建一个永久的网桥而不需要编辑任何文件。

本文将展示如何使用 NetworkManager 的命令行工具 `nmcli` 来创建网桥。

### 如何使用 nmcli 来创建/添加网桥

使用 NetworkManager 在 Linux 上添加网桥接口的步骤如下：

1. 打开终端
2. 获取当前连接状态：
```
nmcli con show
```
3. 添加新的网桥：
```
nmcli con add type bridge ifname br0
```
4. 创建子网卡：
```
nmcli con add type bridge-slave ifname eno1 master br0
```
5. 打开 br0：
```
nmcli con up br0
```

让我们从细节层面看看如何创建一个名为 br0 的网桥。

### 获取当前网络配置

你可以通过 NetworkManager 的 GUI 来了解本机的网络连接：

[![Getting Network Info on Linux][1]][1]

也可以使用如下命令行来查看：

```
$ nmcli con show
$ nmcli connection show --active 
```

[![View the connections with nmcli][2]][2]

我有一个使用网卡 `eno1` 的 “有线连接”。我的系统还有一个 VPN 接口。我将要创建一个名为 `br0` 的网桥，并连接到 `eno1`。

### 如何创建一个名为 br0 的网桥

```
$ sudo nmcli con add ifname br0 type bridge con-name br0
$ sudo nmcli con add type bridge-slave ifname eno1 master br0
$ nmcli connection show
```

[![Create bridge interface using nmcli on Linux][3]][3]

你也可以禁用 STP：

```
$ sudo nmcli con modify br0 bridge.stp no
$ nmcli con show
$ nmcli -f bridge con show br0
```

最后一条命令展示了禁用 STP 后的网桥参数：

```
bridge.mac-address:                     --
bridge.stp:                             no
bridge.priority:                        32768
bridge.forward-delay:                   15
bridge.hello-time:                      2
bridge.max-age:                         20
bridge.ageing-time:                     300
bridge.multicast-snooping:              yes
```

### 如何打开网桥

你必须先关闭 `Wired connection 1` ，然后打开 `br0`：

```
$ sudo nmcli con down "Wired connection 1"
$ sudo nmcli con up br0
$ nmcli con show
```

使用 [ip 命令][4] 来查看 IP 信息：

```
$ ip a s
$ ip a s br0
```

[![Build a network bridge with nmcli on Linux][5]][5]

### 附录: 如何在 KVM 上使用 br0

现在你可以使用 KVM/VirtualBox/VMware workstation 创建的 VM（虚拟机）来直接连接网络而非通过 NAT。使用 `vi` 或者 [cat 命令][6]为虚拟机创建一个名为 `br0.xml` 的文件：

```
$ cat /tmp/br0.xml
```

添加以下代码：

```
<network>
  <name>br0</name>
  <forward mode="bridge"/>
  <bridge name="br0" />
</network>
```

如下所示运行 `virsh`命令：

```
# virsh net-define /tmp/br0.xml
# virsh net-start br0
# virsh net-autostart br0
# virsh net-list --all
```

输出：

```
 Name State Autostart Persistent
----------------------------------------------------------
 br0 active yes yes
 default inactive no yes
```

阅读 man 页面获取更多信息：

```
$ man ip
$ man nmcli
```

### 关于作者

作者是 nixCraft 的创建者、老练的系统管理员和一个 Linux/Unix shell 脚本编程培训师。他为全球客户和各种公司工作，包括 IT，教育，国防，空间研究以及非营利组织。 他的联系方式 [Twitter][7]、 [Facebook][8]、 [Google+][9]。

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-add-network-bridge-with-nmcli-networkmanager-on-linux/

作者：[Vivek Gite][a]
译者：[kennethXia](https://github.com/kennethXia)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/faq/2018/01/Getting-Network-Info-on-Linux.jpg
[2]:https://www.cyberciti.biz/media/new/faq/2018/01/View-the-connections-with-nmcli.jpg
[3]:https://www.cyberciti.biz/media/new/faq/2018/01/Create-bridge-interface-using-nmcli-on-Linux.jpg
[4]:https://www.cyberciti.biz/faq/linux-ip-command-examples-usage-syntax/ (See Linux/Unix ip command examples for more info)
[5]:https://www.cyberciti.biz/media/new/faq/2018/01/Build-a-network-bridge-with-nmcli-on-Linux.jpg
[6]:https://www.cyberciti.biz/faq/linux-unix-appleosx-bsd-cat-command-examples/ (See Linux/Unix cat command examples for more info)
[7]:https://twitter.com/nixcraft
[8]:https://facebook.com/nixcraft
[9]:https://plus.google.com/+CybercitiBiz
