[#]: subject: (Test Your Typing Speed in Linux Terminal With Ttyper)
[#]: via: (https://itsfoss.com/ttyper/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13401-1.html)

用 Ttyper 测试你在 Linux 终端的打字速度
======

![](https://img.linux.net.cn/data/attachment/album/202105/18/092309xnzs2qgey3ss8cmq.jpg)

有几种方法可以测试和提高你的打字速度。你可以使用在线工具，在桌面上安装专门的应用，或者在 Linux 终端测试。

Linux 终端？是的。从 [浏览互联网][1] 到 [玩游戏][2]，你可以在强大的 Linux 终端中做 [许多有趣的事情][3]。测试你的打字速度就是其中之一。

### Ttyper：基于终端的打字测试工具

[Ttyper][4] 是一个用 [Rust][5] 编写的工具，允许你练习打字。

它给出了一些最常见的英语单词的随机选择。打出的正确单词用绿色突出显示，错误的用红色突出显示，而且这是实时发生的。你可以按退格键纠正单词，但这将导致分数下降。

![][6]

当你打完所有显示的单词后，你会得到你的打字速度（每分钟字数）、准确率和正确按键数的结果。如果你没有心情打完全部，你可以使用 `Ctrl+C` 退出 Ttyper。

![][7]

你可以在这个由开发者录制的 GIF 中看到 Ttyper 的操作。

![][8]

默认情况下，你有 50 个单词可以练习，但你可以用命令选项来扩大。你还可以使用一个自定义的文本文件，用它的内容来练习打字。

命令 | 内容
---|---
`ttyper` | 200 个最常见的英语单词中的 50 个
`ttyper -w 100` | 200 个最常见的英语单词中的 100 个
`ttyper -w 100 -l english1000` | 1000 个最常见的英语单词中的 100 个
`ttyper text.txt` | 内容来自用空格分隔的 `test.txt`

Ttyper 也专注于开发者。它支持几种编程语言，如果你是一个程序员，你可以用它来测试和改进你在编码时的打字速度。

![][9]

截至目前，支持 C、Csharp、Go、HTML、Java、JavaScript、Python、Ruby 和 Rust 语言。

你可以通过以下方式改变语言：

```
ttyper -l html
```

顺便说一下，“Ttyper” 中的双 “T” 不是一个打字错误。它是故意的，因为TTY（**T**ele**TY**pewriter）代表 [终端模拟器][10]，表明它是一个终端工具。

### 在 Linux 上安装 Ttyper

Ttyper 是用 Rust 构建的，你可以把它安装在任何支持 Rust 编程语言及其 [Cargo 软件包管理器][13]的 Linux 发行版上。

Cargo 相当于 Python 中的 PIP。它有一个[中央仓库][14]，你可以用 Cargo 轻松地下载和安装 Rust 包和它的依赖项。

我将添加在基于 Ubuntu 的 Linux 发行版上安装 Cargo 的说明。你应该可以用你的[发行版的包管理器][15]来安装它。

请确保你在 Ubuntu 上启用了 universe 仓库。你可以用这个命令来安装 Cargo：

```
sudo apt install cargo
```

它将安装 Cargo 包管理器和 Rust 语言的 `rustc` 包。

当你的系统安装了 Cargo，就可以用这个命令来安装 Ttyper：

```
cargo install ttyper
```

这将在你的主目录下的 `.cargo/bin` 目录中添加一个可执行 Rust 文件。它将在软件包安装输出的最后显示。

![][16]

你可以切换到这个目录：

```
cd ~/.cargo/bin
```

并运行 `ttyper` 可执行文件：

```
./ttyper
```

当然，这不是很方便。这就是为什么你应该 [把这个目录添加到 PATH 变量中][17]。如果你熟悉 Linux 的命令行，你可以很容易做到这一点。

不幸的是，我不能在这里给你确切的命令，因为你需要提供这个目录的绝对路径，而这个路径名称会根据你的用户名而不同。例如，对我来说，它是 `/home/abhishek/.cargo/bin`。这个绝对路径对你来说会有所不同。

我建议阅读 [绝对路径和相对路径][18] 以了解更多关于这个问题的信息。

你可以通过删除二进制文件来卸载 Ttyper，或者用 Cargo 命令来卸载：

```
cargo uninstall ttyper
```

如果你喜欢这个灵巧的终端工具，[在 GitHub 上给它加星][4] 以感谢开发者的努力。

正如我在本文开头提到的，你可以在终端做很多很酷的事情。如果你想给你的同事一个惊喜，也许你可以试试 [完全在 Linux 终端中制作幻灯片][12]。

--------------------------------------------------------------------------------

via: https://itsfoss.com/ttyper/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/terminal-web-browsers/
[2]: https://itsfoss.com/best-command-line-games-linux/
[3]: https://itsfoss.com/funny-linux-commands/
[4]: https://github.com/max-niederman/ttyper
[5]: https://www.rust-lang.org/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/ttyper-typing-speed-test-linux.png?resize=800%2C441&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/ttyper-typing-test-result.png?resize=800%2C547&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/ttyper.gif?resize=800%2C498&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/ttyper-typing-test-html.png?resize=800%2C441&ssl=1
[10]: https://itsfoss.com/linux-terminal-emulators/
[13]: https://doc.rust-lang.org/cargo/index.html
[14]: https://crates.io/
[15]: https://itsfoss.com/package-manager/
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/installing-ttyper-linux.png?resize=800%2C399&ssl=1
[17]: https://itsfoss.com/add-directory-to-path-linux/
[18]: https://linuxhandbook.com/absolute-vs-relative-path/
