[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11929-1.html)
[#]: subject: (How to Install Latest Git Version on Ubuntu)
[#]: via: (https://itsfoss.com/install-git-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Ubuntu 上安装最新版本的 Git
======

在 Ubuntu 上安装 Git 非常容易。它存在于 [Ubuntu 的主仓库][1]中，你可以像这样[使用 apt 命令][2]安装它：

```
sudo apt install git
```

很简单？是不是？

只有一点点小问题（这可能根本不是问题），就是它安装的 [Git][3] 版本。

在 LTS 系统上，软件稳定性至关重要，这就是为什么 Ubuntu 18.04 和其他发行版经常提供较旧但稳定的软件版本的原因，它们都经过发行版的良好测试。

这就是为什么当你检查 Git 版本时，会看到安装的版本会比 [Git 网站上当前最新 Git 版本][4]旧：

```
$ git --version
git version 2.17.1
```

在编写本教程时，网站上提供的版本为 2.25。那么，如何在 Ubuntu 上安装最新的 Git？

### 在基于 Ubuntu 的 Linux 发行版上安装最新的 Git

![][5]

一种方法是[从源代码安装][6]。这种很酷又老派的方法不适合所有人。值得庆幸的是，Ubuntu Git 维护团队提供了 [PPA][7]，莫可以使用它轻松地安装最新的稳定 Git 版本。

```
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git
```

即使你以前使用 `apt` 安装了 Git，它也将更新为最新的稳定版本。

```
$ git --version
git version 2.25.0
```

[使用PPA][8] 的好处在于，如果发布了新的 Git 稳定版本，那么就可以通过系统更新获得它。[仅更新 Ubuntu][9] 来获取最新的 Git 稳定版本。

### 配置 Git （推荐给开发者）

如果你出于开发目的安装了 Git，你会很快开始克隆仓库，进行更改并提交更改。

如果你尝试提交代码，那么你可能会看到 “Please tell me who you are” 这样的错误：

```
$ git commit -m "update readme"

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: unable to auto-detect email address (got 'abhishek@itsfoss.(none)')
```

这是因为你还没配置必要的个人信息。

正如错误已经暗示的那样，你可以像这样设置全局 Git 配置：

```
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

你可以使用以下命令检查 Git 配置：

```
git config --list
```

它应该显示如下输出：

```
user.email=you@example.com
user.name=Your Name
```

配置保存在 `~/.gitconfig` 中。你可以手动修改配置。

### 结尾

我希望这个小教程可以帮助你在 Ubuntu 上安装 Git。使用 PPA，你可以轻松获得最新的 Git 版本。

如果你有任何疑问或建议，请随时在评论部分提问。也欢迎直接写“谢谢”  :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-git-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-repositories/
[2]: https://itsfoss.com/apt-command-guide/
[3]: https://git-scm.com/
[4]: https://git-scm.com/downloads
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/02/install_git_ubuntu.png?ssl=1
[6]: https://itsfoss.com/install-software-from-source-code/
[7]: https://launchpad.net/~git-core/+archive/ubuntu/ppa
[8]: https://itsfoss.com/ppa-guide/
[9]: https://itsfoss.com/update-ubuntu/
