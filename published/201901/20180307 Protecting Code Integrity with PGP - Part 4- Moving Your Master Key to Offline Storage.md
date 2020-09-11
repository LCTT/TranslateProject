用 PGP 保护代码完整性（四）：将主密钥移到离线存储中
======
> 如果开发者的 PGP 密钥被偷了，危害非常大。了解一下如何更安全。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/industry-1920.jpg?itok=gI3QraS8)

在本系列教程中，我们为使用 PGP 提供了一个实用指南。你可以从下面的链接中查看前面的文章：

- [第一部分：基本概念和工具][1]
- [第二部分：生成你的主密钥][2]
- [第三部分：生成 PGP 子密钥][3]

这是本系列教程的第四部分，我们继续本教程，我们将谈一谈如何及为什么要将主密钥从你的家目录移到离线存储中。现在开始我们的教程。

#### 清单

  * 准备一个加密的可移除的存储（必要）
  * 备份你的 GnuPG 目录（必要）
  * 从你的家目录中删除主密钥（推荐）
  * 从你的家目录中删除吊销证书（推荐）

#### 考虑事项

为什么要从你的家目录中删除你的主 [C] 密钥 ？这样做的主要原因是防止你的主密钥失窃或意外泄露。对于心怀不轨的人来说，私钥对他们具有很大的诱惑力 —— 我们知道有几个恶意软件成功地实现了扫描用户的家目录并将发现的私钥内容上传。

对于开发者来说，私钥失窃是非常危险的事情 —— 在自由软件的世界中，这无疑是身份证明失窃。从你的家目录中删除私钥将帮你防范这类事件的发生。

#### 备份你的 GnuPG 目录

**!!!绝对不要跳过这一步!!!**

备份你的 PGP 密钥将让你在需要的时候很容易地恢复它们，这很重要！（这与我们做的使用 paperkey 的灾难级备份是不一样的）。

#### 准备可移除的加密存储

我们从取得一个（最好是两个）小型的 USB “拇指“ 驱动器（可加密 U 盘）开始，我们将用它来做备份。你首先需要去加密它们：

加密密码可以使用与主密钥相同的密码。

#### 备份你的 GnuPG 目录

加密过程结束之后，重新插入 USB 驱动器并确保它能够正常挂载。你可以通过运行 `mount` 命令去找到设备挂载点的完全路径。（在 Linux 下，外置介质一般挂载在 `/media/disk` 下，Mac 一般在它的 `/Volumes` 下）

你知道了挂载点的全路径后，将你的整个 GnuPG 的目录复制进去：

```
$ cp -rp ~/.gnupg [/media/disk/name]/gnupg-backup
```

（注意：如果出现任何套接字不支持的错误，没有关系，直接忽略它们。）

现在，用如下的命令去测试一下，确保它们能够正常地工作：

```
$ gpg --homedir=[/media/disk/name]/gnupg-backup --list-key [fpr]
```

如果没有出现任何错误，说明一切正常。弹出这个 USB 驱动器并给它粘上一个明确的标签，以便于你下次需要它时能够很快找到它。接着，将它放到一个安全的 —— 但不要太远 —— 的地方，因为从现在起，你需要偶尔使用它来做一些像编辑身份信息、添加或吊销子证书、或签署其它人的密钥这样的事情。

#### 删除主密钥

我们家目录中的文件并没有像我们所想像的那样受到保护。它们可能会通过许多不同的方式被泄露或失窃：

  * 通过快速复制来配置一个新工作站时的偶尔事故
  * 通过系统管理员的疏忽或恶意操作
  * 通过安全性欠佳的备份
  * 通过桌面应用中的恶意软件（浏览器、pdf 查看器等等）
  * 通过跨境胁迫

使用一个很好的密码来保护你的密钥是降低上述风险的一个很好方法，但是密码能够通过键盘记录器、背后窥视、或其它方式被发现。基于以上原因，我们建议去配置一个从你的家目录上可移除的主密钥，将它保存在一个离线存储中。

##### 删除你的主密钥

**请查看前面的节，确保你有完整的你的 GnuPG 目录的一个备份。如果你没有一个可用的备份，下面所做的操作将会使你的主密钥失效！！！**

首先，识别你的主密钥的 keygrip：

```
$ gpg --with-keygrip --list-key [fpr]
```

它的输出应该像下面这样：

```
pub   rsa4096 2017-12-06 [C] [expires: 2019-12-06]
     111122223333444455556666AAAABBBBCCCCDDDD
     Keygrip = AAAA999988887777666655554444333322221111
uid           [ultimate] Alice Engineer <alice@example.org>
uid           [ultimate] Alice Engineer <allie@example.net>
sub   rsa2048 2017-12-06 [E]
     Keygrip = BBBB999988887777666655554444333322221111
sub   rsa2048 2017-12-06 [S]
     Keygrip = CCCC999988887777666655554444333322221111
```

找到 `pub` 行下方的 `Keygrip` 条目（就在主密钥指纹的下方）。它与你的家目录下 `.gnupg` 目录下的一个文件是一致的：

```
$ cd ~/.gnupg/private-keys-v1.d
$ ls
AAAA999988887777666655554444333322221111.key
BBBB999988887777666655554444333322221111.key
CCCC999988887777666655554444333322221111.key
```

现在你做的全部操作就是简单地删除与主密钥 keygrip 一致的 `.key` 文件：

```
$ cd ~/.gnupg/private-keys-v1.d
$ rm AAAA999988887777666655554444333322221111.key
```

现在，如果运行 `--list-secret-keys` 命令将出现问题，它将显示主密钥丢失（`#` 表示不可用）：

```
$ gpg --list-secret-keys
sec# rsa4096 2017-12-06 [C] [expires: 2019-12-06]
 111122223333444455556666AAAABBBBCCCCDDDD
uid [ultimate] Alice Engineer <alice@example.org>
uid [ultimate] Alice Engineer <allie@example.net>
ssb rsa2048 2017-12-06 [E]
ssb rsa2048 2017-12-06 [S]
```

#### 删除吊销证书

你应该去删除的另一个文件是吊销证书（**删除之前，确保你的备份中有它**），它是使用你的主密钥自动创建的。吊销证书允许一些人去永久标记你的证书为吊销状态，这意味着它无论在任何用途中将不再被使用或信任。一般是使用它来吊销由于某些原因不再受控的一个密钥 —— 比如，你丢失了密钥密码。

与使用主密钥一样，如果一个吊销证书泄露到恶意者手中，他们能够使用它去破坏你的开发者数字身份，因此，最好是从你的家目录中删除它。

```
cd ~/.gnupg/openpgp-revocs.d
rm [fpr].rev
```

在下一篇文章中，你将学习如何保护你的子密钥。敬请期待。

从来自 Linux 基金会和 edX 的免费课程 [“Linux 入门”][4] 中学习更多 Linux 知识。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/pgp/2018/3/protecting-code-integrity-pgp-part-4-moving-your-master-key-offline-storage

作者：[Konstantin Ryabitsev][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/mricon
[1]:https://linux.cn/article-9524-1.html
[2]:https://linux.cn/article-9529-1.html
[3]:https://linux.cn/article-9607-1.html
[4]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
