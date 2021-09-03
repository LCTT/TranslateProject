[#]: subject: "What are container runtimes?"
[#]: via: "https://opensource.com/article/21/9/container-runtimes"
[#]: author: "Nived V https://opensource.com/users/nivedv"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What are container runtimes?
======
Take a deep dive into container runtimes so you can understand how
container environments are built.
![Ships at sea on the web][1]

In my examination of [container images][2], I discussed container fundamentals, but now it's time to delve deeper into container runtimes so you can understand how container environments are built. The information in this article is in part extracted from the [official documentation][3] of the Open Container Initiative (OCI), the open standard for containers, so this information is relevant regardless of your container engine.

### Container runtimes

So what really happens in the backend when you run a command like `podman run` or `docker run` command? Here is a step-by-step overview for you:

  1. The image is pulled from an image registry if it not available locally
  2. The image is extracted onto a copy-on-write filesystem, and all the container layers overlay each other to create a merged filesystem
  3. A container mount point is prepared
  4. Metadata is set from the container image, including settings like overriding CMD, ENTRYPOINT from user inputs, setting up SECCOMP rules, etc., to ensure container runs as expected
  5. The kernel is alerted to assign some sort of isolation, such as process, networking, and filesystem, to this container (namespaces)
  6. The kernel is also alerted to assign some resource limits like CPU or memory limits to this container (cgroups)
  7. A system call (syscall) is passed to the kernel to start the container
  8. SELinux/AppArmor is set up



Container runtimes take care of all of the above. When we think about container runtimes, the things that come to mind are probably runc, lxc, containerd, rkt, cri-o, and so on. Well, you are not wrong. These are container engines and container runtimes, and each is built for different situations.

_Container runtimes_ focus more on running containers, setting up namespace and cgroups for containers, and are also called lower-level container runtimes. Higher-level container runtimes or container engines focus on formats, unpacking, management, and image-sharing. They also provide APIs for developers.

### Open Container Initiative (OCI)

The Open Container Initiative (OCI) is a Linux Foundation project. Its purpose is to design certain open standards or a structure around how to work with container runtimes and container image formats. It was established in June 2015 by Docker, rkt, CoreOS, and other industry leaders.

It does this using two specifications:

#### 1\. Image Specification (image-spec)

The goal of this specification is to enable the creation of interoperable tools for building, transporting, and preparing a container image to run.

The high-level components of the spec include:

  * [Image Manifest][4] — a document describing the elements that make up a container image
  * [Image Index][5] — an annotated index of image manifests
  * [Image Layout][6] — a filesystem layout representing the contents of an image
  * [Filesystem Layer][7] — a changeset that describes a container’s filesystem
  * [Image Configuration][8] — a document determining layer ordering and configuration of the image suitable for translation into a [runtime bundle][9]
  * [Conversion][10] — a document explaining how this translation should occur
  * [Descriptor][11] — a reference that describes the type, metadata, and content address of referenced content



#### 2\. Runtime specification (runtime-spec)

This specification aims to define the configuration, execution environment, and lifecycle of a container. The config.json file provides the container configuration for all supported platforms and details the field that enables the creation of a container. The execution environment is detailed along with the common actions defined for a container’s lifecycle to ensure that applications running inside a container have a consistent environment between runtimes.

The Linux container specification uses various kernel features, including namespaces, cgroups, capabilities, LSM, and filesystem jails to fulfill the spec.

### Now you know

Container runtimes are managed by the OCI specifications to provide consistency and interoperability. Many people use containers without the need to understand how they work, but understanding containers is a valuable advantage when you need to troubleshoot or optimize how you use them.

* * *

_This article is based on a [techbeatly][12] article and has been adapted with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/container-runtimes

作者：[Nived V][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nivedv
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/kubernetes_containers_ship_lead.png?itok=9EUnSwci (Ships at sea on the web)
[2]: https://opensource.com/article/21/8/container-fundamentals-2
[3]: https://github.com/opencontainers
[4]: https://github.com/opencontainers/image-spec/blob/master/manifest.md
[5]: https://github.com/opencontainers/image-spec/blob/master/image-index.md
[6]: https://github.com/opencontainers/image-spec/blob/master/image-layout.md
[7]: https://github.com/opencontainers/image-spec/blob/master/layer.md
[8]: https://github.com/opencontainers/image-spec/blob/master/config.md
[9]: https://github.com/opencontainers/runtime-spec
[10]: https://github.com/opencontainers/image-spec/blob/master/conversion.md
[11]: https://github.com/opencontainers/image-spec/blob/master/descriptor.md
[12]: https://medium.com/techbeatly/container-runtimes-deep-dive-77eb0e511939
