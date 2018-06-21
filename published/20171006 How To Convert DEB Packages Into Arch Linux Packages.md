将 DEB 软件包转换成 Arch Linux 软件包
============

![](https://www.ostechnix.com/wp-content/uploads/2017/10/Debtap-720x340.png)

我们已经学会了如何[为多个平台构建包][1]，以及如何从[源代码构建包][2]。 今天，我们将学习如何将 DEB 包转换为 Arch Linux 包。 您可能会问，AUR 是这个星球上的大型软件存储库，几乎所有的软件都可以在其中使用。 为什么我需要将 DEB 软件包转换为 Arch Linux 软件包？ 这的确没错！ 但是，由于某些软件包无法编译（封闭源代码软件包），或者由于各种原因（如编译时出错或文件不可用）而无法从 AUR 生成。 或者，开发人员懒得在 AUR 中构建一个包，或者他/她不想创建 AUR 包。 在这种情况下，我们可以使用这种快速但有点粗糙的方法将 DEB 包转换成 Arch Linux 包。

### Debtap - 将 DEB 包转换成 Arch Linux 包

为此，我们将使用名为 “Debtap” 的实用程序。 它代表了 **DEB**  **T** o **A** rch （Linux） **P** ackage。 Debtap 在 AUR 中可以使用，因此您可以使用 AUR 辅助工具（如 [Pacaur][3]、[Packer][4] 或 [Yaourt][5] ）来安装它。

使用 pacaur 安装 debtap 运行：

```
pacaur -S debtap
```

使用 Packer 安装：

```
packer -S debtap
```

使用 Yaourt 安装：

```
yaourt -S debtap
```

同时，你的 Arch 系统也应该已经安装好了 `bash`， `binutils` ，`pkgfile` 和 `fakeroot` 包。

在安装 Debtap 和所有上述依赖关系之后，运行以下命令来创建/更新 pkgfile 和 debtap 数据库。

```
sudo debtap -u
```

示例输出是：

```
==> Synchronizing pkgfile database...
:: Updating 6 repos...
 download complete: archlinuxfr [ 151.7 KiB 67.5K/s 5 remaining]
 download complete: multilib [ 319.5 KiB 36.2K/s 4 remaining]
 download complete: core [ 707.7 KiB 49.5K/s 3 remaining]
 download complete: testing [ 1716.3 KiB 58.2K/s 2 remaining]
 download complete: extra [ 7.4 MiB 109K/s 1 remaining]
 download complete: community [ 16.9 MiB 131K/s 0 remaining]
:: download complete in 131.47s < 27.1 MiB 211K/s 6 files >
:: waiting for 1 process to finish repacking repos...
==> Synchronizing debtap database...
 % Total % Received % Xferd Average Speed Time Time Time Current
 Dload Upload Total Spent Left Speed
100 34.1M 100 34.1M 0 0 206k 0 0:02:49 0:02:49 --:--:-- 180k
 % Total % Received % Xferd Average Speed Time Time Time Current
 Dload Upload Total Spent Left Speed
100 814k 100 814k 0 0 101k 0 0:00:08 0:00:08 --:--:-- 113k
 % Total % Received % Xferd Average Speed Time Time Time Current
 Dload Upload Total Spent Left Speed
100 120k 100 120k 0 0 61575 0 0:00:02 0:00:02 --:--:-- 52381
 % Total % Received % Xferd Average Speed Time Time Time Current
 Dload Upload Total Spent Left Speed
100 35.4M 100 35.4M 0 0 175k 0 0:03:27 0:03:27 --:--:-- 257k
==> Downloading latest virtual packages list...
 % Total % Received % Xferd Average Speed Time Time Time Current
 Dload Upload Total Spent Left Speed
100 149 0 149 0 0 49 0 --:--:-- 0:00:03 --:--:-- 44
100 11890 0 11890 0 0 2378 0 --:--:-- 0:00:05 --:--:-- 8456
==> Downloading latest AUR packages list...
 % Total % Received % Xferd Average Speed Time Time Time Current
 Dload Upload Total Spent Left Speed
100 264k 0 264k 0 0 30128 0 --:--:-- 0:00:09 --:--:-- 74410
==> Generating base group packages list...
==> All steps successfully completed!
```

你至少需要运行上述命令一次。

现在是时候开始转换包了。

比如说要使用 debtap 转换包 Quadrapassel，你可以这样做：

```
debtap quadrapassel_3.22.0-1.1_arm64.deb
```

上述的命令会将 DEB 包文件转换为 Arch Linux 包。你需要输入包的维护者和许可证，输入他们，然后按下回车键就可以开始转换了。

包转换的过程可能依赖于你的 CPU 的速度从几秒到几分钟不等。喝一杯咖啡等一等。

示例输出：

```
==> Extracting package data...
==> Fixing possible directories structure differencies...
==> Generating .PKGINFO file...

:: Enter Packager name:
quadrapassel

:: Enter package license (you can enter multiple licenses comma separated):
GPL

*** Creation of .PKGINFO file in progress. It may take a few minutes, please wait...

Warning: These dependencies (depend = fields) could not be translated into Arch Linux packages names:
gsettings-backend

==> Checking and generating .INSTALL file (if necessary)...

:: If you want to edit .PKGINFO and .INSTALL files (in this order), press (1) For vi (2) For nano (3) For default editor (4) For a custom editor or any other key to continue:

==> Generating .MTREE file...

==> Creating final package...
==> Package successfully created!
==> Removing leftover files...
```

**注**：Quadrapassel 在 Arch Linux 官方的软件库中早已可用，我只是用它来说明一下。

如果在包转化的过程中，你不想回答任何问题，使用 `-q` 略过除了编辑元数据之外的所有问题。

```
debtap -q quadrapassel_3.22.0-1.1_arm64.deb
```

为了略过所有的问题（不推荐），使用 `-Q`。

```
debtap -Q quadrapassel_3.22.0-1.1_arm64.deb
```

转换完成后，您可以使用 `pacman` 在 Arch 系统中安装新转换的软件包，如下所示。

```
sudo pacman -U <package-name>
```

显示帮助文档，使用 `-h`：

```
$ debtap -h
Syntax: debtap [options] package_filename

Options:

 -h --h -help --help Prints this help message
 -u --u -update --update Update debtap database
 -q --q -quiet --quiet Bypass all questions, except for editing metadata file(s)
 -Q --Q -Quiet --Quiet Bypass all questions (not recommended)
 -s --s -pseudo --pseudo Create a pseudo-64-bit package from a 32-bit .deb package
 -w --w -wipeout --wipeout Wipeout versions from all dependencies, conflicts etc.
 -p --p -pkgbuild --pkgbuild Additionally generate a PKGBUILD file
 -P --P -Pkgbuild --Pkgbuild Generate a PKGBUILD file only
```

这就是现在要讲的。希望这个工具有所帮助。如果你发现我们的指南有用，请花一点时间在你的社交、专业网络分享并支持我们!

更多的好东西来了。请继续关注!

干杯!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/convert-deb-packages-arch-linux-packages/

作者：[SK][a]
译者：[amwps290](https://github.com/amwps290)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/build-linux-packages-multiple-platforms-easily/
[2]:https://www.ostechnix.com/build-packages-source-using-checkinstall/
[3]:https://www.ostechnix.com/install-pacaur-arch-linux/
[4]:https://www.ostechnix.com/install-packer-arch-linux-2/
[5]:https://www.ostechnix.com/install-yaourt-arch-linux/
