translating---geekpi

How to build container images with Buildah
======

![](https://fedoramagazine.org/wp-content/uploads/2018/04/buildah-816x345.png)

Project Atomic, through their efforts on the Open Container Initiative (OCI), have created a great tool called [Buildah][1]. Buildah helps with creating, building and updating container images supporting Docker formatted images as well as OCI compliant images.

Buildah handles building container images without the need to have a full container runtime or daemon installed. This particularly shines for setting up a continuous integration and continuous delivery pipeline for building containers.

Buildah makes the container’s filesystem directly available to the build host. Meaning that the build tooling is available on the host and not needed in the container image, keeping the build faster and the image smaller and safer. There are Buildah packages for CentOS, Fedora, and Debian.

### Installing Buildah

Since Fedora 26 Buildah can be installed using dnf.
```
$ sudo dnf install buildah -y

```

The current version of buildah is 0.16, which can be displayed by the following command.
```
$ buildah --version

```

### Basic commands

The first step needed to build a container image is to get a base image, this is done by the FROM statement in a Dockerfile. Buildah does handle this in a similar way.
```
$ sudo buildah from fedora

```

This command pulls the Fedora based image and stores it on the host. It is possible to inspect the images available on the host, by running the following.
```
$ sudo buildah images
IMAGE ID IMAGE NAME CREATED AT SIZE
9110ae7f579f docker.io/library/fedora:latest Mar 7, 2018 20:51 234.7 MB

```

After pulling the base image, a running container instance of this image is available, this is a “working-container”.

The following command displays the running containers.
```
$ sudo buildah containers
CONTAINER ID BUILDER IMAGE ID IMAGE NAME
CONTAINER NAME
6112db586ab9 * 9110ae7f579f docker.io/library/fedora:latest fedora-working-container

```

Buildah also provides a very useful command to stop and remove all the containers that are currently running.
```
$ sudo buildah rm --all

```

The full list of command is available using the –help option.
```
$ buildah --help

```

### Building an Apache web server container image

Let’s see how to use Buildah to install an Apache web server on a Fedora base image, then copy a custom index.html to be served by the server.

First let’s create the custom index.html.
```
$ echo "Hello Fedora Magazine !!!" > index.html

```

Then install the httpd package inside the running container.
```
$ sudo buildah from fedora
$ sudo buildah run fedora-working-container dnf install httpd -y

```

Let’s copy index.html to /var/www/html/.
```
$ sudo buildah copy fedora-working-container index.html /var/www/html/index.html

```

Then configure the container entrypoint to start httpd.
```
$ sudo buildah config --entrypoint "/usr/sbin/httpd -DFOREGROUND" fedora-working-container

```

Now to make the “working-container” available, the commit command saves the container to an image.
```
$ sudo buildah commit fedora-working-container hello-fedora-magazine

```

The hello-fedora-magazine image is now available, and can be pushed to a registry to be used.
```
$ sudo buildah images
IMAGE ID IMAGE NAME CREATED
AT SIZE
9110ae7f579f docker.io/library/fedora:latest
Mar 7, 2018 22:51 234.7 MB
49bd5ec5be71 docker.io/library/hello-fedora-magazine:latest
Apr 27, 2018 11:01 427.7 MB

```

It is also possible to use Buildah to test this image by running the following steps.
```
$ sudo buildah from --name=hello-magazine docker.io/library/hello-fedora-magazine

$ sudo buildah run hello-magazine

```

Accessing <http://localhost> will display “Hello Fedora Magazine !!!“


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/daemon-less-container-management-buildah/

作者：[Ashutosh Sudhakar Bhakare][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/ashutoshbhakare/
[1]:https://github.com/projectatomic/buildah
