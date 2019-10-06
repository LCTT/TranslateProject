[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11327-1.html)
[#]: subject: (How to build Fedora container images)
[#]: via: (https://fedoramagazine.org/how-to-build-fedora-container-images/)
[#]: author: (Clément Verna https://fedoramagazine.org/author/cverna/)

如何构建 Fedora 容器镜像
======

![][1]

随着容器和容器技术的兴起，现在所有主流的 Linux 发行版都提供了容器基础镜像。本文介绍了 Fedora 项目如何构建其基本镜像。同时还展示了如何使用它来创建分层图像。

### 基础和分层镜像

在看如何构建 Fedora 容器<ruby>基础镜像<rt>base image</rt></ruby>之前，让我们定义基础镜像和<ruby>分层镜像<rt>layered image</rt></ruby>。定义基础镜像的简单方法是没有父镜像层的镜像。但这具体意味着什么呢？这意味着基础镜像通常只包含操作系统的根文件系统基础镜像（rootfs）。基础镜像通常提供安装软件以创建分层镜像所需的工具。

分层镜像在基础镜像上添加了一组层，以便安装、配置和运行应用。分层镜像在 Dockerfile 中使用 `FROM` 指令引用基础镜像：

```
FROM fedora:latest
```

### 如何构建基础镜像

Fedora 有一整套用于构建容器镜像的工具。[其中包括 podman][2]，它不需要以 root 身份运行。

#### 构建 rootfs

基础镜像主要由一个 [tarball][3] 构成。这个 tarball 包含一个 rootfs。有不同的方法来构建此 rootfs。Fedora 项目使用 [kickstart][4] 安装方式以及 [imagefactory][5] 来创建这些 tarball。

在创建 Fedora 基础镜像期间使用的 kickstart 文件可以在 Fedora 的构建系统 [Koji][6] 中找到。[Fedora-Container-Base][7] 包重新组合了所有基础镜像的构建版本。如果选择了一个构建版本，那么可以访问所有相关文件，包括 kickstart 文件。查看 [示例][8]，文件末尾的 `%packages` 部分定义了要安装的所有软件包。这就是让软件放在基础镜像中的方法。

#### 使用 rootfs 构建基础镜像

rootfs 完成后，构建基础镜像就很容易了。它只需要一个包含以下指令的 Dockerfile：

```
FROM scratch
ADD layer.tar /
CMD ["/bin/bash"]
```

这里的重要部分是 `FROM scratch` 指令，它会创建一个空镜像。然后，接下来的指令将 rootfs 添加到镜像，并设置在运行镜像时要执行的默认命令。

让我们使用 Koji 内置的 Fedora rootfs 构建一个基础镜像：

```
$ curl -o fedora-rootfs.tar.xz https://kojipkgs.fedoraproject.org/packages/Fedora-Container-Base/Rawhide/20190902.n.0/images/Fedora-Container-Base-Rawhide-20190902.n.0.x86_64.tar.xz
$ tar -xJvf fedora-rootfs.tar.xz 51c14619f9dfd8bf109ab021b3113ac598aec88870219ff457ba07bc29f5e6a2/layer.tar 
$ mv 51c14619f9dfd8bf109ab021b3113ac598aec88870219ff457ba07bc29f5e6a2/layer.tar layer.tar
$ printf "FROM scratch\nADD layer.tar /\nCMD [\"/bin/bash\"]" > Dockerfile
$ podman build -t my-fedora .
$ podman run -it --rm my-fedora cat /etc/os-release
```

需要从下载的存档中提取包含 rootfs 的 `layer.tar` 文件。这在 Fedora 生成的镜像已经可以被容器运行时使用才需要。

因此，使用 Fedora 生成的镜像，获得基础镜像会更容易。让我们看看它是如何工作的：

```
$ curl -O https://kojipkgs.fedoraproject.org/packages/Fedora-Container-Base/Rawhide/20190902.n.0/images/Fedora-Container-Base-Rawhide-20190902.n.0.x86_64.tar.xz
$ podman load --input Fedora-Container-Base-Rawhide-20190902.n.0.x86_64.tar.xz
$ podman run -it --rm localhost/fedora-container-base-rawhide-20190902.n.0.x86_64:latest cat /etc/os-release
```

### 构建分层镜像

要构建使用 Fedora 基础镜像的分层镜像，只需在 `FROM` 行指令中指定 `fedora`：

```
FROM fedora:latest
```

`latest` 标记引用了最新的 Fedora 版本（编写本文时是 Fedora 30）。但是可以使用镜像的标签来使用其他版本。例如，`FROM fedora:31` 将使用 Fedora 31 基础镜像。

Fedora 支持将软件作为容器来构建并发布。这意味着你可以维护 Dockerfile 来使其他人可以使用你的软件。关于在 Fedora 中成为容器镜像维护者的更多信息，请查看 [Fedora 容器指南][9]。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-build-fedora-container-images/

作者：[Clément Verna][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/cverna/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/08/fedoracontainers-816x345.jpg
[2]: https://linux.cn/article-10156-1.html
[3]: https://en.wikipedia.org/wiki/Tar_(computing)
[4]: https://en.wikipedia.org/wiki/Kickstart_(Linux)
[5]: http://imgfac.org/
[6]: https://koji.fedoraproject.org/koji/
[7]: https://koji.fedoraproject.org/koji/packageinfo?packageID=26387
[8]: https://kojipkgs.fedoraproject.org//packages/Fedora-Container-Base/30/20190902.0/images/koji-f30-build-37420478-base.ks
[9]: https://docs.fedoraproject.org/en-US/containers/guidelines/guidelines/
