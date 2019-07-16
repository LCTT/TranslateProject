[#]: collector: (lujun9972)
[#]: translator: (dianbanjiu)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10531-1.html)
[#]: subject: (Using more to view text files at the Linux command line)
[#]: via: (https://opensource.com/article/19/1/more-text-files-linux)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

在 Linux 命令行使用 more 查看文本文件  
======

> 文本文件和 Linux 一直是携手并进的。或者说看起来如此。那你又是依靠哪些让你使用起来很舒服的工具来查看这些文本文件的呢？  

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE)

Linux 下有很多实用工具可以让你在终端界面查看文本文件。其中一个就是 [more][1]。  

`more` 跟我之前另一篇文章里写到的工具 —— [less][2] 很相似。它们之间的主要不同点在于 `more` 只允许你向前查看文件。  

尽管它能提供的功能看起来很有限，不过它依旧有很多有用的特性值得你去了解。下面让我们来快速浏览一下 `more` 可以做什么，以及如何使用它吧。

### 基础使用  

假设你现在想在终端查看一个文本文件。只需打开一个终端，进入对应的目录，然后输入以下命令：  

```shell
$ more <filename>
```

例如，  

```shell
$ more jekyll-article.md
```

![](https://opensource.com/sites/default/files/uploads/more-viewing-file.png)

使用空格键可以向下翻页，输入 `q` 可以退出。  

如果你想在这个文件中搜索一些文本，输入 `/` 字符并在其后加上你想要查找的文字。例如你要查看的字段是 “terminal”，只需输入：  

```
/terminal
```

![](https://opensource.com/sites/default/files/uploads/more-searching.png)

搜索的内容是区分大小写的，所以输入 `/terminal` 跟 `/Terminal` 会出现不同的结果。  

### 和其他实用工具组合使用

你可以通过管道将其他命令行工具得到的文本传输到 `more`。你问为什么这样做？因为有时这些工具获取的文本会超过终端一页可以显示的限度。  

想要做到这个，先输入你想要使用的完整命令，后面跟上管道符（`|`），管道符后跟 `more`。假设现在有一个有很多文件的目录。你就可以组合 `more` 跟 `ls` 命令完整查看这个目录当中的内容。  

```shell
$ ls | more
```

![](https://opensource.com/sites/default/files/uploads/more-with_ls_cmd.png)

你可以组合 `more` 和 `grep` 命令，从而实现在多个文件中找到指定的文本。下面是我在多篇文章的源文件中查找 “productivity” 的例子。

```shell
$ grep ‘productivity’ core.md Dict.md lctt2014.md lctt2016.md lctt2018.md README.md | more
```

![](https://opensource.com/sites/default/files/uploads/more-with_grep_cmd.png)

另外一个可以和 `more` 组合的实用工具是 `ps`（列出你系统上正在运行的进程）。当你的系统上运行了很多的进程，你现在想要查看他们的时候，这个组合将会派上用场。例如你想找到一个你需要杀死的进程，只需输入下面的命令：  

```shell
$ ps -u scott | more
```

注意用你的用户名替换掉 “scott”。  

![](https://opensource.com/sites/default/files/uploads/more-with_ps_cmd.png)

就像我文章开篇提到的， `more` 很容易使用。尽管不如它的双胞胎兄弟 `less` 那般灵活，但是仍然值得了解一下。  

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/more-text-files-linux

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/More_(command)
[2]: https://opensource.com/article/18/4/using-less-view-text-files-command-line
