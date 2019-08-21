[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How rootless Buildah works: Building containers in unprivileged environments)
[#]: via: (https://opensource.com/article/19/3/tips-tricks-rootless-buildah)
[#]: author: (Daniel J Walsh https://opensource.com/users/rhatdan)

How rootless Buildah works: Building containers in unprivileged environments
======
Buildah is a tool and library for building Open Container Initiative (OCI) container images.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_2015-1-osdc-lead.png?itok=VEB4zwza)

In previous articles, including [How does rootless Podman work?][1], I talked about [Podman][2], a tool that enables users to manage pods, containers, and container images.

[Buildah][3] is a tool and library for building Open Container Initiative ([OCI][4]) container images that is complementary to Podman. (Both projects are maintained by the [containers][5] organization, of which I'm a member.) In this article, I will talk about rootless Buildah, including the differences between it and Podman.

Our goal with Buildah was to build a low-level tool that could be used either directly or vendored into other tools to build container images.

### Why Buildah?

Here is how I describe a container image: It is basically a rootfs directory that contains the code needed to run your container. This directory is called a rootfs because it usually looks like **/ (root)** on a Linux machine, meaning you are likely to find directories in a rootfs like **/etc** , **/usr** , **/bin** , etc.

The second part of a container image is a JSON file that describes the contents of the rootfs. It contains fields like the command to run the container, the entrypoint, the environment variables required to run the container, the working directory of the container, etc. Basically this JSON file allows the developer of the container image to describe how the container image is expected to be used. The fields in this JSON file have been standardized in the [OCI Image Format specification][6]

The rootfs and the JSON file then get tar'd together to create an image bundle that is stored in a container registry. To create a layered image, you install more software into the rootfs and modify the JSON file. Then you tar up the differences of the new and the old rootfs and store that in another image tarball. The second JSON file refers back to the first JSON file via a checksum.

Many years ago, Docker introduced Dockerfile, a simplified scripting language for building container images. Dockerfile was great and really took off, but it has many shortcomings that users have complained about. For example:

  * Dockerfile encourages the inclusion of tools used to build containers inside the container image. Container images do not need to include yum/dnf/apt, but most contain one of them and all their dependencies.

  * Each line causes a layer to be created. Because of this, secrets can mistakenly get added to container images. If you create a secret in one line of the Dockerfile and delete it in the next, the secret is still in the image.




One of my biggest complaints about the "container revolution" is that six years since it started, the only way to build a container image was still with Dockerfiles. Lots of tools other than **docker build** have appeared besides Buildah, but most still deal only with Dockerfile. So users continue hacking around the problems with Dockerfile.

Note that [umoci][7] is an alternative to **docker build** that allows you to build container images without Dockerfile.

Our goal with Buildah was to build a simple tool that could just create a rootfs directory on disk and allow other tools to populate the directory, then create the JSON file. Finally, Buildah would create the OCI image and push it to a container registry where it could be used by any container engine, like [Docker][8], Podman, [CRI-O][9], or another Buildah.

Buildah also supports Dockerfile, since we know the bulk of people building containers have created Dockerfiles.

### Using Buildah directly

Lots of people use Buildah directly. A cool feature of Buildah is that you can script up the container build directly in Bash.

The example below creates a Bash script called **myapp.sh** , which uses Buildah to pull down the Fedora image, and then uses **dnf** and **make** on a machine to install software into the container image rootfs, **$mnt**. It then adds some fields to the JSON file using **buildah config** and commits the container to a container image **myapp**. Finally, it pushes the container image to a container registry, **quay.io**. (It could push it to any container registry.) Now this OCI image can be used by any container engine or Kubernetes.

```
cat myapp.sh
#!/bin/sh
ctr=$(buildah from fedora)
mnt=($buildah mount $ctr)
dnf -y install --installroot $mnt httpd
make install DESTDIR=$mnt myapp
rm -rf $mnt/var/cache $mnt/var/log/*
buildah config --command /usr/bin/myapp -env foo=bar --working-dir=/root $ctr
buildah commit $ctr myapp
buildah push myapp http://quay.io/username/myapp
```

To create really small images, you could replace **fedora** in the script above with **scratch** , and Buildah will build a container image that only has the requirements for the **httpd** package inside the container image. No need for Python or DNF.

### Podman's relationship to Buildah

With Buildah, we have a low-level tool for building container images. Buildah also provides a library for other tools to build container images. Podman was designed to replace the Docker command line interface (CLI). One of the Docker CLI commands is **docker build**. We needed to have **podman build** to support building container images with Dockerfiles. Podman vendored in the Buildah library to allow it to do **podman build**. Any time you do a **podman build** , you are executing Buildah code to build your container images. If you are only going to use Dockerfiles to build container images, we recommend you only use Podman; there's no need for Buildah at all.

### Other tools using the Buildah library

Podman is not the only tool to take advantage of the Buildah library. [OpenShift 4 Source-to-Image][10] (S2I) will also use Buildah to build container images. OpenShift S2I allows developers using OpenShift to use Git commands to modify source code; when they push the changes for their source code to the Git repository, OpenShift kicks off a job to compile the source changes and create a container image. It also uses Buildah under the covers to build this image.

[Ansible-Bender][11] is a new project to build container images via an Ansible playbook. For those familiar with Ansible, Ansible-Bender makes it easy to describe the contents of the container image and then uses Buildah to package up the container image and send it to a container registry.

We would love to see other tools and languages for describing and building a container image and would welcome others use Buildah to do the conversion.

### Problems with rootless

Buildah works fine in rootless mode. It uses user namespace the same way Podman does. If you execute

```
$ buildah bud --tag myapp -f Dockerfile .
$ buildah push myapp http://quay.io/username/myapp
```

in your home directory, everything works great.

However, if you execute the script described above, it will fail!

The problem is that, when running the **buildah mount** command in rootless mode, the **buildah** command must put itself inside the user namespace and create a new mount namespace. Rootless users are not allowed to mount filesystems when not running in a user namespace.

When the Buildah executable exits, the user namespace and mount namespace disappear, so the mount point no longer exists. This means the commands after **buildah mount** that attempt to write to **$mnt** will fail since **$mnt** is no longer mounted.

How can we make the script work in rootless mode?

#### Buildah unshare

Buildah has a special command, **buildah unshare** , that allows you to enter the user namespace. If you execute it with no commands, it will launch a shell in the user namespace, and your shell will seem like it is running as root and all the contents of the home directory will seem like they are owned by root. If you look at the owner or files in **/usr** , it will list them as owned by **nfsnobody** (or nobody). This is because your user ID (UID) is now root inside the user namespace and real root (UID=0) is not mapped into the user namespace. The kernel represents all files owned by UIDs not mapped into the user namespace as the NFSNOBODY user. When you exit the shell, you will exit the user namespace, you will be back to your normal UID, and the home directory will be owned by your UID again.

If you want to execute the **myapp.sh** command defined above, you can execute **buildah unshare myapp.sh** and the script will now run correctly.

#### Conclusion

Building and running containers in unprivileged environments is now possible and quite useable. There is little reason for developers to develop containers as root.

If you want to use a traditional container engine, and use Dockerfile's for builds, then you should probably just use Podman. But if you want to experiment with building container images in new ways without using Dockerfile, then you should really take a look at Buildah.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/tips-tricks-rootless-buildah

作者：[Daniel J Walsh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rhatdan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/19/2/how-does-rootless-podman-work
[2]: https://podman.io/
[3]: https://github.com/containers/buildah
[4]: https://www.opencontainers.org/
[5]: https://github.com/containers
[6]: https://github.com/opencontainers/image-spec
[7]: https://github.com/openSUSE/umoci
[8]: https://github.com/docker
[9]: https://cri-o.io/
[10]: https://github.com/openshift/source-to-image
[11]: https://github.com/TomasTomecek/ansible-bender
