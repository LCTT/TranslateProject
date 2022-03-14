[#]: subject: "Using GPG to Encrypt and Decrypt Files on Linux [Hands-on for Beginners]"
[#]: via: "https://itsfoss.com/gpg-encrypt-files-basic/"
[#]: author: "Hunter Wittenborn https://itsfoss.com/author/hunter/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14082-1.html"

手把手指导：在 Linux 上使用 GPG 加解密文件
======

![](https://img.linux.net.cn/data/attachment/album/202112/15/133531wcs1iy4luihr3beg.jpg)

[GnuPG][1]，俗称 GPG，是一个非常通用的工具，被广泛用作电子邮件、信息、文件或任何你需要安全地发送给别人的东西的加密行业标准。

学习使用 GPG 很容易，你可以在几分钟内就学会使用它。

在本教程中，我将告诉你如何用 GPG 加密和解密文件。这是一个简单的教程，你可以在你的 Linux 系统上尝试所有的练习。这将帮助你练习 GPG 命令，并在你完全陌生的情况下理解它。

请先阅读整个教程，然后开始自己做。

### GPG 是如何进行加密的？

![GPG 加密][2]

要使用 GPG，你首先需要有一个 GPG 密钥。

GPG 密钥是你在后面的教程中用来加密（或解密）文件的东西。它也是用来识别你的身份的，你的名字和电子邮件也会与密钥绑定。

GPG 密钥的工作原理是使用两个文件，一个私钥和一个公钥。这两个密钥是相互联系的，并且 GPG 的所有功能都需要使用它们，特别是对文件加密和解密。

当你用 GPG 加密一个文件时，它使用的是私钥。然后，这个新的加密文件**只能**用配对的公钥进行解密。

私钥，顾名思义，是以私下的、不给任何人看的方式来存储的密钥。

另一方面，公钥是用来给其他人的，或者你希望能够解密你的文件的任何人。

这就是 GPG 的加密方法的主要作用。它允许你对文件进行本地加密，然后允许其他人确保他们收到的文件实际上是由你发送的。因为他们能够解密文件的唯一方法是使用你的公钥，而这只有在文件首先使用你的私钥加密的情况下才有效。

**反之**，其他人可以用你的公钥对文件进行加密，而唯一能够解密的方法是用你的私钥。因此，允许其他人公开发布文件，而不用担心除了你以外的人能够阅读它们。（LCTT 译注：另外一个常见的用例是你用你的私钥对公开发布的文件进行签名，别人使用你的公钥通过验证你的签名而确信文件是你发布的、并没有被篡改。但本文没有涉及这个用例。）

换句话说，如果一个文件是用私钥加密的，它只能用相应的公钥解密。而如果一个文件是用公钥加密的，它只能用相应的私钥解密。

#### 你已经在使用 GPG 而没有意识到

一个最常见的使用 GPG 的例子是在 Linux 软件包管理器中，特别是 [外部仓库][3]。你把开发者的公钥添加到你系统的可信密钥中。开发者用他/她的私钥签署软件包（生成签名）。由于你的 Linux 系统拥有该公钥文件，它就能理解该软件包实际上是来自受信任的开发者。

许多加密服务在你没有意识到的情况下使用了某种 GPG 的实现。但现在最好不要去研究这些细节。

现在你对这个概念有点熟悉了，让我们看看如何使用 GPG 来加密一个文件，然后用它来解密。

### 用 GPG 对文件进行加密和解密

![][4]

这是一个非常简单的场景。我假定你只有一个系统，你想看看 GPG 是如何工作的。你并没有把文件发送到其他系统。你对文件进行加密，然后在同一个系统上解密。

当然，这不是一个实际的用例，但这也不是本教程的目的。我的目的是让你熟悉 GPG 命令和功能。之后，你可以在现实世界中使用这些知识（如果需要的话）。为此，我将告诉你如何与他人分享你的公钥。

#### 第一步：安装 GPG

GPG 可以在大多数发行版的软件库中找到，开箱即用。

在基于 Debian 和 Ubuntu 的系统中，安装 `gpg` 包：

```
sudo apt install gpg
```

如果你使用 [基于 Arch 的发行版][5]，用 [pacman 命令][6] 安装 `gnupg` 软件包：

```
sudo pacman -S gnupg
```

#### 第二步：生成一个 GPG 密钥

在你的系统上生成一个 GPG 密钥只需要一条简单的命令。

只要运行下面的命令，就会生成你的密钥（你可以对大多数问题使用默认值，如下面的下划线部分所示）。

```
gpg --full-generate-key
```

![生成 GPG 密钥][7]

**检查 GPG 密钥**

然后你可以通过使用 `--list-secret-keys` 和 `--list-public-keys` 参数，分别看到私钥和公钥都是通过 `pub` 下显示的那个 ID 相互绑定的。

![列出 GPG 密钥][8]

#### 第三步：用 GPG 加密一个文件

现在你已经设置了 GPG 密钥，你可以开始对我们的文件进行加密了。

使用下面的命令来加密文件：

```
gpg --encrypt --output file.gpg --recipient user@example.com file
```

让我们快速浏览一下该命令的内容：

首先，你指定了 `—encrypt` 选项。这告诉 GPG，我们将对一个文件进行加密。

接下来，你指定了 `--output file.gpg`。这可以是任何名字，不过惯例是给你要加密的文件的名称加上 `.gpg` 扩展名（所以 `message.txt` 会变成 `message.txt.gpg`）。

接下来，你输入 `—recipient user@example.com`。这指定了一个相应的 GPG 密钥的电子邮件，这个密钥实际上在这个系统上还不存在。

有点迷惑？

工作原理是，你在这里指定的电子邮件必须与你本地系统中的公钥相联系。

通常情况下，这将是来自另外一个人的 GPG 公钥，你要用它来加密你的文件。之后，该文件将只能用该用户的私钥进行解密。

在这个例子中，我将使用我以前的与 `user@example.com` 关联的 GPG 密钥。因此，其逻辑是，我用 `user@example.com` 的 _公钥_ 对文件进行加密，然后只能用 `user@example.com` 的 _私钥_ 进行解密。

如果你是为别人加密文件，你只有该公钥，但由于你是为自己加密文件，你的系统上有这两个密钥。

最后，你只需指定你要加密的文件。在这个例子中，让我们使用一个名为 `message.txt` 的文件，内容如下：

```
We're encrypting with GPG!
```

![文本文件样本][10]

同样地，如果电子邮件是 `user@example.com`，新的 GPG 命令将如下所示：

```
gpg --encrypt --output message.txt.gpg --recipient user@example.com message.txt
```

![用 GPG 加密文件][11]

如果你尝试阅读该文件，你会看到它看起来像乱码。这是预料之中的，因为该文件现在已经被加密了。

![读取加密文件会产生乱码][12]

现在让我们删除未加密的 `message.txt` 文件，这样你就可以看到 `message.txt.gpg` 文件实际上在没有原始文件的情况下也能正常解密。

![][13]

#### 第四步：用 GPG 解密加密的文件

最后，让我们来实际解密加密的信息。你可以用下面的命令来做。

```
gpg --decrypt --output file file.gpg
```

通过这里的参数，我们首先指定 `—decrypt`，它告诉 GPG 你将会解密一个文件。

接下来，你输入 `—output` 文件，这只是告诉 GPG，在你解密后，你将把我们文件的解密形式保存到哪个文件。

最后，你输入 `file.gpg`，这是你的加密文件的路径。

按照这个例子，我使用的命令是这样的。

```
gpg --decrypt --output message.txt message.txt.gpg
```

![用GPG解密文件][14]

然后就完成了！当你想用 GPG 加密和解密文件时，这就是全部内容了。

剩下你可能想知道的是如何与他人分享你的公钥，以便他们在将文件发送给你之前对其进行加密。

### 发送和接收 GPG 密钥

要给别人发送一个 GPG 密钥，你首先需要从你的**钥匙链**中导出它，它包含了你所有的公钥和私钥。

要导出一个密钥，只需在你的钥匙链中找到密钥的 ID，然后运行以下命令，用密钥的 ID 替换 `id`，用你想保存的文件名替换 `key.gpg`。

```
gpg --output key.gpg --export id
```

![导出 GPG 公钥][15]

要导入一个密钥，只需把输出文件（来自前面的命令）给其他用户，然后让他们运行下面的命令。

```
gpg --import key.gpg
```

![][16]

但要正常使用该密钥，你需要验证该密钥，以便 GPG 正确地信任它。

这可以通过在其他用户的系统上使用 `--edit-key` 参数来完成，然后对密钥进行签名。

首先运行 `gpg --edit-key id`：

![GPG 编辑密钥][17]

接下来，使用 `—fpr` 参数，它将显示密钥的指纹。这个命令的输出应该与你自己机器上的输出进行验证，这可以通过在你的系统上运行同样的 `--edit-key` 参数来找到。

![GPG 密钥的指纹][18]

如果一切吻合，只需使用 `—sign` 参数，一切就可以开始了。

![签署 GPG 密钥][19]

就是这样！其他用户现在可以开始用你的公钥加密文件了，就像你之前做的那样，这可以确保它们只有在你用你的私钥解密时才能被你读取。

这就是使用 GPG 的所有基础知识！

### 总结

现在你已经了解了开始使用 GPG 所需要的一切，包括为自己和他人加密文件。正如我前面提到的，这只是为了了解 GPG 的加密和解密过程是如何工作的。你刚刚获得的基本 GPG 知识在应用于真实世界的场景中时可以更上一层楼。

还需要一些帮助来弄清楚一些东西，或者有一些不工作的东西？欢迎在下面的评论中留下任何内容。

--------------------------------------------------------------------------------

via: https://itsfoss.com/gpg-encrypt-files-basic/

作者：[Hunter Wittenborn][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/hunter/
[b]: https://github.com/lujun9972
[1]: https://gnupg.org/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/GPG-encryption-explained.png?resize=800%2C300&ssl=1
[3]: https://itsfoss.com/adding-external-repositories-ubuntu/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/GPG-encryption-basic.png?resize=800%2C450&ssl=1
[5]: https://itsfoss.com/arch-based-linux-distros/
[6]: https://itsfoss.com/pacman-command/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-key-generation.png?resize=676%2C663&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-list-keys-1.png?resize=703%2C379&ssl=1
[9]: https://itsfoss.com/cdn-cgi/l/email-protection
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-example-message.png?resize=665%2C277&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-example-message-encrypted-800x252.png?resize=800%2C252&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-example-message-encrypted-gibberish.png?resize=800%2C252&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-message-original-deleted.png?resize=800%2C252&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-message-decrypt.png?resize=800%2C252&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-key-export-800x218.png?resize=800%2C218&ssl=1
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-key-import.png?resize=800%2C221&ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-edit-key-prompt.png?resize=800%2C351&ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-edit-key-fingerprint-1.png?resize=800%2C317&ssl=1
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-edit-key-sign.png?resize=800%2C531&ssl=1
