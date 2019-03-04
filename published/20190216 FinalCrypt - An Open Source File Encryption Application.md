[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10588-1.html)
[#]: subject: (FinalCrypt – An Open Source File Encryption Application)
[#]: via: (https://itsfoss.com/finalcrypt/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

FinalCrypt：一个开源文件加密应用
======

我通常不会加密文件，但如果我打算整理我的重要文件或凭证，加密程序就会派上用场。

你可能已经在使用像 [GnuPG][1] 这样的程序来帮助你加密/解密 Linux 上的文件。还有 [EncryptPad][2] 也可以加密你的笔记。

但是，我看到了一个名为 FinalCrypt 的新的免费开源加密工具。你可以在 [GitHub 页面][3]上查看其最新的版本和源码。

在本文中，我将分享使用此工具的经验。请注意，我不会将它与其他程序进行比较 —— 因此，如果你想要多个程序之间的详细比较，请在评论中告诉我们。

![FinalCrypt][4]

### 使用 FinalCrypt 加密文件

FinalCrypt 使用[一次性密码本][5]密钥生成密码来加密文件。换句话说，它会生成一个 OTP 密钥，你将使用该密钥加密或解密你的文件。

根据你指定的密钥大小，密钥是完全随机的。因此，没有密钥文件就无法解密文件。

虽然 OTP 密钥用于加密/解密简单而有效，但管理或保护密钥文件对某些人来说可能是不方便的。

如果要使用 FinalCrypt，可以从它的网站下载 DEB/RPM 文件。FinalCrypt 也可用于 Windows 和 macOS。

- [下载 FinalCrypt](https://sites.google.com/site/ronuitholland/home/finalcrypt)

下载后，只需双击该 [deb][6] 或 rpm 文件就能安装。如果需要，你还可以从源码编译。

### 使用 FileCrypt

该视频演示了如何使用FinalCrypt：

<https://youtu.be/6Ir8VcZ26E4>

如果你喜欢 Linux 相关的视频，请[订阅我们的 YouTube 频道][7]。

安装 FinalCrypt 后，你将在已安装的应用列表中找到它。从这里启动它。

启动后，你将看到（分割的）两栏，一个进行加密/解密，另一个选择 OTP 文件。

![Using FinalCrypt for encrypting files in Linux][8]

首先，你必须生成 OTP 密钥。下面是做法：

![finalcrypt otp][9]

请注意你的文件名可以是任何内容 —— 但你需要确保密钥文件的大小大于或等于要加密的文件。我觉得这很荒谬，但事实就是如此。

![][10]

生成文件后，选择窗口右侧的密钥，然后选择要在窗口左侧加密的文件。

生成 OTP 后，你会看到高亮显示的校验和、密钥文件大小和有效状态：

![][11]

选择之后，你只需要点击 “Encrypt” 来加密这些文件，如果已经加密，那么点击 “Decrypt” 来解密这些文件。

![][12]

你还可以在命令行中使用 FinalCrypt 来自动执行加密作业。

#### 如何保护你的 OTP 密钥？

加密/解密你想要保护的文件很容易。但是，你应该在哪里保存你的 OTP 密钥？

如果你未能将 OTP 密钥保存在安全的地方，那么它几乎没用。

嗯，最好的方法之一是使用专门的 USB 盘保存你的密钥。只需要在解密文件时将它插入即可。

除此之外，如果你认为足够安全，你可以将密钥保存在[云服务][13]中。

有关 FinalCrypt 的更多信息，请访问它的网站。

[FinalCrypt](https://sites.google.com/site/ronuitholland/home/finalcrypt)

### 总结

它开始时看上去有点复杂，但它实际上是 Linux 中一个简单且用户友好的加密程序。如果你想看看其他的，还有一些其他的[加密保护文件夹][14]的程序。

你如何看待 FinalCrypt？你还知道其他类似可能更好的程序么？请在评论区告诉我们，我们将会查看的！


--------------------------------------------------------------------------------

via: https://itsfoss.com/finalcrypt/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.gnupg.org/
[2]: https://itsfoss.com/encryptpad-encrypted-text-editor-linux/
[3]: https://github.com/ron-from-nl/FinalCrypt
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/finalcrypt.png?resize=800%2C450&ssl=1
[5]: https://en.wikipedia.org/wiki/One-time_pad
[6]: https://itsfoss.com/install-deb-files-ubuntu/
[7]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/finalcrypt.jpg?fit=800%2C439&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/finalcrypt-otp-key.jpg?resize=800%2C443&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/finalcrypt-otp-generate.jpg?ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/finalcrypt-key.jpg?fit=800%2C420&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/finalcrypt-encrypt.jpg?ssl=1
[13]: https://itsfoss.com/cloud-services-linux/
[14]: https://itsfoss.com/password-protect-folder-linux/
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/finalcrypt.png?fit=800%2C450&ssl=1
