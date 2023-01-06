[#]: subject: "What is Build Essential Package in Ubuntu? How to Install it?"
[#]: via: "https://itsfoss.com/build-essential-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13953-1.html"

构建基础包的基础知识
======

![][5]

> 这是一篇快速提示，旨在给 Ubuntu 的新用户解释构建基础包是什么、它的用处和安装步骤。

在 Ubuntu 中安装构建基础包（`build-essential`），只需要在终端中简单输入这个命令：

```
sudo apt update && sudo apt install build-essential
```

但围绕它有几个问题，你可能想知道答案：

  * 什么是构建基础包？
  * 它包含什么内容？
  * 为什么要安装它（如果安装的话）？
  * 如何安装它？
  * 如何删除它？

### 什么是 Ubuntu 中的构建基础包？

构建基础包（`build-essential`）实际上是属于 Debian 的。在它里面其实并不是一个软件。它包含了创建一个 Debian 包（`.deb`）所需的软件包列表。这些软件包包括 `libc`、`gcc`、`g++`、`make`、`dpkg-dev` 等。构建基础包包含这些所需的软件包作为依赖，所以当你安装它时，你只需一个命令就能安装所有这些软件包。

请不要认为构建基础包是一个可以在一个命令中神奇地安装从 Ruby 到 Go 的所有开发工具的超级软件包。它包含一些开发工具，但不是全部。

#### 你为什么要安装构建基础包？

它用来从应用的源代码创建 DEB 包。一个普通用户不会每天都去创建 DEB 包，对吗？

然而，有些用户可能会使用他们的 Ubuntu Linux 系统进行软件开发。如果你想 [在 Ubuntu 中运行 c 程序][1]，你需要 gcc 编译器。如果你想 [在 Ubuntu 中运行 C++ 程序][2]，你需要 g++ 编译器。如果你要使用一个不寻常的、只能从源代码中获得的软件，你的系统会抛出 “[make 命令未找到的错误][3]”，因为你需要先安装 `make` 工具。

当然，所有这些都可以单独安装。然而，利用构建基础包的优势，一次性安装所有这些开发工具要容易得多。这就是你得到的好处。

这就像 [ubuntu-restricted-extras 包允许你一次安装几个媒体编解码器][4]。

现在你知道了这个包的好处，让我们看看如何安装它。

### 在 Ubuntu Linux 中安装构建基础包

在 Ubuntu 中按 `Ctrl+Alt+T` 快捷键打开终端，输入以下命令：

```
sudo apt update
```

使用 `sudo` 命令，你会被要求输入你的账户密码。当你输入时，屏幕上没有任何显示。这没问题。这在大多数 Linux 系统中都是这样的。盲打输入你的密码，然后按回车键。

![][6]

`apt update` 命令刷新了本地软件包的缓存。这对于一个新安装的 Ubuntu 来说是必不可少的。

之后，运行下面的命令来安装构建基础包：

```
sudo apt install build-essential
```

它应该显示所有要安装的软件包。当要求确认时按 `Y`：

![][7]

等待安装完成。就好了。

### 从 Ubuntu 中删除构建基础包

保留这些开发工具不会损害你的系统。但如果你的磁盘空间不足，你可以考虑删除它。

在 Ubuntu 中，由于有 `apt remove` 命令，删除软件很容易：

```
sudo apt remove build-essential
```

运行 `autoremove` 命令来删除剩余的依赖包也是一个好主意：

```
sudo apt autoremove
```

你现在知道了构建基础包的基础知识（双关语）。希望对你有用~

--------------------------------------------------------------------------------

via: https://itsfoss.com/build-essential-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/run-c-program-linux/
[2]: https://itsfoss.com/c-plus-plus-ubuntu/
[3]: https://itsfoss.com/make-command-not-found-ubuntu/
[4]: https://itsfoss.com/install-media-codecs-ubuntu/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/Build-Essential-Ubuntu.png?resize=800%2C450&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/apt-update.png?resize=800%2C467&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/install-build-essential-ubuntu.png?resize=800%2C434&ssl=1
