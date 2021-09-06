[#]: subject: "What is a container image?"
[#]: via: "https://opensource.com/article/21/8/container-image"
[#]: author: "Nived V https://opensource.com/users/nivedv"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

什么是容器镜像？
======
容器镜像包含一个打包的应用，以及它的依赖关系，还有它在启动时运行的进程信息。

![Shipping containers stacked][1]

容器是当今 IT 运维的一个关键部分。一个_容器镜像_包含了一个打包的应用，以及它的依赖关系，还有它在启动时运行的进程信息。

你通过提供一组特殊格式的指令来创建容器镜像，可以是提交给 Registry，或者是 Dockerfile。 例如，这个 Dockerfile 为 PHP Web 应用创建了一个容器：


```
FROM registry.access.redhat.com/ubi8/ubi:8.1

RUN yum --disableplugin=subscription-manager -y module enable php:7.3 \
 &amp;&amp; yum --disableplugin=subscription-manager -y install httpd php \
 &amp;&amp; yum --disableplugin=subscription-manager clean all

ADD index.php /var/www/html

RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf \
 &amp;&amp; sed -i 's/listen.acl_users = apache,nginx/listen.acl_users =/' /etc/php-fpm.d/www.conf \
 &amp;&amp; mkdir /run/php-fpm \
 &amp;&amp; chgrp -R 0 /var/log/httpd /var/run/httpd /run/php-fpm \
 &amp;&amp; chmod -R g=u /var/log/httpd /var/run/httpd /run/php-fpm

EXPOSE 8080
USER 1001
CMD php-fpm &amp; httpd -D FOREGROUND
```

这个文件中的每条指令都会在容器镜像中增加一个_层_。每一层只增加与下面一层的区别，然后，所有这些层叠在一起，形成一个只读的容器镜像。

### 这是怎么做到的？

你需要知道一些关于容器镜像的事情，按照这个顺序理解这些概念很重要：

  1. Union 文件系统
  2. 写入时复制
  3. Overlay 文件系统
  4. SnapShotters



### Union 文件系统（Aufs）

Union 文件系统（UnionFS）内置于 Linux 内核中，它允许将一个文件系统的内容与另一个文件系统的内容合并，同时保持“物理”内容的分离。其结果是一个统一的文件系统，即使数据实际上是以分支形式组织。

这里的想法是，如果你有多个镜像有一些相同的数据，不是让这些数据再次复制过来，而是通过使用一个叫做_层_的东西来共享。

![UnionFS][2]

图片 CC BY-SA opensource.com

每一层都是一个可以在多个容器中共享的文件系统，例如，httpd 基础层是 Apache 的官方镜像，可以在任何数量的容器中使用。想象一下，由于我们在所有的容器中使用相同的基础层，我们节省了多少磁盘空间。

这些镜像层总是只读的，但是当我们用这个镜像创建一个新的容器时，我们会在它上面添加一个薄的可写层。这个可写层是你创建/修改/删除或进行每个容器所需的其他修改的地方。

### 写时复制

当你启动一个容器时，看起来好像这个容器有自己的整个文件系统。这意味着你在系统中运行的每个容器都需要自己的文件系统副本。这岂不是要占用大量的磁盘空间，而且还要花费大量的时间让容器启动？不是的，因为每个容器都不需要它自己的文件系统副本!

容器和镜像使用写时复制机制来实现这一点。写时复制策略不是复制文件，而是将同一个数据实例分享给多个进程，并且只在一个进程需要修改或写入数据时进行复制。所有其他进程将继续使用原始数据。在运行中的容器中执行任何写操作之前，要修改的文件的副本被放在容器的可写层上。这就是发生_写_的地方。现在你知道为什么它被称为“写时复制”了么。

这种策略既优化了镜像磁盘空间的使用，也优化了容器启动时间的性能，并与 UnionFS 一起工作。

### Overlay 文件系统

Overlay 文件系统位于现有文件系统的顶部，结合了上层和下层的目录树，并将它们作为一个单一的目录来呈现。这些目录被称为_层_。下层保持不被修改。每一层只增加与下一层的差异（计算术语为 _diff_），这种统一的过程被称为 _union 挂载_。

最低的目录或镜像层被称为 _lowerdir_，上面的目录被称为 _upperdir_。最后的覆盖层或统一层被称为 _merged_。

![Layered file system][3]

图片 CC BY-SA opensource.com

常见的术语包括这些层的定义：

  * 基础层是你的文件系统的文件所在的地方。就容器镜像而言，这个层就是你的基础镜像。
  * Overlay 层通常被称为_容器层_，因为对运行中的容器所做的所有改变，如添加、删除或修改文件，都会写到这个可写层。对这一层所做的所有修改都存储在下一层，是基础层和 Diff 层的 _union_ 视图。
  * Diff 层包含了在 Overlay 层所作的所有修改。如果你写的东西已经在基础层了，那么 Overlay 文件系统就会把文件复制到 Diff层，并做出你想写的修改。这被称为_写时复制_。



# SnapShotters

容器可以使用层和图形驱动程序构建、管理和分发更改作为其容器文件系统的一部分。。但是使用图形驱动的工作真的很复杂，而且容易出错。SnapShotters 与图形驱动不同，因为它们不了解镜像或容器。

Snapshotters 的工作方式与 Git 非常相似，比如有树的概念，并跟踪每次提交对树的改变。一个_快照_代表一个文件系统状态。快照有父子关系，使用一组目录。可以在父级和其快照之间进行 _diff_，以创建一个层。

Snapshotter 提供了一个用于分配、快照和挂载抽象的分层文件系统的 API。

### 总结

你现在对什么是容器镜像以及它们的分层方法如何使容器可移植有了很好的认识。接下来，我将介绍容器的运行机制和内部结构。

* * *

_本文基于 [techbeatly][4] 的文章，经许可后改编。_

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/container-image

作者：[Nived V][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nivedv
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-containers.png?itok=d_4QhZxT (Shipping containers stacked)
[2]: https://opensource.com/sites/default/files/unionfs.png (UnionFS)
[3]: https://opensource.com/sites/default/files/rect1036.png (Layered file system)
[4]: https://medium.com/techbeatly/container-part-ii-images-4f2139194775
