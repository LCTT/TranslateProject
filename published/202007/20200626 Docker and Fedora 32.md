[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12433-1.html)
[#]: subject: (Docker and Fedora 32)
[#]: via: (https://fedoramagazine.org/docker-and-fedora-32/)
[#]: author: (Kevin "Eonfge" Degeling https://fedoramagazine.org/author/eonfge/)

在 Fedora 32 上运行 Docker
======

![][1]

随着 Fedora 32 的发布，[Docker][2] 的普通用户面临着一个小挑战。在编写本文时，Fedora 32 不支持 Docker。虽然还有其他选择，例如 [Podman][3] 和 [Buildah][4]，但是对于许多现有用户而言，现在切换可能不是最佳时机。因此，本文可以帮助你在 Fedora 32 上设置 Docker 环境。

### 步骤 0：消除冲突

此步骤适用于从 Fedora 30 或 31 升级的任何用户。如果全新安装的 Fedora 32，那么可以跳到步骤 1。

删除 docker 及其所有相关组件：

```
sudo dnf remove docker-*
sudo dnf config-manager --disable docker-*
```

### 步骤 1：系统准备

在 Fedora 的最后两个版本中，操作系统已迁移到两项新技术： CGroups 和用于防火墙的 NFTables。尽管这些新技术的详细信息不在本教程的讨论范围之内，但是令人遗憾的是，Docker 还不支持这些新技术。因此，你必须进行一些更改才能在 Fedora 上使用 Docker。

#### 启用旧的 CGroups

Fedora 仍然支持 CGroups 的先前实现，可以使用以下命令启用它：

```
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
```

#### 在防火墙中将 Docker 列入白名单

为了让 Docker 具有网络访问权限，需要两个命令：

```
sudo firewall-cmd --permanent --zone=trusted --add-interface=docker0
sudo firewall-cmd --permanent --zone=FedoraWorkstation --add-masquerade
```

第一个命令将 Docker 接口添加到受信任的环境，它允许 Docker 建立远程连接。第二个命令将允许 Docker 建立本地连接。当有多个 Docker 容器作为开发环境时，这特别有用。

### 步骤 2：安装 Moby

[Moby][5] 是 Docker 的开源白牌版本。它基于相同的代码，但不带商标。它包含在 Fedora 的主仓库中，因此很容易安装：

```
sudo dnf install moby-engine docker-compose
```

这将安装 `moby-engine`、`docker-compose`、`containerd` 和其他一些相关的库。安装完成后，你必须启用系统级守护程序才能运行 Docker：

```
sudo systemctl enable docker
```

### 步骤 3：重新启动并测试

为了确保正确处理所有系统和设置，你现在必须重启计算机：

```
sudo systemctl reboot
```

之后，你可以使用 Docker hello-world 包来验证安装：

```
sudo docker run hello-world
```

除非遇到问题，不然你就会看到来自 Docker 的问候！

#### 以管理员身份运行

可选地，你现在还可以将用户添加到 Docker 的组帐户中，以便无需输入 `sudo` 即可启动 Docker 镜像：

```
sudo groupadd docker
sudo usermod -aG docker $USER
```

注销并登录以使更改生效。如果以管理员权限运行容器的想法让你有所顾虑，那么你应该研究 Podman。

### 总结

从现在起，Docker 将按照你的习惯工作，包括 `docker-compose` 和所有与 `docker` 相关的工具。不要忘记查看官方文档，这在很多情况下可以为你提供帮助。

Fedora 32 上 Docker 的当前状态并不理想。缺少官方软件包可能会困扰一些人，有一个[上游问题][6]对此进行了讨论。对 [CGroups][7] 和 [NFTables][8] 缺少支持更多是技术问题，但是你可以查看它们在其公共问题上的进展。

这些指导应可以让你就像什么都没有发生一样继续工作。如果这不能满足你的需求，请不要忘记到 Moby 或 Docker Github 页面去寻求解决你的技术问题，或者看看 Podman，长期来看，它可能会更加强大。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/docker-and-fedora-32/

作者：[Kevin "Eonfge" Degeling][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/eonfge/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/06/f32-04-twilight-816x459.png
[2]: https://docs.docker.com/
[3]: https://podman.io/getting-started/
[4]: https://buildah.io/
[5]: https://mobyproject.org/
[6]: https://github.com/docker/for-linux/issues/955
[7]: https://github.com/moby/moby/issues/40360
[8]: https://github.com/moby/moby/issues/26824
