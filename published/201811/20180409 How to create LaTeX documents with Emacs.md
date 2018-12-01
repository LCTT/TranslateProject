如何使用 Emacs 创建 LaTeX 文档
======
> 这篇教程将带你遍历在 Emacs 使用强大的开源排版系统 LaTex 来创建文档的全过程。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_paper_envelope_document.png?itok=uPj_kouJ)

一篇由 Aaron Cocker 写的很棒的文章 “[在 LaTeX 中创建文件的介绍][1]” 中，介绍了 [LaTeX 排版系统][3] 并描述了如何使用 [TeXstudio][4] 来创建 LaTeX 文档。同时，他也列举了一些很多用户觉得创建 LaTeX 文档很方便的编辑器。

[Greg Pittman][5] 对这篇文章的评论吸引了我：“当你第一次开始使用 LaTeX 时，他似乎是个很差劲的排版……” 事实也确实如此。LaTeX 包含了多种排版字体和调试，如果你漏了一个特殊的字符比如说感叹号，这会让很多用户感到沮丧，尤其是新手。在本文中，我将介绍如何使用 [GNU Emacs][6] 来创建 LaTeX 文档。

### 创建你的第一个文档

启动 Emacs：

```
emacs -q --no-splash helloworld.org
```

参数 `-q` 确保 Emacs 不会加载其他的初始化配置。参数 `--no-splash-screen` 防止 Emacs 打开多个窗口，确保只打开一个窗口，最后的参数 `helloworld.org` 表示你要创建的文件名为 `helloworld.org` 。

![Emacs startup screen][8]

*GNU Emacs 打开文件名为 helloworld.org 的窗口时的样子。*

现在让我们用 Emacs 添加一些 LaTeX 的标题吧：在菜单栏找到 “Org” 选项并选择 “Export/Publish”。

![template_flow.png][10]

*导入一个默认的模板*

在下一个窗口中，Emacs 同时提供了导入和导出一个模板。输入 `#`（“[#] Insert template”）来导入一个模板。这将会使光标跳转到一个带有 “Options category:” 提示的 mini-buffer 中。第一次你可能不知道这个类型的名字，但是你可以使用 `Tab` 键来查看所有的补全。输入 “default” 然后按回车，之后你就能看到如下的内容被插入了：

```
#+TITLE: helloworld
#+DATE: <2018-03-12 Mon>
#+AUTHOR:
#+EMAIL: makerpm@nubia
#+OPTIONS: ':nil *:t -:t ::t <:t H:3 \n:nil ^:t arch:headline
#+OPTIONS: author:t c:nil creator:comment d:(not "LOGBOOK") date:t
#+OPTIONS: e:t email:nil f:t inline:t num:t p:nil pri:nil stat:t
#+OPTIONS: tags:t tasks:t tex:t timestamp:t toc:t todo:t |:t
#+CREATOR: Emacs 25.3.1 (Org mode 8.2.10)
#+DESCRIPTION:
#+EXCLUDE_TAGS: noexport
#+KEYWORDS:
#+LANGUAGE: en
#+SELECT_TAGS: export
```

根据自己的需求修改标题、日期、作者和 email。我自己的话是下面这样的：

```
#+TITLE: Hello World! My first LaTeX document
#+DATE: \today
#+AUTHOR: Sachin Patil
#+EMAIL: psachin@redhat.com
```

我们目前还不想创建一个目录，所以要将 `toc` 的值由 `t` 改为 `nil`，具体如下：

```
#+OPTIONS: tags:t tasks:t tex:t timestamp:t toc:nil todo:t |:t
```

现在让我们添加一个章节和段落吧。章节是由一个星号（`*`）开头。我们从 Aaron 的贴子（来自 [Lipsum Lorem Ipsum 生成器][11]）复制一些文本过来：

```
* Introduction

  \paragraph{}
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras lorem
  nisi, tincidunt tempus sem nec, elementum feugiat ipsum. Nulla in
  diam libero. Nunc tristique ex a nibh egestas sollicitudin.

  \paragraph{}
  Mauris efficitur vitae ex id egestas. Vestibulum ligula felis,
  pulvinar a posuere id, luctus vitae leo. Sed ac imperdiet orci, non
  elementum leo. Nullam molestie congue placerat. Phasellus tempor et
  libero maximus commodo.
```


![helloworld_file.png][13]

*helloworld.org 文件*


将内容修改好后，我们要把它导出为 PDF 格式。再次在 “Org” 的菜单选项中选择 “Export/Publish”，但是这次，要输入 `l`（“export to LaTeX”），紧跟着输入 `o`（“as PDF file and open”）。这次操作不止会打开 PDF 文件让你浏览，同时也会将文件保存为 `helloworld.pdf`，并保存在与 `helloworld.org` 的同一个目录下。

![org_to_pdf.png][15]

*将 helloworld.org 导出为 helloworld.pdf*

![org_and_pdf_file.png][17]

*打开 helloworld.pdf 文件*

你也可以按下 `Alt + x` 键，然后输入 `org-latex-export-to-pdf` 来将 org 文件导出为 PDF 文件。可以使用 `Tab` 键来自动补全命令。

Emacs 也会创建 `helloworld.tex` 文件来让你控制具体的内容。

![org_tex_pdf.png][19]

*Emacs 在三个不同的窗口中分别打开 LaTeX，org 和 PDF 文档。*

你可以使用命令来将 `.tex` 文件转换为 `.pdf` 文件：

```
pdflatex helloworld.tex
```

你也可以将 `.org` 文件输出为 HTML 或是一个简单的文本格式的文件。我最喜欢 `.org` 文件的原因是他们可以被推送到 [GitHub][20] 上，然后同 markdown 一样被渲染。

### 创建一个 LaTeX 的 Beamer 简报

现在让我们更进一步，通过少量的修改上面的文档来创建一个 LaTeX [Beamer][21] 简报，如下所示：

```
#+TITLE: LaTeX Beamer presentation
#+DATE: \today
#+AUTHOR: Sachin Patil
#+EMAIL: psachin@redhat.com
#+OPTIONS: ':nil *:t -:t ::t <:t H:3 \n:nil ^:t arch:headline
#+OPTIONS: author:t c:nil creator:comment d:(not "LOGBOOK") date:t
#+OPTIONS: e:t email:nil f:t inline:t num:t p:nil pri:nil stat:t
#+OPTIONS: tags:t tasks:t tex:t timestamp:t toc:nil todo:t |:t
#+CREATOR: Emacs 25.3.1 (Org mode 8.2.10)
#+DESCRIPTION:
#+EXCLUDE_TAGS: noexport
#+KEYWORDS:
#+LANGUAGE: en
#+SELECT_TAGS: export
#+LATEX_CLASS: beamer
#+BEAMER_THEME: Frankfurt
#+BEAMER_INNER_THEME: rounded


* Introduction
*** Programming
    - Python
    - Ruby

*** Paragraph one

    Lorem ipsum dolor sit amet, consectetur adipiscing
    elit. Cras lorem nisi, tincidunt tempus sem nec, elementum feugiat
    ipsum. Nulla in diam libero. Nunc tristique ex a nibh egestas
    sollicitudin.

*** Paragraph two

    Mauris efficitur vitae ex id egestas. Vestibulum
    ligula felis, pulvinar a posuere id, luctus vitae leo. Sed ac
    imperdiet orci, non elementum leo. Nullam molestie congue
    placerat. Phasellus tempor et libero maximus commodo.

* Thanks
*** Links
    - Link one
    - Link two
```

我们给标题增加了三行：

```
#+LATEX_CLASS: beamer
#+BEAMER_THEME: Frankfurt
#+BEAMER_INNER_THEME: rounded
```

导出为 PDF，按下 `Alt + x` 键后输入 `org-beamer-export-to-pdf`。

![latex_beamer_presentation.png][23]

*用 Emacs 和 Org 模式创建的 Latex Beamer 简报*

希望你会爱上使用 Emacs 来创建 LaTex 和 Beamer 文档（注意：使用快捷键比用鼠标更快些）。Emacs 的 Org 模式提供了比我在这篇文章中说的更多的功能，你可以在 [orgmode.org][24] 获取更多的信息.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/how-create-latex-documents-emacs

作者：[Sachin Patil][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[oneforalone](https://github.com/oneforalone)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/psachin
[1]:https://opensource.com/article/17/6/introduction-latex
[2]:https://opensource.com/users/aaroncocker
[3]:https://www.latex-project.org
[4]:http://www.texstudio.org/
[5]:https://opensource.com/users/greg-p
[6]:https://www.gnu.org/software/emacs/
[7]:/file/392261
[8]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/emacs_startup.png?itok=UnT4PgK5 (Emacs startup screen)
[9]:/file/392266
[10]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/insert_template_flow.png?itok=V_c2KipO (template_flow.png)
[11]:https://www.lipsum.com/feed/html
[12]:/file/392271
[13]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/helloworld_file.png?itok=o8IX0TsJ (helloworld_file.png)
[14]:/file/392276
[15]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/org_to_pdf.png?itok=fNnC1Y-L (org_to_pdf.png)
[16]:/file/392281
[17]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/org_and_pdf_file.png?itok=HEhtw-cu (org_and_pdf_file.png)
[18]:/file/392286
[19]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/org_tex_pdf.png?itok=poZZV_tj (org_tex_pdf.png)
[20]:https://github.com
[21]:https://www.sharelatex.com/learn/Beamer
[22]:/file/392291
[23]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/latex_beamer_presentation.png?itok=rsPSeIuM (latex_beamer_presentation.png)
[24]:https://orgmode.org/worg/org-tutorials/org-latex-export.html
