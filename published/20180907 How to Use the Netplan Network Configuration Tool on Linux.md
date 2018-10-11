如何在 Linux 上使用网络配置工具 Netplan
======
> netplan 是一个命令行工具，用于在某些 Linux 发行版上配置网络。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/netplan.jpg?itok=Gu_ZfNGa)

多年以来 Linux 管理员和用户们以相同的方式配置他们的网络接口。例如，如果你是 Ubuntu 用户，你能够用桌面 GUI 配置网络连接，也可以在 `/etc/network/interfaces` 文件里配置。配置相当简单且可以奏效。在文件中配置看起来就像这样：

```
auto enp10s0
iface enp10s0 inet static
address 192.168.1.162
netmask 255.255.255.0
gateway 192.168.1.100
dns-nameservers 1.0.0.1,1.1.1.1
```

保存并关闭文件。使用命令重启网络：

```
sudo systemctl restart networking
```

或者，如果你使用不带 systemd 的发行版，你可以通过老办法来重启网络：

```
sudo /etc/init.d/networking restart
```

你的网络将会重新启动，新的配置将会生效。

这就是多年以来的做法。但是现在，在某些发行版上（例如 Ubuntu Linux 18.04），网络的配置与控制发生了很大的变化。不需要那个 `interfaces` 文件和 `/etc/init.d/networking` 脚本，我们现在转向使用 [Netplan][1]。Netplan 是一个在某些 Linux 发行版上配置网络连接的命令行工具。Netplan 使用 YAML 描述文件来配置网络接口，然后，通过这些描述为任何给定的呈现工具生成必要的配置选项。

我将向你展示如何在 Linux 上使用 Netplan 配置静态 IP 地址和 DHCP 地址。我会在 Ubuntu Server 18.04 上演示。有句忠告，你创建的 .yaml 文件中的缩进必须保持一致，否则将会失败。你不用为每行使用特定的缩进间距，只需保持一致就行了。

### 新的配置文件

打开终端窗口（或者通过 SSH 登录进 Ubuntu 服务器）。你会在 `/etc/netplan` 文件夹下发现 Netplan 的新配置文件。使用 `cd /etc/netplan` 命令进入到那个文件夹下。一旦进到了那个文件夹，也许你就能够看到一个文件：

```
01-netcfg.yaml
```

你可以创建一个新的文件或者是编辑默认文件。如果你打算修改默认文件，我建议你先做一个备份：

```
sudo cp /etc/netplan/01-netcfg.yaml /etc/netplan/01-netcfg.yaml.bak
```

备份好后，就可以开始配置了。

### 网络设备名称

在你开始配置静态 IP 之前，你需要知道设备名称。要做到这一点，你可以使用命令 `ip a`，然后找出哪一个设备将会被用到（图 1）。

![netplan][3]

*图 1：使用 ip a 命令找出设备名称*

我将为 ens5 配置一个静态的 IP。

### 配置静态 IP 地址

使用命令打开原来的 .yaml 文件：

```
sudo nano /etc/netplan/01-netcfg.yaml
```

文件的布局看起来就像这样：

```
network:
    Version: 2
    Renderer: networkd
    ethernets:
       DEVICE_NAME:
          Dhcp4: yes/no
          Addresses: [IP/NETMASK]
          Gateway: GATEWAY
          Nameservers:
             Addresses: [NAMESERVER, NAMESERVER]
```

其中：

  * `DEVICE_NAME` 是需要配置设备的实际名称。
  * `yes`/`no` 代表是否启用 dhcp4。
  * `IP` 是设备的 IP 地址。
  * `NETMASK` 是 IP 地址的掩码。
  * `GATEWAY` 是网关的地址。
  * `NAMESERVER` 是由逗号分开的 DNS 服务器列表。

这是一份 .yaml 文件的样例：

```
network:
    version: 2
    renderer: networkd
    ethernets:
       ens5:
       dhcp4: no
       addresses: [192.168.1.230/24]
       gateway4: 192.168.1.254
       nameservers:
          addresses: [8.8.4.4,8.8.8.8]
```

编辑上面的文件以达到你想要的效果。保存并关闭文件。

注意，掩码已经不用再配置为 `255.255.255.0` 这种形式。取而代之的是，掩码已被添加进了 IP 地址中。

### 测试配置

在应用改变之前，让我们测试一下配置。为此，使用命令：

```
sudo netplan try
```

上面的命令会在应用配置之前验证其是否有效。如果成功，你就会看到配置被接受。换句话说，Netplan 会尝试将新的配置应用到运行的系统上。如果新的配置失败了，Netplan 会自动地恢复到之前使用的配置。成功后，新的配置就会被使用。

### 应用新的配置

如果你确信配置文件没有问题，你就可以跳过测试环节并且直接使用新的配置。它的命令是：

```
sudo netplan apply
```

此时，你可以使用 ip a 看看新的地址是否正确。

### 配置 DHCP

虽然你可能不会配置 DHCP 服务，但通常还是知道比较好。例如，你也许不知道网络上当前可用的静态 IP 地址是多少。你可以为设备配置 DHCP，获取到 IP 地址，然后将那个地址重新配置为静态地址。

在 Netplan 上使用 DHCP，配置文件看起来就像这样：

```
network:
    version: 2
    renderer: networkd
    ethernets:
       ens5:
       Addresses: []
       dhcp4: true
       optional: true
```

保存并退出。用下面命令来测试文件：

```
sudo netplan try
```

Netplan 应该会成功配置 DHCP 服务。这时你可以使用 `ip a` 命令得到动态分配的地址，然后重新配置静态地址。或者，你可以直接使用 DHCP 分配的地址（但看看这是一个服务器，你可能不想这样做）。

也许你有不只一个的网络接口，你可以命名第二个 .yaml 文件为 `02-netcfg.yaml` 。Netplan 会按照数字顺序应用配置文件，因此 01 会在 02 之前使用。根据你的需要创建多个配置文件。

### 就是这些了

不管怎样，那些就是所有关于使用 Netplan 的东西了。虽然它对于我们习惯性的配置网络地址来说是一个相当大的改变，但并不是所有人都用的惯。但这种配置方式值得一提……因此你会适应的。

在 Linux Foundation 和 edX 上通过 [“Introduction to Linux”][5] 课程学习更多关于 Linux 的内容。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/9/how-use-netplan-network-configuration-tool-linux

作者：[Jack Wallen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[LuuMing](https://github.com/LuuMing)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/jlwallen
[1]: https://netplan.io/
[3]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/netplan_1.jpg?itok=XuIsXWbV (netplan)
[4]: /licenses/category/used-permission
[5]: https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
