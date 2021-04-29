[#]: subject: (Build smaller containers)
[#]: via: (https://fedoramagazine.org/build-smaller-containers/)
[#]: author: (Daniel Schier https://fedoramagazine.org/author/danielwtd/)
[#]: collector: (lujun9972)
[#]: translator: (ShuyRoy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Build smaller containers
======

![build smaller containers][1]

Otter image excerpted from photo by [Dele Oluwayomi][2] on [Unsplash][3]

Working with containers is a daily task for many users and developers. Container developers often need to (re)build container images frequently. If you develop containers, have you ever thought about reducing the image size? Smaller images have several benefits. They require less bandwidth to download and they save costs when run in cloud environments. Also, using smaller container images on Fedora [CoreOS][4], [IoT][5] and [Silverblue][6] improves overall system performance because those operating systems rely heavily on container workflows. This article will provide a few tips for reducing the size of container images.

### The tools

The host operating system in the following examples is Fedora Linux 33. The examples use [Podman][7] 3.1.0 and [Buildah][8] 1.2.0. Podman and Buildah are pre-installed in most Fedora Linux variants. If you don’t have Podman or Buildah installed, run the following command to install them.

```
$ sudo dnf install -y podman buildah
```

### The task

Begin with a basic example. Build a web container meeting the following requirements.

  * The container must be based on Fedora Linux
  * Use the Apache httpd web server
  * Include a custom website
  * The container should be relatively small



The following steps will also work on more complex images.

### The setup

First, create a project directory. This directory will include your website and container file.

```
$ mkdir smallerContainer
$ cd smallerContainer
$ mkdir files
$ touch files/index.html
```

Make a simple landing page. For this demonstration, you may copy the below HTML into the _index.html_ file.

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

Optionally, test the above _index.html_ file in your browser.

```
$ firefox files/index.html
```

Finally, create a container file. The file can be named either _Dockerfile_ or _Containerfile_.

```
$ touch Containerfile
```

You should now have a project directory with a file system layout similar to what is shown in the below diagram.

```
smallerContainer/
|- files/
|    |- index.html
|
|- Containerfile
```

### The build

Now make the image. Each of the below stages will add a layer of improvements to help reduce the size of the image. You will end up with a series of images, but only one _Containerfile_.

#### Stage 0: a baseline container image

Your new image will be very simple and it will only include the mandatory steps. Place the following text in _Containerfile_.

```
# Use Fedora 33 as base image
FROM registry.fedoraproject.org/fedora:33

# Install httpd
RUN dnf install -y httpd

# Copy the website
COPY files/* /var/www/html/

# Expose Port 80/tcp
EXPOSE 80

# Start httpd
CMD ["httpd", "-DFOREGROUND"]
```

In the above file there are some comments to indicate what is being done. More verbosely, the steps are:

  1. Create a build container with the base FROM registry.fedoraproject.org/fedora:33
  2. RUN the command: _dnf install -y httpd_
  3. COPY files relative to the _Containerfile_ to the container
  4. Set EXPOSE 80 to indicate which port is auto-publishable
  5. Set a CMD to indicate what should be run if one creates a container from this image



Run the below command to create a new image from the project directory.

```
$ podman image build -f Containerfile -t localhost/web-base
```

Use the following command to examine your image’s attributes. Note in particular the size of your image (467 MB).

```
$ podman image ls
REPOSITORY                         TAG     IMAGE ID      CREATED        SIZE
localhost/web-base                 latest  ac8c5ed73bb5  5 minutes ago  467 MB
registry.fedoraproject.org/fedora  33      9f2a56037643  3 months ago   182 MB
```

The example image shown above is currently occupying 467 MB of storage. The remaining stages should reduce the size of the image significantly. But first, verify that the image works as intended.

Enter the following command to start the container.

```
$ podman container run -d --name web-base -P localhost/web-base
```

Enter the following command to list your containers.

```
$ podman container ls
CONTAINER ID  IMAGE               COMMAND               CREATED        STATUS            PORTS                  NAMES
d24063487f9f  localhost/web-base  httpd -DFOREGROUN...  2 seconds ago  Up 3 seconds ago  0.0.0.0:46191->80/tcp  web-base
```

The container shown above is running and it is listening on port _46191_. Going to _localhost:46191_ from a web browser running on the host operating system should render your web page.

```
$ firefox localhost:46191
```

#### Stage 1: clear caches and remove other leftovers from the container

The first step one should always perform to optimize the size of their container image is “clean up”. This will ensure that leftovers from installations and packaging are removed. What exactly this process entails will vary depending on your container. For the above example you can just edit _Containerfile_ to include the following lines.

```
[...]
# Install httpd
RUN dnf install -y httpd && \
    dnf clean all -y
[...]
```

Build the modified _Containerfile_ to reduce the size of the image significantly (237 MB in this example).

```
$ podman image build -f Containerfile -t localhost/web-clean
$ podman image ls
REPOSITORY            TAG     IMAGE ID      CREATED        SIZE
localhost/web-clean   latest  f0f62aece028  6 seconds ago  237 MB
```

#### Stage 2: remove documentation and unneeded package dependencies

Many packages will pull in recommendations, weak dependencies and documentation when they are installed. These are often not needed in a container and can be excluded. The _dnf_ command has options to indicate that it should not include weak dependencies or documentation.

Edit _Containerfile_ again and add the options to exclude documentation and weak dependencies on the _dnf install_ line:

```
[...]
# Install httpd
RUN dnf install -y httpd --nodocs --setopt install_weak_deps=False && \
    dnf clean all -y
[...]
```

Build _Containerfile_ with the above modifications to achieve an even smaller image (231 MB).

```
$ podman image build -f Containerfile -t localhost/web-docs
$ podman image ls
REPOSITORY            TAG     IMAGE ID      CREATED        SIZE
localhost/web-docs    latest  8a76820cec2f  8 seconds ago  231 MB
```

#### Stage 3: use a smaller container base image

The prior stages, in combination, have reduced the size of the example image by half. But there is still one more thing that can be done to reduce the size of the image. The base image _registry.fedoraproject.org/fedora:33_ is meant for general purpose use. It provides a collection of packages that many people expect to be pre-installed in their Fedora Linux containers. The collection of packages provided in the general purpose Fedora Linux base image is often more extensive than needed, however. The Fedora Project also provides a _fedora-minimal_ base image for those who wish to start with only the essential packages and then add only what they need to achieve a smaller total image size.

Use _podman image search_ to search for the _fedora-minimal_ image as shown below.

```
$ podman image search fedora-minimal
INDEX               NAME   DESCRIPTION   STARS   OFFICIAL   AUTOMATED
fedoraproject.org   registry.fedoraproject.org/fedora-minimal         0
```

The _fedora-minimal_ base image excludes [DNF][9] in favor of the smaller [microDNF][10] which does not require Python. When _registry.fedoraproject.org/fedora:33_ is replaced with _registry.fedoraproject.org/fedora-minimal:33_, _dnf_ needs to be replaced with _microdnf_.

```
# Use Fedora minimal 33 as base image
FROM registry.fedoraproject.org/fedora-minimal:33

# Install httpd
RUN microdnf install -y httpd --nodocs --setopt install_weak_deps=0 && \
    microdnf clean all -y
[...]
```

Rebuild the image to see how much storage space has been recovered by using _fedora-minimal_ (169 MB).

```
$ podman image build -f Containerfile -t localhost/web-docs
$ podman image ls
REPOSITORY             TAG     IMAGE ID      CREATED        SIZE
localhost/web-minimal  latest  e1603bbb1097  7 minutes ago  169 MB
```

The initial image size was **467 MB**. Combining the methods detailed in each of the above stages has resulted in a final image size of **169 MB**. The final _total_ image size is smaller than the original _base_ image size of 182 MB!

### Building containers from scratch

The previous section used a container file and Podman to build a new image. There is one last thing to demonstrate — building a container from scratch using Buildah. Podman uses the same libraries to build containers as Buildah. But Buildah is considered a pure build tool. Podman is designed to work as a replacement for Docker.

When building from scratch using Buildah, the container is empty — there is _nothing_ in it. Everything needed must be installed or copied from outside the container. Fortunately, this is quite easy with Buildah. Below, a small Bash script is provided which will build the image from scratch. Instead of running the script, you can run each of the commands from the script individually in a terminal to better understand what is being done.

```
#!/usr/bin/env bash
set -o errexit

# Create a container
CONTAINER=$(buildah from scratch)

# Mount the container filesystem
MOUNTPOINT=$(buildah mount $CONTAINER)

# Install a basic filesystem and minimal set of packages, and nginx
dnf install -y --installroot $MOUNTPOINT  --releasever 33 glibc-minimal-langpack httpd --nodocs --setopt install_weak_deps=False

dnf clean all -y --installroot $MOUNTPOINT --releasever 33

# Cleanup
buildah unmount $CONTAINER

# Copy the website
buildah copy $CONTAINER 'files/*' '/var/www/html/'

# Expose Port 80/tcp
buildah config --port 80 $CONTAINER

# Start httpd
buildah config --cmd "httpd -DFOREGROUND" $CONTAINER

# Save the container to an image
buildah commit --squash $CONTAINER web-scratch
```

Alternatively, the image can be built by passing the above script to Buildah. Notice that root privileges are not required.

```
$ buildah unshare bash web-scratch.sh
$ podman image ls
REPOSITORY             TAG     IMAGE ID      CREATED        SIZE
localhost/web-scratch  latest  acca45fc9118  9 seconds ago  155 MB
```

The final image is only **155 MB**! Also, the [attack surface][11] has been reduced. Not even DNF (or microDNF) is installed in the final image.

### Conclusion

Building smaller container images has many advantages. Reducing the needed bandwidth, the disk footprint and attack surface will lead to better images overall. It is easy to reduce the footprint with just a few small changes. Many of the changes can be done without altering the functionality of the resulting image.

It is also possible to build very small images from scratch which will only hold the needed binaries and configuration files.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/build-smaller-containers/

作者：[Daniel Schier][a]
选题：[lujun9972][b]
译者：[ShuyRoy](https://github.com/Shuyroy)
校对：[校对者ID](https://github.com/校对者ID)

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
