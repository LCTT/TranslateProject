2018 年 6 月 COPR 中值得尝试的 4 个很酷的新项目
======

![](https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-1024x433.jpg)

COPR 是个人软件仓库[集合][1]，它不在 Fedora 中。这是因为某些软件不符合轻松打包的标准。或者它可能不符合其他 Fedora 标准，尽管它是免费和开源的。COPR 可以在 Fedora 套件之外提供这些项目。COPR 中的软件不被 Fedora 基础设施不支持或没有被该项目所签名。但是，这是一种尝试新的或实验性的软件的一种巧妙的方式。

这是 COPR 中一组新的有趣项目。

### Ghostwriter

[Ghostwriter][2] 是 [Markdown][3] 格式的文本编辑器，它有一个最小的界面。它以 HTML 格式提供文档预览，并为 Markdown 提供语法高亮显示。它提供了仅高亮显示当前正在编写的段落或句子的选项。此外，Ghostwriter 可以将文档导出为多种格式，包括 PDF 和 HTML。最后，它有所谓的“海明威”模式，其中删除被禁用，迫使用户现在智能编写，而在稍后编辑。

![][4]

#### 安装说明

仓库目前为 Fedora 26、27、28 和 Rawhide 以及 EPEL 7 提供 Ghostwriter。要安装 Ghostwriter，请使用以下命令：

```
sudo dnf copr enable scx/ghostwriter
sudo dnf install ghostwriter
```

### Lector

[Lector][5] 是一个简单的电子书阅读器程序。Lector 支持最常见的电子书格式，如 EPUB、MOBI 和 AZW，以及漫画书格式 CBZ 和 CBR。它很容易设置 —— 只需指定包含电子书的目录即可。你可以使用表格或书籍封面浏览 Lector 库内的书籍。Lector 的功能包括书签、用户自定义标签和内置字典。![][6]

#### 安装说明

该仓库目前为 Fedora 26、27、28 和 Rawhide 提供Lector。要安装 Lector，请使用以下命令：

```
sudo dnf copr enable bugzy/lector
sudo dnf install lector
```

### Ranger

Ranerger 是一个基于文本的文件管理器，它带有 Vim 键绑定。它以三列显示目录结构。左边显示父目录，中间显示当前目录的内容，右边显示所选文件或目录的预览。对于文本文件，Ranger 将文件的实际内容作为预览。![][7]

#### 安装说明

该仓库目前为 Fedora 27、28 和 Rawhide 提供 Ranger。要安装 Ranger，请使用以下命令：

```
sudo dnf copr enable fszymanski/ranger
sudo dnf install ranger
```

### PrestoPalette

PrestoPeralette 是一款帮助创建平衡调色板的工具。PrestoPalette 的一个很好的功能是能够使用光照来影响调色板的亮度和饱和度。你可以将创建的调色板导出为 PNG 或 JSON。

![][8]

#### 安装说明

仓库目前为 Fedora 26、27、28 和 Rawhide 以及 EPEL 7 提供 PrestoPalette。要安装 PrestoPalette，请使用以下命令：

```
sudo dnf copr enable dagostinelli/prestopalette
sudo dnf install prestopalette
```


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-try-copr-june-2018/

作者：[Dominik Turecek][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:https://copr.fedorainfracloud.org/
[2]:http://wereturtle.github.io/ghostwriter/
[3]:https://daringfireball.net/
[4]:https://fedoramagazine.org/wp-content/uploads/2018/05/ghostwriter.png
[5]:https://github.com/BasioMeusPuga/Lector
[6]:https://fedoramagazine.org/wp-content/uploads/2018/05/lector.png
[7]:https://fedoramagazine.org/wp-content/uploads/2018/05/ranger.png
[8]:https://fedoramagazine.org/wp-content/uploads/2018/05/prestopalette.png
