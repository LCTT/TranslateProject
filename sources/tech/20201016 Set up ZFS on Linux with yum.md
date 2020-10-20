[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Set up ZFS on Linux with yum)
[#]: via: (https://opensource.com/article/20/10/zfs-dnf)
[#]: author: (Sheng Mao https://opensource.com/users/ivzhh)

Set up ZFS on Linux with yum
======
Use a yum repo to take advantage of the latest ZFS features on Fedora.
![Puzzle pieces coming together to form a computer screen][1]

I am a Fedora Linux user who runs `yum upgrade` daily. While this habit enables me to run all the latest software (one of [Fedora's four foundations][2] is "first," and it lives up to that), it also highlights any incompatibilities between the [ZFS][3] storage platform and a new kernel.

As a developer, sometimes I need new features from the latest ZFS branch. For example, ZFS 2.0.0 contains an exciting new feature greatly [improving ZVOL sync performance][4], which is critical to me as a KVM user. But this means that if I want to use the 2.0.0 branch, I have to build ZFS myself.

At first, I just compiled ZFS manually from its Git repo after every kernel update. If I forgot, ZFS would fail to be recognized on the next boot. Luckily, I quickly learned how to set up dynamic kernel module support ([DKMS][5]) for ZFS. However, this solution isn't perfect. For one thing, it doesn't utilize the powerful [yum][6] system, which can help with resolving dependencies and upgrading. In addition, switching between your own package and an upstream package is pretty easy with yum.

In this article, I will demonstrate how to set up a yum repo for packaging ZFS. The solution has two steps:

  1. Create RPM packages from the ZFS Git repository
  2. Set up a yum repo to host the packages



### Create RPM packages

To create RPM packages, you need to install the RPM toolchain. Yum provides groups to bundle installing the tools:


```
`sudo dnf group install 'C Development Tools and Libraries' 'RPM Development Tools'`
```

After these have been installed, you must install all the packages necessary to build ZFS from the ZFS Git repo. The packages belong to three groups:

  1. [Autotools][7] to generate build files from platform configurations
  2. Libraries for building ZFS kernel and userland tools
  3. Libraries for building RPM packages




```
sudo dnf install libtool autoconf automake gettext createrepo \
    libuuid-devel libblkid-devel openssl-devel libtirpc-devel \
    lz4-devel libzstd-devel zlib-devel \
    kernel-devel elfutils-libelf-devel \
    libaio-devel libattr-devel libudev-devel \
    python3-devel libffi-devel
```

Now you are ready to create your own packages.

### Build OpenZFS

[OpenZFS][8] provides excellent infrastructure. To build it:

  1. Clone the repository with `git` and switch to the branch/tag that you hope to use.
  2. Run Autotools to generate a makefile.
  3. Run `make rpm` and, if everything works, RPM files will be placed in the build folder.




```
$ git clone --branch=zfs-2.0.0-rc3 <https://github.com/openzfs/zfs.git> zfs
$ cd zfs
$ ./autogen.sh
$ ./configure
$ make rpm
```

### Set up a yum repo

In yum, a repo is a server or local path that includes metadata and RPM files. A consumer sets up an INI configuration file, and the `yum` command automatically resolves the metadata and downloads the corresponding packages.

Fedora provides the `createrepo` tool to set up a yum repo. First, create the repo and copy all RPM files from the ZFS folder to the repo. Then run `createrepo --update` to include all packages in the metadata:


```
$ sudo mkdir -p /var/lib/zfs.repo
$ sudo createrepo /var/lib/zfs.repo
$ sudo cp *.rpm /var/lib/zfs.repo/
$ sudo createrepo --update /var/lib/zfs.repo
```

Create a new configuration file in `/etc/yum.repos.d` to include the repo path:


```
$ echo \
"[zfs-local]\\\nname=ZFS Local\\\nbaseurl=file:///var/lib/zfs.repo\\\nenabled=1\\\ngpgcheck=0" |\
sudo tee /etc/yum.repos.d/zfs-local.repo

$ sudo dnf --repo=zfs-local list available --refresh
```

Finally, you have reached the end of the journey! You have a working yum repo and ZFS packages. Now you just need to install them:


```
$ sudo dnf install zfs
$ sudo /sbin/modprobe zfs
```

Run `sudo zfs version` to see the version of your userland and kernel tools. Congratulations! You have [ZFS for Fedora][9].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/zfs-dnf

作者：[Sheng Mao][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ivzhh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://docs.fedoraproject.org/en-US/project/#_what_is_fedora_all_about
[3]: https://zfsonlinux.org/
[4]: https://www.phoronix.com/scan.php?page=news_item&px=OpenZFS-3x-Boost-Sync-ZVOL
[5]: https://www.linuxjournal.com/article/6896
[6]: https://en.wikipedia.org/wiki/Yum_%28software%29
[7]: https://opensource.com/article/19/7/introduction-gnu-autotools
[8]: https://openzfs.org/wiki/Main_Page
[9]: https://openzfs.github.io/openzfs-docs/Getting%20Started/Fedora.html
