[#]: subject: (Create an encrypted file vault on Linux)
[#]: via: (https://opensource.com/article/21/4/linux-encryption)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13296-1.html)

在 Linux 上创建一个加密文件保险库
======

> 使用 Linux 统一密钥设置（LUKS）为物理驱动器或云存储上的敏感文件创建一个加密保险库。

![](https://img.linux.net.cn/data/attachment/album/202104/14/151220l5zkkxiukgzix54k.jpg)

最近，我演示了如何在 Linux 上使用<ruby>统一密钥设置<rt>Linux Unified Key Setup</rt></ruby>（[LUKS][3]）和 `cryptsetup` 命令 [实现全盘加密][2]。虽然加密整个硬盘在很多情况下是有用的，但也有一些原因让你不想对整个硬盘进行加密。例如，你可能需要让一个硬盘在多个平台上工作，其中一些平台可能没有集成 [LUKS][3]。此外，现在是 21 世纪，由于云的存在，你可能不会使用物理硬盘来处理所有的数据。

几年前，有一个名为 [TrueCrypt][4] 的系统，允许用户创建加密的文件保险库，可以通过 TrueCrypt 解密来提供读/写访问。这是一项有用的技术，基本上提供了一个虚拟的便携式、完全加密的驱动器，你可以在那里存储重要数据。TrueCrypt 项目关闭了，但它可以作为一个有趣的模型。

幸运的是，LUKS 是一个灵活的系统，你可以使用它和 `cryptsetup` 在一个独立的文件中创建一个加密保险库，你可以将其保存在物理驱动器或云存储中。

下面就来介绍一下怎么做。

### 1、建立一个空文件

首先，你必须创建一个预定大小的空文件。就像是一种保险库或保险箱，你可以在其中存储其他文件。你使用的命令是 `util-linux` 软件包中的 `fallocate`：

```
$ fallocate --length 512M vaultfile.img
```

这个例子创建了一个 512MB 的文件，但你可以把你的文件做成任何你想要的大小。

### 2、创建一个 LUKS 卷

接下来，在空文件中创建一个 LUKS 卷：

```
$ cryptsetup --verify-passphrase \
    luksFormat vaultfile.img
```

### 3、打开 LUKS 卷

要想创建一个可以存储文件的文件系统，必须先打开 LUKS 卷，并将其挂载到电脑上：

```
$ sudo cryptsetup open \
    --type luks vaultfile.img myvault
$ ls /dev/mapper
myvault
```

### 4、建立一个文件系统

在你打开的保险库中建立一个文件系统：

```
$ sudo mkfs.ext4 -L myvault /dev/mapper/myvault
```

如果你现在不需要它做什么，你可以关闭它：

```
$ sudo cryptsetup close myvault
```

### 5、开始使用你的加密保险库

现在一切都设置好了，你可以在任何需要存储或访问私人数据的时候使用你的加密文件库。要访问你的保险库，必须将其挂载为一个可用的文件系统：

```
$ sudo cryptsetup open \
    --type luks vaultfile.img myvault
$ ls /dev/mapper
myvault
$ sudo mkdir /myvault
$ sudo mount /dev/mapper/myvault /myvault
```

这个例子用 `cryptsetup` 打开保险库，然后把保险库从 `/dev/mapper` 下挂载到一个叫 `/myvault` 的新目录。和 Linux 上的任何卷一样，你可以把 LUKS 卷挂载到任何你想挂载的地方，所以除了 `/myvault`，你可以用 `/mnt` 或 `~/myvault` 或任何你喜欢的位置。

当它被挂载后，你的 LUKS 卷就会被解密。你可以像读取和写入文件一样读取和写入它，就像它是一个物理驱动器一样。

当使用完你的加密保险库时，请卸载并关闭它：

```
$ sudo umount /myvault
$ sudo cryptsetup close myvault
```

### 加密的文件保险库

你用 LUKS 加密的镜像文件和其他文件一样，都是可移动的，因此你可以将你的保险库存储在硬盘、外置硬盘，甚至是互联网上。只要你可以使用 LUKS，就可以解密、挂载和使用它来保证你的数据安全。轻松加密，提高数据安全性，不妨一试。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/linux-encryption

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life_bank_vault_secure_safe.png?itok=YoW93h7C (Secure safe)
[2]: https://opensource.com/article/21/3/encryption-luks
[3]: https://gitlab.com/cryptsetup/cryptsetup/blob/master/README.md
[4]: https://en.wikipedia.org/wiki/TrueCrypt
