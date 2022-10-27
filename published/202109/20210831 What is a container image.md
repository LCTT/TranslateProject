[#]: subject: "What is a container image?"
[#]: via: "https://opensource.com/article/21/8/container-image"
[#]: author: "Nived V https://opensource.com/users/nivedv"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13766-1.html"

什么是容器镜像？
======

> 容器镜像包含一个打包的应用，以及它的依赖关系，还有它在启动时运行的进程信息。

![](https://img.linux.net.cn/data/attachment/album/202109/08/152733c9i69xsssa62b6rr.jpg)

容器是当今 IT 运维的一个关键部分。<ruby>容器镜像<rt>container image</rt></ruby>包含了一个打包的应用，以及它的依赖关系，还有它在启动时运行的进程信息。

你可以通过提供一组特殊格式的指令来创建容器镜像，可以是提交给<ruby>注册中心<rt>Registry</rt></ruby>，或者是作为 Dockerfile 保存。例如，这个 Dockerfile 为 PHP Web 应用创建了一个容器：

```
FROM registry.access.redhat.com/ubi8/ubi:8.1

RUN yum --disableplugin=subscription-manager -y module enable php:7.3 \
  && yum --disableplugin=subscription-manager -y install httpd php \
  && yum --disableplugin=subscription-manager clean all

ADD index.php /var/www/html

RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf \
  && sed -i 's/listen.acl_users = apache,nginx/listen.acl_users =/' /etc/php-fpm.d/www.conf \
  && mkdir /run/php-fpm \
  && chgrp -R 0 /var/log/httpd /var/run/httpd /run/php-fpm \
  && chmod -R g=u /var/log/httpd /var/run/httpd /run/php-fpm

EXPOSE 8080
USER 1001
CMD php-fpm & httpd -D FOREGROUND
```

这个文件中的每条指令都会在容器镜像中增加一个<ruby>层<rt>layer</rt></ruby>。每一层只增加与下面一层的区别，然后，所有这些堆叠在一起，形成一个只读的容器镜像。

### 它是如何工作的？

你需要知道一些关于容器镜像的事情，按照这个顺序理解这些概念很重要：

  1. 联合文件系统
  2. 写入时复制（COW）
  3. 叠加文件系统
  4. 快照器

### 联合文件系统

<ruby>联合文件系统<rt>Union File System</rt></ruby>（UnionFS）内置于 Linux 内核中，它允许将一个文件系统的内容与另一个文件系统的内容合并，同时保持“物理”内容的分离。其结果是一个统一的文件系统，即使数据实际上是以分支形式组织。

这里的想法是，如果你有多个镜像有一些相同的数据，不是让这些数据再次复制过来，而是通过使用一个叫做<ruby>层<rt>layer</rt></ruby>的东西来共享。

![UnionFS][2]

每一层都是一个可以在多个容器中共享的文件系统，例如，httpd 基础层是 Apache 的官方镜像，可以在任何数量的容器中使用。想象一下，由于我们在所有的容器中使用相同的基础层，我们节省了多少磁盘空间。

这些镜像层总是只读的，但是当我们用这个镜像创建一个新的容器时，我们会在它上面添加一个薄的可写层。这个可写层是你创建、修改、删除或进行每个容器所需的其他修改的地方。

### 写时复制（COW）

当你启动一个容器时，看起来好像这个容器有自己的整个文件系统。这意味着你在系统中运行的每个容器都需要自己的文件系统副本。这岂不是要占用大量的磁盘空间，而且还要花费大量的时间让容器启动？不是的，因为每个容器都不需要它自己的文件系统副本!

容器和镜像使用<ruby>写时复制<rt>copy-on-write</rt></ruby>（COW）机制来实现这一点。写时复制策略不是复制文件，而是将同一个数据实例分享给多个进程，并且只在一个进程需要修改或写入数据时进行复制。所有其他进程将继续使用原始数据。

Docker 对镜像和容器都使用了写时复制的机制。为了做到这一点，在旧版本中，镜像和运行中的容器之间的变化是通过<ruby>图驱动<rt>graph driver</rt></ruby>来跟踪的，现在则是通过<ruby>快照器<rt>snapshotter</rt></ruby>来跟踪。

在运行中的容器中执行任何写操作之前，要修改的文件的副本被放在容器的可写层上。这就是发生 _写_ 的地方。现在你知道为什么它被称为“写时复制”了么。

这种策略既优化了镜像磁盘空间的使用，也优化了容器启动时间的性能，并与 UnionFS 一起工作。

### 叠加文件系统

<ruby>叠加文件系统<rt>Overlay File System</rt></ruby>位于现有文件系统的顶部，结合了上层和下层的目录树，并将它们作为一个单一的目录来呈现。这些目录被称为<ruby>层<rt>layer</rt></ruby>。下层保持不被修改。每一层只增加与下一层的差异（计算机术语为 “diff”），这种统一的过程被称为<ruby>联合挂载<rt>union mount</rt></ruby>。

最低的目录或镜像层被称为<ruby>下层目录<rt>lowerdir</rt></ruby>，上面的目录被称为 <ruby>上层目录<rt>upperdir</rt></ruby>。最后的覆盖层或统一层被称为<ruby>合并层<rt>merged</rt></ruby>。

![Layered file system][3]

常见的术语包括这些层的定义：

  * <ruby>基础层<rt>Base layer</rt></ruby>：是你的文件系统的文件所在的地方。就容器镜像而言，这个层就是你的基础镜像。
  * <ruby>叠加层<rt>Overlay layer</rt></ruby>：通常被称为<ruby>容器层<rt>container layer</rt></ruby>，因为对运行中的容器所做的所有改变，如添加、删除或修改文件，都会写到这个可写层。对这一层所做的所有修改都存储在下一层，是基础层和差异层的联合视图。
  * <ruby>差异层<rt>Diff layer</rt></ruby>包含了在叠加层所作的所有修改。如果你写的东西已经在基础层了，那么叠加文件系统就会把文件复制到差异层，并做出你想写的修改。这被称为写时复制。

### 快照器

通过使用层和图驱动，容器可以将其更改作为其容器文件系统的一部分来构建、管理和分发。但是使用<ruby>图驱动<rt>graph driver</rt></ruby>的工作真的很复杂，而且容易出错。<ruby>快照器<rt>SnapShotter</rt></ruby>与图驱动不同，因为它们不用了解镜像或容器。

快照器的工作方式与 Git 非常相似，比如有树的概念，并跟踪每次提交对树的改变。一个<ruby>快照<rt>snapshot</rt></ruby>代表一个文件系统状态。快照有父子关系，使用一组目录。可以在父级和其快照之间进行差异比较（`diff`），以创建一个层。

快照器提供了一个用于分配、快照和挂载抽象的分层文件系统的 API。

### 总结

你现在对什么是容器镜像以及它们的分层方法如何使容器可移植有了很好的认识。接下来，我将介绍容器的运行机制和内部结构。

本文基于 [techbeatly][4] 的文章，经许可后改编。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/container-image

作者：[Nived V][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nivedv
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-containers.png?itok=d_4QhZxT (Shipping containers stacked)
[2]: https://opensource.com/sites/default/files/unionfs.png (UnionFS)
[3]: https://miro.medium.com/max/4800/0*h61UE3S0jRPv3mA7 (Layered file system)
[4]: https://medium.com/techbeatly/container-part-ii-images-4f2139194775
