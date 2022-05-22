[#]: subject: (Build smaller containers)
[#]: via: (https://fedoramagazine.org/build-smaller-containers/)
[#]: author: (Daniel Schier https://fedoramagazine.org/author/danielwtd/)
[#]: collector: (lujun9972)
[#]: translator: (ShuyRoy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13382-1.html)

如何构建更小的容器
======

![](https://img.linux.net.cn/data/attachment/album/202105/12/112108han4e111a6v16act.jpg)

使用容器工作是很多用户和开发者的日常任务。容器开发者经常需要频繁地（重新）构建容器镜像。如果你开发容器，你有想过减小镜像的大小吗？较小的镜像有一些好处。在下载的时候所需要的带宽更少，而且在云环境中运行的时候也可以节省开销。而且在 Fedora [CoreOS][4]、[IoT][5] 以及[Silverblue][6] 上使用较小的容器镜像可以提升整体系统性能，因为这些操作系统严重依赖于容器工作流。这篇文章将会提供一些减小容器镜像大小的技巧。

### 工具

以下例子所用到的主机操作系统是 Fedora Linux 33。例子使用 [Podman][7] 3.1.0 和[Buildah][8] 1.2.0。Podman 和 Buildah 已经预装在大多数 Fedora Linux 变种中。如果你没有安装 Podman 和 Buildah，可以用下边的命令安装：

```
$ sudo dnf install -y podman buildah
```

### 任务

从一个基础的例子开始。构建一个满足以下需求的 web 容器：

  * 容器必须基于 Fedora Linux
  * 使用 Apache httpd web 服务器
  * 包含一个定制的网站
  * 容器应该比较小

下边的步骤也适用于比较复杂的镜像。

### 设置

首先，创建一个工程目录。这个目录将会包含你的网站和容器文件：

```
$ mkdir smallerContainer
$ cd smallerContainer
$ mkdir files
$ touch files/index.html
```

制作一个简单的登录页面。对于这个演示，你可以将下面的 HTML 复制到 `index.html` 文件中。

```
<!doctype html>

<html lang="de">
<head>
  <title>Container Page</title>
</head>

<body>
  <header>
    <h1>Container Page</h1>
  </header>
  <main>
    <h2>Fedora</h2>
    <ul>
      <li><a href="https://getfedora.org">Fedora Project</a></li>
      <li><a href="https://docs.fedoraproject.org/">Fedora Documentation</a></li>
      <li><a href="https://fedoramagazine.org">Fedora Magazine</a></li>
      <li><a href="https://communityblog.fedoraproject.org/">Fedora Community Blog</a></li>
    </ul>
    <h2>Podman</h2>
    <ul>
      <li><a href="https://podman.io">Podman</a></li>
      <li><a href="https://docs.podman.io/">Podman Documentation</a></li>
      <li><a href="https://github.com/containers/podman">Podman Code</a></li>
      <li><a href="https://podman.io/blogs/">Podman Blog</a></li>
    </ul>
    <h2>Buildah</h2>
    <ul>
      <li><a href="https://buildah.io">Buildah</a></li>
      <li><a href="https://github.com/containers/buildah">Buildah Code</a></li>
      <li><a href="https://buildah.io/blogs/">Buildah Blog</a></li>
    </ul>
    <h2>Skopeo</h2>
    <ul>
      <li><a href="https://github.com/containers/skopeo">skopeo Code</a></li>
    </ul>
    <h2>CRI-O</h2>
    <ul>
      <li><a href="https://cri-o.io/">CRI-O</a></li>
      <li><a href="https://github.com/cri-o/cri-o">CRI-O Code</a></li>
      <li><a href="https://medium.com/cri-o">CRI-O Blog</a></li>
    </ul>
  </main>
</body>

</html>
```

此时你可以选择在浏览器中测试上面的 `index.html` 文件：

```
$ firefox files/index.html
```

最后，创建一个容器文件。这个文件可以命名为 `Dockerfile` 或者 `Containerfile`：

```
$ touch Containerfile
```

现在你应该有了一个工程目录，并且该目录中的文件系统布局如下：

```
smallerContainer/
|- files/
|    |- index.html
|
|- Containerfile
```

### 构建

现在构建镜像。下边的每个阶段都会添加一层改进来帮助减小镜像的大小。你最终会得到一系列镜像，但只有一个 `Containerfile`。

#### 阶段 0：一个基本的容器镜像

你的新镜像将会非常简单，它只包含强制性步骤。在 `Containerfile` 中添加以下内容：

```
# 使用 Fedora 33 作为基镜像
FROM registry.fedoraproject.org/fedora:33

# 安装 httpd
RUN dnf install -y httpd

# 复制这个网站
COPY files/* /var/www/html/

# 设置端口为 80/tcp
EXPOSE 80

# 启动 httpd
CMD ["httpd", "-DFOREGROUND"]
```

在上边的文件中有一些注释来解释每一行内容都是在做什么。更详细的步骤：

  1. 在 `FROM registry.fedoraproject.org/fedora:33` 的基础上创建一个构建容器 
  2. 运行命令： `dnf install -y httpd`
  3. 将与 `Containerfile` 有关的文件拷贝到容器中
  4. 设置 `EXPOSE 80` 来说明哪个端口是可以自动设置的
  5. 设置一个 `CMD` 指令来说明如果从这个镜像创建一个容器应该运行什么

运行下边的命令从工程目录创建一个新的镜像：

```
$ podman image build -f Containerfile -t localhost/web-base
```

使用一下命令来查看你的镜像的属性。注意你的镜像的大小（467 MB）。

```
$ podman image ls
REPOSITORY                         TAG     IMAGE ID      CREATED        SIZE
localhost/web-base                 latest  ac8c5ed73bb5  5 minutes ago  467 MB
registry.fedoraproject.org/fedora  33      9f2a56037643  3 months ago   182 MB
```

以上这个例子中展示的镜像在现在占用了467 MB的空间。剩下的阶段将会显著地减小镜像的大小。但是首先要验证镜像是否能够按照预期工作。

输入以下命令来启动容器：

```
$ podman container run -d --name web-base -P localhost/web-base
```

输入以下命令可以列出你的容器：

```
$ podman container ls
CONTAINER ID  IMAGE               COMMAND               CREATED        STATUS            PORTS                  NAMES
d24063487f9f  localhost/web-base  httpd -DFOREGROUN...  2 seconds ago  Up 3 seconds ago  0.0.0.0:46191->80/tcp  web-base
```

以上展示的容器正在运行，它正在监听的端口是 `46191` 。从运行在主机操作系统上的 web 浏览器转到 `localhost:46191` 应该呈现你的 web 页面：

```
$ firefox localhost:46191
```

#### 阶段 1：清除缓存并将残余的内容从容器中删除

为了优化容器镜像的大小，第一步应该总是执行“清理”。这将保证安装和打包所残余的内容都被删掉。这个过程到底需要什么取决于你的容器。对于以上的例子，只需要编辑 `Containerfile` 让它包含以下几行。

```
[...]
# Install httpd
RUN dnf install -y httpd && \
    dnf clean all -y
[...]
```

构建修改后的 `Containerfile` 来显著地减小镜像（这个例子中是 237 MB）。

```
$ podman image build -f Containerfile -t localhost/web-clean
$ podman image ls
REPOSITORY            TAG     IMAGE ID      CREATED        SIZE
localhost/web-clean   latest  f0f62aece028  6 seconds ago  237 MB
```

#### 阶段 2：删除文档和不需要的依赖包

许多包在安装时会被建议拉下来，包含一些弱依赖和文档。这些在容器中通常是不需要的，可以删除。 `dnf` 命令有选项可以表明它不需要包含弱依赖或文档。

再次编辑 `Containerfile` ，并在 `dnf install` 行中添加删除文档和弱依赖的选项：

```
[...]
# Install httpd
RUN dnf install -y httpd --nodocs --setopt install_weak_deps=False && \
    dnf clean all -y
[...]
```

构建经过以上修改后的 `Containerfile` 可以得到一个更小的镜像（231 MB）。

```
$ podman image build -f Containerfile -t localhost/web-docs
$ podman image ls
REPOSITORY            TAG     IMAGE ID      CREATED        SIZE
localhost/web-docs    latest  8a76820cec2f  8 seconds ago  231 MB
```

#### 阶段 3：使用更小的容器基镜像

前面的阶段结合起来，使得示例镜像的大小减少了一半。但是仍然还有一些途径来进一步减小镜像的大小。这个基镜像 `registry.fedoraproject.org/fedora:33` 是通用的。它提供了一组软件包，许多人希望这些软件包预先安装在他们的 Fedora Linux 容器中。但是，通用的 Fedora Linux 基镜像中提供的包通常必须要的更多。Fedora 项目也为那些希望只从基本包开始，然后只添加所需内容来实现较小总镜像大小的用户提供了一个 `fedora-minimal` 镜像。

使用 `podman image search` 来查找 `fedora-minimal` 镜像，如下所示：

```
$ podman image search fedora-minimal
INDEX               NAME   DESCRIPTION   STARS   OFFICIAL   AUTOMATED
fedoraproject.org   registry.fedoraproject.org/fedora-minimal         0
```

`fedora-minimal` 基镜像不包含 [DNF][9]，而是倾向于使用不需要 Python 的较小的 [microDNF][10]。当 `registry.fedoraproject.org/fedora:33` 被 `registry.fedoraproject.org/fedora-minimal:33` 替换后，需要用 `microdnf` 命令来替换 `dnf`。

```
# 使用 Fedora minimal 33 作为基镜像
FROM registry.fedoraproject.org/fedora-minimal:33

# 安装 httpd
RUN microdnf install -y httpd --nodocs --setopt install_weak_deps=0 && \
    microdnf clean all -y
[...]
```
使用 `fedora-minimal` 重新构建后的镜像大小如下所示 （169 MB）：

```
$ podman image build -f Containerfile -t localhost/web-docs
$ podman image ls
REPOSITORY             TAG     IMAGE ID      CREATED        SIZE
localhost/web-minimal  latest  e1603bbb1097  7 minutes ago  169 MB
```

最开始的镜像大小是 **467 MB**。结合以上每个阶段所提到的方法，进行重新构建之后可以得到最终大小为 **169 MB** 的镜像。最终的 _总_ 镜像大小比最开始的 _基_ 镜像小了 182 MB！

### 从零开始构建容器

前边的内容使用一个容器文件和 Podman 来构建一个新的镜像。还有最后一个方法要展示——使用 Buildah 来从头构建一个容器。Podman 使用与 Buildah 相同的库来构建容器。但是 Buildah 被认为是一个纯构建工具。Podman 被设计来是为了代替 Docker 的。

使用 Buildah 从头构建的容器是空的——它里边什么都 _没有_ 。所有的东西都需要安装或者从容器外复制。幸运地是，使用 Buildah 相当简单。下边是一个从头开始构建镜像的小的 Bash 脚本。除了运行这个脚本，你也可以在终端逐条地运行脚本中的命令，来更好的理解每一步都是做什么的。

```
#!/usr/bin/env bash
set -o errexit

# 创建一个容器
CONTAINER=$(buildah from scratch)

# 挂载容器文件系统
MOUNTPOINT=$(buildah mount $CONTAINER)

# 安装一个基本的文件系统和最小的包以及 nginx
dnf install -y --installroot $MOUNTPOINT  --releasever 33 glibc-minimal-langpack httpd --nodocs --setopt install_weak_deps=False

dnf clean all -y --installroot $MOUNTPOINT --releasever 33

# 清除
buildah unmount $CONTAINER

# 复制网站
buildah copy $CONTAINER 'files/*' '/var/www/html/'

# 设置端口为 80/tcp
buildah config --port 80 $CONTAINER

# 启动 httpd
buildah config --cmd "httpd -DFOREGROUND" $CONTAINER

# 将容器保存为一个镜像
buildah commit --squash $CONTAINER web-scratch
```

或者，可以通过将上面的脚本传递给 Buildah 来构建镜像。注意不需要 root 权限。

```
$ buildah unshare bash web-scratch.sh
$ podman image ls
REPOSITORY             TAG     IMAGE ID      CREATED        SIZE
localhost/web-scratch  latest  acca45fc9118  9 seconds ago  155 MB
```

最后的镜像只有 **155 MB**！而且 [攻击面][11] 也减少了。甚至在最后的镜像中都没有安装 DNF（或者 microDNF）。

### 结论

构建一个比较小的容器镜像有许多优点。减少所需要的带宽、磁盘占用以及攻击面，都会得到更好的镜像。只用很少的更改来减小镜像的大小很简单。许多更改都可以在不改变结果镜像的功能下完成。

只保存所需的二进制文件和配置文件来构建非常小的镜像也是可能的。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/build-smaller-containers/

作者：[Daniel Schier][a]
选题：[lujun9972][b]
译者：[ShuyRoy](https://github.com/Shuyroy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/danielwtd/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/04/podman-smaller-1-816x345.jpg
[2]: https://unsplash.com/@errbodysaycheese?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/otter?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/getting-started-with-fedora-coreos/
[5]: https://getfedora.org/en/iot/
[6]: https://fedoramagazine.org/what-is-silverblue/
[7]: https://podman.io/
[8]: https://buildah.io/
[9]: https://github.com/rpm-software-management/dnf
[10]: https://github.com/rpm-software-management/microdnf
[11]: https://en.wikipedia.org/wiki/Attack_surface
