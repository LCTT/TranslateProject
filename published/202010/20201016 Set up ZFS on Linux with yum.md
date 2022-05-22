[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12754-1.html)
[#]: subject: (Set up ZFS on Linux with yum)
[#]: via: (https://opensource.com/article/20/10/zfs-dnf)
[#]: author: (Sheng Mao https://opensource.com/users/ivzhh)

在 Linux 上使用 yum 设置 ZFS
======

> 在 Fedora 上使用 yum 仓库来获取最新的 ZFS 特性。

![](https://img.linux.net.cn/data/attachment/album/202010/26/103028g9q3v3e391c9b62v.jpg)

我是一名 Fedora Linux 用户，我每天都会运行 `yum upgrade`。虽然这个习惯使我能够运行所有最新的软件（[Fedora 的四个基础][2]之一的 “First” ，它也做到了），但它也会提醒 [ZFS][3] 存储平台和新内核之间的不兼容性。

作为一名开发者，有时我需要最新的 ZFS 分支的新特性。例如，ZFS 2.0.0 包含了一个令人兴奋的新功能，它大大[提高了 ZVOL 同步性能][4]，这对我这个 KVM 用户来说至关重要。但这意味着，如果我想使用 2.0.0 分支，我必须自己构建 ZFS。

起初，我只是在每次内核更新后从它的 Git 仓库中手动编译 ZFS。如果我忘记了，ZFS 就会在下次启动时无法被识别。幸运的是，我很快就学会了如何为 ZFS 设置动态内核模块支持 （[DKMS][5]）。然而，这个解决方案并不完美。首先，它没有利用强大的 [yum][6] 系统，而这个系统可以帮助解决依赖关系和升级。此外，使用 `yum` 在你自己的包和上游包之间进行切换是非常容易的。

在本文中，我将演示如何设置 `yum` 仓库来打包 ZFS。这个方案有两个步骤：

  1. 从 ZFS 的 Git 仓库中创建 RPM 包。
  2. 建立一个 `yum` 仓库来托管这些包。

### 创建 RPM 包

要创建 RPM 包，你需要安装 RPM 工具链。`yum` 提供了一个组来捆绑安装这些工具：

```
sudo dnf group install 'C Development Tools and Libraries' 'RPM Development Tools'
```

安装完这些之后，你必须从 ZFS Git 仓库中安装构建 ZFS 所需的所有包。这些包属于三个组：

  1. [Autotools][7]，用于从平台配置中生成构建文件。
  2. 用于构建 ZFS 内核和用户态工具的库。
  3. 构建 RPM 包的库。

```
sudo dnf install libtool autoconf automake gettext createrepo \
    libuuid-devel libblkid-devel openssl-devel libtirpc-devel \
    lz4-devel libzstd-devel zlib-devel \
    kernel-devel elfutils-libelf-devel \
    libaio-devel libattr-devel libudev-devel \
    python3-devel libffi-devel
```

现在你已经准备好创建你自己的包了。

### 构建 OpenZFS

[OpenZFS][8] 提供了优秀的基础设施。要构建它:

  1. 用 `git` 克隆仓库，并切换到你希望使用的分支/标签。
  2. 运行 Autotools 生成一个 makefile。
  3. 运行 `make rpm`，如果一切正常，RPM 文件将被放置在 `build` 文件夹中。

```
$ git clone --branch=zfs-2.0.0-rc3 <https://github.com/openzfs/zfs.git> zfs
$ cd zfs
$ ./autogen.sh
$ ./configure
$ make rpm
```

### 建立一个 yum 仓库

在 `yum` 中，仓库是一个服务器或本地路径，包括元数据和 RPM 文件。用户设置一个 INI 配置文件，`yum` 命令会自动解析元数据并下载相应的软件包。

Fedora 提供了 `createrepo` 工具来设置 `yum` 仓库。首先，创建仓库，并将 ZFS 文件夹中的所有 RPM 文件复制到仓库中。然后运行 `createrepo --update` 将所有的包加入到元数据中。

```
$ sudo mkdir -p /var/lib/zfs.repo
$ sudo createrepo /var/lib/zfs.repo
$ sudo cp *.rpm /var/lib/zfs.repo/
$ sudo createrepo --update /var/lib/zfs.repo
```

在 `/etc/yum.repos.d` 中创建一个新的配置文件来包含仓库路径：

```
$ echo \
"[zfs-local]\\nname=ZFS Local\\nbaseurl=file:///var/lib/zfs.repo\\nenabled=1\\ngpgcheck=0" |\
sudo tee /etc/yum.repos.d/zfs-local.repo

$ sudo dnf --repo=zfs-local list available --refresh
```

终于完成了！你已经有了一个可以使用的 `yum` 仓库和 ZFS 包。现在你只需要安装它们。

```
$ sudo dnf install zfs
$ sudo /sbin/modprobe zfs
```

运行 `sudo zfs version` 来查看你的用户态和内核工具的版本。恭喜！你拥有了 [Fedora 中的 ZFS][9]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/zfs-dnf

作者：[Sheng Mao][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

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
