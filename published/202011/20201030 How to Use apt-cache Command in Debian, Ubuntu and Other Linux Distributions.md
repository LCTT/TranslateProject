[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12786-1.html)
[#]: subject: (How to Use apt-cache Command in Debian, Ubuntu and Other Linux Distributions)
[#]: via: (https://itsfoss.com/apt-cache-command/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Debian、Ubuntu 中使用 apt-cache 命令
======

> 使用 apt-cache 命令，你可以在本地 APT 缓存中搜索软件包的详细信息。在本教程中学习使用 apt-cache 命令。

### apt-cache 命令是用来干什么的？

[APT][1] [包管理器][2]工作在软件包元数据的本地缓存上。元数据通常由包名、版本、描述、依赖关系、仓库和开发者等信息组成。通过 `apt-cache` 命令，你可以查询这个本地 APT 缓存并获得相关信息。

你可以搜索一个包的可用性、它的版本号、它的依赖关系等等。我将通过实例告诉你如何使用 `apt-cache`命令。

APT 缓存的位置是 `/var/lib/apt/lists/` 目录。缓存哪些仓库元数据取决于你的源列表中 `/etc/apt/sources.list` 文件中添加的仓库，以及位于 `/etc/apt/sources.list.d` 目录下的额外仓库文件。

令人惊讶的是，`apt-cache` 并不能清除 APT 缓存。为此，你必须[使用 apt-get clean 命令][3]。

不用说，APT 打包系统是在 Debian 和基于 Debian 的 Linux 发行版上使用的，比如 Ubuntu、Linux Mint、Elementary OS 等。你不能在 Arch 或 Fedora 上使用它。

### 使用 apt-cache 命令

![][4]

就像其他 Linux 命令一样，`apt-cache` 也有一些可用的选项，你可以随时参考它的手册页来了解这些选项。

然而，你可能并不需要使用所有的选项。这就是为什么我在本教程中只向你展示 `apt-cache` 命令中最常见和最有用的例子。

#### 始终更新

更新本地 APT 缓存以与远程仓库同步是一个好主意。如何做到这一点呢？你可以使用命令： 

```
sudo apt update
```

#### 搜索软件包

`apt-cache` 命令最常见的用途是查找软件包。你可以使用一个正则表达式来搜索本地 APT 缓存中的包。

```
apt-cache search package_name
```

默认情况下，它会在软件包的名称和描述中查找搜索关键词。它按字母顺序显示匹配的软件包及其简短的描述。

![][5]

你也可以缩小搜索范围，只在软件包名称中查找搜索词。

```
apt-cache search --names-only package_name
```

![][6]

如果你想知道所有匹配软件包的完整细节，你可以使用 `--full` 标志。

![][7]

#### 获取详细的包装信息

如果你知道确切的软件包名称（或者你已经成功地通过搜索找到了它），你可以得到软件包的详细元数据信息。

```
apt-cache show package_name
```

![][8]

你可以看到软件包元数据中的所有细节，比如名称、版本、开发者、维护者、仓库、长短描述、软件包大小甚至是校验和。

还有一个选项 `showpkg` 可以显示软件包的名称、版本、正向和反向依赖关系等信息。

```
apt-cache showpkg package_name
```

#### apt-cache 的策略

这是 `apt-cache` 命令中很少使用的一个选项。`policy` 选项可以帮助你调试与 [preference 文件][9]相关的问题。

如果你指定了软件包的名称，它将显示该软件包是否已经安装，在哪个版本的仓库中可用，以及它的优先级。

![][10]

默认情况下，每个已安装的软件包版本的优先级为 100，未安装的软件包的优先级为 500。同一软件包可能有多个不同优先级的版本。APT 会安装优先级较高的版本，除非安装的版本较新。

如果不理解这个部分，也没关系。对于一个普通的 Linux 用户来说，会极少纠结于这么深的软件包管理知识。

#### 检查软件包的依赖关系和反向依赖关系。

你可以在安装之前（甚至在安装之后）[检查一个包的依赖关系][11]。它还会显示所有可能满足依赖关系的软件包。

```
apt-cache depends package
```

![][12]

你也可以通过 `apt-cahce` 检查反向依赖关系来检查哪些包是依赖于某个包的。

![][13]

坦白说，看到 Ansible 这样的 DevOps 工具对 [Cowsay 这样有趣的 Linux 命令][14]有依赖性，我也很惊讶。我想可能是因为在[安装 Ansible][15]之后，它会在节点上显示一些信息。

#### 检查未满足的依赖性

你可能会被 [Ubuntu 中未满足的依赖问题][16]所困扰，其他 Linux 也有类似问题。`apt-cache` 命令提供了一个选项来检查系统中各种可用软件包的所有未满足的依赖关系。

```
apt-cache unmet
```

![][17]

### 结论

你可以用 `apt-cache` 命令列出所有可用的软件包。输出结果会很庞大，所以我建议将其与 [wc 命令][18] 结合起来，得到可用软件包的总数，就像这样：

```
apt-cache pkgnames | wc -l
```

你是否注意到你不需要成为 [root 用户][19]就可以使用 `apt-cache` 命令？

较新的 [apt 命令][20]也有一些与 `apt-cache` 命令相对应的功能选项。由于 `apt` 比较新，所以在脚本中还是首选使用 `apt-get` 及其相关的 `apt-cache` 等命令。

希望你觉得本教程对你有帮助。如果你对上面讨论的任何一点有疑问或者有改进的建议，请在评论中告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/apt-cache-command/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://wiki.debian.org/Apt
[2]: https://itsfoss.com/package-manager/
[3]: https://itsfoss.com/clear-apt-cache/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-command.png?resize=800%2C450&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-search.png?resize=759%2C437&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-search-names-only.png?resize=759%2C209&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-show-full.png?resize=759%2C722&ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-show-pkgname.png?resize=800%2C795&ssl=1
[9]: https://debian-handbook.info/browse/stable/sect.apt-get.html#sect.apt.priorities
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-policy.png?resize=795%2C456&ssl=1
[11]: https://itsfoss.com/check-dependencies-package-ubuntu/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-dependency-check.png?resize=768%2C304&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-reverse-dependency.png?resize=768%2C304&ssl=1
[14]: https://itsfoss.com/funny-linux-commands/
[15]: https://linuxhandbook.com/install-ansible-linux/
[16]: https://itsfoss.com/held-broken-packages-error/
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-unmet.png?resize=759%2C399&ssl=1
[18]: https://linuxhandbook.com/wc-command/
[19]: https://itsfoss.com/root-user-ubuntu/
[20]: https://itsfoss.com/apt-command-guide/
