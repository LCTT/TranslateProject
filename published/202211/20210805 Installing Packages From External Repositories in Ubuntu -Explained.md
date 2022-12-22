[#]: subject: "Installing Packages From External Repositories in Ubuntu [Explained]"
[#]: via: "https://itsfoss.com/adding-external-repositories-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "nophDog"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15299-1.html"

详解在 Ubuntu 从外部存储库安装软件包
======

![][0]

你大概知道怎么在 Ubuntu 中使用 `apt` 命令安装软件包。那些软件包都是来自 Ubuntu 的官方存储库。

那第三方或者外部存储库呢？不，我这里并不是要讲 PPA。

早晚你会碰到那种至少四行的安装说明：你需要安装名为 `apt-transport-https` 的包、操作一下 GPG 和 <ruby>源列表<rt>source list</rt></ruby> 之后，你才能正常安装软件包。

没有什么印象的话，那我分享一个 [在 Ubuntu 上安装最新版本的 Yarn][1] 的例子：

```
sudo apt install apt-transport-https curl
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo sh -c 'echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list'
sudo apt update && sudo apt install yarn
```

当你需要直接从开发者那里安装编程工具的时候，大概率会碰到这种安装方式。

许多人只是按照说明进行操作，并不会去思考其中的原理。这也没什么不对，但了解该过程实际上可以提升你在这方面的知识，而且有助于之后排除故障。

我来解释一下这些代码背后的逻辑。

### 理解从外部存储库安装的过程

在你继续往下阅读之前，我强烈建议你先看看下面这两篇文章，方便理解后续的概念：

  * [什么是 Ubuntu 中的存储库][2]
  * [什么是 Ubuntu 中 PPA][3]

为了让你有点印象，这里有一张软件包存储库和 [Linux 中的包管理器][4] 的图片。

![Illustration of repository and package manager][5]

整件事情其实就是在系统中添加一个新的外部存储库。这样，你就可以从这个新存储库下载并安装可用的软件包。如果这个存储库提供了包版本的更新，你可以在更新系统的同时更新这些软件包（`apt update && apt upgrade`）。

那么，这是什么工作原理呢？让我们一条一条地过一遍。

#### 第 1 部分：为 apt 获取 HTTPS 支持

第一行是这样的：

```
sudo apt install apt-transport-https curl
```

`curl` 是一个 [Linux 终端下载文件的工具][6]。这里主要的部分是安装 `apt-transport-https`，但事实上已经不需要了。

明白了吗？这个 `apt-transport-https` 包让你的系统通过 HTTPS 协议安全访问存储库。按照设计，Ubuntu 的存储库使用 http 而不是 https 协议。

看看下面的截图。 https 这张图是我已经添加到系统中的外部存储库。Ubuntu 的存储库和 PPA 使用 http 协议。

![][7]

在旧版本的 `apt` 包管理器中，不支持 https 协议。`apt-transport-https` 包为 `apt` 添加了 https 支持。要新增一个使用 https 的存储库，首先就得先安装此包。

我之前不是说不需要安装这个包了吗？是的，因为较新版本的 `apt`（高于 1.5）已经支持 https，所以你不需要再安装 `apt-transport-https`。

但是你依然看到我在说明中提到了这个包。这更多是出于遗留原因，而且可能还有很旧的发行版在使用旧版本的 `apt` 包。

现在，你可能想知道既然 https 是安全协议，那为什么 Ubuntu 的存储库还要使用 http 而不是 https。这难道没有安全风险吗？接着往下看你就知道答案了。

#### 第 2 部分：添加远程存储库的 GPG 密钥

Linux 存储库内置了基于 GPG 密钥的安全机制。每个存储库都将其 GPG 公钥添加到你的系统信任密钥中。来自存储库的包由这个 GPG 密钥“<ruby>签名<rt>signed</rt></ruby>”，并且通过这份存储的公钥，系统能够验证软件包正是来自这个存储库。

如果 [密钥之间不匹配，你的系统会发出提醒][8]，而不会继续从该存储库安装或者更新软件包。

到目前为止，一切都很顺利。下一步是将外部存储库的 GPG 公钥添加到你的 Linux 系统，以便它能接收来自该存储库的软件包。

```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
```

在上面的命令中，你使用 `curl` 从指定的 URL 下载 GPG 密钥。选项 `-sS` 能够让你不看多余的输出（静默模式），但会显示错误（如果有的话）。最后一个 `-` 告诉 `apt-key` 使用<ruby>标准输入<rt>stdin</rt></ruby>而不是文件（在本例中是 `curl` 命令的输出）。

`apt-key add` 命令已经将下载的密钥添加到系统中。

你可以通过 `apt-key list` 命令查看系统中各种存储库添加的 GPG 密钥。

![List GPG keys][9]

这是将 GPG 密钥添加到系统的一种方法。你会看到一些其它的命令，看起来略有不同，但效果一样，都是将存储库的公钥添加到你的系统里面。

```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
```

你会注意到 `apt-key` 已被弃用的警告。在 Ubuntu 22.04 之前，你还可以使用 `apt-key` 命令，但它最终会被删除。现在不需要杞人忧天。

#### 第 3 部分：将外部存储库添加到源列表

下个命令是在系统的源列表中添加一个新条目。这样，你的系统就会知道它得检查该存储库中的包和更新。

```
sudo sh -c 'echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list'
```

有一个文件 `/etc/apt/sources.list` 包含 Ubuntu 存储库的详细信息。最好不要随便动这个文件。所有新增的存储库都应放在 `/etc/apt/sources.list.d` 目录中相应的文件里（约定以 `.list` 结尾）。

![External repository should have their own sources list file in the /etc/apt/sources.list.d directory][10]

这使得包管理变得更容易。如果你要从系统中删除一个存储库，只需删除相应的源文件即可。无需修改主 `sources.list` 文件。

让我们再仔细地看一下这行命令。

```
sudo sh -c 'echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list'
```

使用 `sh` 可以在一个新的 shell 进程中运行命令，而不是 [子 shel​​l][11]。 `-c` 选项告诉 `sh` 命令从参数而不是标准输入读取命令。然后它运行 `echo` 命令，也就是把 `deb https://dl.yarnpkg.com/debian/ stable main` 这一行添加到 `/etc/apt/sources.list.d/yarn.list` 文件（会创建该文件）。

现在，你可以通过各种方法在指定目录中创建 `.list` 文件并在其中添加包含存储库详细信息的数据行。你也可以像这样使用：

```
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
```

明白了吧？

#### 第 4 部分：从新添加的存储库安装应用程序

到目前为止，你已经将存储库的 GPG 密钥和存储库的 URL 添加到系统中。

但是系统仍然不晓得这个新存储库中有哪些可用的包。这就是为什么你需要先使用下面这个命令更新包元数据的本地缓存：

```
sudo apt update
```

这时你的系统就已经知道新增存储库中可用软件包的信息，现在可以试试安装软件包：

```
sudo apt install yarn
```

为了节省时间，你可以在 [同一行挨着运行这两个命令][12]e。

```
sudo apt update && sudo apt install yarn
```

`&&` 可以确保第二个命令只会在前一个命令没有任何报错的前提下运行。

整个流程就是这样。

#### 有没有豁然开朗呢，还是一脸懵逼？

我已经解释了在 Ubuntu 中使用外部存储库背后的逻辑。希望你现在能更好地理解它，当然可能还有很多细节会让你困惑。

如果你还不清楚或者还有其他问题，可以联系我。如果你发现了技术上的纰漏，记得在评论区告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/adding-external-repositories-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[nophDog](https://github.com/nophDog)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-yarn-ubuntu/
[2]: https://itsfoss.com/ubuntu-repositories/
[3]: https://itsfoss.com/ppa-guide/#comments
[4]: https://itsfoss.com/package-manager/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/linux-package-manager-explanation.png?resize=800%2C450&ssl=1
[6]: https://itsfoss.com/download-files-from-linux-terminal/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/apt-update-http-https.png?resize=800%2C527&ssl=1
[8]: https://itsfoss.com/solve-gpg-error-signatures-verified-ubuntu/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/list-apt-key-gpg-ubuntu.png?resize=800%2C547&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/sources-list-ubuntu.png?resize=800%2C313&ssl=1
[11]: https://linuxhandbook.com/subshell/
[12]: https://itsfoss.com/run-multiple-commands-linux/
[0]: https://img.linux.net.cn/data/attachment/album/202211/29/154339id0xb2exw0c8y222.jpg