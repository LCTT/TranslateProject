[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to build Fedora container images)
[#]: via: (https://fedoramagazine.org/how-to-build-fedora-container-images/)
[#]: author: (Clément Verna https://fedoramagazine.org/author/cverna/)

How to build Fedora container images
======

![][1]

With the rise of containers and container technology, all major Linux distributions nowadays provide a container base image. This article presents how the Fedora project builds its base image. It also shows you how to use it to create a layered image.

### Base and layered images

Before we look at how the Fedora container base image is built, let’s define a base image and a layered image. A simple way to define a base image is an image that has no parent layer. But what does that concretely mean? It means a base image usually contains only the root file system (_rootfs_) of an operating system. The base image generally provides the tools needed to install software in order to create layered images.

A layered image adds a collections of layers on top of the base image in order to install, configure, and run an application. Layered images reference base images in a _Dockerfile_ using the _FROM_ instruction:

```
FROM fedora:latest
```

### How to build a base image

Fedora has a full suite of tools available to build container images. [This includes][2] _[podman][2]_, which does not require running as the root user.

#### Building a rootfs

A base image comprises mainly a [tarball][3]. This tarball contains a rootfs. There are different ways to build this rootfs. The Fedora project uses the [kickstart][4] installation method coupled with [imagefactory][5] software to create these tarballs.

The kickstart file used during the creation of the Fedora base image is available in Fedora’s build system [Koji][6]. The _[Fedora-Container-Base][7]_ package regroups all the base image builds. If you select a build, it gives you access to all the related artifacts, including the kickstart files. Looking at an [example][8], the _%packages_ section at the end of the file defines all the packages to install. This is how you make software available in the base image.

#### Using a rootfs to build a base image

Building a base image is easy, once a rootfs is available. It requires only a Dockerfile with the following instructions:

```
FROM scratch
ADD layer.tar /
CMD ["/bin/bash"]
```

The important part here is the _FROM scratch_ instruction, which is creating an empty image. The following instructions then add the rootfs to the image, and set the default command to be executed when the image is run.

Let’s build a base image using a Fedora rootfs built in Koji:

```
$ curl -o fedora-rootfs.tar.xz https://kojipkgs.fedoraproject.org/packages/Fedora-Container-Base/Rawhide/20190902.n.0/images/Fedora-Container-Base-Rawhide-20190902.n.0.x86_64.tar.xz
$ tar -xJvf fedora-rootfs.tar.xz 51c14619f9dfd8bf109ab021b3113ac598aec88870219ff457ba07bc29f5e6a2/layer.tar
$ mv 51c14619f9dfd8bf109ab021b3113ac598aec88870219ff457ba07bc29f5e6a2/layer.tar layer.tar
$ printf "FROM scratch\nADD layer.tar /\nCMD [\"/bin/bash\"]" > Dockerfile
$ podman build -t my-fedora .
$ podman run -it --rm my-fedora cat /etc/os-release
```

The _layer.tar_ file which contains the rootfs needs to be extracted from the downloaded archive. This is only needed because Fedora generates images that are ready to be consumed by a container run-time.

So using Fedora’s generated image, it’s even easier to get a base image. Let’s see how that works:

```
$ curl -O https://kojipkgs.fedoraproject.org/packages/Fedora-Container-Base/Rawhide/20190902.n.0/images/Fedora-Container-Base-Rawhide-20190902.n.0.x86_64.tar.xz
$ podman load --input Fedora-Container-Base-Rawhide-20190902.n.0.x86_64.tar.xz
$ podman run -it --rm localhost/fedora-container-base-rawhide-20190902.n.0.x86_64:latest cat /etc/os-release
```

### Building a layered image

To build a layered image that uses the Fedora base image, you only need to specify _fedora_ in the _FROM_ line instruction:

```
FROM fedora:latest
```

The _latest_ tag references the latest active Fedora release (Fedora 30 at the time of writing). But it is possible to get other versions using the image tag. For example, _FROM fedora:31_ will use the Fedora 31 base image.

Fedora supports building and releasing software as containers. This means you can maintain a Dockerfile to make your software available to others. For more information about becoming a container image maintainer in Fedora, check out the [Fedora Containers Guidelines][9].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-build-fedora-container-images/

作者：[Clément Verna][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/cverna/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/08/fedoracontainers-816x345.jpg
[2]: https://fedoramagazine.org/running-containers-with-podman/
[3]: https://en.wikipedia.org/wiki/Tar_(computing)
[4]: https://en.wikipedia.org/wiki/Kickstart_(Linux)
[5]: http://imgfac.org/
[6]: https://koji.fedoraproject.org/koji/
[7]: https://koji.fedoraproject.org/koji/packageinfo?packageID=26387
[8]: https://kojipkgs.fedoraproject.org//packages/Fedora-Container-Base/30/20190902.0/images/koji-f30-build-37420478-base.ks
[9]: https://docs.fedoraproject.org/en-US/containers/guidelines/guidelines/
