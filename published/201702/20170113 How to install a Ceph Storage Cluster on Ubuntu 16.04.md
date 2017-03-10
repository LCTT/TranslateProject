如何在 Ubuntu 16.04 中安装 Ceph 存储集群
============================================================

Ceph 是一个高性能、可靠、可扩展的开源存储平台。它是一个自由的分布式存储系统，提供了对象、块和文件级存储的接口，并可以不受单点故障的影响而运行。

在这个教程中，我将指导你在 Ubuntu 16.04 服务器上安装建立一个 Ceph 集群。Ceph 集群包括这些组件：

*   **Ceph OSD (ceph-osd)** - 控制数据存储，数据复制和恢复。Ceph 集群需要至少两个 Ceph OSD 服务器。这次安装中我们将使用三个 Ubuntu 16.04 服务器。
*   **Ceph Monitor (ceph-mon)** - 监控集群状态并运行 OSD 映射 和 CRUSH 映射。这里我们使用一个服务器。
*   **Ceph Meta Data Server (ceph-mds)** - 如果你想把 Ceph 作为文件系统使用，就需要这个。

### 前提条件

*   6 个安装了 Ubuntu 16.04 的服务器节点
*   所有节点上的 root 权限

我将使用下面这些 hostname /IP 安装：

```
主机名              IP 地址
ceph-admin        10.0.15.10
mon1                 10.0.15.11
osd1                  10.0.15.21
osd2                  10.0.15.22
osd3                  10.0.15.23
client                 10.0.15.15
```

### 第 1 步 - 配置所有节点

这次安装，我将配置所有的 6 个节点来准备安装 Ceph 集群软件。所以你必须在所有节点运行下面的命令。然后确保所有节点都安装了 ssh-server。

#### 创建 Ceph 用户

在所有节点创建一个名为 `cephuser` 的新用户

```
useradd -m -s /bin/bash cephuser
passwd cephuser
```

创建完新用户后，我们需要给 `cephuser` 配置无密码的 sudo 权限。这意味着 `cephuser` 可以不先输入密码而获取到 sudo 权限运行。

运行下面的命令来完成配置。

```
echo "cephuser ALL = (root) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/cephuser
chmod 0440 /etc/sudoers.d/cephuser
sed -i s'/Defaults requiretty/#Defaults requiretty'/g /etc/sudoers
```

#### 安装和配置 NTP

安装 NTP 来同步所有节点的日期和时间。先运行 `ntpdate` 命令通过 NTP 设置日期。我们将使用 US 池的 NTP 服务器。然后开启并使 NTP 服务在开机时启动。

```
sudo apt-get install -y ntp ntpdate ntp-doc
ntpdate 0.us.pool.ntp.org
hwclock --systohc
systemctl enable ntp
systemctl start ntp
```

#### 安装 Open-vm-tools

如果你正在 VMware 里运行所有节点，你需要安装这个虚拟化工具。

```
sudo apt-get install -y open-vm-tools
```

#### 安装 Python 和 parted

在这个教程，我们需要 python 包来建立 ceph 集群。安装 python 和 python-pip。

```
sudo apt-get install -y python python-pip parted
```

#### 配置 Hosts 文件

用 vim 编辑器编辑所有节点的 `hosts` 文件。

```
vim /etc/hosts
```

粘帖如下配置：

```
10.0.15.10        ceph-admin
10.0.15.11        mon1
10.0.15.21        ceph-osd1
10.0.15.22        ceph-osd2
10.0.15.23        ceph-osd3
10.0.15.15        ceph-client
```

保存 `hosts` 文件，然后退出 vim 编辑器。

现在你可以试着在两个服务器间 `ping` 主机名来测试网络连通性。

```
ping -c 5 mon1
```

[
 ![Ceph cluster Installation on Ubuntu 16.04](https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/1.png) 
][8]

### 第 2 步 - 配置 SSH 服务器

这一步，我们将配置 **ceph-admin 节点**。管理节点是用来配置监控节点和 osd 节点的。登录到 ceph-admin 节点然后使用 `cephuser` 用户。

```
ssh root@ceph-admin
su - cephuser
```

管理节点用来安装配置所有集群节点，所以 ceph-admin 上的用户必须有不使用密码连接到所有节点的权限。我们需要为 'ceph-admin' 节点的 `cephuser` 用户配置无密码 SSH 登录权限。

生成 `cephuser` 的 ssh 密钥。

```
ssh-keygen
```

让密码为空。

下面，为 ssh 创建一个配置文件

```
vim ~/.ssh/config
```

粘帖如下配置：

```
Host ceph-admin
        Hostname ceph-admin
        User cephuser

Host mon1
        Hostname mon1
        User cephuser

Host ceph-osd1
        Hostname ceph-osd1
        User cephuser

Host ceph-osd2
        Hostname ceph-osd2
        User cephuser

Host ceph-osd3
        Hostname ceph-osd3
        User cephuser

Host ceph-client
        Hostname ceph-client
        User cephuser
```

保存文件并退出 vim。

[
 ![Ceph-admin configuration](https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/2.png) 
][9]

改变配置文件权限为 644。

```
chmod 644 ~/.ssh/config
```

现在使用 `ssh-copy-id` 命令增加密钥到所有节点。

```
ssh-keyscan ceph-osd1 ceph-osd2 ceph-osd3 ceph-client mon1 >> ~/.ssh/known_hosts
ssh-copy-id ceph-osd1
ssh-copy-id ceph-osd2
ssh-copy-id ceph-osd3
ssh-copy-id mon1
```

当请求输入密码时输入你的 `cephuser` 密码。

[
 ![Ceph-admin deploy ssh key to all cluster nodes](https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/3.png) 
][10]

现在尝试从 ceph-admin 节点登录 osd1 服务器，测试无密登录是否正常。

```
ssh ceph-osd1
```

[
 ![SSH Less password from ceph-admin to all nodes cluster](https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/4.png) 
][11]

### 第 3 步 - 配置 Ubuntu 防火墙

出于安全原因，我们需要在服务器打开防火墙。我们更愿使用 Ufw（不复杂防火墙）来保护系统，这是 Ubuntu 默认的防火墙。在这一步，我们在所有节点开启 ufw，然后打开 ceph-admin、ceph-mon 和 ceph-osd 需要使用的端口。

登录到 ceph-admin 节点，然后安装 ufw 包。

```
ssh root@ceph-admin
sudo apt-get install -y ufw
```

打开 80，2003 和 4505-4506 端口，然后重启防火墙。

```
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 2003/tcp
sudo ufw allow 4505:4506/tcp
```

开启 ufw 并设置开机启动。

```
sudo ufw enable
```

[
 ![UFW Firewall with Ceph service](https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/5.png) 
][12]

从 ceph-admin 节点，登录到监控节点 mon1 然后安装 ufw。

```
ssh mon1
sudo apt-get install -y ufw
```

打开 ceph 监控节点的端口然后开启 ufw。

```
sudo ufw allow 22/tcp
sudo ufw allow 6789/tcp
sudo ufw enable
```

最后，在每个 osd 节点 ceph-osd1、ceph-osd2 和 ceph-osd3 上打开这些端口 6800-7300。

从 ceph-admin 登录到每个 ceph-osd 节点安装 ufw。

```
ssh ceph-osd1
sudo apt-get install -y ufw
```

在 osd 节点打开端口并重启防火墙。

```
sudo ufw allow 22/tcp
sudo ufw allow 6800:7300/tcp
sudo ufw enable
```

ufw 防火墙配置完成。

### 第 4 步 - 配置 Ceph OSD 节点

这个教程里，我们有 3 个 OSD 节点，每个节点有两块硬盘分区。

1.  **/dev/sda** 用于根分区
2.  **/dev/sdb** 空闲分区 - 20GB

我们要使用 **/dev/sdb** 作为 ceph 磁盘。从 ceph-admin 节点，登录到所有 OSD 节点，然后格式化 /dev/sdb 分区为 **XFS** 文件系统。

```
ssh ceph-osd1
ssh ceph-osd2
ssh ceph-osd3
```

使用 fdisk 命令检查分区表。

```
sudo fdisk -l /dev/sdb
```

格式化 /dev/sdb 分区为 XFS 文件系统，使用 `parted` 命令创建一个 GPT 分区表。

```
sudo parted -s /dev/sdb mklabel gpt mkpart primary xfs 0% 100%
```

下面，使用 `mkfs` 命令格式化分区为 XFS 格式。

```
sudo mkfs.xfs -f /dev/sdb
```

现在检查分区，然后你会看见一个 XFS 文件系统的 /dev/sdb 分区。

```
sudo fdisk -s /dev/sdb
sudo blkid -o value -s TYPE /dev/sdb
```

[
 ![Format partition ceph OSD nodes](https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/6.png) 
][13]

### 第 5 步 - 创建 Ceph 集群

在这步，我们将从 ceph-admin 安装 Ceph 到所有节点。马上开始，先登录到 ceph-admin 节点。

```
ssh root@ceph-admin
su - cephuser
```

#### 在 ceph-admin 节点上安装 ceph-deploy

首先我们已经在系统上安装了 python 和 python-pip。现在我们需要从 pypi python 仓库安装 Ceph 部署工具 '**ceph-deploy**'。

用 pip 命令在 ceph-admin 节点安装 ceph-deploy 。

```
sudo pip install ceph-deploy
```

注意： 确保所有节点都已经更新。

ceph-deploy 工具已经安装完毕后，为 Ceph 集群配置创建一个新目录。

#### 创建一个新集群

创建一个新集群目录。

```
mkdir cluster
cd cluster/
```

下一步，用 `ceph-deploy` 命令通过定义监控节点 mon1 创建一个新集群。

```
ceph-deploy new mon1
```

命令将在集群目录生成 Ceph 集群配置文件 `ceph.conf`。

[
 ![Generate new ceph cluster configuration](https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/7.png) 
][14]

用 vim 编辑 `ceph.conf`。

```
vim ceph.conf
```

在 `[global]` 块下，粘贴下面的配置。

```
# Your network address
public network = 10.0.15.0/24
osd pool default size = 2
```

保存文件并退出编辑器。

#### 安装 Ceph 到所有节点

现在用一个命令从 ceph-admin 节点安装 Ceph 到所有节点。

```
ceph-deploy install ceph-admin ceph-osd1 ceph-osd2 ceph-osd3 mon1
```

命令将自动安装 Ceph 到所有节点：mon1、osd1-3 和 ceph-admin - 安装将花一些时间。

现在到 mon1 节点部署监控节点。

```
ceph-deploy mon create-initial
```

命令将创建一个监控密钥，用 ceph 命令检查密钥。

```
ceph-deploy gatherkeys mon1
```

[
 ![Deploy key ceph](https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/8.png) 
][15]

#### 增加 OSD 到集群

在所有节点上安装了 Ceph 之后，现在我们可以增加 OSD 守护进程到该集群。OSD 守护进程将在磁盘 /dev/sdb 分区上创建数据和日志 。

检查所有 osd 节点的 /dev/sdb 磁盘可用性。

```
ceph-deploy disk list ceph-osd1 ceph-osd2 ceph-osd3
```

[
 ![disk list of osd nodes](https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/9.png) 
][16]

你将看见我们之前创建 XFS 格式的 /dev/sdb。

下面，在所有 OSD 节点上用 zap 选项删除该分区表。

```
ceph-deploy disk zap ceph-osd1:/dev/sdb ceph-osd2:/dev/sdb ceph-osd3:/dev/sdb
```

这个命令将删除所有 Ceph OSD 节点的 /dev/sdb 上的数据。

现在准备所有 OSD 节点，请确保结果没有报错。

```
ceph-deploy osd prepare ceph-osd1:/dev/sdb ceph-osd2:/dev/sdb ceph-osd3:/dev/sdb
```

当你看到 ceph-osd1-3 结果已经准备好供 OSD 使用，就表明命令已经成功。

[
 ![Prepare the ceph-osd nodes](https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/10.png) 
][17]

用下面的命令激活 OSD：

```
ceph-deploy osd activate ceph-osd1:/dev/sdb ceph-osd2:/dev/sdb ceph-osd3:/dev/sdb
```

现在你可以再一次检查 OSDS 节点的 sdb 磁盘。

```
ceph-deploy disk list ceph-osd1 ceph-osd2 ceph-osd3
```

[
 ![Ceph osds activated](https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/11.png) 
][18]

结果是 /dev/sdb 现在已经分为两个区：

1.  **/dev/sdb1** - Ceph Data
2.  **/dev/sdb2** - Ceph Journal

或者你直接在 OSD 节点山检查。

```
ssh ceph-osd1
sudo fdisk -l /dev/sdb
```

[
 ![Ceph OSD nodes were created](https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/12.png) 
][19]

接下来，部署管理密钥到所有关联节点。

```
ceph-deploy admin ceph-admin mon1 ceph-osd1 ceph-osd2 ceph-osd3
```

在所有节点运行下面的命令，改变密钥文件权限。

```
sudo chmod 644 /etc/ceph/ceph.client.admin.keyring
```

Ceph 集群在 Ubuntu 16.04 已经创建完成。

### 第 6 步 - 测试 Ceph

在第 4 步，我们已经安装并创建了一个新 Ceph 集群，然后添加了 OSD 节点到集群。现在我们应该测试集群确保它如期工作。

从 ceph-admin 节点，登录到 Ceph 监控服务器 mon1。

```
ssh mon1
```

运行下面命令来检查集群是否健康。

```
sudo ceph health
```

现在检查集群状态。

```
sudo ceph -s
```

你可以看到下面返回结果：

[
 ![Ceph Cluster Status](https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/13.png) 
][20]

确保 Ceph 健康状态是 `OK` 的，有一个监控节点 mon1 IP 地址为 '**10.0.15.11**'。有 **3 个 OSD** 服务器都是 **up** 状态并且正在运行，可用磁盘空间为 **45GB** - 3x15GB 的 Ceph 数据 OSD 分区。

我们在 Ubuntu 16.04 建立一个新 Ceph 集群成功。

### 参考

 * http://docs.ceph.com/docs/jewel/

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-install-a-ceph-cluster-on-ubuntu-16-04/

作者：[Muhammad Arul][a]
译者：[wyangsun](https://github.com/wyangsun)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/how-to-install-a-ceph-cluster-on-ubuntu-16-04/
[1]:https://www.howtoforge.com/tutorial/how-to-install-a-ceph-cluster-on-ubuntu-16-04/#step-configure-all-nodes
[2]:https://www.howtoforge.com/tutorial/how-to-install-a-ceph-cluster-on-ubuntu-16-04/#step-configure-the-ssh-server
[3]:https://www.howtoforge.com/tutorial/how-to-install-a-ceph-cluster-on-ubuntu-16-04/#step-configure-the-ubuntu-firewall
[4]:https://www.howtoforge.com/tutorial/how-to-install-a-ceph-cluster-on-ubuntu-16-04/#step-configure-the-ceph-osd-nodes
[5]:https://www.howtoforge.com/tutorial/how-to-install-a-ceph-cluster-on-ubuntu-16-04/#step-build-the-ceph-cluster
[6]:https://www.howtoforge.com/tutorial/how-to-install-a-ceph-cluster-on-ubuntu-16-04/#step-testing-ceph
[7]:https://www.howtoforge.com/tutorial/how-to-install-a-ceph-cluster-on-ubuntu-16-04/#reference
[8]:https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/big/1.png
[9]:https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/big/2.png
[10]:https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/big/3.png
[11]:https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/big/4.png
[12]:https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/big/5.png
[13]:https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/big/6.png
[14]:https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/big/7.png
[15]:https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/big/8.png
[16]:https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/big/9.png
[17]:https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/big/10.png
[18]:https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/big/11.png
[19]:https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/big/12.png
[20]:https://www.howtoforge.com/images/how-to-install-a-ceph-cluster-on-ubuntu-16-04/big/13.png
