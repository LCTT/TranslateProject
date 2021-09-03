[#]: subject: "What is a container image?"
[#]: via: "https://opensource.com/article/21/8/container-image"
[#]: author: "Nived V https://opensource.com/users/nivedv"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What is a container image?
======
A container image contains a packaged application, along with its
dependencies, and information on what processes it runs when launched.
![Shipping containers stacked][1]

Containers are a critical part of today's IT operations. A _container image_ contains a packaged application, along with its dependencies, and information on what processes it runs when launched.

You create container images by providing a set of specially formatted instructions, either as commits to a registry or as a Dockerfile. For example, this Dockerfile creates a container for a PHP web application:


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

Each instruction in this file adds a _layer_ to the container image. Each layer only adds the difference from the layer below it, and then, all these layers are stacked together to form a read-only container image.

### How does that work?

You need to know a few things about container images, and it's important to understand the concepts in this order:

  1. Union file systems
  2. Copy-on-Write
  3. Overlay File Systems
  4. Snapshotters



### Union File Systems (Aufs)

The Union File System (UnionFS) is built into the Linux kernel, and it allows contents from one file system to be merged with the contents of another, while keeping the "physical" content separate. The result is a unified file system, even though the data is actually structured in branches.

The idea here is that if you have multiple images with some identical data, instead of having this data copied over again, it's shared by using something called a _layer_.

![UnionFS][2]

Image CC BY-SA opensource.com

Each layer is a file system that can be shared across multiple containers, e.g., The httpd base layer is the official Apache image and can be used across any number of containers. Imagine the disk space we just saved since we are using the same base layer for all our containers.

These image layers are always read-only, but when we create a new container from this image, we add a thin writable layer on top of it. This writable layer is where you create/modify/delete or make other changes required for each container.

### Copy-on-write

When you start a container, it appears as if the container has an entire file system of its own. That means every container you run in the system needs its own copy of the file system. Wouldn't this take up a lot of disk space and also take a lot of time for the containers to boot? No—because every container does not need its own copy of the filesystem!

Containers and images use a copy-on-write mechanism to achieve this. Instead of copying files, the copy-on-write strategy shares the same instance of data to multiple processes and copies only when a process needs to modify or write data. All other processes would continue to use the original data. Before any write operation is performed in a running container, a copy of the file to be modified is placed on the writeable layer of the container. This is where the _write_ takes place. Now you know why it's called _copy-on-write_.

This strategy optimizes both image disk space usage and the performance of container start times and works in conjunction with UnionFS.

### Overlay File System

An overlay sits on top of an existing filesystem, combines an upper and lower directory tree, and presents them as a single directory. These directories are called _layers_. The lower layer remains unmodified. Each layer adds only the difference (the _diff_, in computing terminology) from the layer below it, and this unification process is referred to as a _union mount_.

The lowest directory or an Image layer is called _lowerdir_, and the upper directory is called _upperdir_. The final overlayed or unified layer is called _merged._

![Layered file system][3]

Image CC BY-SA opensource.com

Common terminology consists of these layer definitions:

  * Base layer is where the files of your filesystem are located. In terms of container images, this layer would be your base image.
  * Overlay layer is often called the _container layer_, as all the changes that are made to a running container, as adding, deleting, or modifying files, are written to this writable layer. All changes made to this layer are stored in the next layer, and is a _union_ view of the Base and Diff layers.
  * Diff layer contains all changes made in the Overlay layer. If you write something that's already in the Base layer, then the overlay file system copies the file to the Diff layer and makes the modifications you intended to write. This is called a _copy-on-write_.



# Snapshotters

Containers can build, manage, and distribute changes as a part of their container filesystem using layers and graph drivers. But working with graph drivers is really complicated and is error-prone. SnapShotters are different from graph drivers, as they have no knowledge of images or containers.

Snapshotters work very similar to Git, such as the concept of having trees, and tracking changes to trees for each commit. A _snapshot_ represents a filesystem state. Snapshots have parent-child relationships using a set of directories. A _diff can_ be taken between a parent and its snapshot to create a layer.

The Snapshotter provides an API for allocating, snapshotting, and mounting abstract, layered file systems.

### Wrap up

You now have a good sense of what container images are and how their layered approach makes containers portable. Next up, I'll cover container runtimes and internals.

* * *

_This article is based on a [techbeatly][4] article and has been adapted with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/container-image

作者：[Nived V][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nivedv
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-containers.png?itok=d_4QhZxT (Shipping containers stacked)
[2]: https://opensource.com/sites/default/files/unionfs.png (UnionFS)
[3]: https://opensource.com/sites/default/files/rect1036.png (Layered file system)
[4]: https://medium.com/techbeatly/container-part-ii-images-4f2139194775
