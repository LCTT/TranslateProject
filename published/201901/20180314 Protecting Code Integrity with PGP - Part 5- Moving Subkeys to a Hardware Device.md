用 PGP 保护代码完整性（五）：将子密钥移到一个硬件设备中
======

> 在这个系列教材中，将为你提供使用 PGP 和保护你的私钥的最佳体验。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/pgp-keys.jpg?itok=aS6IWGpq)

在本系列教程中，我们将提供一个使用 PGP 的实用指南。如果你没有看过前面的文章，你可以通过下面的链接去查看。在这篇文章中，我们将继续讨论如何保护你的密钥，谈一谈将你的子密钥移到一个专门的硬件设备中的一些技巧。

- [第一部分：基本概念和工具][1]
- [第二部分：生成你的主密钥][2]
- [第三部分：生成 PGP 子密钥][3]
- [第四部分：将主密钥移到离线存储中][4]

#### 清单

  * 取得一个 GnuPG 兼容的硬件设备（必要）
  * 配置 GnuPG 在设备上工作（必要）
  * 设置用户和管理员的 PIN（必要）
  * 移动子密钥到设备中（必要）

#### 考虑事项

虽然现在主密钥已经不用担心泄露或失窃了，但子密钥仍然在你的家目录中。任何得到它的人都能够解密你的通讯或假冒你的签名（如果他们知道密钥的密码）。并且，每次执行一个 GnuPG 操作都要将密钥加载到操作系统内存中，这将使一些更高级的恶意软件有机会得到你的密钥（想想 Meltdown 和 Spectre）。

完全保护密钥的最好方式就是，将它移到一个专门的硬件设备中，这种硬件设备是一个可操作的智能卡。

##### 智能卡的好处

一个智能卡包含一个加密芯片，它能够存储私钥，并且直接在智能卡内部执行秘密操作。因为密钥内容从来没有离开过智能卡，计算机操作系统并不能检索你插入的智能卡上的私钥。这与前面用于备份目的的加密 USB 存储是不同的 —— 虽然 USB 设备也是插入并解密的，但操作系统是能够去访问私钥内容的。使用外置的加密 USB 介质并不能代替智能卡设备的功能。

智能卡的一些其它好处：

  * 它们很便宜且易于获得
  * 它们小巧且易于携带
  * 它们可以用于多种设备上
  * 它们中的很多都具有防篡改功能（取决于制造商）

#### 可用的智能卡设备

智能卡最初是嵌入到真实钱包大小的卡中，故而得名智能卡。你肯定可以买到并使用 GnuPG 功能的智能卡，并且它们是你能得到的最便宜的可用设备之一。但是，事实上智能卡有一个很重要的缺点：它们需要一个智能卡读卡器，只有极小数的笔记本电脑上有这种读卡器。

由于这个原因，制造商开始推出小型 USB 设备，它的大小和 U 盘类似，内置有微型智能卡，并且在芯片上简单地实现了智能卡协议特性。下面推荐几个这样的设备：

  * [Nitrokey Start][5]：开源硬件和自由软件，可用于 GnuPG 的最便宜的选择之一，但是额外的安全特性很少。
  * [Nitrokey Pro][6]：类似于 Nitrokey Start，它提供防篡改及更多的安全特性（但没有 U2F，具体查看指南的 U2F 节）。
  * [Yubikey 4][7]：专利硬件和软件，但比 Nitrokey Pro 便宜，并且可以用在最新的笔记本电脑上的 USB-C 接口；也提供像 U2F 这样的额外的安全特性。

我们推荐选一个同时具备智能卡功能和 U2F 的设备，在写这篇文章时，只能选择 Yubikey 4。

#### 配置智能卡设备

你的智能卡设备插入任何一台现代的 Linux 或 Mac 工作站上都应该能正常工作。你可以通过运行如下的命令去验证它：

```
$ gpg --card-status
```

如果你没有收到错误，有一个完整的卡列表，就表示一切正常。不幸的是，排除为什么设备不能正常工作的所有可能原因，已经超出了本指南的范围。如果你的智能卡使用 GnuPG 时有问题，请通过你的操作系统的常见支持通道寻求支持。

##### PIN 不一定是数字

注意，尽管名为 “PIN”（暗示你它必须是一个“数字”），不论是用户 PIN 还是管理员 PIN 都不必非要是数字。

当你收到一个新设备时，它可能设置有一个默认的用户和管理员 PIN，对于 Yubikey，它分别是 `123456` 和 `12345678`。如果它们的 PIN 不是默认的，请查看设备附带的说明书。

##### 快速设置

为配置你的智能卡，你需要使用 GnuPG 菜单系统，因此这里并没有更方便的命令行开关：

```
$ gpg --card-edit
[...omitted...]
gpg/card> admin
Admin commands are allowed
gpg/card> passwd
```

你应该去设置用户 PIN (1)、管理员 PIN (3)、和重置码 (4)。请确保把它们记录并保存到一个安全的地方 —— 尤其是管理员 PIN 和重置码（它允许你去擦除整个智能卡内容）。你很少使用到管理员 PIN，因此如果你不记录下来，很可能会忘掉它。

返回到智能卡主菜单，你也可以设置其它值（比如名字、性别、登入日期、等等），但是这些都不是必需的，一旦你的智能卡丢失了，将导致额外的信息泄露。

#### 将子密钥移到你的智能卡中

退出卡菜单（使用 `q` 命令）保存所有更改。接下来，我们将你的子密钥移到智能卡中。将需要用到你的 PGP 密钥的密码，在大多数的智能卡操作中都将用到管理员 PIN。记住，那个 `[fpr]` 表示你的密钥的完整的 40 个字符的指纹。

```
$ gpg --edit-key [fpr]

Secret subkeys are available.

pub  rsa4096/AAAABBBBCCCCDDDD
    created: 2017-12-07  expires: 2019-12-07 usage: C
    trust: ultimate      validity: ultimate
ssb  rsa2048/1111222233334444
    created: 2017-12-07  expires: never usage: E
ssb  rsa2048/5555666677778888
    created: 2017-12-07  expires: never usage: S
[ultimate] (1). Alice Engineer <alice@example.org>
[ultimate] (2)  Alice Engineer <allie@example.net>

gpg>
```

使用 `--edit-key` 再次进入到菜单模式，你将注意到那个密钥清单有一点小差别。从现在开始，所有的命令都是在这个菜单模式下运行，它用 `gpg>` 提示符来表示。

首先，我们来选择移到智能卡中的密钥 —— 你可以通过键入 `key 1`（它表示选择清单中的第一个密钥）来实现：

```
gpg> key 1
```

这个输出会有一点细微的差别：

```
pub  rsa4096/AAAABBBBCCCCDDDD
    created: 2017-12-07  expires: 2019-12-07 usage: C
    trust: ultimate      validity: ultimate
ssb* rsa2048/1111222233334444
    created: 2017-12-07  expires: never usage: E
ssb  rsa2048/5555666677778888
    created: 2017-12-07  expires: never usage: S
[ultimate] (1). Alice Engineer <alice@example.org>
[ultimate] (2)  Alice Engineer <allie@example.net>
```

注意与密钥对应的 `ssb` 行旁边的 `*` —— 它表示这是当前选定的密钥。它是可切换的，意味着如果你再次输入 `key 1`，这个 `*` 将消失，这个密钥将不再被选中。

现在，我们来将密钥移到智能卡中：

```
gpg> keytocard
Please select where to store the key:
  (2) Encryption key
Your selection? 2
```

由于它是我们的 [E] 密钥，把它移到加密区中是有很有意义的。当你提交了你的选择之后，将会被提示输入你的 PGP 密钥的保护密码，接下来输入智能卡的管理员 PIN。如果命令没有返回错误，表示你的密钥已经被移到智能卡中了。

**重要：** 现在再次输入 `key 1` 去取消选中第一个密钥，并输入 `key 2` 去选择 [S] 密钥：

```
gpg> key 1
gpg> key 2
gpg> keytocard
Please select where to store the key:
  (1) Signature key
  (3) Authentication key
Your selection? 1
```

你可以使用 [S] 密钥同时做签名和验证，但是我们希望确保它在签名区，因此，我们选择 (`1`)。完成后，如果你的命令没有返回错误，表示操作已成功。

最后，如果你创建了一个 [A] 密钥，你也可以将它移到智能卡中，但是你需要先取消选中 `key 2`。完成后，选择 `q`：

```
gpg> q
Save changes? (y/N) y
```

保存变更将把你的子密钥移到智能卡后，把你的家目录中的相应子密钥删除（没有关系，因为我们的备份中还有，如果更换了智能卡，你需要再做一遍）。

##### 验证移动后的密钥

现在，如果你执行一个` --list-secret-keys` 操作，你将看到一个稍有不同的输出：

```
$ gpg --list-secret-keys
sec#  rsa4096 2017-12-06 [C] [expires: 2019-12-06]
     111122223333444455556666AAAABBBBCCCCDDDD
uid           [ultimate] Alice Engineer <alice@example.org>
uid           [ultimate] Alice Engineer <allie@example.net>
ssb>  rsa2048 2017-12-06 [E]
ssb>  rsa2048 2017-12-06 [S]
```

在 `ssb>` 的输出中的 `>` 表示子密钥仅在智能卡上有效。如果你进入到你的密钥目录中，查看目录的内容，你将会看到那个 `.key` 文件已经被存根替换：

```
$ cd ~/.gnupg/private-keys-v1.d
$ strings *.key
```

这个输出将包含一个影子私钥，它表示那个文件仅是个存根，真正的内容在智能卡中。

#### 验证智能卡的功能

验证智能卡能否如期正常运行，你可以通过创建一个签名来验证：

```
$ echo "Hello world" | gpg --clearsign > /tmp/test.asc
$ gpg --verify /tmp/test.asc
```

首次运行这个命令时将询问你智能卡的 PIN，在你运行 `gpg —verify` 之后，它将显示 “Good signature”。

祝贺你，你已经成功将窃取你的开发者数字身份变得更加困难了！

#### 其它常见 GnuPG 操作

下面是使用你的 PGP 密钥需要做的一些常见操作的快速指南。

在下面的所有命令中，`[fpr]` 表示你的密钥指纹。

##### 挂载主密钥离线存储

下面的一些操作将需要你的主密钥，因此首先需要去挂载你的主密钥离线存储，并告诉 GnuPG 去使用它。首先，找出介质挂载路径，可以通过查看 `mount` 命令的输出找到它。接着，设置你的 GnuPG 目录为你的介质上备份的目录，并告诉 GnuPG 将那个目录做为它的家目录：

```
$ export GNUPGHOME=/media/disk/name/gnupg-backup
$ gpg --list-secret-keys
```

确保你在输出中看到的是 `sec` 而不是 `sec#`（这个 `#` 表示密钥不可用，仍然使用的是惯常的那个 Home 目录）。

##### 更新你惯常使用的那个 GnuPG 工作目录

在你的离线存储上做了任何更改之后，你应该将这些更改同步应用到你惯常使用的工作目录中：

```
$ gpg --export | gpg --homedir ~/.gnupg --import
$ unset GNUPGHOME
```

##### 延长密钥过期日期

我们创建的主密钥的默认过期日期是自创建之日起两年后。这样做都是为安全考虑，这样将使淘汰密钥最终从密钥服务器上消失。

延长你的密钥过期日期，从当前日期延长一年，只需要运行如下命令：

```
$ gpg --quick-set-expire [fpr] 1y
```

如果为了好记住，你也可以使用一个特定日期（比如，你的生日、1 月 1 日、或加拿大国庆日）：

```
$ gpg --quick-set-expire [fpr] 2020-07-01
```

记得将更新后的密钥发送到密钥服务器：

```
$ gpg --send-key [fpr]
```

##### 吊销身份

如果你需要吊销一个身份（比如，你换了雇主并且旧的邮件地址不再有效了），你可以使用一行命令搞定：

```
$ gpg --quick-revoke-uid [fpr] 'Alice Engineer <aengineer@example.net>'
```

你也可以通过使用 `gpg --edit-key [fpr]` 在菜单模式下完成同样的事情。

完成后，记得将更新后的密钥发送到密钥服务器上：

```
$ gpg --send-key [fpr]
```

下一篇文章中，我们将谈谈 Git 如何支持 PGP 的多级别集成。

通过来自 Linux 基金会和 edX 的免费课程 [“Linux 入门”][8]学习更多 Linux 知识。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/pgp/2018/3/protecting-code-integrity-pgp-part-5-moving-subkeys-hardware-device

作者：[KONSTANTIN RYABITSEV][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/mricon
[1]:https://linux.cn/article-9524-1.html
[2]:https://linux.cn/article-9529-1.html
[3]:https://linux.cn/article-9607-1.html
[4]:https://linux.cn/article-10402-1.html
[5]:https://shop.nitrokey.com/shop/product/nitrokey-start-6
[6]:https://shop.nitrokey.com/shop/product/nitrokey-pro-3
[7]:https://www.yubico.com/product/yubikey-4-series/
[8]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
