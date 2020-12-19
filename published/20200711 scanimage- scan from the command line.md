[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12886-1.html)
[#]: subject: (scanimage: scan from the command line!)
[#]: via: (https://jvns.ca/blog/2020/07/11/scanimage--scan-from-the-command-line/)
[#]: author: (Julia Evans https://jvns.ca/)

scanimage：从命令行扫描!
======

![](https://img.linux.net.cn/data/attachment/album/202012/05/105822m30t6x66hz3hx6x3.jpg)

这又是一篇关于我很喜欢的一个命令行工具的文章。

昨晚，出于官僚原因，我需要扫描一些文档。我以前从来没有在 Linux 上使用过扫描仪，我担心会花上好几个小时才弄明白。我从使用 `gscan2pdf` 开始，但在用户界面上遇到了麻烦。我想同时扫描两面（我知道我们的扫描仪支持），但无法使它工作。

### 遇到 scanimage！

`scanimage` 是一个命令行工具，在 `sane-utils` Debian 软件包中。我想所有的 Linux 扫描工具都使用 `sane` （“scanner access now easy”） 库，所以我猜测它和其他扫描软件有类似的能力。在这里，我不需要 OCR，所以我不打算谈论 OCR。

### 用 scanimage -L 得到你的扫描仪的名字

`scanimage -L` 列出了你所有的扫描设备。

一开始我不能让它工作，我有点沮丧，但事实证明，我把扫描仪连接到了我的电脑上，但没有插上电源。

插上后，它马上就能工作了。显然我们的扫描仪叫 `fujitsu:ScanSnap S1500:2314`。万岁！

### 用 --help 列出你的扫描仪选项

显然每个扫描仪有不同的选项（有道理！），所以我运行这个命令来获取我的扫描仪的选项：

```
scanimage --help -d 'fujitsu:ScanSnap S1500:2314'
```

我发现我的扫描仪支持 `--source` 选项（我可以用它来启用双面扫描）和 `--resolution` 选项（我把它改为 150，以减少文件大小，使扫描更快）。

### scanimage 不支持输出 PDF 文件（但你可以写一个小脚本）

唯一的缺点是：我想要一个 PDF 格式的扫描文件，而 scanimage 似乎不支持 PDF 输出。

所以我写了这个 5 行的 shell 脚本在一个临时文件夹中扫描一堆 PNG 文件，并将结果保存到 PDF 中。

```
#!/bin/bash
set -e

DIR=`mktemp -d`
CUR=$PWD
cd $DIR
scanimage -b --format png  -d 'fujitsu:ScanSnap S1500:2314' --source 'ADF Front' --resolution 150
convert *.png $CUR/$1
```

我像这样运行脚本：`scan-single-sided output-file-to-save.pdf`

你可能需要为你的扫描仪设置不同的 `-d` 和 `-source`。

### 这真是太简单了!

我一直以为在 Linux 上使用打印机/扫描仪是一个噩梦，我真的很惊讶 `scanimage` 可以工作。我可以直接运行我的脚本 `scan-single-sided receipts.pdf`，它将扫描文档并将其保存到 `receipts.pdf`！

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/07/11/scanimage--scan-from-the-command-line/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
