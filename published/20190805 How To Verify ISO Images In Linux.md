[#]: collector: "lujun9972"
[#]: translator: "FSSlc"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-11212-1.html"
[#]: subject: "How To Verify ISO Images In Linux"
[#]: via: "https://www.ostechnix.com/how-to-verify-iso-images-in-linux/"
[#]: author: "sk https://www.ostechnix.com/author/sk/"

如何在 Linux 中验证 ISO 镜像
======

![如何在 Linux 中校验 ISO 镜像][1]

你从喜爱的 Linux 发行版的官方网站或第三方网站下载了它的 ISO 镜像之后，接下来要做什么呢？是[创建可启动介质][2]并开始安装系统吗？并不是，请稍等一下。在开始使用它之前，强烈建议你检查一下你刚下载到本地系统中的 ISO 文件是否是下载镜像站点中 ISO 文件的一个精确拷贝。因为在前几年 [Linux Mint 的网站被攻破了][3]，并且攻击者创建了一个包含后门的经过修改的 Linux Mint ISO 文件。 所以验证下载的 Linux ISO 镜像的可靠性和完整性是非常重要的一件事儿。假如你不知道如何在 Linux 中验证 ISO 镜像，本次的简要介绍将给予你帮助，请接着往下看！

### 在 Linux 中验证 ISO 镜像

我们可以使用 ISO 镜像的“校验和”来验证 ISO 镜像。校验和是一系列字母和数字的组合，用来检验下载文件的数据是否有错以及验证其可靠性和完整性。当前存在不同类型的校验和，例如 SHA-0、SHA-1、SHA-2（224、256、384、512）和 MD5。MD5 校验和最为常用，但对于现代的 Linux 发行版，SHA-256 最常被使用。

我们将使用名为 `gpg` 和 `sha256` 的两个工具来验证 ISO 镜像的可靠性和完整性。

#### 下载校验和及签名

针对本篇指南的目的，我将使用 Ubuntu 18.04 LTS 服务器 ISO 镜像来做验证，但对于其他的 Linux 发行版应该也是适用的。

在靠近 Ubuntu 下载页的最上端，你将看到一些额外的文件（校验和及签名），正如下面展示的图片那样：

![Ubuntu 18.04 的校验和及签名][4]

其中名为 `SHA256SUMS` 的文件包含了这里所有可获取镜像的校验和，而 `SHA256SUMS.gpg` 文件则是这个文件的 GnuPG 签名。在下面的步骤中，我们将使用这个签名文件来 **验证** 校验和文件。

下载 Ubuntu 的 ISO 镜像文件以及刚才提到的那两个文件，然后将它们放到同一目录下，例如这里的 `ISO` 目录：

```
$ ls ISO/
SHA256SUMS SHA256SUMS.gpg ubuntu-18.04.2-live-server-amd64.iso
```

如你所见，我已经下载了 Ubuntu 18.04.2 LTS 服务器版本的镜像，以及对应的校验和文件和签名文件。

#### 下载有效的签名秘钥

现在，使用下面的命令来下载正确的签名秘钥：

```
$ gpg --keyid-format long --keyserver hkp://keyserver.ubuntu.com --recv-keys 0x46181433FBB75451 0xD94AA3F0EFE21092
```

示例输出如下：

```
gpg: key D94AA3F0EFE21092: 57 signatures not checked due to missing keys
gpg: key D94AA3F0EFE21092: public key "Ubuntu CD Image Automatic Signing Key (2012) <[email protected]>" imported
gpg: key 46181433FBB75451: 105 signatures not checked due to missing keys
gpg: key 46181433FBB75451: public key "Ubuntu CD Image Automatic Signing Key <[email protected]>" imported
gpg: no ultimately trusted keys found
gpg: Total number processed: 2
gpg: imported: 2
```

#### 验证 SHA-256 校验和

接下来我们将使用签名来验证校验和文件：

```
$ gpg --keyid-format long --verify SHA256SUMS.gpg SHA256SUMS
```

下面是示例输出：

```
gpg: Signature made Friday 15 February 2019 04:23:33 AM IST
gpg: using DSA key 46181433FBB75451
gpg: Good signature from "Ubuntu CD Image Automatic Signing Key <[email protected]>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg: There is no indication that the signature belongs to the owner.
Primary key fingerprint: C598 6B4F 1257 FFA8 6632 CBA7 4618 1433 FBB7 5451
gpg: Signature made Friday 15 February 2019 04:23:33 AM IST
gpg: using RSA key D94AA3F0EFE21092
gpg: Good signature from "Ubuntu CD Image Automatic Signing Key (2012) <[email protected]>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg: There is no indication that the signature belongs to the owner.
Primary key fingerprint: 8439 38DF 228D 22F7 B374 2BC0 D94A A3F0 EFE2 1092
```

假如你在输出中看到 `Good signature` 字样，那么该校验和文件便是由 Ubuntu 开发者制作的，并且由秘钥文件的所属者签名认证。

#### 检验下载的 ISO 文件

下面让我们继续检查下载的 ISO 文件是否和所给的校验和相匹配。为了达到该目的，只需要运行：

```
$ sha256sum -c SHA256SUMS 2>&1 | grep OK
ubuntu-18.04.2-live-server-amd64.iso: OK
```

假如校验和是匹配的，你将看到 `OK` 字样，这意味着下载的文件是合法的，没有被改变或篡改过。

假如你没有获得类似的输出，或者看到不同的输出，则该 ISO 文件可能已经被修改过或者没有被正确地下载。你必须从一个更好的下载源重新下载该文件。

某些 Linux 发行版已经在它的下载页面中包含了校验和。例如 Pop!_os 的开发者在他们的下载页面中提供了所有 ISO 镜像的 SHA-256 校验和，这样你就可以快速地验证这些 ISO 镜像。

![Pop os 位于其下载页面中的 SHA256 校验和][5]

在下载完 ISO 镜像文件后，可以使用下面的命令来验证它们：

```
$ sha256sum Soft_backup/ISOs/pop-os_18.04_amd64_intel_54.iso
```

示例输出如下：

```
680e1aa5a76c86843750e8120e2e50c2787973343430956b5cbe275d3ec228a6 Soft_backup/ISOs/pop-os_18.04_amd64_intel_54.iso
```

![Pop os 的 SHA256 校验和的值][6]

在上面的输出中，以 `680elaa` 开头的部分为 SHA-256 校验和的值。请将该值与位于下载页面中提供的 SHA-256 校验和的值进行比较，如果这两个值相同，那说明这个下载的 ISO 文件是合法的，与它的原有状态相比没有经过更改或者篡改。万事俱备，你可以进行下一步了！

上面的内容便是我们如何在 Linux 中验证一个 ISO 文件的可靠性和完整性的方法。无论你是从官方站点或者第三方站点下载 ISO 文件，我们总是推荐你在使用它们之前做一次简单的快速验证。希望本篇的内容对你有所帮助。

参考文献：

* [https://tutorials.ubuntu.com/tutorial/tutorial-how-to-verify-ubuntu][7]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-verify-iso-images-in-linux/

作者：[sk][a]
选题：[lujun9972][b]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/07/Verify-ISO-Images-In-Linux-720x340.png
[2]: https://www.ostechnix.com/etcher-beauitiful-app-create-bootable-sd-cards-usb-drives/
[3]: https://blog.linuxmint.com/?p=2994
[4]: https://www.ostechnix.com/wp-content/uploads/2019/07/Ubuntu-18.04-checksum-and-signature.png
[5]: https://www.ostechnix.com/wp-content/uploads/2019/07/Pop-os-SHA256-sum.png
[6]: https://www.ostechnix.com/wp-content/uploads/2019/07/Pop-os-SHA256-sum-value.png
[7]: https://tutorials.ubuntu.com/tutorial/tutorial-how-to-verify-ubuntu
