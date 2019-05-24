toplip：一款十分强大的文件加密解密 CLI 工具
======
![](https://www.ostechnix.com/wp-content/uploads/2017/12/Toplip-720x340.jpg)

在市场上能找到许多用来保护文件的文档加密工具。我们已经介绍过其中一些例如 [Cryptomater][1]、[Cryptkeeper][2]、[CryptGo][3]、[Cryptr][4]、[Tomb][5]，以及 [GnuPG][6] 等加密工具。今天我们将讨论另一款叫做 “toplip” 的命令行文件加密解密工具。它是一款使用一种叫做 [AES256][7] 的强大加密方法的自由开源的加密工具。它同时也使用了 XTS-AES 设计以保护你的隐私数据。它还使用了 [Scrypt][8]，一种基于密码的密钥生成函数来保护你的密码免于暴力破解。

### 优秀的特性

相比于其它文件加密工具，toplip 自带以下独特且杰出的特性。

  * 非常强大的基于 XTS-AES256 的加密方法。
  * <ruby>合理的推诿<rt>Plausible deniability</rt></ruby>。
  * 加密并嵌入文件到图片（PNG/JPG）中。
  * 多重密码保护。
  * 可防护直接暴力破解。
  * 无可辨识的输出标记。
  * 开源（GPLv3）。

### 安装 toplip

没有什么需要安装的。`toplip` 是独立的可执行二进制文件。你所要做的仅是从 [产品官方页面][9] 下载最新版的 `toplip` 并赋予它可执行权限。为此你只要运行：

```
chmod +x toplip
```

### 使用

如果你不带任何参数运行 `toplip`，你将看到帮助页面。

```
./toplip
```

![][10]

请允许我给你展示一些例子。

为了达到指导目的，我建了两个文件 `file1` 和 `file2`。我同时也有 `toplip` 可执行二进制文件。我把它们全都保存进一个叫做 `test` 的目录。

![][12]

#### 加密/解密单个文件

现在让我们加密 `file1`。为此，运行：

```
./toplip file1 > file1.encrypted
```

这行命令将让你输入密码。一旦你输入完密码，它就会加密 `file1` 的内容并将它们保存进你当前工作目录下一个叫做 `file1.encrypted` 的文件。

上述命令行的示例输出将会是这样：

```
This is toplip v1.20 (C) 2015, 2016 2 Ton Digital. Author: Jeff Marrison A showcase piece for the HeavyThing library. Commercial support available Proudly made in Cooroy, Australia. More info: https://2ton.com.au/toplip file1 Passphrase #1: generating keys...Done 
Encrypting...Done
```

为了验证文件是否的确经过加密，试着打开它你会发现一些随机的字符。

为了解密加密过的文件，像以下这样使用 `-d` 参数：

```
./toplip -d file1.encrypted
```

这行命令会解密提供的文档并在终端窗口显示内容。

为了保存文档而不是写入到标准输出，运行：

```
./toplip -d file1.encrypted > file1.decrypted
```

输入正确的密码解密文档。`file1.encrypted` 的所有内容将会存入一个叫做 `file1.decrypted` 的文档。

请不要用这种命名方法，我这样用仅仅是为了便于理解。使用其它难以预测的名字。

#### 加密/解密多个文件

现在我们将使用两个分别的密码加密每个文件。

```
./toplip -alt file1 file2 > file3.encrypted
```

你会被要求为每个文件输入一个密码，使用不同的密码。

上述命令行的示例输出将会是这样：

```
This is toplip v1.20 (C) 2015, 2016 2 Ton Digital. Author: Jeff Marrison A showcase piece for the HeavyThing library. Commercial support available Proudly made in Cooroy, Australia. More info: https://2ton.com.au/toplip 
file2 Passphrase #1 : generating keys...Done 
file1 Passphrase #1 : generating keys...Done 
Encrypting...Done
```

上述命令所做的是加密两个文件的内容并将它们保存进一个单独的叫做 `file3.encrypted` 的文件。在保存中分别给予各自的密码。比如说如果你提供 `file1` 的密码，`toplip` 将复原 `file1`。如果你提供 `file2` 的密码，`toplip` 将复原 `file2`。

每个 `toplip` 加密输出都可能包含最多四个单独的文件，并且每个文件都建有各自独特的密码。由于加密输出放在一起的方式，一下判断出是否存在多个文档不是一件容易的事。默认情况下，甚至就算确实只有一个文件是由 `toplip` 加密，随机数据都会自动加上。如果指定了多于一个文件，每个都有自己的密码，那么你可以有选择性地独立解码每个文件，以此来否认其它文件存在的可能性。这能有效地使一个用户在可控的暴露风险下打开一个加密的捆绑文件包。并且对于敌人来说，在计算上没有一种低廉的办法来确认额外的秘密数据存在。这叫做“<ruby>合理的推诿<rt>Plausible deniability</rt></ruby>”，是 toplip 著名的特性之一。

为了从 `file3.encrypted` 解码 `file1`，仅需输入：

```
./toplip -d file3.encrypted > file1.encrypted
```

你将会被要求输入 `file1` 的正确密码。

为了从 `file3.encrypted` 解码 `file2`，输入：

```
./toplip -d file3.encrypted > file2.encrypted
```

别忘了输入 `file2` 的正确密码。

#### 使用多重密码保护

这是我中意的另一个炫酷特性。在加密过程中我们可以为单个文件提供多重密码。这样可以保护密码免于暴力尝试。

```
./toplip -c 2 file1 > file1.encrypted
```

这里，`-c 2` 代表两个不同的密码。上述命令行的示例输出将会是这样：

```
This is toplip v1.20 (C) 2015, 2016 2 Ton Digital. Author: Jeff Marrison A showcase piece for the HeavyThing library. Commercial support available Proudly made in Cooroy, Australia. More info: https://2ton.com.au/toplip 
file1 Passphrase #1: generating keys...Done
file1 Passphrase #2: generating keys...Done 
Encrypting...Done
```

正如你在上述示例中所看到的，`toplip` 要求我输入两个密码。请注意你必须提供两个不同的密码，而不是提供两遍同一个密码。

为了解码这个文件，这样做：

```
$ ./toplip -c 2 -d file1.encrypted > file1.decrypted 
This is toplip v1.20 (C) 2015, 2016 2 Ton Digital. Author: Jeff Marrison A showcase piece for the HeavyThing library. Commercial support available Proudly made in Cooroy, Australia. More info: https://2ton.com.au/toplip 
file1.encrypted Passphrase #1: generating keys...Done
file1.encrypted Passphrase #2: generating keys...Done
Decrypting...Done
```

#### 将文件藏在图片中

将一个文件、消息、图片或视频藏在另一个文件里的方法叫做隐写术。幸运的是 `toplip` 默认包含这个特性。

为了将文件藏入图片中，像如下所示的样子使用 `-m` 参数。

```
$ ./toplip -m image.png file1 > image1.png
This is toplip v1.20 (C) 2015, 2016 2 Ton Digital. Author: Jeff Marrison A showcase piece for the HeavyThing library. Commercial support available Proudly made in Cooroy, Australia. More info: https://2ton.com.au/toplip 
file1 Passphrase #1: generating keys...Done 
Encrypting...Done
```

这行命令将 `file1` 的内容藏入一张叫做 `image1.png` 的图片中。

要解码，运行：

```
$ ./toplip -d image1.png > file1.decrypted This is toplip v1.20 (C) 2015, 2016 2 Ton Digital. Author: Jeff Marrison A showcase piece for the HeavyThing library. Commercial support available Proudly made in Cooroy, Australia. More info: https://2ton.com.au/toplip 
image1.png Passphrase #1: generating keys...Done 
Decrypting...Done
```

#### 增加密码复杂度

为了进一步使文件变得难以破译，我们可以像以下这样增加密码复杂度：

```
./toplip -c 5 -i 0x8000 -alt file1 -c 10 -i 10 file2 > file3.encrypted
```

上述命令将会要求你为 `file1` 输入十条密码，为 `file2` 输入五条密码，并将它们存入单个叫做 `file3.encrypted` 的文件。如你所注意到的，我们在这个例子中又用了另一个 `-i` 参数。这是用来指定密钥生成循环次数。这个选项覆盖了 `scrypt` 函数初始和最终 PBKDF2 阶段的默认循环次数 1。十六进制和十进制数值都是允许的。比如说 `0x8000`、`10` 等。请注意这会大大增加计算次数。

为了解码 `file1`，使用：

```
./toplip -c 5 -i 0x8000 -d file3.encrypted > file1.decrypted
```

为了解码 `file2`，使用：

```
./toplip -c 10 -i 10 -d file3.encrypted > file2.decrypted
```

参考 `toplip` [官网](https://2ton.com.au/toplip/)以了解更多关于其背后的技术信息和使用的加密方式。

我个人对所有想要保护自己数据的人的建议是，别依赖单一的方法。总是使用多种工具/方法来加密文件。不要在纸上写下密码也不要将密码存入本地或云。记住密码，阅后即焚。如果你记不住，考虑使用任何了信赖的密码管理器。

- [KeeWeb – An Open Source, Cross Platform Password Manager](https://www.ostechnix.com/keeweb-an-open-source-cross-platform-password-manager/)
- [Buttercup – A Free, Secure And Cross-platform Password Manager](https://www.ostechnix.com/buttercup-a-free-secure-and-cross-platform-password-manager/)
- [Titan – A Command line Password Manager For Linux](https://www.ostechnix.com/titan-command-line-password-manager-linux/)

今天就到此为止了，更多好东西后续推出，请保持关注。

顺祝时祺！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/toplip-strong-file-encryption-decryption-cli-utility/

作者：[SK][a]
译者：[tomjlw](https://github.com/tomjlw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/cryptomator-open-source-client-side-encryption-tool-cloud/
[2]:https://www.ostechnix.com/how-to-encrypt-your-personal-foldersdirectories-in-linux-mint-ubuntu-distros/
[3]:https://www.ostechnix.com/cryptogo-easy-way-encrypt-password-protect-files/
[4]:https://www.ostechnix.com/cryptr-simple-cli-utility-encrypt-decrypt-files/
[5]:https://www.ostechnix.com/tomb-file-encryption-tool-protect-secret-files-linux/
[6]:https://www.ostechnix.com/an-easy-way-to-encrypt-and-decrypt-files-from-commandline-in-linux/
[7]:http://en.wikipedia.org/wiki/Advanced_Encryption_Standard
[8]:http://en.wikipedia.org/wiki/Scrypt
[9]:https://2ton.com.au/Products/
[10]:https://www.ostechnix.com/wp-content/uploads/2017/12/toplip-2.png
[12]:https://www.ostechnix.com/wp-content/uploads/2017/12/toplip-1.png

