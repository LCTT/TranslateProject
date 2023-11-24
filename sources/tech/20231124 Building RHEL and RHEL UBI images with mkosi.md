[#]: subject: "Building RHEL and RHEL UBI images with mkosi"
[#]: via: "https://fedoramagazine.org/create-images-directly-from-rhel-and-rhel-ubi-package-using-mkosi/"
[#]: author: "Zbigniew Jędrzejewski-Szmek https://fedoramagazine.org/author/zbyszek/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Building RHEL and RHEL UBI images with mkosi
======

![][1]

Photo by [Saad Salim][2] on [Unsplash][3]

Mkosi is a lightweight tool to build images from distribution packages. This article describes how to use mkosi to build images with packages from RHEL (Red Hat Enterprise Linux) and RHEL UBI. RHEL Universal Base Image is a subset of RHEL that is freely available without a subscription.

### Mkosi features

Mkosi supports a few output formats, but the most important one is [Discoverable Disk Images][4] (DDIs). The same DDI can be used to boot a container, as a virtual machine, copied to a USB stick and used to boot a real machine, and finally copied from the USB stick to the disk to boot from it. The image has a standarized layout and metadata that describes its purpose.

Mkosi relies on other tools to do most of the work: _systemd-repart_ to create partitions on a disk image, _mkfs.btrfs_ / _mkfs.ext4_ / _mkfs.xfs_ /… to write the file systems, and _dnf_ / _apt_ / _pacman_ / _zypper_ to download and unpack packages.

Mkosi supports a range of distributions: Debian and Ubuntu, Arch Linux, OpenSUSE, and of course Fedora, CentOS Stream and derivatives, and now RHEL UBI and RHEL since the last release. Because the actual “heavy lifting” is done by other tools, mkosi can do cross builds. This is where one distro is used to build images for various other distros. The only requirement is that the appropriate tools are installed on the host. Fedora has native packages for _apt_ , _pacman_ , and _zypper_ , so it provides a good base to use mkosi to build any other distribution.

There are some nifty features: images can be created by an unprivileged user, or in a container without device files, in particular access to loopback devices. It can also launch those images as VMs (using _qemu_ ) without privileges.

The configuration is declarative and very easy to create. _systemd-repart_ is used to create disk partitions, and _repart.d_ configuration files are used to define how this should be done.

For more details see two talks by Daan DeMeyer at the All Systems Go conference: [systemd-repart: Building Discoverable Disk Images][5] and [mkosi: Building Bespoke Operating System Images][6].

### Project goal

One goal for Mkosi is to allow the testing of a software project against various distributions. It will create an image for a distribution (using packages from that distribution) and then compile and install the software project into that image, inserting additional files that are not part of a package. But the first stage, the creation of an image from packages, is useful on its own. This is what we will show first.

We[1][7] recently added support for RHEL and RHEL UBI. Let’s start with RHEL UBI, just building an image out of distro packages.

Please note that the examples below require mkosi 19, and will not work with earlier versions.

### A basic RHEL UBI image with a shell

```

    $ mkdir -p mkosi.cache
    $ mkosi \
      -d rhel-ubi \
      -t directory \
      -p bash,coreutils,util-linux,systemd,rpm \
      --autologin

```

The commands above specify the distribution ‘rhel-ubi’, the output format ‘directory’, and request that packages _bash_ , _coreutils_ , …, _rpm_ be installed. _rpm_ isn’t normally needed _inside_ of the image, but here it will be useful for introspection. We also enable automatic login as the root user.

Before the build is started, we create the cache directory _mkosi.cache_. When a cache directory is present Mkosi uses it automatically to persist downloaded rpms. This will make subsequent invocations on the same package set much faster.

We can then boot this image as a container using _systemd-nspawn_ :

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

As mentioned earlier, the image can be used to boot a VM. In this setup, it is not possible — our image doesn’t have a kernel. In fact, RHEL UBI doesn’t provide a kernel at all, so we can’t use it to boot (in a VM or on bare metal).

### Creating an image

I also promised an image, but so far we only have a directory. Let’s actually create an image:

```

    $ mkosi \
      -d rhel-ubi \
      -t disk \
      -p bash,coreutils,util-linux,systemd,rpm \
      --autologin

```

This produces _image.raw_ , an disk image with a GPT partition table, and a single root partition (for the native architecture).

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

OK, we have an image, the image has some content from RHEL UBI packages. How do we add our own stuff on top?

### Extending an image with your own files

There are a few ways to extend the image, including compiling something from scratch. But first let’s do something easier and inject a provided file system into the image:

```

    $ mkdir -p mkosi.extra/srv/www/content
    $ cat >mkosi.extra/srv/www/content/index.html <<'EOF'
    <h1>Hello, World!</h1>
    EOF

```

The image will now have _/srv/www/content/index.html_.

This method is used to inject additional configuration or simple programs.

### Building from source

Now let’s do the full monty and build something from sources. For example, a trivial meson project with a single C file:

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

To summarize: we have some source code ( _hello.c_ ), a build system configuration ( _meson.build_ ), and a glue script ( _mkosi.build_ ) that is to be invoked by _mkosi_. For a “real” project, we would have the same elements, just more complex.

The script requires some explanation. Mkosi uses user namespaces when creating the image. This allows the package managers (e.g. _dnf_ ) to install files owned by different users even though it is invoked by a normal unprivileged user. We are using _mkosi-as-caller_ to switch back to the calling user to do the compilation. This way, the files created during compilation under $BUILDDIR will be owned by the calling user.

Now let’s build the image with our program. Compared to the previous invocation, we need additional packages: _meson_ , _gcc_. Since we now have a build script, mkosi will execute two build stages: first an build image is built, and the build script is invoked in it, and the installation artifacts are stashed in a temporary directory, then a final image is built, and the installation artifacts are injected. (Mkosi sets $DESTDIR, and _meson install_ uses $DESTDIR automatically, so the right things happen without us having to specify things explicitly.)

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

At this point we have the image _image.raw_ with a custom payload. We can start our freshly minted executable as a shell command:

```

    $ sudo mkosi -d rhel-ubi -t directory shell hello
    <h1>Hello, World!</h1>

```

### Obtaining a developer subscription for RHEL

RHEL UBI is intended for use primarily as a base layer for container builds. It has a limited set of packages available (about 1500). Let’s now switch to a full RHEL installation.

The easiest way to get access to RHEL is with a [developer license][8]. It provides an entitlement to register 16 physical or virtual nodes running RHEL, with self-service support.

First, [create an account][9]. After that, head over to [management][10] and make sure “Simple content access for Red Hat Subscription Management” is enabled. Then, [create a new activation key][11] with “Red Hat Developer Subscription for Individuals” selected. Make note of the Organization ID that is shown. We’ll refer to the key name and organization ID as $KEY_NAME and $ORGANIZATION_ID below.

Now we are ready to consume RHEL content:

```

    $ sudo dnf install subscription-manager
    $ sudo subscription-manager register \
      --org $ORGANIZATION_ID --activationkey $KEY_NAME

```

### Building an image using RHEL

In previous examples, we specified all configuration through parameter switches. This is nice for quick development, but can become unwieldy. RHEL is a serious distribution, so let’s use a configuration file instead:

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

Let’s first check if everything is kosher:

```

    $ mkosi summary

```

And now let’s build the image (err, directory):

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

Yes, we built the “image” as a directory with a file system tree, and booted it as a virtual machine.

In the booted virtual machine, _findmnt /_ shows that the root file systems is virtiofs. This is a virtual file system that exposes a directory from the host to the guest. We _could_ build a more traditional image with a partition table and file systems inside of a file, but a directory+virtiofs is quick and nicer for development.

The image that we just booted is not registered. To allow updates to be downloaded from _inside_ of the image, we would have to add _yum_ , _subscription-manager_ , and _NetworkManager_ to the package list, and before we download any updates, call _subscription-manager_ in the same way as above. Once we do that, we have about 4500 packages at our disposal in the basic repositories, and a few dozen additional repositories with more specialized packages.

### Finally

And that’s all I have for today. If you have questions, find us on Matrix at [#mkosi:matrix.org][12] or on the [systemd mailing list][13].

  1. Daan DeMeyer, Lukáš Nykrýn, Michal Sekletár, Zbigiew Jędrzejewski-Szmek [↩︎][14]



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/create-images-directly-from-rhel-and-rhel-ubi-package-using-mkosi/

作者：[Zbigniew Jędrzejewski-Szmek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
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
