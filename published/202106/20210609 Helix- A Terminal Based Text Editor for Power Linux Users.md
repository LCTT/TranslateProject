[#]: subject: (Helix: A Terminal Based Text Editor for Power Linux Users)
[#]: via: (https://itsfoss.com/helix-editor/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13495-1.html)

Helix：高级 Linux 用户的终端文本编辑器
======

说到 [基于终端的文本编辑器][1]，通常 Vim、Emacs 和 Nano 受到了关注。

这并不意味着没有其他这样的文本编辑器。Vim 的现代增强版 [Neovim][2]，是许多这样的例子之一。

按照同样的思路，我想介绍另一个基于终端的文本编辑器，叫做 Helix Editor。

### Helix，一个用 Rust 编写的现代文本编辑器

![][3]

[Helix][4] 是用 Rust 编写的，使用 Tree-sitter 进行语法高亮。开发者声称，它比正则表达式高亮更快，因为 Tree-sitter 像编译器一样将代码解析成语法树，从而给出更多的代码结构信息。

你可以跟踪局部变量，计算缩进和操作选择来选择语法节点。它足够强大，即使有语法错误也能产生结果。

Helix 的主要亮点是“多重选择”，这是基于 [Kakoune][5] 的。

内置的语言服务器支持提供上下文感知补全、诊断和代码操作。

### 在 Linux 上安装 Helix

对于 Arch 和 Manjaro 用户来说，Helix 在 AUR 中有两个包：

  * [helix-bin][6]: 包含来自 GitHub 发布的预构建二进制文件
  * [helix-git][7]: 构建该仓库的主分支

作为一个 Arch 用户，我相信你可能已经知道 [如何使用 AUR 安装应用][8]。

对于其他 Linux 发行版，你必须使用 Cargo。Cargo 是 Rust 软件包管理器。有了它，你可以安装 Rust 包。可以认为它相当于 Python 的 PIP。

你应该能够使用你的发行版的包管理器来安装 Cargo。在基于 Ubuntu 的发行版上，可以这样安装 Cargo：

```
sudo apt install cargo
```

接下来，你要克隆 Helix 仓库：

```
git clone --recurse-submodules --shallow-submodules -j8 https://github.com/helix-editor/helix
```

进入克隆的目录中：

```
cd helix
```

现在用 `cargo` 来安装 Helix：

```
cargo install --path helix-term --features "embed_runtime"
```

最后一步是将 `hx` 二进制文件添加到 `PATH` 变量中，这样你就可以从任何地方运行它。这应该被添加到你的 `bashrc` 或 bash 配置文件中。

```
export PATH=”$HOME/.cargo/bin:$PATH”
```

现在都设置好了，你应该可以通过在终端输入 `hx` 来使用编辑器。

你可以在 Helix 的[文档页][9]上找到使用 Helix 的键盘快捷键：

- [Helix 键盘快捷键][10]

它与 Vim 或 Neovim 相比如何？我无法说。我可以用 Vim 进行基本的编辑，但我不是 Vim 忍者。如果你是一个信奉 Vim（或 Emacs）的人，请你试试 Helix 并自己判断。

--------------------------------------------------------------------------------

via: https://itsfoss.com/helix-editor/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/command-line-text-editors-linux/
[2]: https://neovim.io/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/helix-editor-screenshot.png?resize=800%2C515&ssl=1
[4]: https://helix-editor.com/
[5]: http://kakoune.org/
[6]: https://aur.archlinux.org/packages/helix-bin/
[7]: https://aur.archlinux.org/packages/helix-git/
[8]: https://itsfoss.com/aur-arch-linux/
[9]: https://docs.helix-editor.com/
[10]: https://docs.helix-editor.com/keymap.html
