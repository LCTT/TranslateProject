[#]: subject: "Document your source code with Doxygen on Linux"
[#]: via: "https://opensource.com/article/22/5/document-source-code-doxygen-linux"
[#]: author: "Stephan Avenwedde https://opensource.com/users/hansic99"
[#]: collector: "lkxed"
[#]: translator: "toknow-gh"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16227-1.html"

在 Linux 上用 Doxygen 生成源代码文档
======

![][0]

> Doxygen 是一款广泛使用的开源文档生成工具，它通过代码注释来生成文档。

在试着熟悉别人的代码时，你总希望他们留下的代码注释能对你理解代码有所帮助。同理，无论为了自己还是其他人，编写代码时写注释是好习惯。所有编程语言都有专门的注释语法，注释可以是一个单词、一行文字、甚至是一整段话。编译器或解释器处理源代码时会忽略注释。

注释不能完全取代文档，但是有方法可以使用注释来生成文档。[Doxygen][2] 是一个开源的文档生成工具，它能够根据代码注释生成 HTML 或 LaTeX 格式的文档。Doxygen 让你在不用额外操作的情况下创建代码结构概览。尽管 Doxygen 主要是用来给 C++ 生成文档的，它对其它语言同样适用，比如 C、Objective-C、 C#、 PHP、Java 和 Python 等。

要使用 Doxygen，你只需要在源代码中使用 Doxygen 能够识别的语法来写注释。Doxygen 会扫描源码文件，然后根据这些特殊注释生成 HTML 或 LaTeX 文档。下面的示例项目会演示如何使用 Doxygen 注释，以及文档是如通过注释生成出来的。示例代码可从 [GitHub][3] 上获得，本文中也将引用 [Doxygen 手册及文档][4] 的相关章节。

### 在 Linux 上安装 Doxygen

在 Fedora 上可以通过软件包的形式安装 Doxygen。打开终端运行命令：

```
sudo dnf install doxygen
```

在基于 Debian 的操作系统上，可以通过以下命令来安装：

```
sudo apt-get install doxygen
```

### 使用

安装完 Doxygen 后，你需要在项目中按 Doxygen 可以识别的格式来注释代码，还要提供一个 Doxyfile 配置文件来控制 Doxygen 的一些行为。

注意：如果你用的是 GitHub 上的示例项目，你可以忽略下面一步。

如果 Doxyfile 文件不存在，你可以用 Doxygen 生成一个标准 Doxyfile 模板文件。切换到项目根目录下，运行：

```
doxygen -g
```
参数 `-g` 表示 <ruby>生成<rt>generate</rt></ruby>。现在应该会出现一个名为 `Doxyfile` 的新文件。通过命令调用 Doxygen：

```
doxygen
```

现在应该能会有两个新文件夹：

* `html/`
* `latex/`

默认情况下，Doxygen 会同时输出 LaTeX 和 HTML 格式的文档。本文主要关注 HTML 文档。你可以在 Doxygen 官方文档的**入门**小节中找到关于 LaTeX 格式输出的更多信息。

双击 `html/index.html` 打开 HTML 文件。用空的配置文件生成的文档如下图：

![A screenshot of a doxygen generated main page on Firefox. The content field under My Project Documentation is blank.][6]

现在我们试着修改 `Doxyfile` 文件，并在源代码中添加特殊注释。

### Doxyfile 文件

在 `Doxyfile` 文件中可以定义大量的可调选项，本文通过介绍示例项目的 `Doxyfile` 文件我只能覆盖其中很小的子集。

#### 第 35 行：项目名称

你可以在这里指定项目名称，它最终会显示在<ruby>页眉<rt>header</rt></ruby>和浏览器标签上。

```
# The PROJECT_NAME tag is a single word (or a sequence of words surrounded by
# double-quotes, unless you are using Doxywizard) that should identify the
# project for which the documentation is generated. This name is used in the
# title of most generated pages and in a few other places.
# The default value is: My Project.

PROJECT_NAME           = "My Project"
```

#### 第 47 行：项目简介

项目简介会以略小的字号显示在页眉上。

```
# Using the PROJECT_BRIEF tag one can provide an optional one line description
# for a project that appears at the top of each page and should give viewer a
# quick idea about the purpose of the project. Keep the description short.

PROJECT_BRIEF          = "An example of using Doxygen in C++"
```

#### 第 926 行：包含子目录

允许 Doxygen 查找源代码和文档文件时递归遍历子目录。

```
# The RECURSIVE tag can be used to specify whether or not subdirectories should
# be searched for input files as well.
# The default value is: NO.

RECURSIVE = YES
```

####  第 1769 行：禁用 LaTeX 输出

如果你只想生成 HTML 文档，可以通过这个开关禁用 LaTeX 输出。

```
# If the GENERATE_LATEX tag is set to YES, doxygen will generate LaTeX output.

# The default value is: YES.

GENERATE_LATEX = NO
```
修改完成后，你可以再次运行 Doxygen 来检验修改是否生效了。可以在调用 Doxygen 时使用 `-x` 选项来查看 `Doxyfile` 文件的变更项：

![A screenshot of the terminal showing the differences, Project Name, Project Brief, Recursive, and status of Generate Latex][7]

通过调用 `diff` 命令，Doxygen 仅显示当前 Doxyfile 文件和模板文件的差异。

### 特殊注释

Doxygen 通过扫描源代码文件中的特殊注释和关键字来生成 HTML 文档。示例项目中的 ByteStream 类的头文件可以很好地解释特殊注释的用法。 

下面用构造函数和析构函数作为示例：

```
/*! @brief Constructor which takes an external buffer to operate on
*
* The specified buffer already exist.
* Memory and size can be accessed by buffer() and size().
*
* @param[in] pBuf Pointer to existing buffer
* @param[in] size Size of the existing buffer
*/

ByteStream(char* pBuf, size_t size) noexcept;
```

特殊注释块有不同的格式风格。我倾向于使用 `/*!` 开头（Qt 风格），每行前添加 `*`，以 `*/` 结束注释块。你可以参考 Doxygen 手册的*文档化代码*小节，以大致了解不同的风格选项。

Doxygen 注释分两个部分：简要描述和详细描述。它们都是可选的。在上面的例子中的注释块是对紧跟其后的构造函数声明的描述。在 `@brief` 之后的文本会显示在类概览小节中：

![A screenshot of the C++ example of using Doxygen showing the Byte Stream Class Reference. The categories in the list are public member functions, writing (operators for writing to the stream), and reading (operators for reading from the stream)][8]

在空行（空行是段落分隔符）之后是构造函数的实际文档。用 `@param[in/out]` 关键字标注传递给构造函数的参数，Doxygen 基于此生成参数列表：

![Screenshot of the Doxygen example showing the parameters under ByteStream][9]

值得注意的是 Doxygen 为 `buffer()` 和 `size()` 方法自动生成了链接。相反，Doxygen 忽略了析构函数前的注释，因为它并没有使用特殊注释：

```
// Destructor
~ByteStream();
```

现在你已经看到 Doxygen 的绝大部分功能了。通过使用一种稍微改良的注释格式，让 Doxygen 能够识别它们。通过使用一些关键字，你甚至可以进一步控制格式化。在下一节中，我会进一步介绍 Doxygen 的其它特性。

### 其它特性

现在几乎所有的工作都可以通过对源代码注释的方式完成。通过一些微调，你可以轻松地优化 Doxygen 的输出。

#### Markdown 格式

为了进阶的格式化，Doxygen 支持 Markdown 和 HTML 命令。Markdown 速查表可以在 [这里][10] 下载到。

#### 项目主页

除了自定义页眉之外，`html/index.html` 几乎没有其它内容了。你可以通过使用关键字向其中添加一些有意义的内容。因为主页通常不是针对某个源代码文件的，你可以将要显示在主页的内容放到项目根目录下的一个单独文件中。示例项目中就是这样做的，其输出效果如下：

![The Doxygen Example Documentation field now contains headings and documentation: Introduction, Running the example, System requirements, and Building the code, with step by step examples and code snippets (all can be found in the example on GitHub)][11]

#### 自动链接生成

上面已将提到了，当你引用代码的其它部分时，Doxygen 会自动识别并生成相应链接。但要注意，这要求被引用部分也有文档才行。

更多信息可以在官方文档的*自动链接生成*中找到。

#### 分组

`ByteStream` 类<ruby>重载<rt>overload</rt></ruby> 了的读写流操作符 （`<<` 和 `>>`）。在类的概览中可以发现操作符被分为读和写两组。分组是在 `ByteStream` 的头文件中定义的。

分组的语法以标记 `@{` 开始，以 `}@` 结束。在标记范围中的内容都属于这个分组。在 `ByteStream.h` 中的实现如下：


```
/** @name Writing
* Operators for writing to the stream
* @{
*/

(...)

/** @}
* @name Reading
* Operators for reading from the stream
* @{
*/

(...)

/** @} */
```

你可以在官方文档的*分组*中找到更多相关信息。

#### LLVM 支持

如果你用 [Clang][12] 构建项目的话，可以通过使用 `-Wdocumentation` 选项让 Clang 对特殊注释进行检查。想了解该特性的更多信息，可以参考 LLVM 用户手册和  Dmitri Gribenko 的展示报告，它们可以在 Clang 网站上找到。

### 谁在用 Doxygen

Doxygen 是在 1997 年首次发布的。尽管有些年头了，现在仍然有很多项目在使用 Doxygen。比如 NASA 的飞行软件框架 [F Prime][13]、图像处理库 [OpenCV][14]、包管理器 [RPM][15]。你还可以在其它领域发现 Doxygen 语法标记的身影，比如内容管理平台 [Drupal][16] 的文档标准中。

注意：Doxygen 输出的 HTML 文档风格类似于九十年代网页。并且它也难以描绘元编程和模板编程架构。在这些情况下，你应该选择 [Sphinx][17] 而不是 Doxygen。

*（题图：MJ/4d354094-397e-4ac5-a80d-25b9c736ede5）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/document-source-code-doxygen-linux

作者：[Stephan Avenwedde][a]
选题：[lkxed][b]
译者：[toknow-gh](https://github.com/toknow-gh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/documentation-type-keys-yearbook.png
[2]: https://www.doxygen.n/
[3]: https://github.com/hANSIc99/DoxygenSample
[4]: https://www.doxygen.nl/manual/
[5]: https://opensource.com/downloads/doxygen-cheat-sheet
[6]: https://opensource.com/sites/default/files/2022-05/main%20page%20doxy.png
[7]: https://opensource.com/sites/default/files/2022-05/doxygen%20class%20overview.png
[8]: https://opensource.com/sites/default/files/2022-05/actual%20doxy%20byte%20stream%20class.png
[9]: https://opensource.com/sites/default/files/2022-05/argument%20list%20from%20Doxygen.png
[10]: https://opensource.com/downloads/cheat-sheet-markdown
[11]: https://opensource.com/sites/default/files/2022-05/main%20page%20doxygen.png
[12]: https://clang.llvm.org/
[13]: https://github.com/nasa/fprime
[14]: https://docs.opencv.org/4.5.5/index.html
[15]: https://github.com/rpm-software-management/rpm
[16]: https://www.drupal.org/docs/develop/standards/api-documentation-and-comment-standards
[17]: https://opensource.com/article/18/11/building-custom-workflows-sphinx
[18]: https://opensource.com/downloads/doxygen-cheat-sheet
[0]: https://img.linux.net.cn/data/attachment/album/202309/26/103240lkeeijekke3egs5n.jpg