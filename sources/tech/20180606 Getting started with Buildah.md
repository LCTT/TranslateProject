pinewall translating

Getting started with Buildah
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/blocks_building.png?itok=eMOT-ire)

[Buildah][1] is a command-line tool for building [Open Container Initiative][2]-compatible (that means Docker- and Kubernetes-compatible, too) images quickly and easily. It can act as a drop-in replacement for the Docker daemon’s `docker build` command (i.e., building images with a traditional Dockerfile) but is flexible enough to allow you to build images with whatever tools you prefer to use. Buildah is easy to incorporate into scripts and build pipelines, and best of all, it doesn’t require a running container daemon to build its image.

### A drop-in replacement for docker build

You can get started with Buildah immediately, dropping it into place where images are currently built using a Dockerfile and `docker build`. Buildah’s `build-using-dockerfile`, or `bud` argument makes it behave just like `docker build` does, so it's easy to incorporate into existing scripts or build pipelines.

As with [previous articles I’ve written about Buildah][3], I like to use the example of installing "GNU Hello" from source. Consider this Dockerfile:
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

Buildah can create an image from this Dockerfile as easily as `buildah bud -t hello .`, replacing `docker build -t hello .`:
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



<snip>

```

Once the build is complete, you can see the new image with the `buildah images` command:
```
[chris@krang] $ sudo buildah images

IMAGE ID        IMAGE NAME                              CREATED AT              SIZE

30190780b56e    docker.io/library/fedora:28             Mar 7, 2018 16:53       247 MB

6d54bef73e63    docker.io/library/hello:latest    May 3, 2018 15:24     391.8 MB

```

The new image, tagged `hello:latest`, can be pushed to a remote image registry or run using [CRI-O][4] or other Kubernetes CRI-compatible runtimes, or pushed to a remote registry. If you’re testing it as a replacement for Docker build, you will probably want to copy the image to the docker daemon’s local image storage so it can be run by Docker. This is easily accomplished with the `buildah push` command:
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

### A few differences

Unlike Docker build, Buildah doesn’t commit changes to a layer automatically for every instruction in the Dockerfile—it builds everything from top to bottom, every time. On the positive side, this means non-cached builds (for example, those you would do with automation or build pipelines) end up being somewhat faster than their Docker build counterparts, especially if there are a lot of instructions. This is great for getting new changes into production quickly from an automated deployment or continuous delivery standpoint.

Practically speaking, however, the lack of caching may not be quite as useful for image development, where caching layers can save significant time when doing builds over and over again. This applies only to the `build-using-dockerfile` command, however. When using Buildah native commands, as we’ll see below, you can choose when to commit your changes to disk, allowing for more flexible development.

### Buildah native commands

Where Buildah _really_ shines is in its native commands, which you can use to interact with container builds. Rather than using `build-using-dockerfile/bud` for each build, Buildah has commands to actually interact with the temporary container created during the build process. (Docker uses temporary, or _intermediate_ containers, too, but you don’t really interact with them while the image is being built.)

Using the "GNU Hello" example again, consider this image build using Buildah commands:
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

Buildah run $container dnf clean all

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

One thing that should be immediately obvious is the fact that this is a Bash script rather than a Dockerfile. Using Buildah’s native commands makes it easy to script, in whatever language or automation context you like to use. This could be a makefile, a Python script, or whatever tools you like to use.

So what is going on here? The first Buildah command `container=$(buildah from fedora:28)`, creates a running container from the fedora:28 image, and stores the container name (the output of the command) as a variable for later use. All the rest of the Buildah commands use the `$container` variable to say what container to act upon. For the most part those commands are self-explanatory: `buildah copy` moves a file into the container, `buildah run` executes a command in the container. It is easy to match them to their Dockerfile equivalents.

The final command, `buildah commit`, commits the container to an image on disk. When building images with Buildah commands rather than from a Dockerfile, you can use the `commit` command to decide when to save your changes. In the example above, all of the changes are committed at once, but intermediate commits could be included too, allowing you to choose cache points from which to start. (For example, it would be particularly useful to cache to disk after the `dnf install`, as that can take a long time, but is also reliably the same each time.)

### Mountpoints, install directories, and chroots

Another useful Buildah command opens the door to a lot of flexibility in building images. `buildah mount` mounts the root directory of a container to a mountpoint on your host. For example:
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

This is great because now you can interact with the mountpoint to make changes to your container image. This allows you to use tools on your host to build and install software, rather than including those tools in the container image itself. For example, in the Bash script above, we needed to install the tar, Gzip, GCC, and make packages to compile "GNU Hello" inside the container. Using a mountpoint, we can build an image with the same software, but the downloaded tarball and tar, Gzip, etc., RPMs are all on the host machine rather than in the container and resulting image:
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

Take note of a few things in the script above:

  1. The `curl` command downloads the tarball to the host, not the image

  2. The `tar` command (running from the host itself) extracts the source code from the tarball into `/opt` inside the container.

  3. `Configure`, `make`, and `make install` are all running from a directory inside the mountpoint, mounted to the host rather than running inside the container itself.

  4. The `chroot` command here is used to change root into the mountpoint itself and test that "hello" is working, similar to the `buildah run` command used in the previous example.




This script is shorter, it uses tools most Linux folks are already familiar with, and the resulting image is smaller (no tarball, no extra packages, etc). You could even use the package manager for the host system to install software into the container. For example, let’s say you wanted to install [NGINX][5] into the container with GNU Hello (for whatever reason):
```
[chris@krang] $ mountpoint=$(sudo buildah mount ${container})

[chris@krang] $ sudo dnf install nginx --installroot $mountpoint

[chris@krang] $ sudo chroot $mountpoint nginx -v

nginx version: nginx/1.12.1

```

In the example above, DNF is used with the `--installroot` flag to install NGINX into the container, which can be verified with chroot.

### Try it out!

Buildah is a lightweight and flexible way to create container images without running a full Docker daemon on your host. In addition to offering out-of-the-box support for building from Dockerfiles, Buildah is easy to use with scripts or build tools of your choice and can help build container images using existing tools on the build host. The result is leaner images that use less bandwidth to ship around, require less storage space, and have a smaller surface area for potential attackers. Give it a try!

**[See our related story,[Creating small containers with Buildah][6]]**

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/getting-started-buildah

作者：[Chris Collins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/clcollins
[1]:https://github.com/projectatomic/buildah
[2]:https://www.opencontainers.org/
[3]:http://chris.collins.is/2017/08/17/buildah-a-new-way-to-build-container-images/
[4]:http://cri-o.io/
[5]:https://www.nginx.com/
[6]:https://opensource.com/article/18/5/containers-buildah
