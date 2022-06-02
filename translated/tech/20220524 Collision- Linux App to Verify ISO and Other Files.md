[#]: subject: "Collision: Linux App to Verify ISO and Other Files"
[#]: via: "https://www.debugpoint.com/2022/05/collision/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Collision：用于验证 ISO 和其他文件的 Linux 应用
======
本教程概述了 Collision 的功能和使用指南。它是一个基于 GUI 且易于使用的程序，可让你使用加密哈希函数验证文件。

### 为什么需要验证文件？

每个人每天都通过 Internet 下载文件。但许多用户从不费心去验证他们的完整性或真实性。这意味着该文件是否合法且未被任何恶意代码篡改。

以作为标准安装镜像的 [Linux 发行版][1]的 ISO 文件为例。所有流行的发行版制造商还提供哈希文件和 ISO 文件。使用该文件，你可以轻松比较下载文件的哈希值。你可以放心，你的文件是正确的并且没有以任何方式损坏。

此外，如果你通过不稳定的互联网连接下载大文件，该文件可能会损坏。在这些情况下，它也有助于验证。

### Collision – 功能和使用方法

[Collision][2] 使用加密哈希函数来帮助你验证文件。加密哈希函数是一种流行的算法，它通过多种加密算法将文件数据生成为固定长度的数据流。最受欢迎的是 MD5、SHA-1、SHA-256 和 SHA-512。所有这些 Collision 都支持。

除此之外，Collision 还提供了一个简洁的用户界面，它对每个 Linux 用户都简单易用。这是它的外观。

![Collision – First Screen][3]

首先，它有两个主要特点。 a) 上传文件以获取校验和和或哈希值 b) 将校验和与上传的文件进行比较。

例如，如果你有一个简单的文件，你可以通过“打开文件”按钮或“打开”按钮重新上传另一个文件。

如下图所示，文本文件具有以下各种哈希函数的校验和。现在你可以通过互联网/与任何人共享该文件，以及用于验证的校验和值。

![Hash values of a test file][4]

此外，如果有人篡改文件（即使是单个字节）或文件在分发过程中被破坏，那么哈希值就会完全改变。

其次，如果要验证已下载文件的完整性，请点击“验证”选项卡。然后上传文件，输入你收到的上传文件的哈希值。

如果匹配，你应该会看到一个绿色勾号，显示其真实性。

![Collision verifies a sample file with SHA-256][5]

此外，这是另一个示例，我修改了测试文件并保持值相同。这个场景清楚地表明它对该文件无效。

![Collision showing that a file is not valid][6]

#### 重要说明

这里值得一提的是，哈希方法不会验证文件元属性，如修改时间、修改日期等。如果有人篡改了文件并将其还原为原始内容，哈希方法将其称为有效文件。

现在，让我们看一个验证 ISO 文件的典型示例。

### 使用 Collision 验证 Ubuntu Linux 的示例 ISO 文件

我相信你在使用 Linux 时通常会下载许多 ISO 文件。为了说明，我从官方 Ubuntu 下载页面下载了流行的 Ubuntu ISO 服务器镜像。

![Ubuntu server ISO file and checksums][7]

SHA256SUMS 文件具有以下安装程序的校验和值，如上所示。

![SHA-256 value of Ubuntu server ISO image][8]

下载后，打开 Collision 应用并通过验证选项卡上传 ISO 文件。然后复制 SHA-256 值并将其粘贴到左侧的校验和框中。

如果你已正确下载并按照步骤操作，你应该会看到该文件是真实的。

![Ubuntu server ISO image verified][9]

### 如何安装 Collision

使用 Flatpak 可以轻松安装 Collision 应用。你需要为你的 Linux 发行版[设置 Flatpak][10]，并单击以下链接以安装 Collision。

[通过 Flathub 安装 Collision][11]

安装后，你应该通过发行版的应用菜单找到它。

### 有没有其他方法可以在没有任何应用的情况下验证文件？

是的，所有 Linux 发行版中都有一些内置程序，你还可以使用它们来使用终端验证文件及其完整性。

下面的终端程序可用于确定任何文件的哈希值。它们默认安装在所有发行版中，你甚至可以将它们用于你的 shell 脚本以实现自动化。

```
md5sum <文件名>
```

```
sha1sum <文件名>
```

```
sha256sum <文件名>
```

使用上述程序，你可以找出哈希值。但是你需要比较它们以手动验证。

![Verify files via command-line utilities][12]

### 结束语

我希望本指南可以帮助你使用 Collision GTK 应用验证你的文件。它使用起来很简单。此外，你可以在终端中使用命令行方法来验证您想要的任何文件。另外，最好的做法是尽可能始终检查文件完整性。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/05/collision/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/category/distributions
[2]: https://collision.geopjr.dev/
[3]: https://www.debugpoint.com/wp-content/uploads/2022/05/Collision-First-Screen.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/05/Hash-values-of-a-test-file.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/05/Collision-verifies-a-sample-file-with-SHA-256.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/05/Collision-showing-that-a-file-is-not-valid.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/05/Ubuntu-server-ISO-file-and-checksums.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/05/SHA-256-valud-of-Ubuntu-server-ISO-image.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2022/05/Ubuntu-server-ISO-image-verified.jpg
[10]: https://flatpak.org/setup/
[11]: https://dl.flathub.org/repo/appstream/dev.geopjr.Collision.flatpakref
[12]: https://www.debugpoint.com/wp-content/uploads/2022/05/Verify-files-via-command-line-utilities.jpg
