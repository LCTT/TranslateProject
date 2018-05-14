如何使用 Buildah 构建容器镜像
======

![](https://fedoramagazine.org/wp-content/uploads/2018/04/buildah-816x345.png)

Project Atomic 通过他们在 Open Container Initiative（OCI）上的努力创造了一个名为 [Buildah][1] 的伟大工具。Buildah 能帮助创建、构建和更新，它支持 Docker 容器镜像以及 OCI 兼容镜像。

Buildah 处理构建容器镜像时无需安装完整的容器运行时或守护进程。这对建立容器的持续集成和持续交付管道尤其有用。

Buildah 使容器的文件系统可以直接供构建主机使用。这意味着构建工具在主机上可用，并且在容器镜像中不需要，从而使构建更快速，镜像更小，更安全。Buildah 有 CentOS、Fedora 和 Debian 的软件包。

### 安装 Buildah

从 Fedora 26 开始 Buildah 可以使用 dnf 进行安装。
```
$ sudo dnf install buildah -y

```

buildah 的当前版本为 0.16，可以通过以下命令显示。
```
$ buildah --version

```

### 基本命令

构建容器镜像的第一步是获取基础镜像，这是通过 Dockerfile 中的 FROM 语句完成的。Buildah 以类似的方式处理这个。
```
$ sudo buildah from fedora

```

该命令将拉取 Fedora 的基础镜像并存储在主机上。通过执行以下操作可以检查主机上可用的镜像。
```
$ sudo buildah images
IMAGE ID IMAGE NAME CREATED AT SIZE
9110ae7f579f docker.io/library/fedora:latest Mar 7, 2018 20:51 234.7 MB

```

在拉取基础镜像后，有一个该镜像的运行容器实例，这是一个“工作容器”。

以下命令显示正在运行的容器。
```
$ sudo buildah containers
CONTAINER ID BUILDER IMAGE ID IMAGE NAME
CONTAINER NAME
6112db586ab9 * 9110ae7f579f docker.io/library/fedora:latest fedora-working-container

```

Buildah 还提供了一个非常有用的命令来停止和删除当前正在运行的所有容器。
```
$ sudo buildah rm --all

```

完整的命令列表可以使用 -help 选项。
```
$ buildah --help

```

### 构建一个 Apache Web 服务器容器镜像

让我们看看如何使用 Buildah 在 Fedora 基础镜像上安装 Apache Web 服务器，然后复制一个可供服务的自定义 index.html。

首先让我们创建自定义的 index.html。
```
$ echo "Hello Fedora Magazine !!!" > index.html

```

然后在正在运行的容器中安装 httpd 包。
```
$ sudo buildah from fedora
$ sudo buildah run fedora-working-container dnf install httpd -y

```

让我们将 index.html 复制到 /var/www/html/。
```
$ sudo buildah copy fedora-working-container index.html /var/www/html/index.html

```

然后配置容器入口点以启动 httpd。
```
$ sudo buildah config --entrypoint "/usr/sbin/httpd -DFOREGROUND" fedora-working-container

```

现在为了使“工作容器”可用，commit 命令将容器保存到镜像。
```
$ sudo buildah commit fedora-working-container hello-fedora-magazine

```

hello-fedora-magazine 镜像现在可用，并且可以推送到仓库以供使用。
```
$ sudo buildah images
IMAGE ID IMAGE NAME CREATED
AT SIZE
9110ae7f579f docker.io/library/fedora:latest
Mar 7, 2018 22:51 234.7 MB
49bd5ec5be71 docker.io/library/hello-fedora-magazine:latest
Apr 27, 2018 11:01 427.7 MB

```

通过运行以下步骤，还可以使用 Buildah 来测试此镜像。
```
$ sudo buildah from --name=hello-magazine docker.io/library/hello-fedora-magazine

$ sudo buildah run hello-magazine

```

访问 <http://localhost> 将显示 “Hello Fedora Magazine !!!”


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/daemon-less-container-management-buildah/

作者：[Ashutosh Sudhakar Bhakare][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/ashutoshbhakare/
[1]:https://github.com/projectatomic/buildah
