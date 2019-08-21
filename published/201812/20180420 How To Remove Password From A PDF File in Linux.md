如何在 Linux 中从一个 PDF 文件中移除密码
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/Remove-Password-From-A-PDF-File-720x340.png)

今天，我碰巧分享一个受密码保护的 PDF 文件给我的一个朋友。我知道这个 PDF 文件的密码，但是我不想透露密码。作为代替，我只想移除密码并发送文件给他。我开始在因特网上查找一些简单的方法来从 PDF 文件中移除密码保护。在快速 google 搜索后，在 Linux 中，我带来四种方法来从一个 PDF 文件中移除密码。有趣的事是，在几年以前我已经做过这事情但是我忘记了。如果你想知道，如何在 Linux 中从一个 PDF 文件移除密码，继续读！它是不难的。

### 在Linux中从一个PDF文件中移除密码

#### 方法 1 – 使用 Qpdf

**Qpdf** 是一个 PDF 转换软件，它被用于加密和解密 PDF 文件，转换 PDF 文件到其他等效的 PDF 文件。 Qpdf 在大多数 Linux 发行版中的默认存储库中是可用的，所以你可以使用默认的软件包安装它。

例如，Qpdf 可以被安装在 Arch Linux 和它的衍生版，使用 [pacman][1] ，像下面显示。

```
$ sudo pacman -S qpdf
```

在 Debian、Ubuntu、Linux Mint 上：

```
$ sudo apt-get install qpdf
```

现在，让我们使用 qpdf 从一个 pdf 文件移除密码。

我有一个受密码保护的 PDF 文件，名为 `secure.pdf`。每当我打开这个文件时，它提示我输入密码来显示它的内容。

![][3]

我知道上面 PDF 文件的密码。然而，我不想与任何人共享密码。所以，我将要做的事是简单地移除 PDF 文件的密码，使用 Qpdf 功能带有下面的命令。

```
$ qpdf --password='123456' --decrypt secure.pdf output.pdf
```

相当简单，不是吗？是的，它是！这里，`123456` 是 `secure.pdf` 文件的密码。用你自己的密码替换。

#### 方法 2 – 使用 Pdftk

**Pdftk** 是另一个用于操作 PDF 文件的好软件。 Pdftk 可以做几乎所有的 PDF 操作，例如：

* 加密和解密 PDF 文件。
* 合并 PDF 文档。
* 整理 PDF 页扫描。
* 拆分 PDF 页。
* 旋转 PDF 文件或页。
* 用 X/FDF 数据 填充 PDF 表单，和/或摧毁表单。
* 从 PDF 表单中生成 PDF数据模板。
* 应用一个背景水印，或一个前景印记。
* 报告 PDF 度量标准、书签和元数据。
* 添加/更新 PDF 书签或元数据。
* 附加文件到 PDF 页，或 PDF 文档。
* 解包 PDF 附件。
* 拆解一个 PDF 文件到单页中。
* 压缩和解压缩页流。
* 修复破损的 PDF 文件。

Pddftk 在 AUR 中是可用的，所以你可以在 Arch Linux 和它的衍生版上使用任意 AUR 帮助程序安装它。

使用 [Pacaur][4]：

```
$ pacaur -S pdftk
```

使用 [Packer][5]：

```
$ packer -S pdftk
```

使用 [Trizen][6]：

```
$ trizen -S pdftk
```

使用 [Yay][7]：

```
$ yay -S pdftk
```

使用 [Yaourt][8]：

```
$ yaourt -S pdftk
```

在 Debian、Ubuntu、Linux Mint 上，运行：

```
$ sudo apt-get instal pdftk
```

在 CentOS、Fedora、Red Hat 上：

首先，安装 EPEL 仓库：

```
$ sudo yum install epel-release
```

或

```
$ sudo dnf install epel-release
```

然后，安装 PDFtk 应用程序，使用命令：

```
$ sudo yum install pdftk
```

或者

```
$ sudo dnf install pdftk
```

一旦 pdftk 安装，你可以从一个 PDF 文档移除密码，使用命令：

```
$ pdftk secure.pdf input_pw 123456 output output.pdf
```

用你正确的密码替换 `123456`。这个命令解密 `secure.pdf` 文件，并创建一个相同的名为 `output.pdf` 的无密码保护的文件。

**参阅：**

- [How To Merge PDF Files In Command Line On Linux][9]
- [How To Split or Extract Particular Pages From A PDF File][10]

#### 方法 3 – 使用 Poppler

**Poppler** 是一个基于 xpdf-3.0 代码库的 PDF 渲染库。它包含下列用于操作 PDF 文档的命令行功能集。

* `pdfdetach` – 列出或提取嵌入的文件。
* `pdffonts` – 字体分析器。
* `pdfimages` – 图片提取器。
* `pdfinfo` – 文档信息。
* `pdfseparate` – 页提取工具。
* `pdfsig` – 核查数字签名。
* `pdftocairo` – PDF 到 PNG/JPEG/PDF/PS/EPS/SVG 转换器，使用 Cairo 。
* `pdftohtml` – PDF 到 HTML 转换器。
* `pdftoppm` – PDF 到 PPM/PNG/JPEG 图片转换器。
* `pdftops` – PDF 到 PostScript (PS) 转换器。
* `pdftotext` – 文本提取。
* `pdfunite` – 文档合并工具。

因这个指南的目的，我们仅使用 `pdftops` 功能。

在基于 Arch Linux 的发行版上，安装 Poppler，运行：

```
$ sudo pacman -S poppler
```

在 Debian、Ubuntu、Linux Mint 上：

```
$ sudo apt-get install poppler-utils
```

在 RHEL、CentOS、Fedora 上：

```
$ sudo yum install poppler-utils
```

一旦 Poppler 安装，运行下列命令来解密密码保护的 PDF 文件，并创建一个新的相同的名为 `output.pdf` 的文件。

```
$ pdftops -upw 123456 secure.pdf output.pdf

```

再一次，用你的 pdf 密码替换 `123456` 。

正如你在上面方法中可能注意到，我们仅转换密码保护的名为 `secure.pdf` 的 PDF 文件到另一个相同的名为 `output.pdf` 的 PDF 文件。技术上讲，我们并没有真的从源文件中移除密码，作为代替，我们解密它，并保存它为另一个相同的没有密码保护的 PDF 文件。

#### 方法 4 – 打印到一个文件

这是在所有上面方法中的最简单的方法。你可以使用你存在的 PDF 查看器，例如 Atril 文档查看器、Evince 等等，并打印密码保护的 PDF 文件到另一个文件。

在你的 PDF 查看器应用程序中打开密码保护的文件。转到 “File - > Print” 。并在你选择的某个位置保存 PDF 文件。

![][2]

于是，这是全部。希望这是有用的。你知道/使用一些其它方法来从从 PDF 文件中移除密码保护吗？在下面的评价区让我们知道。

更多好东西来了。敬请期待！

谢谢！


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-remove-password-from-a-pdf-file-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/getting-started-pacman/
[2]:https://www.ostechnix.com/wp-content/uploads/2018/04/Remove-Password-From-A-PDF-File-2.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/04/Remove-Password-From-A-PDF-File-1.png
[4]:https://www.ostechnix.com/install-pacaur-arch-linux/
[5]:https://www.ostechnix.com/install-packer-arch-linux-2/
[6]:https://www.ostechnix.com/trizen-lightweight-aur-package-manager-arch-based-systems/
[7]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[8]:https://www.ostechnix.com/install-yaourt-arch-linux/
[9]: https://www.ostechnix.com/how-to-merge-pdf-files-in-command-line-on-linux/
[10]: https://www.ostechnix.com/extract-particular-pages-pdf-file/
