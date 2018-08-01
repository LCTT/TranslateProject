Buildah 入门
======

> Buildah 提供一种灵活、可脚本编程的方式，来使用你熟悉的工具创建精简、高效的容器镜像。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/blocks_building.png?itok=eMOT-ire)

[Buildah][1] 是一个命令行工具，可以方便、快捷的构建与<ruby>[开放容器标准][2]<rt>Open Container Initiative</rt></ruby>（OCI）兼容的容器镜像，这意味着其构建的镜像与 Docker 和 Kubernetes 兼容。该工具可作为 Docker 守护进程 `docker build` 命令（即使用传统的 Dockerfile 构建镜像）的一种<ruby>简单<rt>drop-in</rt></ruby>替换，而且更加灵活，允许构建镜像时使用你擅长的工具。Buildah 可以轻松与脚本集成并生成<ruby>流水线<rt>pipeline</rt></ruby>，最好之处在于构建镜像不再需要运行容器守护进程（LCTT 译注：这里主要是指 Docker 守护进程）。

### docker build 的简单替换

目前你可能使用 Dockerfile 和 `docker build` 命令构建镜像，那么你可以马上使用 Buildah 进行替代。Buildah 的 `build-using-dockerfile` （或 `bud`）子命令与 `docker build` 基本等价，因此可以轻松的与已有脚本结合或构建流水线。

类似我的上一篇关于 Buildah 的[文章][3]，我也将以使用源码安装 “GNU Hello” 为例进行说明，对应的 Dockerfile 文件如下：

```
FROM fedora:28
LABEL maintainer Chris Collins <collins.christopher@gmail.com>

RUN dnf install -y tar gzip gcc make \
        && dnf clean all

ADD http://ftpmirror.gnu.org/hello/hello-2.10.tar.gz /tmp/hello-2.10.tar.gz

RUN tar xvzf /tmp/hello-2.10.tar.gz -C /opt

WORKDIR /opt/hello-2.10

RUN ./configure
RUN make
RUN make install
RUN hello -v
ENTRYPOINT "/usr/local/bin/hello"
```

使用 Buildah 从 Dockerfile 构建镜像也很简单，使用 `buildah bud -t hello .` 替换 `docker build -t hello .` 即可：

```
[chris@krang] $ sudo buildah bud -t hello .
STEP 1: FROM fedora:28
Getting image source signatures
Copying blob sha256:e06fd16225608e5b92ebe226185edb7422c3f581755deadf1312c6b14041fe73
 81.48 MiB / 81.48 MiB [====================================================] 8s
Copying config sha256:30190780b56e33521971b0213810005a69051d720b73154c6e473c1a07ebd609
 2.29 KiB / 2.29 KiB [======================================================] 0s
Writing manifest to image destination
Storing signatures
STEP 2: LABEL maintainer Chris Collins <collins.christopher@gmail.com>
STEP 3: RUN dnf install -y tar gzip gcc make    && dnf clean all

<考虑篇幅，略去后续输出>
```

镜像构建完毕后，可以使用 `buildah images` 命令查看这个新镜像：

```
[chris@krang] $ sudo buildah images
IMAGE ID        IMAGE NAME                              CREATED AT              SIZE
30190780b56e    docker.io/library/fedora:28             Mar 7, 2018 16:53       247 MB
6d54bef73e63    docker.io/library/hello:latest    May 3, 2018 15:24     391.8 MB
```

新镜像的标签为 `hello:latest`，我们可以将其推送至远程镜像仓库，可以使用 [CRI-O][4] 或其它 Kubernetes CRI 兼容的运行时来运行该镜像，也可以推送到远程仓库。如果你要测试对 Docker build 命令的替代性，你可以将镜像拷贝至 docker 守护进程的本地镜像存储中，这样 Docker 也可以使用该镜像。使用 `buildah push` 可以很容易的完成推送操作：

```
[chris@krang] $ sudo buildah push hello:latest docker-daemon:hello:latest
Getting image source signatures
Copying blob sha256:72fcdba8cff9f105a61370d930d7f184702eeea634ac986da0105d8422a17028
 247.02 MiB / 247.02 MiB [==================================================] 2s
Copying blob sha256:e567905cf805891b514af250400cc75db3cb47d61219750e0db047c5308bd916
 144.75 MiB / 144.75 MiB [==================================================] 1s
Copying config sha256:6d54bef73e638f2e2dd8b7bf1c4dfa26e7ed1188f1113ee787893e23151ff3ff
 1.59 KiB / 1.59 KiB [======================================================] 0s
Writing manifest to image destination
Storing signatures

[chris@krang] $ sudo docker images | head -n2
REPOSITORY              TAG             IMAGE ID        CREATED                 SIZE
docker.io/hello      latest       6d54bef73e63  2 minutes ago   398 MB

[chris@krang] $ sudo docker run -t hello:latest
Hello, world!
```

### 若干差异

与 Docker build 不同，Buildah 不会自动的将 Dockerfile 中的每条指令产生的变更提到新的<ruby>分层<rt>layer</rt></ruby>中，只是简单的每次从头到尾执行构建。类似于<ruby>自动化<rt>automation</rt></ruby>和<ruby>流水线构建<rt>build pipeline</rt></ruby>，这种<ruby>无缓存构建<rt>non-cached</rt></ruby>方式的好处是可以提高构建速度，在指令较多时尤为明显。从<ruby>自动部署<rt>automated deployment</rt></ruby>或<ruby>持续交付<rt>continuous delivery</rt></ruby>的视角来看，使用这种方式可以快速的将新变更落实到生产环境中。

但从实际角度出发，缓存机制的缺乏对镜像开发不利，毕竟缓存层可以避免一遍遍的执行构建，从而显著的节省时间。自动分层只在 `build-using-dockerfile` 命令中生效。但我们在下面会看到，Buildah 原生命令允许我们选择将变更提交到硬盘的时间，提高了开发的灵活性。

### Buildah 原生命令

Buildah _真正_ 有趣之处在于它的原生命令，你可以在容器构建过程中使用这些命令进行交互。相比与使用 `build-using-dockerfile/bud` 命令执行每次构建，Buildah 提供命令让你可以与构建过程中的临时容器进行交互。（Docker 也使用临时或<ruby> _中间_ <rt>intermediate</rt></ruby>容器，但你无法在镜像构建过程中与其交互。）

还是使用 “GNU Hello” 为例，考虑使用如下 Buildah 命令构建的镜像：

```
#!/usr/bin/env bash

set -o errexit

# Create a container
container=$(buildah from fedora:28)

# Labels are part of the "buildah config" command
buildah config --label maintainer="Chris Collins <collins.christopher@gmail.com>" $container

# Grab the source code outside of the container
curl -sSL http://ftpmirror.gnu.org/hello/hello-2.10.tar.gz -o hello-2.10.tar.gz

buildah copy $container hello-2.10.tar.gz /tmp/hello-2.10.tar.gz

buildah run $container dnf install -y tar gzip gcc make
buildah run $container dnf clean all
buildah run $container tar xvzf /tmp/hello-2.10.tar.gz -C /opt

# Workingdir is also a "buildah config" command
buildah config --workingdir /opt/hello-2.10 $container

buildah run $container ./configure
buildah run $container make
buildah run $container make install
buildah run $container hello -v

# Entrypoint, too, is a “buildah config” command
buildah config --entrypoint /usr/local/bin/hello $container

# Finally saves the running container to an image
buildah commit --format docker $container hello:latest
```

我们可以一眼看出这是一个 Bash 脚本而不是 Dockerfile。基于 Buildah 的原生命令，可以轻易的使用任何脚本语言或你擅长的自动化工具编写脚本。形式可以是 makefile、Python 脚本或其它你擅长的类型。

这个脚本做了哪些工作呢？首先，Buildah 命令 `container=$(buildah from fedora:28)` 基于 fedora:28 镜像创建了一个正在运行的容器，将容器名（`buildah from` 命令的返回值）保存到变量中，便于后续使用。后续所有命令都是有 `$container` 变量指明需要操作的容器。这些命令的功能大多可以从名称看出：`buildah copy` 将文件拷贝至容器，`buildah run` 会在容器中执行命令。可以很容易的将上述命令与 Dockerfile 中的指令对应起来。

最后一条命令 `buildah commit` 将容器提交到硬盘上的镜像中。当不使用 Dockerfile 而是使用 Buildah 命令构建镜像时，你可以使用 `commit` 命令决定何时保存变更。在上例中，所有的变更是一起提交的；但也可以增加中间提交，让你可以选择作为起点的<ruby>缓存点<rt>cache point</rt></ruby>。（例如，执行完 `dnf install` 命令后将变更缓存到硬盘是特别有意义的，一方面因为该操作耗时较长，另一方面每次执行的结果也确实相同。）

### 挂载点，安装目录以及 chroot

另一个可以大大增加构建镜像灵活性的 Buildah 命令是 `buildah mount`，可以将容器的根目录挂载到你主机的一个挂载点上。例如：

```
[chris@krang] $ container=$(sudo buildah from fedora:28)
[chris@krang] $ mountpoint=$(sudo buildah mount ${container})
[chris@krang] $ echo $mountpoint
/var/lib/containers/storage/overlay2/463eda71ec74713d8cebbe41ee07da5f6df41c636f65139a7bd17b24a0e845e3/merged
[chris@krang] $ cat ${mountpoint}/etc/redhat-release
Fedora release 28 (Twenty Eight)
[chris@krang] $ ls ${mountpoint}
bin   dev  home  lib64          media  opt   root  sbin  sys  usr
boot  etc  lib   lost+found  mnt        proc  run   srv   tmp  var
```

这太棒了，你可以通过与挂载点交互对容器镜像进行修改。这允许你使用主机上的工具进行构建和安装软件，不用将这些构建工具打包到容器镜像本身中。例如，在我们上面的 Bash 脚本中，我们需要安装 tar、Gzip、GCC 和 make，在容器内编译 “GNU Hello”。如果使用挂载点，我仍使用同样的工具进行构建，但下载的压缩包和 tar、Gzip 等 RPM 包都在主机而不是容器和生成的镜像内：

```
#!/usr/bin/env bash

set -o errexit

# Create a container
container=$(buildah from fedora:28)
mountpoint=$(buildah mount $container)

buildah config --label maintainer="Chris Collins <collins.christopher@gmail.com>" $container

curl -sSL http://ftpmirror.gnu.org/hello/hello-2.10.tar.gz \
     -o /tmp/hello-2.10.tar.gz
tar xvzf src/hello-2.10.tar.gz -C ${mountpoint}/opt

pushd ${mountpoint}/opt/hello-2.10
./configure
make
make install DESTDIR=${mountpoint}
popd

chroot $mountpoint bash -c "/usr/local/bin/hello -v"

buildah config --entrypoint "/usr/local/bin/hello" $container
buildah commit --format docker $container hello
buildah unmount $container
```

在上述脚本中，需要提到如下几点：

  1. `curl` 命令将压缩包下载到主机中，而不是镜像中；
  2. （主机中的） `tar` 命令将压缩包中的源代码解压到容器的 `/opt` 目录；
  3. `configure`，`make` 和 `make install` 命令都在主机的挂载点目录中执行，而不是在容器内；
  4. 这里的 `chroot` 命令用于将挂载点本身当作根路径并测试 "hello" 是否正常工作；类似于前面例子中用到的 `buildah run` 命令。


这个脚本更加短小，使用大多数 Linux 爱好者都很熟悉的工具，最后生成的镜像也更小（没有 tar 包，没有额外的软件包等）。你甚至可以使用主机系统上的包管理器为容器安装软件。例如，（出于某种原因）你希望安装 GNU Hello 的同时在容器中安装 [NGINX][5]：

```
[chris@krang] $ mountpoint=$(sudo buildah mount ${container})
[chris@krang] $ sudo dnf install nginx --installroot $mountpoint
[chris@krang] $ sudo chroot $mountpoint nginx -v
nginx version: nginx/1.12.1
```

在上面的例子中，DNF 使用 `--installroot` 参数将 NGINX 安装到容器中，可以通过 chroot 进行校验。

### 快来试试吧！

Buildah 是一种轻量级、灵活的容器镜像构建方法，不需要在主机上运行完整的 Docker 守护进程。除了提供基于 Dockerfile 构建容器的开箱即用支持，Buildah 还可以很容易的与脚本或你喜欢的构建工具相结合，特别是可以使用主机上已有的工具构建容器镜像。Buildah 生成的容器体积更小，更便于网络传输，占用更小的存储空间，而且潜在的受攻击面更小。快来试试吧！

**[阅读相关的故事，[使用 Buildah 创建小体积的容器][6]]**

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/getting-started-buildah

作者：[Chris Collins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[pinewall](https://github.com/pinewall)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/clcollins
[1]:https://github.com/projectatomic/buildah
[2]:https://www.opencontainers.org/
[3]:http://chris.collins.is/2017/08/17/buildah-a-new-way-to-build-container-images/
[4]:http://cri-o.io/
[5]:https://www.nginx.com/
[6]:https://linux.cn/article-9719-1.html
