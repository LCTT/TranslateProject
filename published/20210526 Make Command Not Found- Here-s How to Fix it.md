[#]: subject: (Make Command Not Found? Here’s How to Fix it)
[#]: via: (https://itsfoss.com/make-command-not-found-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13451-1.html)

Make 命令未找到？这是修复它的方法
======

![](https://img.linux.net.cn/data/attachment/album/202106/02/203049l51rbr5v55kivg11.jpg)

有一天，我试图在一个新的 Ubuntu 系统上编译一个程序，当我试图使用 `make` 命令时，它向我抛出一个错误：

```
The program 'make' is currently not installed. You can install it by typing:
sudo apt install make
```

这表明 `make` 命令还没有安装。你可以用这些命令在 Ubuntu 上逐步安装 `make`：

```
sudo apt update
sudo apt install make
```

第一个命令是更新本地的软件包缓存。如果是一个新安装的 Ubuntu 系统，这是很有必要的。有了刷新的软件包缓存，你的系统就会知道应该从哪个仓库下载 `make` 包。

并验证 `make` 是否已经正确安装：

```
make --version
```

![Checking make version][1]

### 在 Ubuntu 上安装 make 的更好方法

安装 `make` 命令的一个更好的方法是使用 `build-essential` 包。这个包包含 `make`、`gcc`、`g++` 和其他一些编译器和开发工具。

```
sudo apt install build-essential
```

![Installing Build Essential package][2]

安装了这个 `build-essential` 包后，你就可以[在 Linux 中轻松地运行 C/C++ 程序][3]。

### 如果 make 已经安装了，但它没有工作怎么办？

在一些罕见的情况下，可能会发生 `make` 已经安装了，但却无法工作的情况。

其原因是 `make` 命令不在 `$PATH` 变量中。你可以用这个命令重新安装 `make`：

```
sudo apt install --reinstall make
```

如果这不起作用，你可以尝试 [手动添加二进制文件到你的 PATH 中][4]，但这应该不需要手动。

我希望这个快速提示能帮助你。仍然有问题或对相关主题有疑问？请随时在评论区留言。

--------------------------------------------------------------------------------

via: https://itsfoss.com/make-command-not-found-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/check-make-version-linux.png?resize=800%2C293&ssl=1
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/install-build-essentials-800x410.png?resize=800%2C410&ssl=1
[3]: https://itsfoss.com/c-plus-plus-ubuntu/
[4]: https://itsfoss.com/add-directory-to-path-linux/
[5]: https://itsfoss.community/
