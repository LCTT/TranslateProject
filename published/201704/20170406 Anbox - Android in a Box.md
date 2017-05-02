Anbox：容器中的 Android
===============

Anbox 以基于容器的方式，在像 Ubuntu 这样的常规的 GNU Linux 系统上启动一个完整的 Android 系统。

### 概述

Anbox 使用 Linux 命名空间（user、pid、uts、net、mount、ipc）来在容器中运行完整的 Android 系统，并在任何基于 GNU Linux 平台上提供 Android 应用。

容器内的 Android 无法直接访问任何硬件。所有硬件访问都通过主机上的 anbox 守护进程进行。我们重用基于 QEMU 的模拟器实现的 Android 中的 GL、ES 加速渲染。容器内的 Android 系统使用不同的管道与主机系统通信，并通过它发送所有硬件访问命令。

有关更多详细信息，请参考下文档：

 * [Android 硬件 OpenGL ES 仿真设计概述](https://android.googlesource.com/platform/external/qemu/+/emu-master-dev/android/android-emugl/DESIGN)
 * [Android QEMU 快速管道](https://android.googlesource.com/platform/external/qemu/+/emu-master-dev/android/docs/ANDROID-QEMU-PIPE.TXT)
 * [Android 的 “qemud” 复用守护进程](https://android.googlesource.com/platform/external/qemu/+/emu-master-dev/android/docs/ANDROID-QEMUD.TXT)
 * [Android qemud 服务](https://android.googlesource.com/platform/external/qemu/+/emu-master-dev/android/docs/ANDROID-QEMUD-SERVICES.TXT)

Anbox 目前适合桌面使用，但也用在移动操作系统上，如 Ubuntu Touch、Sailfish OS 或 Lune OS。然而，由于 Android 程序的映射目前只针对桌面环境，因此还需要额外的工作来支持其他的用户界面。

Android 运行时环境带有一个基于 [Android 开源项目](https://source.android.com/)镜像的最小自定义 Android 系统。所使用的镜像目前基于 Android 7.1.1。

### 安装

目前，安装过程包括一些添加额外组件到系统的步骤。包括：

* 启用用于 binder 和 ashmen 的非发行的树外内核模块。
* 使用 udev 规则为 /dev/binder 和 /dev/ashmem 设置正确权限。
* 能够启动 Anbox 会话管理器作为用户会话的一个启动任务。

为了使这个过程尽可能简单，我们将必要的步骤绑定在一个 snap（见 https://snapcraft.io） 中，称之为 “anbox-installer”。这个安装程序会执行所有必要的步骤。你可以在所有支持 snap 的系统运行下面的命令安装它。

```
$ snap install --classic anbox-installer
```

另外你可以通过下面的命令下载安装脚本。

```
$ wget https://raw.githubusercontent.com/anbox/anbox-installer/master/installer.sh -O anbox-installer
```

请注意，我们还不支持除所有 Linux 发行版。请查看下面的章节了解支持的发行版。

运行下面的命令进行安装。

```
$ anbox-installer
```

它会引导你完成安装过程。

**注意：** Anbox 目前处于 **pre-alpha 开发状态**。不要指望它具有生产环境你需要的所有功能。你肯定会遇到错误和崩溃。如果你遇到了，请不要犹豫并报告它们！

**注意：** Anbox snap 目前 **完全没有约束**，因此它只能从边缘渠道获取。正确的约束是我们想要在未来实现的，但由于 Anbox 的性质和复杂性，这不是一个简单的任务。

### 已支持的 Linux 发行版

目前我们官方支持下面的 Linux 发行版：

 * Ubuntu 16.04 (xenial)

未测试但可能支持的：

 * Ubuntu 14.04 (trusty)
 * Ubuntu 16.10 (yakkety)
 * Ubuntu 17.04 (zesty)

### 安装并运行 Android 程序

#### 从源码构建

要构建 Anbox 运行时不需要特别了解什么，我们使用 cmake 作为构建系统。你的主机系统中应已有下面这些构建依赖：

 * libdbus
 * google-mock
 * google-test
 * libboost
 * libboost-filesystem
 * libboost-log
 * libboost-iostreams
 * libboost-program-options
 * libboost-system
 * libboost-test
 * libboost-thread
 * libcap
 * libdbus-cpp
 * mesa (libegl1, libgles2)
 * glib-2.0
 * libsdl2
 * libprotobuf
 * protobuf-compiler
 * lxc

在 Ubuntu 系统中你可以用下面的命令安装所有的依赖：

```
$ sudo apt install build-essential cmake cmake-data debhelper dbus google-mock \
    libboost-dev libboost-filesystem-dev libboost-log-dev libboost-iostreams-dev \
    libboost-program-options-dev libboost-system-dev libboost-test-dev \
    libboost-thread-dev libcap-dev libdbus-1-dev libdbus-cpp-dev libegl1-mesa-dev \
    libgles2-mesa-dev libglib2.0-dev libglm-dev libgtest-dev liblxc1 \
    libproperties-cpp-dev libprotobuf-dev libsdl2-dev lxc-dev pkg-config \
    protobuf-compiler
```

之后用下面的命令构建 Anbox：

```
$ mkdir build
$ cd build
$ cmake ..
$ make
```

一个简单的命令会将必要的二进制安装到你的系统中，如下。

```
$ make install
```

如果你想要构建 anbox snap，你可以按照下面的步骤：

```
$ mkdir android-images
$ cp /path/to/android.img android-images/android.img
$ snapcraft
```

结果会有一个 .snap 文件，你可以在支持 snap 的系统上安装。

```
$ snap install --dangerous --devmode anbox_1_amd64.snap
```

#### 运行 Anbox

要从本地构建运行 Anbox ，你需要了解更多一点。请参考[“运行时步骤”](docs/runtime-setup.md)文档。

### 文档

在项目源代码的子目录下，你可以找到额外的关于 Anbox 的文档。

有兴趣可以看下：

 * [运行时步骤](docs/runtime-setup.md)
 * [构建 Android 镜像](docs/build-android.md)

### 报告 bug

如果你发现了一个 Anbox 问题，请[提交 bug](https://github.com/anbox/anbox/issues/new)。

### 取得联系

如果你想要与开发者联系，你可以在 [FreeNode](https://freenode.net/) 中加入 *#anbox* 的 IRC 频道。

### 版权与许可

Anbox 重用了像 Android QEMU 模拟器这样的其他项目的代码。这些项目可在外部/带有许可声明的子目录中得到。

anbox 源码本身，如果没有在相关源码中声明其他的许可，默认是 GPLv3 许可。

-----------------------------------------------

via: https://github.com/anbox/anbox/blob/master/README.md

作者：[Anbox][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://anbox.io/
