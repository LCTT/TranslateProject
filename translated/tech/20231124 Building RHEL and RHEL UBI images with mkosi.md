[#]: subject: "Building RHEL and RHEL UBI images with mkosi"
[#]: via: "https://fedoramagazine.org/create-images-directly-from-rhel-and-rhel-ubi-package-using-mkosi/"
[#]: author: "Zbigniew Jędrzejewski-Szmek https://fedoramagazine.org/author/zbyszek/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "GlassFoxowo"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用 mkosi 构建 RHEL 和 RHEL UBI 镜像
======

![][1]

图片： [Saad Salim][2] 发布于 [Unsplash][3]

mkosi 是一个轻量级工具，用于从发行包构建镜像。本文介绍如何使用 mkosi 从 RHEL(Red Hat Enterprise Linux) 和RHEL <ruby>[通用基础镜像][4]<rt>Universal Base Image</rt></ruby>（UBI） 的软件包构建镜像。RHEL UBI 是 RHEL的一个子集，可以在没有订阅的情况下免费使用。

### mkosi 特性

mkosi 支持一些输出格式，但最重要的是 <ruby>[可发现磁盘镜像][4]<rt>Discoverable Disk Images</rt></ruby>（DDI）。相同的 DDI 可用于引导容器、或运行在虚拟机、抑或是复制到 U 盘以引导真机，然后从 U 盘复制到磁盘以引导系统。该镜像具有标准化的布局和描述其用途的元数据。

mkosi 依赖其他工具来完成大部分工作：使用 _systemd-repart_ 在磁盘镜像上创建分区，使用 _mkfs.btrfs_ / _mkfs.ext4_ / _mkfs.xfs_ /… 编写文件系统，并使用 _dnf_ / _apt_ / _pacman_ / _zypper_ 下载和解压包。

mkosi 支持一系列发行版：Debian 和 Ubuntu,Arch Linux,OpenSUSE，当然还包括 Fedora,CentOS Stream 及其衍生版本，以及最近的 RHEL UBI 和 RHEL 。由于实际的”重活“是由其他工具完成的，mkosi 可以进行交叉构建。这意味着可以使用一个发行版构建各种其他发行版的镜像。唯一的要求是主机上安装了相应的工具。Fedora 对于 _apt_、_pacman_ 和 _zypper_ 有本机包，因此它为使用 mkosi 构建任何其他发行版提供了良好的基础。

还有一些巧妙的功能：镜像可以由非特权用户创建，或者在没有设备文件的容器中创建，特别是没有对回环设备的访问权限。它还可以在没有特权的情况下将这些镜像启动为虚拟机（使用 _qemu_）。

配置是声明性的，非常容易创建。使用 _systemd-repart_ 创建磁盘分区，并使用 _repart.d_ 配置文件定义应该如何完成此操作。

有关更多详细信息，请参见 Daan DeMeyer 在 All Systems Go 大会上的两个演讲：[systemd-repart: Building Discoverable Disk Images][5] 和 [mkosi: Building Bespoke Operating System Images][6]。


### 项目目标

mkosi 的一个目标是允许对软件项目进行针对不同发行版的测试。它将为一个发行版创建一个镜像（使用该发行版的软件包），然后将软件项目编译并安装到该镜像中，插入不属于软件包的额外文件。但是，首个阶段，即从软件包创建镜像的过程，本身就是有用的。这是我们将首先展示的内容。

我们[1][7]最近添加了对 RHEL 和 RHEL UBI 的支持。让我们从 RHEL UBI 开始，只构建一个由发行软件包组成的镜像。

请注意，下面的示例要求 mkosi 19，而且不适用于更早的版本。


### 带有Shell的基本RHEL UBI镜像


```

    $ mkdir -p mkosi.cache
    $ mkosi \
      -d rhel-ubi \
      -t directory \
      -p bash,coreutils,util-linux,systemd,rpm \
      --autologin

```

上面的命令指定了发行版 'rhel-ubi'，输出格式 'directory'，并请求安装软件包 _bash_、_coreutils_、…、_rpm_。_rpm_ 通常不需要在镜像内部，但在这里用于内省会很有用。我们还启用了以 root 用户自动登录。

在启动构建之前，我们创建了缓存目录 _mkosi.cache_。当存在缓存目录时，mkosi 会自动使用它来持久化下载的 RPM 包。这将使相同软件包集合的后续调用速度更快。

然后，我们可以使用 _systemd-nspawn_ 将此镜像作为容器启动：

```

    $ sudo mkosi \
      -d rhel-ubi \
      -t directory \
      boot

```

```

    systemd 252-14.el9_2.3 running in system mode (+PAM +AUDIT +SELINUX -APPARMOR +IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS -FIDO2 +IDN2 -IDN -IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY +P11KIT -QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -BPF_FRAMEWORK +XKBCOMMON +UTMP +SYSVINIT default-hierarchy=unified)
    Detected virtualization systemd-nspawn.
    Detected architecture x86-64.
    Detected first boot.

    Red Hat Enterprise Linux 9.2 (Plow)
    ...
    [ OK ] Created slice Slice /system/getty.
    [ OK ] Created slice Slice /system/modprobe.
    [ OK ] Created slice User and Session Slice.
    ...
    [ OK ] Started User Login Management.
    [ OK ] Reached target Multi-User System.

    Red Hat Enterprise Linux 9.2 (Plow)
    Kernel 6.5.6-300.fc39.x86_64 on an x86_64

    image login: root (automatic login)

    [root@image ~]# rpm -q rpm systemd
    rpm-4.16.1.3-22.el9.x86_64
    systemd-252-14.el9_2.3.x86_64

```

正如前面提到的，此镜像可以用于启动虚拟机。但在此设置下，这是不可能的——我们的镜像没有内核。事实上，RHEL UBI 根本不提供内核，因此我们无法使用它进行引导（无论是在虚拟机上还是在裸机上）。

### 创建镜像

我一开始说是要创建镜像，但到目前为止我们只有一个目录。让我们开始实际创建一个镜像：

```

    $ mkosi \
      -d rhel-ubi \
      -t disk \
      -p bash,coreutils,util-linux,systemd,rpm \
      --autologin

```

这将生成 _image.raw_，一个带有 GPT 分区表和单个根分区（用于本机架构）的磁盘镜像。

```

    $ sudo systemd-dissect image.raw
    Name: image.raw
    Size: 301.0M
    Sec. Size: 512
    Arch.: x86-64

    Image UUID: dcbd6499-409e-4b62-b251-e0dd15e446d5
    OS Release: NAME=Red Hat Enterprise Linux
    VERSION=9.2 (Plow)
    ID=rhel
    ID_LIKE=fedora
    VERSION_ID=9.2
    PLATFORM_ID=platform:el9
    PRETTY_NAME=Red Hat Enterprise Linux 9.2 (Plow)
    ANSI_COLOR=0;31
    LOGO=fedora-logo-icon
    CPE_NAME=cpe:/o:redhat:enterprise_linux:9::baseos
    HOME_URL=https://www.redhat.com/
    DOCUMENTATION_URL=https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9
    BUG_REPORT_URL=https://bugzilla.redhat.com/
    REDHAT_BUGZILLA_PRODUCT=Red Hat Enterprise Linux 9
    REDHAT_BUGZILLA_PRODUCT_VERSION=9.2
    REDHAT_SUPPORT_PRODUCT=Red Hat Enterprise Linux
    REDHAT_SUPPORT_PRODUCT_VERSION=9.2

    Use As: ✗ bootable system for UEFI
            ✓ bootable system for container
            ✗ portable service
            ✗ initrd
            ✗ sysext extension for system
            ✗ sysext extension for initrd
            ✗ sysext extension for portable service

    RW DESIGNATOR PARTITION UUID PARTITION LABEL FSTYPE ARCHITECTURE VERITY GROWFS NODE PARTNO
    rw root 1236e211-4729-4561-a6fc-9ef8f18b828f root-x86-64 xfs x86-64 no yes /dev/loop0p1 1

```

好的，我们现在有一个镜像，镜像中包含了一些来自 RHEL UBI 软件包的内容。我们如何在其上加点我们自己的东西呢？

### 使用自己的文件扩展镜像

有几种方法可以扩展镜像，包括从头开始编译某些东西。但在那之前，让我们做一些更简单的事情，将一个现成的文件系统注入到镜像中：

```

    $ mkdir -p mkosi.extra/srv/www/content
    $ cat >mkosi.extra/srv/www/content/index.html <<'EOF'
    <h1>Hello, World!</h1>
    EOF

```

现在，该镜像将包含 _/srv/www/content/index.html_。

这种方法用于注入额外的配置或简单的程序。

### 从源代码构建

现在让我们过一遍完整流程，从源代码构建一些东西。例如，一个简单的 Meson 项目，有一个单独的 C 文件：

```

    $ cat >hello.c <<'EOF'
    #include <stdio.h>

    int main(int argc, char **argv) {
        char buf[1024];

        FILE *f = fopen("/srv/www/content/index.html", "re");
        size_t n = fread(buf, 1, sizeof buf, f);

        fwrite(buf, 1, n, stdout);
        fclose(f);
        return 0;
    }
    EOF

    $ cat >meson.build <<'EOF'
    project('hello', 'c')
    executable('hello', 'hello.c',
               install: true)
    EOF

```

```

    $ cat >mkosi.build <<'EOF'
    set -ex

    mkosi-as-caller rm -rf "$BUILDDIR/build"
    mkosi-as-caller meson setup "$BUILDDIR/build" "$SRCDIR"
    mkosi-as-caller meson compile -C "$BUILDDIR/build"
    meson install -C "$BUILDDIR/build" --no-rebuild
    EOF
    $ chmod +x mkosi.build

```

总结一下：我们有一些源代码（_hello.c_），一个构建系统配置文件（_meson.build_），以及一个由 _mkosi_ 调用的胶水脚本（_mkosi.build_）。对于实际的项目，也会有相同的元素，只是更加复杂。

这个脚本需要一些解释。mkosi 在创建镜像时使用用户命名空间。这允许包管理器（例如 _dnf_）安装由不同用户拥有的文件，即使它是由一个普通非特权用户调用的。我们使用 _mkosi-as-caller_ 切换回调用者以进行编译。这样，在 $BUILDDIR 下编译期间创建的文件将由调用者拥有。

现在让我们使用我们的程序构建镜像。与之前的调用相比，我们需要额外的软件包：_meson_、_gcc_。由于我们现在有了构建脚本，mkosi 将执行两个构建阶段：首先创建一个构建镜像，并在其中调用构建脚本，将安装产物存储在一个临时目录中，然后构建最终镜像，并将安装产物注入其中。（mkosi 设置 $DESTDIR，_meson install_ 自动使用 $DESTDIR，因此并不需要我们明确指定。）


```

    $ mkosi \
      -d rhel-ubi \
      -t disk \
      -p bash,coreutils,util-linux,systemd,rpm \
      --autologin \
      --build-package=meson,gcc \
      --build-dir=mkosi.builddir \
      --build-script=mkosi.build \
      -f

```

此时，我们有了带有自定义载荷的镜像 _image.raw_。我们可以启动我们新创建的可执行文件作为 shell 命令：

```

    $ sudo mkosi -d rhel-ubi -t directory shell hello
    <h1>Hello, World!</h1>

```

### 获取 RHEL 的开发者订阅

RHEL UBI 主要用作容器构建的基础层。它提供了有限的软件包（约 1500 个）。现在让我们切换到完整的 RHEL 安装。

获取 RHEL 的最简单方法是使用 [开发者许可证][8]。它提供了权限注册 16 个运行 RHEL 的物理或虚拟节点，并提供自助式支持。

首先，[创建一个账户][9]。然后，转到 [管理页面][10] 并确保启用了“用于 Red Hat 订阅管理的简化内容访问”。接下来，[创建一个新的激活密钥][11]，选择“ Red Hat 个人开发者订阅”。记下显示的组织 ID。在下面，我们将使用密钥名称和组织 ID 分别表示为 $KEY_NAME 和 $ORGANIZATION_ID。

现在，我们准备使用 RHEL 内容：

```

    $ sudo dnf install subscription-manager
    $ sudo subscription-manager register \
      --org $ORGANIZATION_ID --activationkey $KEY_NAME

```

### 使用 RHEL 构建镜像

在之前的示例中，我们通过参数开关指定了所有配置。这对于快速开发很友好，但可能在情况复杂时变得难以处理。RHEL 是一个严肃的发行版，所以让我们改为使用配置文件：

```

    $ cat >mkosi.conf <<'EOF'
    [Output]
    Format=directory
    Output=rhel-directory

    [Distribution]
    Distribution=rhel

    [Content]
    Packages=
    bash
    coreutils
    util-linux
    systemd
    systemd-boot
    systemd-udev
    kernel-core

    Bootable=yes
    Bootloader=uki
    Autologin=yes
    WithDocs=no
    EOF

```

首先，让我们检查一下一切是否正常：

```

    $ mkosi summary

```

现在让我们构建镜像（呃，或者说，目录）：

```

    $ mkosi build
    $ mkosi qemu

```

```

    Welcome to Red Hat Enterprise Linux 9.2 (Plow)!

    [ OK ] Created slice Slice /system/modprobe.
    [ OK ] Reached target Initrd Root Device.
    [ OK ] Reached target Initrd /usr File System.
    [ OK ] Reached target Local Integrity Protected Volumes.
    [ OK ] Reached target Local File Systems.
    [ OK ] Reached target Path Units.
    [ OK ] Reached target Remote Encrypted Volumes.
    [ OK ] Reached target Remote Verity Protected Volumes.
    [ OK ] Reached target Slice Units.
    [ OK ] Reached target Swaps.
    ...
    [ OK ] Listening on Journal Socket.
    [ OK ] Listening on udev Control Socket.
    [ OK ] Listening on udev Kernel Socket.
    ...
    Red Hat Enterprise Linux 9.2 (Plow)
    Kernel 5.14.0-284.30.1.el9_2.x86_64 on an x86_64

    localhost login: root (automatic login)
    [root@localhost ~]#

```

很好，我们将“镜像”构建为一个带有文件系统树的目录，并在虚拟机中引导了它。

在引导的虚拟机中，_findmnt /_ 显示根文件系统是 virtiofs。这是一个虚拟文件系统，将主机的目录暴露给客户机。我们其实也可以构建一个更传统的镜像，其中包含文件系统和文件内的分区表，但 目录+virtiofs 对于开发来说更快且更友好。

我们刚刚引导的镜像未注册。要允许从镜像“内部”下载更新，我们必须将 _yum_ 、_subscription-manager_ 和 _NetworkManager_ 添加到软件包列表，并在下载任何更新之前以与上述相同的方式调用 _subscription-manager_。在这之后，我们在基本仓库中就有大约 4500 个软件包可用，并且还有一些包含更多专业软件包的额外仓库。

### 最后

今天就是这些了。如果您有问题，可以在 Matrix 上找到我们，地址为 [#mkosi:matrix.org][12]，或者在 [systemd 邮件列表][13] 上找到我们。

--
  1. Daan DeMeyer、Lukáš Nykrýn、Michal Sekletár、Zbigiew Jędrzejewski-Szmek [↩︎][14]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/create-images-directly-from-rhel-and-rhel-ubi-package-using-mkosi/

作者：[Zbigniew Jędrzejewski-Szmek][a]
选题：[lujun9972][b]
译者：[GlassFoxowo](https://github.com/GlassFoxowo-Dev)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/zbyszek/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/10/building_w_mkosi-816x345.jpg
[2]: https://unsplash.com/@saadx?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[3]: https://unsplash.com/photos/aerial-photo-of-people-in-park-at-daytime-PqRvLsjD_TU?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[4]: https://uapi-group.org/specifications/specs/discoverable_disk_image/
[5]: https://media.ccc.de/v/all-systems-go-2023-191-systemd-repart-building-discoverable-disk-images
[6]: https://media.ccc.de/v/all-systems-go-2023-190-mkosi-building-bespoke-operating-system-images
[7]: tmp.1bzWuYb2vw#a08aaa7d-ee14-4565-80a0-e3d19b21ad26
[8]: https://developers.redhat.com/articles/faqs-no-cost-red-hat-enterprise-linux
[9]: https://developers.redhat.com/register
[10]: https://access.redhat.com/management
[11]: https://access.redhat.com/management/activation_keys/new
[12]: https://matrix.to/#/#mkosi:matrix.org
[13]: https://lists.freedesktop.org/mailman/listinfo/systemd-devel
[14]: tmp.1bzWuYb2vw#a08aaa7d-ee14-4565-80a0-e3d19b21ad26-link
