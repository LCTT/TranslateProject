[#]: subject: "Build your own container on Linux"
[#]: via: "https://opensource.com/article/22/2/build-your-own-container-linux-buildah"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Build your own container on Linux
======
Buildah is an open source tool for building your own container from
scratch.
![Someone wearing a hardhat and carrying code ][1]

Containers are run in the [cloud][2]. That's because container technology allows websites and web apps to spawn fresh copies of themselves as demand increases. They're the reason hundreds of millions of people can use popular sites without those sites buckling under the pressure of global traffic. Containers are a Linux technology, meaning that they rely on code (specifically `cgroups` and namespaces) unique to the Linux kernel, so when you run a container, you're running Linux. Using container images from sites like quay.io and dockerhub.io, most people build new containers specific to their application or use case. But that makes some people wonder: If my container comes from a developer building on top of another developer's container, where do _those_ containers come from? Don't worry, it's not turtles all the way down. You can build a container from scratch, and there's a great open source tool called [Buildah][3] to help you do it.

### Container specifications

Containers grew out of projects like Linux containers (LXC) and Docker, and it's the [Open Container Initiative (OCI)][4] that maintains the formal specification of what a container is. A properly assembled container that meets the OCI definition runs on any OCI-compliant container engine, such as Podman, Docker, CRI-O, and so on.

### Installing Buildah

On Fedora and CentOS, you may have Buildah already installed.  If not, you can install it with your package manager:


```
`$ sudo dnf install buildah`
```

On Debian and Debian-based systems:


```
`$ sudo apt install buildah`
```

### Configuring Buildah 

Because Buildah creates containers, configuring your environment for it is the same as configuration for Podman. Whether or not you're using Podman, [configure your system for "rootless" podman][5] before continuing.

### Building a container out of nothing

To build a brand-new container, using nobody's prior work as your foundation, you use the special name `scratch` to tell Buildah that you want to create an empty container. The `scratch` designation is not an image name. It's your exemption from using an existing image to base your work on.


```
`$ buildah from scratch`
```

This new container, named `working-container` by default, features a small amount of metadata and literally nothing else, and it's secretly running in the background now. You can see it with the `containers` subcommand:


```


$ buildah containers
CONTAINER ID  BUILDER  ID  IMAGE NAME   CONTAINER NAME
dafc77921c0c     *         scratch      working-container

```

To run the container, you must first use the `unshare` subcommand (unless you're running Buildah as root):


```
`$ buildah unshare`
```

Confirm that your working container has no functionality (failure expected response in this instance):


```


$ buildah run working-container sh
ERRO[0000] container_linux.go:349: starting container process caused "exec: \"sh\": executable file not found in $PATH"

```

### Adding to your container

To add commands to your container, you must mount it first. Container images are stored in your `~/.local` directory by default:


```


$ buildah mount working-container
~/.local/share/containers/storage/overlay/b76940e6fe4efad7a0adca3b5399ee12055ddd733bbe273120dcae36a2e6c12f/merged

```

With the container mounted to your `~/.local` directory (or `/var/lib/containers/` in the case of running as root), you can add packages using your package manager. The `--releasever` must match the distribution you're running as you build the container.


```


[Fedora]$ sudo dnf install --installroot \
~/.local/share/containers/storage/overlay/b76940e6fe4efad7a0adca3b5399ee12055ddd733bbe273120dcae36a2e6c12f/merged \
\--releasever 33 \
bash coreutils \
\--setopt install_weak_deps=false -y

```

The exact method of adding packages depends on your distribution and the package manager it uses. For example, on my Slackware desktop, I use `installpkg`:


```


[Slack]$ installpkg --root ~/.local/share/containers/storage/overlay/b76940e6fe4efad7a0adca3b5399ee12055ddd733bbe273120dcae36a2e6c12f/merged \
/tmp/bash-5.0.17-x86_64-1_SMi.txz

```

Now you can run the container and try something simple, like launching a shell:


```


$ buildah run working-container bash
# bash --version
GNU bash, version 5.0.17(1)-release (x86_64-redhat-linux-gnu)
Copyright (C) 2019 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later &lt;[http://gnu.org/licenses/gpl.html\&gt;][6]

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

```

### Configuring your container

The `buildah config` subcommand gives you access to common attributes such as the default command you want your container to run when it's launched, set environment variables, set the default shell, define the author, architecture, and hostname, and much more. For instance, imagine that you have added a package containing a shell script called `motd.sh`, and you want it to run when the container is launched:


```


$ buildah config --author "Seth Kenlon" \
\--os "Slackware" --shell /bin/bash \
\--cmd /usr/bin/motd.sh working-container

```

### Distributing your container

When you're finished constructing your container, you can preserve it as an image using the `commit` subcommand.


```
`$ buildah commit working-container my_image`
```

### Build it with Buildah

Containers sometimes seem magical, but they're not magic. They're built from the ground up, and they're flexible enough that once an image exists, others can use it to build new containers and container images that fill a different niche. It's not necessary to start from scratch, but if you're curious how images start, or you want to try to create an image specific to your requirements, Buildah is the tool to use.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/build-your-own-container-linux-buildah

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/build_structure_tech_program_code_construction.png?itok=nVsiLuag (Someone wearing a hardhat and carrying code )
[2]: https://opensource.com/tags/cloud
[3]: http://buildah.io
[4]: https://www.opencontainers.org/
[5]: https://opensource.com/article/21/12/run-containers-without-sudo-podman
[6]: http://gnu.org/licenses/gpl.html\>
