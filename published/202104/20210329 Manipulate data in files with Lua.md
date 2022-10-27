[#]: subject: (Manipulate data in files with Lua)
[#]: via: (https://opensource.com/article/21/3/lua-files)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13268-1.html)

用 Lua 操作文件中的数据
======

> 了解 Lua 如何处理数据的读写。

![](https://img.linux.net.cn/data/attachment/album/202104/05/102424yczwucc3xcuyzkgw.jpg)

有些数据是临时的，存储在 RAM 中，只有在应用运行时才有意义。但有些数据是要持久的，存储在硬盘上供以后使用。当你编程时，无论是简单的脚本还是复杂的工具套件，通常都需要读取和写入文件。有时文件可能包含配置选项，而另一些时候这个文件是你的用户用你的应用创建的数据。每种语言都会以不同的方式处理这项任务，本文将演示如何使用 Lua 处理文件数据。

### 安装 Lua

如果你使用的是 Linux，你可以从你的发行版软件库中安装 Lua。在 macOS 上，你可以从 [MacPorts][2] 或 [Homebrew][3] 安装 Lua。在 Windows 上，你可以从 [Chocolatey][4] 安装 Lua。

安装 Lua 后，打开你最喜欢的文本编辑器并准备开始。

### 用 Lua 读取文件

Lua 使用 `io` 库进行数据输入和输出。下面的例子创建了一个名为 `ingest` 的函数来从文件中读取数据，然后用 `:read` 函数进行解析。在 Lua 中打开一个文件时，有几种模式可以启用。因为我只需要从这个文件中读取数据，所以我使用 `r`（代表“读”）模式：

```
function ingest(file)
   local f = io.open(file, "r")
   local lines = f:read("*all")
   f:close()
   return(lines)
end

myfile=ingest("example.txt")
print(myfile)
```

在这段代码中，注意到变量 `myfile` 是为了触发 `ingest` 函数而创建的，因此，它接收该函数返回的任何内容。`ingest` 函数返回文件的行数（从一个称为 `lines` 的变量中0。当最后一步打印 `myfile` 变量的内容时，文件的行数就会出现在终端中。

如果文件 `example.txt` 中包含了配置选项，那么我会写一些额外的代码来解析这些数据，可能会使用另一个 Lua 库，这取决于配置是以 INI 文件还是 YAML 文件或其他格式存储。如果数据是 SVG 图形，我会写额外的代码来解析 XML，可能会使用 Lua 的 SVG 库。换句话说，你的代码读取的数据一旦加载到内存中，就可以进行操作，但是它们都需要加载 `io` 库。

### 用 Lua 将数据写入文件

无论你是要存储用户用你的应用创建的数据，还是仅仅是关于用户在应用中做了什么的元数据（例如，游戏保存或最近播放的歌曲），都有很多很好的理由来存储数据供以后使用。在 Lua 中，这是通过 `io` 库实现的，打开一个文件，将数据写入其中，然后关闭文件：

```
function exgest(file)
   local f = io.open(file, "a")
   io.output(f)
   io.write("hello world\n")
   io.close(f)
end

exgest("example.txt")
```

为了从文件中读取数据，我以 `r` 模式打开文件，但这次我使用  `a` （用于”追加“）将数据写到文件的末尾。因为我是将纯文本写入文件，所以我添加了自己的换行符（`/n`）。通常情况下，你并不是将原始文本写入文件，你可能会使用一个额外的库来代替写入一个特定的格式。例如，你可能会使用 INI 或 YAML 库来帮助编写配置文件，使用 XML 库来编写 XML，等等。

### 文件模式

在 Lua 中打开文件时，有一些保护措施和参数来定义如何处理文件。默认值是 `r`，允许你只读数据：

  * `r` 只读
  * `w` 如果文件不存在，覆盖或创建一个新文件。
  * `r+` 读取和覆盖。
  * `a` 追加数据到文件中，或在文件不存在的情况下创建一个新文件。
  * `a+` 读取数据，将数据追加到文件中，或文件不存在的话，创建一个新文件。

还有一些其他的(例如，`b` 代表二进制格式)，但这些是最常见的。关于完整的文档，请参考 [Lua.org/manual][5] 上的优秀 Lua 文档。

### Lua 和文件

和其他编程语言一样，Lua 有大量的库支持来访问文件系统来读写数据。因为 Lua 有一个一致且简单语法，所以很容易对任何格式的文件数据进行复杂的处理。试着在你的下一个软件项目中使用 Lua，或者作为 C 或 C++ 项目的 API。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/lua-files

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://opensource.com/article/20/11/macports
[3]: https://opensource.com/article/20/6/homebrew-mac
[4]: https://opensource.com/article/20/3/chocolatey
[5]: http://lua.org/manual
