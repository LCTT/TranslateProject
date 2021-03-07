[#]: subject: (How to Install the Latest Erlang on Ubuntu Linux)
[#]: via: (https://itsfoss.com/install-erlang-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13182-1.html)

如何在 Ubuntu Linux 上安装最新的 Erlang
======

![](https://img.linux.net.cn/data/attachment/album/202103/07/001753blfwcg2gc2c2lcgl.jpg)

[Erlang][1] 是一种用于构建大规模可扩展实时系统的函数式编程语言。Erlang 最初是由 [爱立信][2] 创建的专有软件，后来被开源。

Erlang 在 [Ubuntu 的 Universe 仓库][3] 中可用。启用该仓库后，你可以使用下面的命令轻松安装它：

```
sudo apt install erlang
```

![][4]

但是，*Ubuntu 仓库提供的 Erlang 版本可能不是最新的*。

如果你想要 Ubuntu 上最新的 Erlang 版本，你可以添加 [Erlang Solutions 提供的][5]仓库。它们为各种 Linux 发行版、Windows 和 macOS 提供了预编译的二进制文件。

如果你之前安装了一个名为 `erlang` 的包，那么它将会被升级到由添加的仓库提供的较新版本。

### 在 Ubuntu 上安装最新版本的 Erlang

你需要[在 Linux 终端下载密钥文件][6]。你可以使用 `wget` 工具，所以请确保你已经安装了它：

```
sudo apt install wget
```

接下来，使用 `wget` 下载 Erlang Solution 仓库的 GPG 密钥，并将其添加到你的 apt 打包系统中。添加了密钥后，你的系统就会信任来自该仓库的包。

```
wget -O- https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | sudo apt-key add -
```

现在，你应该在你的 APT `sources.list.d` 目录下为 Erlang 添加一个文件，这个文件将包含有关仓库的信息，APT 包管理器将使用它来获取包和未来的更新。

对于 Ubuntu 20.04（和 Ubuntu 20.10），使用以下命令：

```
echo "deb https://packages.erlang-solutions.com/ubuntu focal contrib" | sudo tee /etc/apt/sources.list.d/erlang-solution.list
```

我知道上面的命令提到了 Ubuntu 20.04 focal，但它也适用于 Ubuntu 20.10 groovy。

对于 **Ubuntu 18.04**，使用以下命令：

```
echo "deb https://packages.erlang-solutions.com/ubuntu bionic contrib" | sudo tee /etc/apt/sources.list.d/erlang-solution.list
```

你必须更新本地的包缓存，以通知它关于新添加的仓库的包。

```
sudo apt update
```

你会注意到，它建议你进行一些升级。如果你列出了可用的升级，你会在那里找到 erlang 包。要更新现有的 erlang 版本或重新安装，使用这个命令：

```
sudo apt install erlang
```

安装好后，你可以测试一下。

![][7]

要退出 Erlang shell，使用 `Ctrl+g`，然后输入 `q`，由于我从来没有用过 Erlang，所以我只好尝试了一些按键，然后发现了操作方法。

#### 删除 erlang

要删除该程序，请使用以下命令：

```
sudo apt remove erlang
```

还会有一些依赖关系。你可以用下面的命令删除它们：

```
sudo apt autoremove
```

如果你愿意，你也可以删除添加的仓库文件。

```
sudo rm /etc/apt/sources.list.d/erlang-solution.list
```

就是这样。享受在 Ubuntu Linux 上使用 Erlang 学习和编码的乐趣。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-erlang-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.erlang.org/
[2]: https://www.ericsson.com/en
[3]: https://itsfoss.com/ubuntu-repositories/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/install-erlang-ubuntu.png?resize=800%2C445&ssl=1
[5]: https://www.erlang-solutions.com/downloads/
[6]: https://itsfoss.com/download-files-from-linux-terminal/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/erlang-shell.png?resize=800%2C274&ssl=1
