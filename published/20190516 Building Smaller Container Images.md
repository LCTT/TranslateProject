[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10885-1.html)
[#]: subject: (Building Smaller Container Images)
[#]: via: (https://fedoramagazine.org/building-smaller-container-images/)
[#]: author: (Muayyad Alsadi https://fedoramagazine.org/author/alsadi/)

构建更小的容器镜像的技巧
======

![][1]

Linux 容器已经成为一个热门话题，保证容器镜像较小被认为是一个好习惯。本文提供了有关如何构建较小 Fedora 容器镜像的一些技巧。

### microdnf

Fedora 的 DNF 是用 Python 编写的，因为它有各种各样的插件，因此它的设计是可扩展的。但是 有一个 Fedora 基本容器镜像替代品，它使用一个较小的名为 [microdnf][2] 的包管理器，使用 C 编写。要在 Dockerfile 中使用这个最小的镜像，`FROM` 行应该如下所示：

```
FROM registry.fedoraproject.org/fedora-minimal:30
```

如果你的镜像不需要像 Python 这样的典型 DNF 依赖项，例如，如果你在制作 NodeJS 镜像时，那么这是一个重要的节省项。

### 在一个层中安装和清理

为了节省空间，使用 `dnf clean all` 或其 microdnf 等效的 `microdnf clean all` 删除仓库元数据非常重要。但是你不应该分两步执行此操作，因为这实际上会将这些文件保存在容器镜像中，然后在另一层中将其标记为删除。要正确地执行此操作，你应该像这样一步完成安装和清理：

```
FROM registry.fedoraproject.org/fedora-minimal:30
RUN microdnf install nodejs && microdnf clean all
```

### 使用 microdnf 进行模块化

模块化是一种给你选择不同堆栈版本的方法。例如，你可能需要在项目中用非 LTS 的 NodeJS v11，旧的 LTS NodeJS v8 用于另一个，最新的 LTS NodeJS v10 用于另一个。你可以使用冒号指定流。

```
# dnf module list
# dnf module install nodejs:8
```

`dnf module install` 命令意味着两个命令，一个启用流，另一个是从它安装 nodejs。

```
# dnf module enable nodejs:8
# dnf install nodejs
```

尽管 `microdnf` 不提供与模块化相关的任何命令，但是可以启用带有配置文件的模块，并且 libdnf（被 microdnf 使用）[似乎][3]支持模块化流。该文件看起来像这样：

```
/etc/dnf/modules.d/nodejs.module
[nodejs]
name=nodejs
stream=8
profiles=
state=enabled
```

使用模块化的 `microdnf` 的完整 Dockerfile 如下所示：

```
FROM registry.fedoraproject.org/fedora-minimal:30
RUN \
   echo -e "[nodejs]\nname=nodejs\nstream=8\nprofiles=\nstate=enabled\n" > /etc/dnf/modules.d/nodejs.module && \
   microdnf install nodejs zopfli findutils busybox && \
   microdnf clean all
```

### 多阶段构建

在许多情况下，你可能需要大量的无需用于运行软件的构建时依赖项，例如构建一个静态链接依赖项的 Go 二进制文件。多阶段构建是分离应用构建和应用运行时的有效方法。

例如，下面的 Dockerfile 构建了一个 Go 应用 [confd][4]。

```
# building container
FROM registry.fedoraproject.org/fedora-minimal AS build
RUN mkdir /go && microdnf install golang && microdnf clean all
WORKDIR /go
RUN export GOPATH=/go; CGO_ENABLED=0 go get github.com/kelseyhightower/confd

FROM registry.fedoraproject.org/fedora-minimal
WORKDIR /
COPY --from=build /go/bin/confd /usr/local/bin
CMD ["confd"]
```

通过在 `FROM` 指令之后添加 `AS` 并从基本容器镜像中添加另一个 `FROM` 然后使用 `COPY --from=` 指令将内容从*构建*的容器复制到第二个容器来完成多阶段构建。

可以使用 `podman` 构建并运行此 Dockerfile：

```
$ podman build -t myconfd .
$ podman run -it myconfd
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/building-smaller-container-images/

作者：[Muayyad Alsadi][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/alsadi/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/05/smaller-container-images-816x345.jpg
[2]: https://github.com/rpm-software-management/microdnf
[3]: https://bugzilla.redhat.com/show_bug.cgi?id=1575626
[4]: https://github.com/kelseyhightower/confd
