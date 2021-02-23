ddgr：一个从终端搜索 DuckDuckGo 的命令行工具
======

在 Linux 中，Bash 技巧非常棒，它使 Linux 中的一切成为可能。

对于开发人员或系统管理员来说，它真的很管用，因为他们大部分时间都在使用终端。你知道他们为什么喜欢这种技巧吗？

因为这些技巧可以提高他们的工作效率，也能使他们工作更快。

### 什么是 ddgr

[ddgr][1] 是一个命令行实用程序，用于从终端搜索 DuckDuckGo。如果设置了 `BROWSER` 环境变量，ddgr 可以在几个基于文本的浏览器中开箱即用。

确保你的系统安装了任何一个基于文本的浏览器。你可能知道 [googler][2]，它允许用户从 Linux 命令行进行 Google 搜索。

它在命令行用户中非常受欢迎，他们期望对隐私敏感的 DuckDuckGo 也有类似的实用程序，这就是 `ddgr` 出现的原因。

与 Web 界面不同，你可以指定每页要查看的搜索结果数。

**建议阅读：**

- [Googler – 从 Linux 命令行搜索 Google][2]
- [Buku – Linux 中一个强大的命令行书签管理器][3]
- [SoCLI – 从终端搜索和浏览 StackOverflow 的简单方法][4]
- [RTV（Reddit 终端查看器）- 一个简单的 Reddit 终端查看器][5]

### 什么是 DuckDuckGo

DDG 即 DuckDuckGo。DuckDuckGo（DDG）是一个真正保护用户搜索和隐私的互联网搜索引擎。它没有过滤用户的个性化搜索结果，对于给定的搜索词，它会向所有用户显示相同的搜索结果。

大多数用户更喜欢谷歌搜索引擎，但是如果你真的担心隐私，那么你可以放心地使用 DuckDuckGo。

### ddgr 特性

  * 快速且干净（没有广告、多余的 URL 或杂物参数），自定义颜色
  * 旨在以最小的空间提供最高的可读性
  * 指定每页显示的搜索结果数
  * 可以在 omniprompt 中导航结果，在浏览器中打开 URL
  * 用于 Bash、Zsh 和 Fish 的搜索和选项补完脚本
  * 支持 DuckDuckGo Bang（带有自动补完）
  * 直接在浏览器中打开第一个结果（如同 “I’m Feeling Ducky”）
  * 不间断搜索：无需退出即可在 omniprompt 中触发新搜索
  * 关键字支持（例如：filetype:mime、site:somesite.com）
  * 按时间、指定区域搜索，禁用安全搜索
  * 支持 HTTPS 代理，支持 Do Not Track，可选择禁用用户代理字符串
  * 支持自定义 URL 处理程序脚本或命令行实用程序
  * 全面的文档，man 页面有方便的使用示例
  * 最小的依赖关系

### 需要条件

`ddgr` 需要 Python 3.4 或更高版本。因此，确保你的系统应具有 Python 3.4 或更高版本。

```
$ python3 --version
Python 3.6.3
```

### 如何在 Linux 中安装 ddgr

我们可以根据发行版使用以下命令轻松安装 `ddgr`。

对于 Fedora ，使用 [DNF 命令][6]来安装 `ddgr`。

```
# dnf install ddgr
```

或者我们可以使用 [SNAP 命令][7]来安装 `ddgr`。

```
# snap install ddgr
```

对于 LinuxMint/Ubuntu，使用 [APT-GET 命令][8] 或 [APT 命令][9]来安装 `ddgr`。

```
$ sudo add-apt-repository ppa:twodopeshaggy/jarun
$ sudo apt-get update
$ sudo apt-get install ddgr
```

对于基于 Arch Linux 的系统，使用 [Yaourt 命令][10]或 [Packer 命令][11]从 AUR 仓库安装 `ddgr`。

```
$ yaourt -S ddgr
或
$ packer -S ddgr
```

对于 Debian，使用 [DPKG 命令][12] 安装 `ddgr`。

```
# wget https://github.com/jarun/ddgr/releases/download/v1.2/ddgr_1.2-1_debian9.amd64.deb
# dpkg -i ddgr_1.2-1_debian9.amd64.deb
```

对于 CentOS 7，使用 [YUM 命令][13]来安装 `ddgr`。

```
# yum install https://github.com/jarun/ddgr/releases/download/v1.2/ddgr-1.2-1.el7.3.centos.x86_64.rpm
```

对于 opensuse，使用 [zypper 命令][14]来安装 `ddgr`。

```
# zypper install https://github.com/jarun/ddgr/releases/download/v1.2/ddgr-1.2-1.opensuse42.3.x86_64.rpm
```

### 如何启动 ddgr

在终端上输入 `ddgr` 命令，不带任何选项来进行 DuckDuckGo 搜索。你将获得类似于下面的输出。

```
$ ddgr
```

![][16]

### 如何使用 ddgr 进行搜索

我们可以通过两种方式启动搜索。从 omniprompt 或者直接从终端开始。你可以搜索任何你想要的短语。

直接从终端：

```
$ ddgr 2daygeek
```

![][17]

从 omniprompt：

![][18]

### Omniprompt 快捷方式

输入 `?` 以获得 omniprompt，它将显示关键字列表和进一步使用 `ddgr` 的快捷方式。

![][19]

### 如何移动下一页、上一页和第一页

它允许用户移动下一页、上一页或第一页。

  * `n`： 移动到下一组搜索结果
  * `p`： 移动到上一组搜索结果
  * `f`： 跳转到第一页

![][20]

### 如何启动新搜索

`d` 选项允许用户从 omniprompt 发起新的搜索。例如，我搜索了 “2daygeek website”，现在我将搜索 “Magesh Maruthamuthu” 这个新短语。

从 omniprompt：

```
ddgr (? for help) d magesh maruthmuthu
```

![][21]

### 在搜索结果中显示完整的 URL

默认情况下，它仅显示文章标题，在搜索中添加 `x` 选项以在搜索结果中显示完整的文章网址。

```
$ ddgr -n 5 -x 2daygeek
```

![][22]

### 限制搜索结果

默认情况下，搜索结果每页显示 10 个结果。如果你想为方便起见限制页面结果，可以使用 `ddgr` 带有 `--num` 或 ` -n` 参数。 

```
$ ddgr -n 5 2daygeek
```

![][23]

### 网站特定搜索

要搜索特定网站的特定页面，使用以下格式。这将从网站获取给定关键字的结果。例如，我们在 2daygeek 网站下搜索 “Package Manager”，查看结果。

```
$ ddgr -n 5 --site 2daygeek "package manager"
```

![][24]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/ddgr-duckduckgo-search-from-the-command-line-in-linux/

作者：[Magesh Maruthamuthu][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://github.com/jarun/ddgr
[2]:https://www.2daygeek.com/googler-google-search-from-the-command-line-on-linux/
[3]:https://www.2daygeek.com/buku-command-line-bookmark-manager-linux/
[4]:https://www.2daygeek.com/socli-search-and-browse-stack-overflow-from-linux-terminal/
[5]:https://www.2daygeek.com/rtv-reddit-terminal-viewer-a-simple-terminal-viewer-for-reddit/
[6]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[7]:https://www.2daygeek.com/snap-command-examples/
[8]:https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[9]:https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[10]:https://www.2daygeek.com/install-yaourt-aur-helper-on-arch-linux/
[11]:https://www.2daygeek.com/install-packer-aur-helper-on-arch-linux/
[12]:https://www.2daygeek.com/dpkg-command-to-manage-packages-on-debian-ubuntu-linux-mint-systems/
[13]:https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[14]:https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[15]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[16]:https://www.2daygeek.com/wp-content/uploads/2018/03/ddgr-duckduckgo-command-line-search-for-linux1.png
[17]:https://www.2daygeek.com/wp-content/uploads/2018/03/ddgr-duckduckgo-command-line-search-for-linux-3.png
[18]:https://www.2daygeek.com/wp-content/uploads/2018/03/ddgr-duckduckgo-command-line-search-for-linux-2.png
[19]:https://www.2daygeek.com/wp-content/uploads/2018/03/ddgr-duckduckgo-command-line-search-for-linux-4.png
[20]:https://www.2daygeek.com/wp-content/uploads/2018/03/ddgr-duckduckgo-command-line-search-for-linux-5a.png
[21]:https://www.2daygeek.com/wp-content/uploads/2018/03/ddgr-duckduckgo-command-line-search-for-linux-6a.png
[22]:https://www.2daygeek.com/wp-content/uploads/2018/03/ddgr-duckduckgo-command-line-search-for-linux-7a.png
[23]:https://www.2daygeek.com/wp-content/uploads/2018/03/ddgr-duckduckgo-command-line-search-for-linux-8.png
[24]:https://www.2daygeek.com/wp-content/uploads/2018/03/ddgr-duckduckgo-command-line-search-for-linux-9a.png
