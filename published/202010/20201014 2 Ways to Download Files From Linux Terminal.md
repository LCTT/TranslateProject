[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12752-1.html)
[#]: subject: (2 Ways to Download Files From Linux Terminal)
[#]: via: (https://itsfoss.com/download-files-from-linux-terminal/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

2 种从 Linux 终端下载文件的方法
======

如果你被困在 Linux 终端，比如说在服务器上，如何从终端下载文件？

在 Linux 中是没有 `download` 命令的，但是有几个 Linux 命令可用于下载文件。

在这篇终端技巧中，你将学习两种在 Linux 中使用命令行下载文件的方法。

我在这里使用的是 Ubuntu，但除了安装，其余的命令同样适用于所有其他 Linux 发行版。

### 使用 wget 命令从 Linux 终端下载文件

![][1]

[wget][2] 也许是 Linux 和类 UNIX 系统中使用最多的命令行下载管理器。你可以使用 `wget` 下载一个文件、多个文件、整个目录甚至整个网站。

`wget` 是非交互式的，可以轻松地在后台工作。这意味着你可以很容易地在脚本中使用它，甚至构建像 [uGet 下载管理器][3]这样的工具。

让我们看看如何使用 `wget` 从终端下载文件。

#### 安装 wget

大多数 Linux 发行版都预装了 `wget`。它也可以在大多数发行版的仓库中找到，你可以使用发行版的包管理器轻松安装它。

在基于 Ubuntu 和 Debian 的发行版上，你可以使用 [apt 包管理器][4]命令：

```
sudo apt install wget
```

#### 使用 wget 下载文件或网页

你只需要提供文件或网页的 URL。它将在你所在的目录下以原始名下载该文件。

```
wget URL
```

![][5]

要下载多个文件，你必须将它们的 URL 保存在一个文本文件中，并将该文件作为输入提供给 `wget`，就像这样：

```
wget -i download_files.txt
```

#### 用 wget 下载不同名字的文件

你会注意到，网页在 `wget` 中几乎总是以 `index.html` 的形式保存。为下载的文件提供自定义名称是个好主意。

你可以在下载时使用 `-O` （大写字母 `O`） 选项来提供输出文件名：

```
wget -O filename URL
```

![][6]

#### 用 wget 下载一个文件夹

假设你正在浏览一个 FTP 服务器，你需要下载整个目录，你可以使用递归选项 `-r`：

```
wget -r ftp://server-address.com/directory
```

#### 使用 wget 下载整个网站

是的，你完全可以做到这一点。你可以用 `wget` 镜像整个网站。我说的下载整个网站是指整个面向公众的网站结构。

虽然你可以直接使用镜像选项 `-m`，但最好加上：

  * `–convert-links`：链接将被转换，使内部链接指向下载的资源，而不是网站。
  * `–page-requisites`：下载额外的东西，如样式表，使页面在离线状态下看起来更好。

```
wget -m --convert-links --page-requisites website_address
```

![][7]

#### 额外提示：恢复未完成的下载

如果你因为某些原因按 `CTRL-C` 键中止了下载，你可以用选项 `-c` 恢复之前的下载：

```
wget -c
```

### 使用 curl 在 Linux 命令行中下载文件

和 `wget` 一样，[curl][8] 也是 Linux 终端中最常用的下载文件的命令之一。[使用 curl][9] 的方法有很多，但我在这里只关注简单的下载。

#### 安装 curl

虽然 `curl` 并不是预装的，但在大多数发行版的官方仓库中都有。你可以使用你的发行版的包管理器来安装它。

要[在 Ubuntu][10] 和其他基于 Debian 的发行版上安装 `curl`，请使用以下命令：

```
sudo apt install curl
```

#### 使用 curl 下载文件或网页

如果你在使用 `curl` 命令时没有在 URL 中带任何选项，它就会读取文件并打印在终端上。

要在 Linux 终端中使用 `curl` 命令下载文件，你必须使用 `-O`（大写字母 `O`）选项：

```
curl -O URL
```

![][11]

在 Linux 中，用 `curl` 下载多个文件是比较简单的。你只需要指定多个 URL 即可：

```
curl -O URL1 URL2 URL3
```

请记住，`curl` 不像 `wget` 那么简单。`wget` 可以将网页保存为 `index.html`，`curl` 却会抱怨远程文件没有网页的名字。你必须按照下一节的描述用一个自定义的名字来保存它。

#### 用不同的名字下载文件

这可能会让人感到困惑，但如果要为下载的文件提供一个自定义的名称（而不是原始名称），你必须使用 `-o`（小写 `O`）选项：

```
curl -o filename URL
```

![][12]

有些时候，`curl` 并不能像你期望的那样下载文件，你必须使用选项 `-L`（代表位置）来正确下载。这是因为有些时候，链接会重定向到其他链接，而使用选项 `-L`，它就会跟随最终的链接。

#### 用 curl 暂停和恢复下载

和 `wget` 一样，你也可以用 `curl` 的 `-c` 选项恢复暂停的下载：

```
curl -c URL
```

### 总结

和以往一样，在 Linux 中做同一件事有多种方法。从终端下载文件也不例外。

`wget` 和 `curl` 只是 Linux 中最流行的两个下载文件的命令。还有更多这样的命令行工具。基于终端的网络浏览器，如 [elinks][13]、[w3m][14] 等也可以用于在命令行下载文件。

就个人而言，对于一个简单的下载，我更喜欢使用 `wget` 而不是 `curl`。它更简单，也不会让你感到困惑，因为你可能很难理解为什么 `curl` 不能以预期的格式下载文件。

欢迎你的反馈和建议。

--------------------------------------------------------------------------------

via: https://itsfoss.com/download-files-from-linux-terminal/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/Download-Files-from-Linux-terminal.png?resize=800%2C450&ssl=1
[2]: https://www.gnu.org/software/wget/
[3]: https://itsfoss.com/install-latest-uget-ubuntu-linux-mint/
[4]: https://itsfoss.com/apt-command-guide/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/download-file-in-linux-terminal-using-wget.png?resize=795%2C418&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/download-file-in-linux-terminal-using-wget-2.png?resize=795%2C418&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/download-entire-website-using-wget.png?resize=795%2C418&ssl=1
[8]: https://curl.haxx.se/
[9]: https://linuxhandbook.com/curl-command-examples/
[10]: https://itsfoss.com/install-curl-ubuntu/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/download-files-in-linux-using-curl.png?resize=795%2C418&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/download-files-in-linux-using-curl-1.png?resize=795%2C418&ssl=1
[13]: http://elinks.or.cz/
[14]: http://w3m.sourceforge.net/
