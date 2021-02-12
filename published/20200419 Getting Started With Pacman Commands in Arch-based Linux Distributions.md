[#]: collector: (lujun9972)
[#]: translator: (Chao-zhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13099-1.html)
[#]: subject: (Getting Started With Pacman Commands in Arch-based Linux Distributions)
[#]: via: (https://itsfoss.com/pacman-command/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

Arch Linux 的 pacman 命令入门
======

> 这本初学者指南向你展示了在 Linux 中可以使用 pacman 命令做什么，如何使用它们来查找新的软件包，安装和升级新的软件包，以及清理你的系统。

[pacman][1] 包管理器是 [Arch Linux][2] 和其他主要发行版如 Red Hat 和 Ubuntu/Debian 之间的主要区别之一。它结合了简单的二进制包格式和易于使用的 [构建系统][3]。`pacman` 的目标是方便地管理软件包，无论它是来自 [官方库][4] 还是用户自己构建的软件库。

如果你曾经使用过 Ubuntu 或基于 debian 的发行版，那么你可能使用过 `apt-get` 或 `apt` 命令。`pacman` 在 Arch Linux 中是同样的命令。如果你 [刚刚安装了 Arch Linux][5]，在安装 Arch Linux 后，首先要做的 [几件事][6] 之一就是学习使用 `pacman` 命令。

在这个初学者指南中，我将解释一些基本的 `pacman` 命令的用法，你应该知道如何用这些命令来管理你的基于 Archlinux 的系统。

### Arch Linux 用户应该知道的几个重要的 pacman 命令

![](https://img.linux.net.cn/data/attachment/album/202102/09/111411uqadijqdd8afgk56.jpg)

与其他包管理器一样，`pacman` 可以将包列表与软件库同步，它能够自动解决所有所需的依赖项，以使得用户可以通过一个简单的命令下载和安装软件。

#### 通过 pacman 安装软件

你可以用以下形式的代码来安装一个或者多个软件包：

```
pacman -S 软件包名1 软件包名2 ...
```

![安装一个包][8]

`-S` 选项的意思是<ruby>同步<rt>synchronization</rt></ruby>，它的意思是 `pacman` 在安装之前先与软件库进行同步。

`pacman` 数据库根据安装的原因将安装的包分为两组：

  * **显式安装**：由 `pacman -S` 或 `-U` 命令直接安装的包
  * **依赖安装**：由于被其他显式安装的包所 [依赖][9]，而被自动安装的包。

#### 卸载已安装的软件包

卸载一个包，并且删除它的所有依赖。

```
pacman -R 软件包名
```

![移除一个包][10]

删除一个包，以及其不被其他包所需要的依赖项：

```
pacman -Rs 软件包名
```

如果需要这个依赖的包已经被删除了，这条命令可以删除所有不再需要的依赖项：

```
pacman -Qdtq | pacman -Rs -
```

#### 升级软件包

`pacman` 提供了一个简单的办法来 [升级 Arch Linux][11]。你只需要一条命令就可以升级所有已安装的软件包。这可能需要一段时间，这取决于系统的新旧程度。

以下命令可以同步存储库数据库，*并且* 更新系统的所有软件包，但不包括不在软件库中的“本地安装的”包：

```
pacman -Syu
```

  * `S` 代表同步
  * `y` 代表更新本地存储库
  * `u` 代表系统更新

也就是说，同步到中央软件库（主程序包数据库），刷新主程序包数据库的本地副本，然后执行系统更新（通过更新所有有更新版本可用的程序包）。

![系统更新][12]

> 注意！
> 
> 对于 Arch Linux 用户，在系统升级前，建议你访问 [Arch-Linux 主页][2] 查看最新消息，以了解异常更新的情况。如果系统更新需要人工干预，主页上将发布相关的新闻。你也可以订阅 [RSS 源][13] 或 [Arch 的声明邮件][14]。
>
> 在升级基础软件（如 kernel、xorg、systemd 或 glibc） 之前，请注意查看相应的 [论坛][15]，以了解大家报告的各种问题。
>
> 在 Arch 和 Manjaro 等滚动发行版中不支持**部分升级**。这意味着，当新的库版本被推送到软件库时，软件库中的所有包都需要根据库版本进行升级。例如，如果两个包依赖于同一个库，则仅升级一个包可能会破坏依赖于该库的旧版本的另一个包。

#### 用 Pacman 查找包

`pacman` 使用 `-Q` 选项查询本地包数据库，使用 `-S` 选项查询同步数据库，使用 `-F` 选项查询文件数据库。

`pacman` 可以在数据库中搜索包，包括包的名称和描述：

```
pacman -Ss 字符串1 字符串2 ...
```

![查找一个包][16]

查找已经被安装的包：

```
pacman -Qs 字符串1 字符串2 ...
```

根据文件名在远程软包中查找它所属的包：

```
pacman -F 字符串1 字符串2 ...
```

查看一个包的依赖树：

```
pactree 软件包名
```

#### 清除包缓存

`pacman` 将其下载的包存储在 `/var/cache/Pacman/pkg/` 中，并且不会自动删除旧版本或卸载的版本。这有一些优点：

  1. 它允许 [降级][17] 一个包，而不需要通过其他来源检索以前的版本。
  2. 已卸载的软件包可以轻松地直接从缓存文件夹重新安装。

但是，有必要定期清理缓存以防止文件夹增大。

[pacman contrib][19] 包中提供的 [paccache(8)][18] 脚本默认情况下会删除已安装和未安装包的所有缓存版本，但最近 3 个版本除外：

```
paccache -r
```

![清除缓存][20]

要删除当前未安装的所有缓存包和未使用的同步数据库，请执行：

```
pacman -Sc
```

要从缓存中删除所有文件，请使用清除选项两次，这是最激进的方法，不会在缓存文件夹中留下任何内容：

```
pacman -Scc
```

#### 安装本地或者第三方的包

安装不是来自远程存储库的“本地”包：

```
pacman -U 本地软件包路径.pkg.tar.xz
```

安装官方存储库中未包含的“远程”软件包：

```
pacman -U http://www.example.com/repo/example.pkg.tar.xz
```

### 额外内容：用 pacman 排除常见错误

下面是使用 `pacman` 管理包时可能遇到的一些常见错误。

#### 提交事务失败（文件冲突）

如果你看到以下报错：

```
error: could not prepare transaction
error: failed to commit transaction (conflicting files)
package: /path/to/file exists in filesystem
Errors occurred, no packages were upgraded.
```

这是因为 `pacman` 检测到文件冲突，不会为你覆盖文件。

解决这个问题的一个安全方法是首先检查另一个包是否拥有这个文件（`pacman-Qo 文件路径`）。如果该文件属于另一个包，请提交错误报告。如果文件不属于另一个包，请重命名“存在于文件系统中”的文件，然后重新发出更新命令。如果一切顺利，文件可能会被删除。

你可以显式地运行 `pacman -S –overwrite 要覆盖的文件模式**，强制 `pacman` 覆盖与 给模式匹配的文件，而不是手动重命名并在以后删除属于该包的所有文件。

#### 提交事务失败（包无效或损坏）

在 `/var/cache/pacman/pkg/` 中查找 `.part` 文件（部分下载的包），并将其删除。这通常是由在 `pacman.conf` 文件中使用自定义 `XferCommand` 引起的。

#### 初始化事务失败（无法锁定数据库）

当 `pacman` 要修改包数据库时，例如安装包时，它会在 `/var/lib/pacman/db.lck` 处创建一个锁文件。这可以防止 `pacman` 的另一个实例同时尝试更改包数据库。

如果 `pacman` 在更改数据库时被中断，这个过时的锁文件可能仍然保留。如果你确定没有 `pacman` 实例正在运行，那么请删除锁文件。

检查进程是否持有锁定文件：

```
lsof /var/lib/pacman/db.lck
```

如果上述命令未返回任何内容，则可以删除锁文件：

```
rm /var/lib/pacman/db.lck
```

如果你发现 `lsof` 命令输出了使用锁文件的进程的 PID，请先杀死这个进程，然后删除锁文件。

我希望你喜欢我对 `pacman` 基础命令的介绍。

--------------------------------------------------------------------------------

via: https://itsfoss.com/pacman-command/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://www.archlinux.org/pacman/
[2]: https://www.archlinux.org/
[3]: https://wiki.archlinux.org/index.php/Arch_Build_System
[4]: https://wiki.archlinux.org/index.php/Official_repositories
[5]: https://itsfoss.com/install-arch-linux/
[6]: https://itsfoss.com/things-to-do-after-installing-arch-linux/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/essential-pacman-commands.jpg?ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/sudo-pacman-S.png?ssl=1
[9]: https://wiki.archlinux.org/index.php/Dependency
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/sudo-pacman-R.png?ssl=1
[11]: https://itsfoss.com/update-arch-linux/
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/sudo-pacman-Syu.png?ssl=1
[13]: https://www.archlinux.org/feeds/news/
[14]: https://mailman.archlinux.org/mailman/listinfo/arch-announce/
[15]: https://bbs.archlinux.org/
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/sudo-pacman-Ss.png?ssl=1
[17]: https://wiki.archlinux.org/index.php/Downgrade
[18]: https://jlk.fjfi.cvut.cz/arch/manpages/man/paccache.8
[19]: https://www.archlinux.org/packages/?name=pacman-contrib
[20]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/sudo-paccache-r.png?ssl=1
