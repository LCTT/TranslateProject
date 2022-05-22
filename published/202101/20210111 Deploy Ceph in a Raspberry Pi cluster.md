[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13020-1.html)
[#]: subject: (Deploy Ceph in a Raspberry Pi cluster)
[#]: via: (https://opensource.com/article/21/1/ceph-raspberry-pi)
[#]: author: (AJ Canlas https://opensource.com/users/ajscanlas)

在树莓派集群中部署 Ceph
======

> 使用 ceph-ansible 安装 Ceph 存储，并将其部署在树莓派集群中。

![](https://img.linux.net.cn/data/attachment/album/202101/16/135445mquduh2idu2pft22.jpg)

[Ceph][2] 是一个开源软件存储平台，它在统一的存储集群中提供对象、块和文件系统存储。我第一次使用 Ceph 是在 [OpenStack 中集成它][3]的时候。一开始，我很困惑，既然存储设备广泛存在，为什么要使用 Ceph。但在使用了三年多之后，这个平台的稳定性和完整性一再证明了它的价值。

本文将告诉你如何使用 [ceph-ansible][4]（Ceph 官方支持的 Ansible playbook）安装 Ceph，并将其部署在树莓派集群中。

**材料：**

  1. 树莓派 4B 4GB 型号四台。
  2. 四张 32GB 的 microSD 卡（用于启动操作系统）
  3. 四个树莓派外壳，带风扇和散热片（非常重要）
  4. 四个树莓派充电器
  5. 6 个 32GB U 盘（用于 Ceph OSD 节点）

**架构：**

![Project architecture][5]

关于配置：

  * 前端和后端网络都在同一个子网中
  * [Ceph Monitor][7] 软件使用 4GB 内存的树莓派 4B。
  * [Ceph OSD][8] 节点使用相同的树莓派型号，但有两个 U 盘用于 OSD 磁盘

### 使用 ceph-ansible 部署 Ceph

使用 Ceph 的 Ansible 仓库可以让部署变得顺畅简单

#### 1、复制 ssh 密钥到所有服务器

我在所有的服务器上都有一个名为 `cephadmin` 的共同用户（在此背景下，每个树莓派都是一台服务器）。`cephadmin` 用户配置了无密码的 `sudo`，以方便工作。

使用 `ssh-keygen` 生成密钥后，使用 `ssh-copy-id` 部署所有密钥。

我使用了一个 Bash `for` 循环，因为我使用的是一致并递增的主机名：

```
$ for i in {0..3}; \
  do ssh-copy-id cephadmin@rpi4b4-$i; \
done
```

你需要每个接受并输入密码，但你可以用 `expect` 来自动完成。

#### 2、克隆 ceph-ansible 并安装依赖

安装 Git 来克隆仓库：

```
$ sudo yum install git -y
```

克隆 ceph-ansible 仓库：

```
$ git clone https://github.com/ceph/ceph-ansible.git
$ cd ceph-ansible/
```

我使用的是 CentOS 7 的 AArch64 构建，所以在继续之前，我必须安装一些所需的包。

首先安装 Python `pip`：

```
$ sudo yum install python3-pip -y
```

接着是 ceph-ansible 需要的包：

```
$ sudo yum install python3-devel libffi-devel openssl-devel -y
```

最后，ceph-ansible 需要的依赖：

```
$ pip3 install -r requirements.txt --user
```

我收到了这个错误：

```
You are linking against OpenSSL 1.0.2, which is no longer supported by the OpenSSL project.
To use this version of cryptography you need to upgrade to a newer version of OpenSSL. For
this version only you can also set the environment variable
CRYPTOGRAPHY_ALLOW_OPENSSL_102 to allow OpenSSL 1.0.2.
```

这可能与架构有关，因为我无法在 CentOS 7 虚拟机中复现该错误。

部署时，将 `CRYPTOGRAPHY_ALLOW_OPENSSL_102` 导出为 `True`，这样 Ansible 就可以运行了。

```
$ export CRYPTOGRAPHY_ALLOW_OPENSSL_102=True
```

#### 3、配置 ceph-ansible 进行部署

现在你可以使用 ceph-ansible 部署 Ceph 了。

复制 `site.yml.sample` 到 `site.yml`：

```
$ mv site.yml.sample site.yml
```

在 `group_vars` 目录下创建 `all.yml`：

```
$ cat << EOF >> group_vars/all.yml
ceph_origin: repository
ceph_repository: community
ceph_repository_type: cdn
ceph_stable_release: nautilus
monitor_interface: wlan0
public_network: "192.168.100.0/24"
cluster_network: "192.168.100.0/24"
dashboard_enabled: false
configure_firewall: false
EOF
```

在 `group_vars` 目录下创建 `osds.yml`：

```
$ cat << EOF >> group_vars/all.yml
osd_scenario: collocated
devices:
 - /dev/sda
 - /dev/sdb
EOF
```

创建一个 `inventory` 文件：

```
$ cat << EOF >> inventory
[mons]
rpi4b4-0

[osds]
rpi4b4-1
rpi4b4-2
rpi4b4-3
EOF
```

在写这篇文章的时候，ceph-ansible 仓库里有一个 bug（根据这个 [bug 工单][9]）。你可以通过编辑角色的第 85 行和第 86 行来减轻这个 bug。

```
    - (wait_for_all_osds_up.stdout | from_json)["osdmap"]["num_osds"] | int > 0
    - (wait_for_all_osds_up.stdout | from_json)["osdmap"]["num_osds"] == (wait_for_all_osds_up.stdout | from_json)["osdmap"]["num_up_osds"]
```

#### 4、部署 Ceph

用你的 `inventory` 文件运行 Ansible 剧本：

```
$ ansible-playbook -i inventory site.yml
```

15-20 分钟后，你应该看到这个结果：

![Ceph deployment][10]

### 下面的步骤

之前，我在另一个树莓派集群中[手动部署][11]了一个 OpenStack 集群。我希望能将其与这个集群整合在一起。我也在研究用 [TripleO][12] 部署。

树莓派、Ansible 和 OpenStack 的可能性是无穷的。开始做你自己的实验，并在评论中告诉我结果如何。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/ceph-raspberry-pi

作者：[AJ Canlas][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ajscanlas
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/raspberrypi_board_vector_red.png?itok=yaqYjYqI (Vector, generic Raspberry Pi board)
[2]: https://ceph.io/
[3]: https://opensource.com/business/15/1/introduction-ceph-storage-openstack
[4]: https://docs.ceph.com/projects/ceph-ansible/en/latest/index.html#
[5]: https://opensource.com/sites/default/files/uploads/architecture_0_0.png (Project architecture)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://docs.ceph.com/en/latest/glossary/#term-Ceph-Monitor
[8]: https://docs.ceph.com/en/latest/glossary/#term-OSD
[9]: https://tracker.ceph.com/issues/43430
[10]: https://opensource.com/sites/default/files/uploads/ceph.png (Ceph deployment)
[11]: https://opensource.com/article/20/12/openstack-raspberry-pi
[12]: https://wiki.openstack.org/wiki/TripleO
