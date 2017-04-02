wkhtmltopdf：一个 Linux 中将网页转成 PDF 的智能工具
============================================================

wkhtmltopdf 是一个开源、简单而有效的命令行 shell 程序，它可以将任何 HTML （网页）转换为 PDF 文档或图像（jpg、png 等）。

wkhtmltopdf 是用 C++ 编写的，并在 GNU/GPL （通用公共许可证）下发布。它使用 WebKit 渲染引擎将 HTML 页面转换为 PDF 文档且不会丢失页面的质量。这是一个用于实时创建和存储网页快照的非常有用且可信赖的解决方案。

### wkhtmltopdf 的功能

1.  开源并且跨平台。
2.  使用 WebKit 引擎将任意 HTML 网页转换为 PDF 文件。
3.  添加页眉和页脚的选项
4.  目录生成 （TOC） 选项。
5.  提供批量模式转换。
6.  通过绑定 libwkhtmltox 来支持 PHP 或 Python。

在本文中，我们将介绍如何在 Linux 系统下使用 tar 包来安装 wkhtmltopdf。

### 安装 Evince (PDF 浏览器)

让我们在 Linux 系统中安装 evince (一个 PDF 阅读器)来浏览 PDF 文件。

```
$ sudo yum install evince             [RHEL/CentOS and Fedora]
$ sudo dnf install evince             [On Fedora 22+ versions]
$ sudo apt-get install evince         [On Debian/Ubuntu systems]
```

### 下载 wkhtmltopdf 源码文件

使用 [wget 命令][1]根据你的 Linux 架构来下载 wkhtmltopdf 源码文件，或者你也可以在 [wkhtmltopdf 下载页][2]下载最新的版本（目前最新的稳定版是 0.12.4）

在 64 位 Linux 系统中：

```
$ wget http://download.gna.org/wkhtmltopdf/0.12/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
```

在 32 位 Linux 系统中：

```
$ wget http://download.gna.org/wkhtmltopdf/0.12/0.12.4/wkhtmltox-0.12.4_linux-generic-i386.tar.xz
```

### 在 Linux 中安装 wkhtmltopdf

使用 [tar 命令][3]解压文件到当前目录中。

```
------ On 64-bit Linux OS ------
$ sudo tar -xvf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz 
------ On 32-bit Linux OS ------
$ sudo tar -xvzf wkhtmltox-0.12.4_linux-generic-i386.tar.xz 
```

为了能从任意路径执行程序，将 wkhtmltopdf 安装到 `/usr/bin` 目录下。

```
$ sudo cp wkhtmltox/bin/wkhtmltopdf /usr/bin/
```

### 如何使用 wkhtmltopdf？

我们会看到如何将远程的 HTML 页面转换成 PDF 文件、验证信息、使用 evince 在 GNOME 桌面中浏览创建的文件。

#### 将 HTML 网页转成 PDF 文件

要将任意 HTML 页面转换成 PDF，运行下面的命令。它会在当前目录下将页面转换成 [10-Sudo-Configurations.pdf][4]。

```
# wkhtmltopdf http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/ 10-Sudo-Configurations.pdf
```

示例输出：

```
Loading pages (1/6)
Counting pages (2/6)
Resolving links (4/6)
Loading headers and footers (5/6)
Printing pages (6/6)
Done
```

#### 浏览生成的 PDF 文件

为了验证创建的文件，使用下面的命令。

```
$ file 10-Sudo-Configurations.pdf
```

示例输出：

```
10-Sudo-Configurations.pdf: PDF document, version 1.4
```

#### 浏览生成的 PDF 文件细节

要浏览生成的文件信息，运行下面的命令。

```
$ pdfinfo 10-Sudo-Configurations.pdf
```

示例输出：

```
Title:          10 Useful Sudoers Configurations for Setting 'sudo' in Linux
Creator:        wkhtmltopdf 0.12.4
Producer:       Qt 4.8.7
CreationDate:   Sat Jan 28 13:02:58 2017
Tagged:         no
UserProperties: no
Suspects:       no
Form:           none
JavaScript:     no
Pages:          13
Encrypted:      no
Page size:      595 x 842 pts (A4)
Page rot:       0
File size:      697827 bytes
Optimized:      no
PDF version:    1.4
```

#### 浏览创建的文件

在桌面中使用 evince 查看最新生成的 PDF 文件。

```
$ evince 10-Sudo-Configurations.pdf
```

示例截图：

在我的 Linux Mint 17 中看起来很棒。

[
 ![View Website Page in PDF](http://www.tecmint.com/wp-content/uploads/2012/10/View-Website-Page-in-PDF.png) 
][5]

*在 PDF 中浏览网页*

### 给 PDF 创建页面的 TOC （Table Of Content 即目录）

要创建一个 PDF 文件的目录，使用 toc 选项。

```
$ wkhtmltopdf toc http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/ 10-Sudo-Configurations.pdf
```

示例输出：

```
Loading pages (1/6)
Counting pages (2/6)
Loading TOC (3/6)
Resolving links (4/6)
Loading headers and footers (5/6)
Printing pages (6/6)
Done
```

要查看已创建文件的 TOC，再次使用 evince。

```
$ evince 10-Sudo-Configurations.pdf
```

示例截图：

看一下下面的图。它上看去比上面的更好。

[
 ![Create Website Page to Table of Contents in PDF](http://www.tecmint.com/wp-content/uploads/2012/10/Create-Website-Page-Table-of-Contents-in-PDF.png) 
][6]

*在 PDF 中创建网页的目录*

#### wkhtmltopdf 选项及使用

更多关于 wkhtmltopdf 的使用及选项，使用下面的帮助命令。它会显示出所有可用的选项。

```
$ wkhtmltopdf --help
```

--------------------------------------------------------------------------------

作者简介：

我是 Ravi Saive，TecMint 的创建者。一个爱在网上分享的技巧和提示的电脑极客和 Linux 专家。我的大多数服务器运行在名为 Linux 的开源平台上。请在 Twitter、 Facebook 和 Google+ 等上关注我。

--------------------------------------------------

via: http://www.tecmint.com/wkhtmltopdf-convert-website-html-page-to-pdf-linux/

作者：[Ravi Saive][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://www.tecmint.com/10-wget-command-examples-in-linux/
[2]:http://wkhtmltopdf.org/downloads.html
[3]:http://www.tecmint.com/18-tar-command-examples-in-linux/
[4]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[5]:http://www.tecmint.com/wp-content/uploads/2012/10/View-Website-Page-in-PDF.png
[6]:http://www.tecmint.com/wp-content/uploads/2012/10/Create-Website-Page-Table-of-Contents-in-PDF.png
