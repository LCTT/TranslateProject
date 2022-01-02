[#]: subject: "4 ways you can edit a PDF with the pdftk-java command"
[#]: via: "https://opensource.com/article/21/12/edit-pdf-linux-pdftk"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14121-1.html"

用 pdftk-java 命令编辑 PDF 的 4 种方法
======

> 用这个方便的 Linux 命令合并 PDF、删除页面、分割 PDF 和填写表格。

![](https://img.linux.net.cn/data/attachment/album/202112/27/130643zzwbp4azsxahqzga.jpg)

技术白皮书、手稿和 RPG 手册，我每天都要处理大量的 PDF 文件。PDF 格式之所以受欢迎，是因为它包含经过处理的 PostScript 代码。PostScript 是现代打印机的原生语言，所以出版商经常将一本书的数字版本发布为 PDF，因为他们已经投入了时间和精力来制作印刷用的文件。但是，PDF 并不是一种可编辑的格式，虽然可以进行一些逆向处理，但它是数字数据发送到打印机之前的最后一站。即便如此，有时你还是需要对 PDF 进行调整，而我最喜欢的工具之一就是 [pdftk-java][2] 命令。

### 在 Linux 上安装 pdftk-java

顾名思义，`pdftk-java` 是用 Java 编写的，所以只要你安装了 Java，它就能在所有主流的操作系统上工作。

Linux 和 macOS 用户可以从 [AdoptOpenJDK.net][3] 安装 Java。Windows 用户可以安装 [Red Hat 的 OpenJDK 的 Windows版本][4]。

要安装 `pdftk-java`：

1、从 Gitlab 仓库下载 [pdftk-all.jar 程序][5]，并将其保存到 `~/.local/bin/` 或[你 path 变量中的其他位置][6]。

2、在你喜欢的文本编辑器中打开 `~/.bashrc` 并添加这一行：

```
alias pdftk='java -jar $HOME/.local/bin/pdftk-all.jar'
```

3、加载你的新 Bash 设置：

```
$ source ~/.bashrc
```

### 命令语法

一个有效的 `pdftk-java` 命令的结构遵循一个模式，但在模式中的内容有很大的灵活性。语法有点不寻常，因为它没有使用传统风格的 [终端选项][7]，但经过实践，它并不难记。

  * `pdftk`：调用该命令的别名
  * 输入文件：你想修改的 PDF 文件
  * 动作：你想对输入文件做什么
  * 输出：你想在哪里保存你修改过的 PDF 文件

最复杂的是动作部分，所以我将从简单的任务开始。

### 将两个 PDF 文件合并成一个

一本书的封面通常在一个单独的应用中创建，如 Inkscape 或 GIMP，而书的其他部分通常在 Scribus 等排版程序或 LibreOffice 等办公套件中完成，这种情况并不罕见。你可以在你的排版应用中把这两者结合起来。像 Scribus 这样的出版软件可以很容易地引用一张图片，这样当封面改变时，它就会在版面中自动更新。然而，也可以用 `pdftk-java` 将封面预置到 PDF 中：

```
$ pdftk cover.pdf body.pdf \
  cat \
  output book.pdf
```

在这个例子中，动作是 `cat` 即 <ruby>连接<rt>concatenate</rt></ruby> 的缩写，和 Linux 的 [cat 命令][8] 一样，它将一个或多个 PDF 文件串联成一个数据流，数据流被引导到“<ruby>输出<rt>output</rt></ruby>”参数指定的任何文件中。

### 从一个 PDF 中删除页面

你不能确切地从一个 PDF 中删除一页，但你可以创建一个新的 PDF，只包含你想保留的页面。

```
$ pdftk book.pdf \
  cat 1 3-end \
  output shorter-book.pdf
```

在这个例子中，我的书的文件的第 1 页，以及从 3 到结尾的所有页面，都被保存到一个新文件中。因此，我删除的那一页是第 2 页。

### 将一个 PDF 分割成不同的文件

将一个 PDF 文件分割成许多不同的文件也使用 `cat` 动作，它的原理与删除页面相似。你可以通过将你想要的页面发送到一个新文件来分割一个 PDF：

```
$ pdftk book.pdf \
  cat 1-15 \
  output part-1.pdf
$ pdftk book.pdf \
  cat 16-42 \
  output part-2.pdf
```

如果你需要将一个 PDF 分割成单页文件，有一个特殊的动作，叫做 `burst`：

```
$ pdftk book.pdf burst
$ ls
book.pdf pg_0001.pdf pg_0002.pdf
pg_0003.pdf pg_0004.pdf pg_0005.pdf
[...]

```

### 填写表格

很少有人能否认多年来 PDF 格式变得越来越臃肿，而你有时在 PDF 文件中发现的一个功能是可填写的表格。你会在美国税务文件、RPG 角色表、线上学校作业本和其他旨在互动的 PDF 文件中看到这种情况。虽然大多数现代的 PDF 浏览器，比如 GNOME 的 Evince 和 KDE 的 Okular，都可以填写 PDF 表格，但你也可以在 `pdftk-java` 的帮助下填写 PDF 表格。

首先，你必须使用 `generate_fdf` 动作提取表单数据。这将提取表单元素的 ID，并将它们放入一个文本文件。

```
$ pdftk character-sheet.pdf \
  generate_fdf \
  output chsheet-form.txt

```

你的目标文件（在这个例子中是 `chsheet-form.txt`）包含 PDF 中的表格数据，但只是文本部分。你可以在任何标准的文本编辑器中编辑它，如 [Atom][9] 或 [Gedit][10]。

在对生成 PDF 的组织的工作流程的有时令人钦佩和有时尴尬的一瞥中，你会发现一些表格有明确的标签，而其他表格有默认的名字，如 “Checkbox_001” 和 “Textfield-021”，所以你可能要把你的文本文件和你的 PDF 对照一下，但如果你要写一个脚本来自动填写表格，这可能是值得的。每个标签都被标记为 `/T` 项，在接下来的一行中，有空间（标记为 `/V`）提供给文本输入。下面是一个片段，它的标签有上下文，并填入了一些数据：

```
/T (CharacterName 2)
/V (Abaddon)
>>
<<
/T (SlotsTotal 24)
/V ()
>>
<<
/T (Hair)
/V (Brown)
>>
<<
/T (AC)
/V (15)
>>
<<
/T (Background)
/V ()
>>
<<
/T (DEXmod )
/V ()
```

当你输入了表单数据，你就可以用 `fill_form` 动作将你的文本输入与 PDF 结构结合起来：

```
$ pdftk character-sheet.pdf \
  fill_form chsheet-form.txt \
  output completed.pdf
```

下面是一个结果示例。

![A form filled by pdftk-java][11]

### PDF 修改变得简单

当你处理大量的 PDF 文件或通过 shell 脚本处理 PDF 文件时，像 `pdftk-java` 这样的工具是非常有价值的，因为它使你不必手动做所有的事情。当我从 [Docbook][12] 的输出建立一个 PDF 时，它是一个 Makefile，调用 `pdftk-java` 完成任何数量的任务，所以我没有机会忘记某个步骤或打错命令，也没有必要把时间花在这上面。在你自己的工作流程中，还有很多其他的原因你可能会使用 `pdftk-java`，它还可以做很多其他的事情，包括 `shuffle`、`rotate`、`dump_data`、`update_info` 和 `attach_files` 等动作。如果你发现自己经常与 PDF 文件打交道，可以试试 `pdftk-java`。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/edit-pdf-linux-pdftk

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk (a checklist for a team)
[2]: https://gitlab.com/pdftk-java/pdftk
[3]: https://adoptopenjdk.net/releases.html
[4]: https://developers.redhat.com/products/openjdk/download
[5]: https://gitlab.com/pdftk-java/pdftk/-/jobs/1527259628/artifacts/raw/build/libs/pdftk-all.jar
[6]: https://opensource.com/article/17/6/set-path-linux
[7]: https://opensource.com/article/21/8/linux-terminal
[8]: https://opensource.com/article/19/2/getting-started-cat-command
[9]: https://opensource.com/article/20/12/atom
[10]: https://opensource.com/article/20/12/gedit
[11]: https://opensource.com/sites/default/files/pdftk-form-fill.jpg (A form filled by pdftk-java)
[12]: https://opensource.com/article/17/9/docbook
