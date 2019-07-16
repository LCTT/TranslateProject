使用 Pandoc 将你的书转换成网页和电子书
======

> 通过 Markdown 和 Pandoc，可以做到编写一次，发布两次。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_paper_envelope_document.png?itok=uPj_kouJ)

Pandoc 是一个命令行工具，用于将文件从一种标记语言转换为另一种标记语言。在我 [对 Pandoc 的简介][1] 一文中，我演示了如何把 Markdown 编写的文本转换为网页、幻灯片和 PDF。

在这篇后续文章中，我将深入探讨 [Pandoc][2]，展示如何从同一个 Markdown 源文件生成网页和 ePub 格式的电子书。我将使用我即将发布的电子书《[面向对象思想的 GRASP 原则][3]》为例进行讲解，这本电子书正是通过以下过程创建的。

首先，我将解释这本书使用的文件结构，然后介绍如何使用 Pandoc 生成网页并将其部署在 GitHub 上；最后，我演示了如何生成对应的 ePub 格式电子书。

你可以在我的 GitHub 仓库 [Programming Fight Club][4] 中找到相应代码。

### 设置图书结构

我用 Markdown 语法完成了所有的写作，你也可以使用 HTML 标记，但是当 Pandoc 将 Markdown 转换为 ePub 文档时，引入的 HTML 标记越多，出现问题的风险就越高。我的书按照每章一个文件的形式进行组织，用 Markdown 的 `H1` 标记（`＃`）声明每章的标题。你也可以在每个文件中放置多个章节，但将它们放在单独的文件中可以更轻松地查找内容并在以后进行更新。

元信息遵循类似的模式，每种输出格式都有自己的元信息文件。元信息文件定义有关文档的信息，例如要添加到 HTML 中的文本或 ePub 的许可证。我将所有 Markdown 文档存储在名为 `parts` 的文件夹中（这对于用来生成网页和 ePub 的 Makefile 非常重要）。下面以一个例子进行说明，让我们看一下目录，前言和关于本书（分为 `toc.md`、`preface.md` 和 `about.md` 三个文件）这三部分，为清楚起见，我们将省略其余的章节。

关于本书这部分内容的开头部分类似：

```
# About this book {-}

## Who should read this book {-}

Before creating a complex software system one needs to create a solid foundation.
General Responsibility Assignment Software Principles (GRASP) are guidelines to assign
responsibilities to software classes in object-oriented programming.
```

每一章完成后，下一步就是添加元信息来设置网页和 ePub 的格式。

### 生成网页

#### 创建 HTML 元信息文件

我创建的网页的元信息文件（`web-metadata.yaml`）是一个简单的 YAML 文件，其中包含 `<head> ` 标签中的作者、标题、和版权等信息，以及 HTML 文件中开头和结尾的内容。

我建议（至少）包括 `web-metadata.yaml` 文件中的以下字段：

```
---
title: <a href="/grasp-principles/toc/">GRASP principles for the Object-oriented mind</a>
author: Kiko Fernandez-Reyes
rights: 2017 Kiko Fernandez-Reyes, CC-BY-NC-SA 4.0 International
header-includes:
- |
  ```{=html}
  <link href="https://fonts.googleapis.com/css?family=Inconsolata" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Gentium+Basic|Inconsolata" rel="stylesheet">
  ```
include-before:
- |
  ```{=html}
  <p>If you like this book, please consider
      spreading the word or
      <a href="https://www.buymeacoffee.com/programming">
        buying me a coffee
      </a>
  </p>
  ```
include-after:
- |
  ```{=html}
  <div class="footnotes">
    <hr>
    <div class="container">
        <nav class="pagination" role="pagination">
          <ul>
          <p>
          <span class="page-number">Designed with</span> ❤️  <span class="page-number"> from Uppsala, Sweden</span>
           </p>
           <p>
           <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a>
           </p>
           </ul>
        </nav>
    </div>
  </div>
  ```
---
```

下面几个变量需要注意一下：

- `header-includes` 变量包含将要嵌入 `<head>` 标签的 HTML 文本。
- 调用变量后的下一行必须是 `- |`。再往下一行必须以与 `|` 对齐的三个反引号开始，否则 Pandoc 将无法识别。`{= html}` 告诉 Pandoc 其中的内容是原始文本，不应该作为 Markdown 处理。（为此，需要检查 Pandoc 中的 `raw_attribute` 扩展是否已启用。要进行此检查，键入 `pandoc --list-extensions | grep raw` 并确保返回的列表包含名为 `+ raw_html` 的项目，加号表示已启用。）
- 变量 `include-before` 在网页开头添加一些 HTML 文本，此处我请求读者帮忙宣传我的书或给我打赏。
- `include-after` 变量在网页末尾添加原始 HTML 文本，同时显示我的图书许可证。

这些只是其中一部分可用的变量，查看 HTML 中的模板变量（我的文章 [Pandoc简介][1] 中介绍了如何查看 LaTeX 的模版变量，查看 HTML 模版变量的过程是相同的）对其余变量进行了解。

#### 将网页分成多章

网页可以作为一个整体生成，这会产生一个包含所有内容的长页面；也可以分成多章，我认为这样会更容易阅读。我将解释如何将网页划分为多章，以便读者不会被长网页吓到。

为了使网页易于在 GitHub Pages 上部署，需要创建一个名为 `docs` 的根文件夹（这是 GitHub Pages 默认用于渲染网页的根文件夹）。然后我们需要为 `docs` 下的每一章创建文件夹，将 HTML 内容放在各自的文件夹中，将文件内容放在名为 `index.html` 的文件中。

例如，`about.md` 文件将转换成名为 `index.html` 的文件，该文件位于名为 `about`（`about/index.html`）的文件夹中。这样，当用户键入 `http://<your-website.com>/about/` 时，文件夹中的 `index.html` 文件将显示在其浏览器中。

下面的 `Makefile` 将执行上述所有操作：

```
# Your book files
DEPENDENCIES= toc preface about

# Placement of your HTML files
DOCS=docs

all: web

web: setup $(DEPENDENCIES)
        @cp $(DOCS)/toc/index.html $(DOCS)


# Creation and copy of stylesheet and images into
# the assets folder. This is important to deploy the
# website to Github Pages.
setup:
        @mkdir -p $(DOCS)
        @cp -r assets $(DOCS)


# Creation of folder and index.html file on a
# per-chapter basis

$(DEPENDENCIES):
        @mkdir -p $(DOCS)/$@
        @pandoc -s --toc web-metadata.yaml parts/$@.md \
        -c /assets/pandoc.css -o $(DOCS)/$@/index.html

clean:
        @rm -rf $(DOCS)

.PHONY: all clean web setup
```

选项 `- c /assets/pandoc.css` 声明要使用的 CSS 样式表，它将从 `/assets/pandoc.cs` 中获取。也就是说，在 `<head>` 标签内，Pandoc 会添加这样一行：

```
<link rel="stylesheet" href="/assets/pandoc.css">
```

使用下面的命令生成网页：

```
make
```

根文件夹现在应该包含如下所示的文件结构：

```
.---parts
|    |--- toc.md
|    |--- preface.md
|    |--- about.md
|
|---docs
    |--- assets/
    |--- index.html
    |--- toc
    |     |--- index.html
    |
    |--- preface
    |     |--- index.html
    |
    |--- about
          |--- index.html
   
```

#### 部署网页

通过以下步骤将网页部署到 GitHub 上：

1. 创建一个新的 GitHub 仓库
2. 将内容推送到新创建的仓库
3. 找到仓库设置中的 GitHub Pages 部分，选择 `Source` 选项让 GitHub 使用主分支的内容

你可以在 [GitHub Pages][5] 的网站上获得更多详细信息。

[我的书的网页][6] 便是通过上述过程生成的，可以在网页上查看结果。

### 生成电子书

#### 创建 ePub 格式的元信息文件

ePub 格式的元信息文件 `epub-meta.yaml` 和 HTML 元信息文件是类似的。主要区别在于 ePub 提供了其他模板变量，例如 `publisher` 和 `cover-image` 。ePub 格式图书的样式表可能与网页所用的不同，在这里我使用一个名为 `epub.css` 的样式表。

```
---
title: 'GRASP principles for the Object-oriented Mind'
publisher: 'Programming Language Fight Club'
author: Kiko Fernandez-Reyes
rights: 2017 Kiko Fernandez-Reyes, CC-BY-NC-SA 4.0 International
cover-image: assets/cover.png
stylesheet: assets/epub.css
...
```

将以下内容添加到之前的 `Makefile` 中：

```
epub:
        @pandoc -s --toc epub-meta.yaml \
        $(addprefix parts/, $(DEPENDENCIES:=.md)) -o $(DOCS)/assets/book.epub
```

用于产生 ePub 格式图书的命令从 HTML 版本获取所有依赖项（每章的名称），向它们添加 Markdown 扩展，并在它们前面加上每一章的文件夹路径，以便让 Pandoc 知道如何进行处理。例如，如果 `$（DEPENDENCIES`  变量只包含 “前言” 和 “关于本书” 两章，那么 `Makefile` 将会这样调用：

```
@pandoc -s --toc epub-meta.yaml \
parts/preface.md parts/about.md -o $(DOCS)/assets/book.epub
```

Pandoc 将提取这两章的内容，然后进行组合，最后生成 ePub 格式的电子书，并放在 `Assets` 文件夹中。

这是使用此过程创建 ePub 格式电子书的一个 [示例][7]。

### 过程总结

从 Markdown 文件创建网页和 ePub 格式电子书的过程并不困难，但有很多细节需要注意。遵循以下大纲可能使你更容易使用 Pandoc。

- HTML 图书：
   - 使用 Markdown 语法创建每章内容
   - 添加元信息
   - 创建一个 `Makefile` 将各个部分组合在一起
   - 设置 GitHub Pages
   - 部署
- ePub 电子书：
   - 使用之前创建的每一章内容
   - 添加新的元信息文件
   - 创建一个 `Makefile` 以将各个部分组合在一起
   - 设置 GitHub Pages
   - 部署


------

via: https://opensource.com/article/18/10/book-to-website-epub-using-pandoc

作者：[Kiko Fernandez-Reyes][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[jlztan](https://github.com/jlztan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kikofernandez
[1]: https://linux.cn/article-10228-1.html
[2]: https://pandoc.org/
[3]: https://www.programmingfightclub.com/
[4]: https://github.com/kikofernandez/programmingfightclub
[5]: https://pages.github.com/
[6]: https://www.programmingfightclub.com/grasp-principles/
[7]: https://github.com/kikofernandez/programmingfightclub/raw/master/docs/web_assets/demo.epub
