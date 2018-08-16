如何在 Linux 上使用 pbcopy 和 pbpaste 命令
======

![](https://www.ostechnix.com/wp-content/uploads/2018/07/Pbcopy-And-Pbpaste-Commands-720x340.png)

由于 Linux 和 Mac OS X 是基于 *Nix 的系统，因此许多命令可以在两个平台上运行。但是，某些命令可能在两个平台上都没有，比如 `pbcopy` 和 `pbpast`。这些命令仅在 Mac OS X 平台上可用。`pbcopy` 命令将标准输入复制到剪贴板。然后，你可以在任何地方使用 `pbpaste` 命令粘贴剪贴板内容。当然，上述命令可能有一些 Linux 替代品，例如 `xclip`。 `xclip` 与 `pbcopy` 完全相同。但是，从 Mac OS 切换到 Linux 的发行版的人将会找不到这两个命令，不过仍然想使用它们。别担心！这个简短的教程描述了如何在 Linux 上使用 `pbcopy` 和 `pbpaste` 命令。

###  安装 xclip / xsel

就像我已经说过的那样，Linux 中没有 `pbcopy` 和 `pbpaste` 命令。但是，我们可以通过 shell 别名使用 xclip 和/或 xsel 命令复制 `pbcopy` 和 `pbpaste` 命令的功能。xclip 和 xsel 包存在于大多数 Linux 发行版的默认存储库中。请注意，你无需安装这两个程序。只需安装上述任何一个程序即可。

要在 Arch Linux 及其衍生产版上安装它们，请运行：

```
$ sudo pacman xclip xsel
```

在 Fedora 上：

```
$ sudo dnf xclip xsel
```

在 Debian、Ubuntu、Linux Mint 上：

```
$ sudo apt install xclip xsel
```

安装后，你需要为 `pbcopy` 和 `pbpaste` 命令创建别名。为此，请编辑 `~/.bashrc`：

```
$ vi ~/.bashrc
```

如果要使用 xclip，请粘贴以下行：

```
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
```

如果要使用 xsel，请在 `~/.bashrc` 中粘贴以下行。

```
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
```

保存并关闭文件。

接下来，运行以下命令以更新 `~/.bashrc` 中的更改。

```
$ source ~/.bashrc
```

ZSH 用户将上述行粘贴到 `~/.zshrc` 中。

### 在 Linux 上使用 pbcopy 和 pbpaste 命令

让我们看一些例子。

`pbcopy` 命令将文本从 stdin 复制到剪贴板缓冲区。例如，看看下面的例子。

```
$ echo "Welcome To OSTechNix!" | pbcopy
```

上面的命令会将文本 “Welcome to OSTechNix” 复制到剪贴板中。你可以稍后访问此内容并使用如下所示的 `pbpaste` 命令将其粘贴到任何位置。

```
$ echo `pbpaste`
Welcome To OSTechNix!
```

![](https://www.ostechnix.com/wp-content/uploads/2018/07/pbcopy-and-pbpaste-commands-in-action.png)

以下是一些其他例子。

我有一个名为 `file.txt` 的文件，其中包含以下内容。

```
$ cat file.txt
Welcome To OSTechNix!
```

你可以直接将文件内容复制到剪贴板中，如下所示。

```
$ pbcopy < file.txt
```

现在，只要你用其他文件的内容更新了剪切板，那么剪切板中的内容就可用了。

要从剪贴板检索内容，只需输入：

```
$ pbpaste
Welcome To OSTechNix!
```

你还可以使用管道字符将任何 Linux 命令的输出发送到剪贴板。看看下面的例子。

```
$ ps aux | pbcopy
```

现在，输入 `pbpaste` 命令以显示剪贴板中 `ps aux` 命令的输出。

```
$ pbpaste
```

![](https://www.ostechnix.com/wp-content/uploads/2018/07/pbcopy-and-pbpaste-commands-2.png)

使用 `pbcopy` 和 `pbpaste` 命令可以做更多的事情。我希望你现在对这些命令有一个基本的想法。

就是这些了。还有更好的东西。敬请关注！

干杯!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-use-pbcopy-and-pbpaste-commands-on-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
