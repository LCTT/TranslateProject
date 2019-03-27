如何打造更小巧的容器镜像
======
> 五种优化 Linux 容器大小和构建更小的镜像的方法。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_scale_performance.jpg?itok=R7jyMeQf)

[Docker][1] 近几年的爆炸性发展让大家逐渐了解到容器和容器镜像的概念。尽管 Linux 容器技术在很早之前就已经出现，但这项技术近来的蓬勃发展却还是要归功于 Docker 对用户友好的命令行界面以及使用 Dockerfile 格式轻松构建镜像的方式。纵然 Docker 大大降低了入门容器技术的难度，但构建一个兼具功能强大、体积小巧的容器镜像的过程中，有很多技巧需要了解。

### 第一步：清理不必要的文件

这一步和在普通服务器上清理文件没有太大的区别，而且要清理得更加仔细。一个小体积的容器镜像在传输方面有很大的优势，同时，在磁盘上存储不必要的数据的多个副本也是对资源的一种浪费。因此，这些技术对于容器来说应该比有大量专用内存的服务器更加需要。

清理容器镜像中的缓存文件可以有效缩小镜像体积。下面的对比是使用 `dnf` 安装 [Nginx][2] 构建的镜像，分别是清理和没有清理 yum 缓存文件的结果：

```
# Dockerfile with cache
FROM fedora:28
LABEL maintainer Chris Collins <collins.christopher@gmail.com>

RUN dnf install -y nginx

-----

# Dockerfile w/o cache
FROM fedora:28
LABEL maintainer Chris Collins <collins.christopher@gmail.com>

RUN dnf install -y nginx \
        && dnf clean all \
        && rm -rf /var/cache/yum

-----

[chris@krang] $ docker build -t cache -f Dockerfile .  
[chris@krang] $ docker images --format "{{.Repository}}: {{.Size}}" 
| head -n 1
cache: 464 MB

[chris@krang] $ docker build -t no-cache -f Dockerfile-wo-cache .
[chris@krang] $ docker images --format "{{.Repository}}: {{.Size}}"  | head -n 1
no-cache: 271 MB
```

从上面的结果来看，清理缓存文件的效果相当显著。和清除了元数据和缓存文件的容器镜像相比，不清除的镜像体积接近前者的两倍。除此以外，包管理器缓存文件、Ruby gem 的临时文件、nodejs 缓存文件，甚至是下载的源码 tarball 最好都全部清理掉。

### 层：一个潜在的隐患

很不幸（当你往下读，你会发现这是不幸中的万幸），根据容器中的层的概念，不能简单地向 Dockerfile 中写一句 `RUN rm -rf /var/cache/yum` 就完事儿了。因为 Dockerfile 的每一条命令都以一个层的形式存储，并一层层地叠加。所以，如果你是这样写的：

```
RUN dnf install -y nginx
RUN dnf clean all
RUN rm -rf /var/cache/yum
```

你的容器镜像就会包含三层，而 `RUN dnf install -y nginx` 这一层仍然会保留着那些缓存文件，然后在另外两层中被移除。但缓存实际上仍然是存在的，当你把一个文件系统挂载在另外一个文件系统之上时，文件仍然在那里，只不过你见不到也访问不到它们而已。

在上一节的示例中，你会看到正确的做法是将几条命令链接起来，在产生缓存文件的同一条 Dockerfile 指令里把缓存文件清理掉：

```
RUN dnf install -y nginx \
        && dnf clean all \
        && rm -rf /var/cache/yum
```

这样就把几条命令连成了一条命令，在最终的镜像中只占用一个层。这样只会浪费一点缓存的好处，稍微多耗费一点点构建容器镜像的时间，但被清理掉的缓存文件就不会留存在最终的镜像中了。作为一个折衷方法，只需要把一些相关的命令（例如 `yum install` 和 `yum clean all`、下载文件、解压文件、移除 tarball 等等）连接成一个命令，就可以在最终的容器镜像中节省出大量体积，你也能够利用 Docker 的缓存加快开发速度。

层还有一个更隐蔽的特性。每一层都记录了文件的更改，这里的更改并不仅仅已有的文件累加起来，而是包括文件属性在内的所有更改。因此即使是对文件使用了 `chmod` 操作也会被在新的层创建文件的副本。

下面是一次 `docker images` 命令的输出内容。其中容器镜像 `layer_test_1` 是在 CentOS 基础镜像中增加了一个 1GB 大小的文件后构建出来的镜像，而容器镜像 `layer_test_2` 是使用了 `FROM layer_test_1` 语句创建出来的，除了执行一条 `chmod u+x` 命令没有做任何改变。

```
layer_test_2        latest       e11b5e58e2fc           7 seconds ago           2.35 GB
layer_test_1        latest       6eca792a4ebe           2 minutes ago           1.27 GB
```

如你所见，`layer_test_2` 镜像比 `layer_test_1` 镜像大了 1GB 以上。尽管事实上 `layer_test_1` 只是 `layer_test_2` 的前一层，但隐藏在这第二层中有一个额外的 1GB 的文件。在构建容器镜像的过程中，如果在单独一层中进行移动、更改、删除文件，都会出现类似的结果。

### 专用镜像和公用镜像

有这么一个亲身经历：我们部门重度依赖于 [Ruby on Rails][3]，于是我们开始使用容器。一开始我们就建立了一个正式的 Ruby 的基础镜像供所有的团队使用，为了简单起见（以及在“这就是我们自己在服务器上瞎鼓捣的”想法的指导下），我们使用 [rbenv][4] 将 Ruby 最新的 4 个版本都安装到了这个镜像当中，目的是让开发人员只用这个单一的镜像就可以将使用不同版本 Ruby 的应用程序迁移到容器中。我们当时还认为这是一个虽然非常大但兼容性相当好的镜像，因为这个镜像可以同时满足各个团队的使用。

实际上这是费力不讨好的。如果维护独立的、版本略微不同的镜像中，可以很轻松地实现镜像的自动化维护。同时，选择特定版本的特定镜像，还有助于在引入破坏性改变，在应用程序接近生命周期结束前提前做好预防措施，以免产生不可控的后果。庞大的公用镜像也会对资源造成浪费，当我们后来将这个庞大的镜像按照 Ruby 版本进行拆分之后，我们最终得到了共享一个基础镜像的多个镜像，如果它们都放在一个服务器上，会额外多占用一点空间，但是要比安装了多个版本的巨型镜像要小得多。

这个例子也不是说构建一个灵活的镜像是没用的，但仅对于这个例子来说，从一个公共镜像创建根据用途而构建的镜像最终将节省存储资源和维护成本，而在受益于公共基础镜像的好处的同时，每个团队也能够根据需要来做定制化的配置。

### 从零开始：将你需要的内容添加到空白镜像中

有一些和 Dockerfile 一样易用的工具可以轻松创建非常小的兼容 Docker 的容器镜像，这些镜像甚至不需要包含一个完整的操作系统，就可以像标准的 Docker 基础镜像一样小。

我曾经写过一篇[关于 Buildah 的文章][5]，我想在这里再一次推荐一下这个工具。因为它足够的灵活，可以使用宿主机上的工具来操作一个空白镜像并安装打包好的应用程序，而且这些工具不会被包含到镜像当中。

Buildah 取代了 `docker build` 命令。可以使用 Buildah 将容器的文件系统挂载到宿主机上并进行交互。

下面来使用 Buildah 实现上文中 Nginx 的例子（现在忽略了缓存的处理）：

```
#!/usr/bin/env bash
set -o errexit

# Create a container
container=$(buildah from scratch)

# Mount the container filesystem
mountpoint=$(buildah mount $container)

# Install a basic filesystem and minimal set of packages, and nginx
dnf install --installroot $mountpoint  --releasever 28 glibc-minimal-langpack nginx --setopt install_weak_deps=false -y

# Save the container to an image
buildah commit --format docker $container nginx

# Cleanup
buildah unmount $container

# Push the image to the Docker daemon’s storage
buildah push nginx:latest docker-daemon:nginx:latest

```

你会发现这里使用的已经不再是 Dockerfile 了，而是普通的 Bash 脚本，而且是从框架（或空白）镜像开始构建的。上面这段 Bash 脚本将容器的根文件系统挂载到了宿主机上，然后使用宿主机的命令来安装应用程序，这样的话就不需要把软件包管理器放置到容器镜像中了。

这样所有无关的内容（基础镜像之外的部分，例如 `dnf`）就不再会包含在镜像中了。在这个例子当中，构建出来的镜像大小只有 304 MB，比使用 Dockerfile 构建的镜像减少了 100 MB 以上。

```
[chris@krang] $ docker images |grep nginx
docker.io/nginx      buildah      2505d3597457    4 minutes ago         304 MB
```

注：这个镜像是使用上面的构建脚本构建的，镜像名称中前缀的 `docker.io` 只是在推送到镜像仓库时加上的。

对于一个 300MB 级别的容器基础镜像来说，能缩小 100MB 已经是很显著的节省了。使用软件包管理器来安装 Nginx 会带来大量的依赖项，如果能够使用宿主机直接从源代码对应用程序进行编译然后构建到容器镜像中，节省出来的空间还可以更多，因为这个时候可以精细的选用必要的依赖项，非必要的依赖项一概不构建到镜像中。

[Tom Sweeney][6] 有一篇文章《[用 Buildah 构建更小的容器][7]》，如果你想在这方面做深入的优化，不妨参考一下。

通过 Buildah 可以构建一个不包含完整操作系统和代码编译工具的容器镜像，大幅缩减了容器镜像的体积。对于某些类型的镜像，我们可以进一步采用这种方式，创建一个只包含应用程序本身的镜像。

### 使用静态链接的二进制文件来构建镜像

按照这个思路，我们甚至可以更进一步舍弃容器内部的管理和构建工具。例如，如果我们足够专业，不需要在容器中进行排错调试，是不是可以不要 Bash 了？是不是可以不要 [GNU 核心套件][8]了？是不是可以不要 Linux 基础文件系统了？如果你使用的编译型语言支持[静态链接库][9]，将应用程序所需要的所有库和函数都编译成二进制文件，那么程序所需要的函数和库都可以复制和存储在二进制文件本身里面。

这种做法在 [Golang][10] 社区中已经十分常见，下面我们使用由 Go 语言编写的应用程序进行展示：

以下这个 Dockerfile 基于 golang:1.8 镜像构建一个小的 Hello World 应用程序镜像：

```
FROM golang:1.8

ENV GOOS=linux
ENV appdir=/go/src/gohelloworld

COPY ./ /go/src/goHelloWorld
WORKDIR /go/src/goHelloWorld

RUN go get
RUN go build -o /goHelloWorld -a

CMD ["/goHelloWorld"]
```

构建出来的镜像中包含了二进制文件、源代码以及基础镜像层，一共 716MB。但对于应用程序运行唯一必要的只有编译后的二进制文件，其余内容在镜像中都是多余的。

如果在编译的时候通过指定参数 `CGO_ENABLED=0` 来禁用 `cgo`，就可以在编译二进制文件的时候忽略某些函数的 C 语言库：

```
GOOS=linux CGO_ENABLED=0 go build -a goHelloWorld.go
```

编译出来的二进制文件可以加到一个空白（或框架）镜像：

```
FROM scratch
COPY goHelloWorld /
CMD ["/goHelloWorld"]
```

来看一下两次构建的镜像对比：

```
[ chris@krang ] $ docker images
REPOSITORY      TAG             IMAGE ID                CREATED                 SIZE
goHello     scratch     a5881650d6e9            13 seconds ago          1.55 MB
goHello     builder     980290a100db            14 seconds ago          716 MB
```

从镜像体积来说简直是天差地别了。基于 golang:1.8 镜像构建出来带有 goHelloWorld 二进制的镜像（带有 `builder` 标签）体积是基于空白镜像构建的只包含该二进制文件的镜像的 460 倍！后者的整个镜像大小只有 1.55MB，也就是说，有 713MB 的数据都是非必要的。

正如上面提到的，这种缩减镜像体积的方式在 Golang 社区非常流行，因此不乏这方面的文章。[Kelsey Hightower][11] 有一篇[文章][12]专门介绍了如何处理这些库的依赖关系。

### 压缩镜像层

除了前面几节中讲到的将多个命令链接成一个命令的技巧，还可以对镜像进行压缩。镜像压缩的实质是导出它，删除掉镜像构建过程中的所有中间层，然后保存镜像的当前状态为单个镜像层。这样可以进一步将镜像缩小到更小的体积。

在 Docker 1.13 之前，压缩镜像层的的过程可能比较麻烦，需要用到 `docker-squash` 之类的工具来导出容器的内容并重新导入成一个单层的镜像。但 Docker 在 Docker 1.13 中引入了 `--squash` 参数，可以在构建过程中实现同样的功能：

```
FROM fedora:28
LABEL maintainer Chris Collins <collins.christopher@gmail.com>

RUN dnf install -y nginx
RUN dnf clean all
RUN rm -rf /var/cache/yum

[chris@krang] $ docker build -t squash -f Dockerfile-squash --squash .
[chris@krang] $ docker images --format "{{.Repository}}: {{.Size}}"  | head -n 1
squash: 271 MB
```

通过这种方式使用 Dockerfile 构建出来的镜像有 271MB 大小，和上面连接多条命令的方案构建出来的镜像体积一样，因此这个方案也是有效的，但也有一个潜在的问题，而且是另一种问题。

“什么？还有另外的问题？”

好吧，有点像以前一样的问题，以另一种方式引发了问题。

### 过头了：过度压缩、太小太专用了

容器镜像之间可以共享镜像层。基础镜像或许大小上有几 Mb，但它只需要拉取/存储一次，并且每个镜像都能复用它。所有共享基础镜像的实际镜像大小是基础镜像层加上每个特定改变的层的差异内容，因此，如果有数千个基于同一个基础镜像的容器镜像，其体积之和也有可能只比一个基础镜像大不了多少。

因此，这就是过度使用压缩或专用镜像层的缺点。将不同镜像压缩成单个镜像层，各个容器镜像之间就没有可以共享的镜像层了，每个容器镜像都会占有单独的体积。如果你只需要维护少数几个容器镜像来运行很多容器，这个问题可以忽略不计；但如果你要维护的容器镜像很多，从长远来看，就会耗费大量的存储空间。

回顾上面 Nginx 压缩的例子，我们能看出来这种情况并不是什么大的问题。在这个镜像中，有 Fedora 操作系统和 Nginx 应用程序，没有缓存，并且已经被压缩。但我们一般不会使用一个原始的 Nginx，而是会修改配置文件，以及引入其它代码或应用程序来配合 Nginx 使用，而要做到这些，Dockerfile 就变得更加复杂了。

如果使用普通的镜像构建方式，构建出来的容器镜像就会带有 Fedora 操作系统的镜像层、一个安装了 Nginx 的镜像层（带或不带缓存）、为 Nginx 作自定义配置的其它多个镜像层，而如果有其它容器镜像需要用到 Fedora 或者 Nginx，就可以复用这个容器镜像的前两层。

```
[   App 1 Layer (  5 MB) ]          [   App 2 Layer (6 MB) ]
[   Nginx Layer ( 21 MB) ] ------------------^
[ Fedora  Layer (249 MB) ]  
```

如果使用压缩镜像层的构建方式，Fedora 操作系统会和 Nginx 以及其它配置内容都被压缩到同一层里面，如果有其它容器镜像需要使用到 Fedora，就必须重新引入 Fedora 基础镜像，这样每个容器镜像都会额外增加 249MB 的大小。

```
[ Fedora + Nginx + App 1 (275 MB)]      [ Fedora + Nginx + App 2 (276 MB) ]  
```

当你构建了大量在功能上趋于分化的的小型容器镜像时，这个问题就会暴露出来了。

就像生活中的每一件事一样，关键是要做到适度。根据镜像层的实现原理，如果一个容器镜像变得越小、越专用化，就越难和其它容器镜像共享基础的镜像层，这样反而带来不好的效果。

对于仅在基础镜像上做微小变动构建出来的多个容器镜像，可以考虑共享基础镜像层。如上所述，一个镜像层本身会带有一定的体积，但只要存在于镜像仓库中，就可以被其它容器镜像复用。这种情况下，数千个镜像也许要比单个镜像占用更少的空间。

```
[ specific app   ]      [ specific app 2 ]
[ customizations ]--------------^
[ base layer     ]
```

一个容器镜像变得越小、越专用化，就越难和其它容器镜像共享基础的镜像层，最终会不必要地占用越来越多的存储空间。

```
 [ specific app 1 ]     [ specific app 2 ]      [ specific app 3 ]
```

### 总结

减少处理容器镜像时所需的存储空间和带宽的方法有很多，其中最直接的方法就是减小容器镜像本身的大小。在使用容器的过程中，要经常留意容器镜像是否体积过大，根据不同的情况采用上述提到的清理缓存、压缩到一层、将二进制文件加入在空白镜像中等不同的方法，将容器镜像的体积缩减到一个有效的大小。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/building-container-images

作者：[Chris Collins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/clcollins
[1]:https://www.docker.com/
[2]:https://www.nginx.com/
[3]:https://rubyonrails.org/
[4]:https://github.com/rbenv/rbenv
[5]:https://opensource.com/article/18/6/getting-started-buildah
[6]:https://twitter.com/TSweeneyRedHat
[7]:https://opensource.com/article/18/5/containers-buildah
[8]:https://www.gnu.org/software/coreutils/coreutils.html
[9]:https://en.wikipedia.org/wiki/Static_library
[10]:https://golang.org/
[11]:https://twitter.com/kelseyhightower
[12]:https://medium.com/@kelseyhightower/optimizing-docker-images-for-static-binaries-b5696e26eb07

