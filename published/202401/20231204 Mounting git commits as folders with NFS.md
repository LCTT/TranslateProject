[#]: subject: "Mounting git commits as folders with NFS"
[#]: via: "https://jvns.ca/blog/2023/12/04/mounting-git-commits-as-folders-with-nfs/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "guevaraya"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16542-1.html"

使用 NFS 将 Git 提交记录显示成文件目录
======

![][0]

大家好！某天，我突发奇想 —— 是否能把 Git 存储库制作成一个 FUSE 文件系统，然后把所有的提交记录做成文件夹呢？答案是肯定的！有 [giblefs][1]、 [GitMounter][2] 和用于 Plan 9 号的 [git9][3]。

但在 Mac 上使用 FUSE 实在很烦人 —— 你需要安装一个内核扩展，但由于安全的原因，Mac OS 上安装内核扩展看起来越来越难了。此外，我还有一些想法，希望能用与这些项目不同的方式来组织文件系统。

因此，我想在 Mac OS 上尝试 FUSE 以外的挂载文件系统的方法会很有趣，因此我创建了一个名为 [git-commit-folders][4] 的项目来做这个事。它可以同时使用 FUSE 和 NFS（至少在我的电脑上），WebDav 的实现起来还有点问题。

这个项目很有实验性（我不确定这究竟是一个有用的软件，还是一个思考 Git 如何工作的有趣玩具），但写起来很有趣，我自己也很喜欢在小型存储库中使用它，下面是我在写这个项目时遇到的一些问题。

### 目标：像文件夹一样显示提交记录

我做这个事的主要目的是给大家一些启发：Git 核心是如何运行的。总结来说，Git 提交记录实际上和文件夹非常类似 —— 每个 Git 提交都包含一个目录，其中 [列出了文件][5]，这个目录也可以有子目录，依此类推。

只是为了节省磁盘空间，Git 提交实际上并不是以文件夹的形式实现的。

而在 `git-commit-folders`，所有的提交记录实际上看起来就是一个文件夹，如果你想浏览历史提交记录，你可以像浏览文件系统一样浏览它们！例如如果你像查看我的博客的初始提交记录，你可以如下操作：

```
$ ls commits/8d/8dc0/8dc0cb0b4b0de3c6f40674198cb2bd44aeee9b86/
README
```

其他之后的提交记录，如下：

```
$ ls /tmp/git-homepage/commits/c9/c94e/c94e6f531d02e658d96a3b6255bbf424367765e9/
_config.yml  config.rb  Rakefile  rubypants.rb  source
```

### 分支是符号链接

通过 `git-commit-folders` 挂载的文件系统中，提交是唯一真正的文件夹 —— 其他一切（分支、标签等）都是提交记录的符号链接。这反映了 Git 底层的工作方式。

```
$ ls -l branches/
lr-xr-xr-x 59 bork bazil-fuse -> ../commits/ff/ff56/ff563b089f9d952cd21ac4d68d8f13c94183dcd8
lr-xr-xr-x 59 bork follow-symlink -> ../commits/7f/7f73/7f73779a8ff79a2a1e21553c6c9cd5d195f33030
lr-xr-xr-x 59 bork go-mod-branch -> ../commits/91/912d/912da3150d9cfa74523b42fae028bbb320b6804f
lr-xr-xr-x 59 bork mac-version -> ../commits/30/3008/30082dcd702b59435f71969cf453828f60753e67
lr-xr-xr-x 59 bork mac-version-debugging -> ../commits/18/18c0/18c0db074ec9b70cb7a28ad9d3f9850082129ce0
lr-xr-xr-x 59 bork main -> ../commits/04/043e/043e90debbeb0fc6b4e28cf8776e874aa5b6e673
$ ls -l tags/
lr-xr-xr-x - bork 31 Dec  1969 test-tag -> ../commits/16/16a3/16a3d776dc163aa8286fb89fde51183ed90c71d0
```

这个并不能完全呈现 Git 的所有工作机理（相比简单的类似文件夹的提交，还有很多复杂的细节），但是我希望大家对“每个提交如同一个文件夹，里面有你的旧版本代码”有一个直观的认识。

### 这么做有什么好处呢？

在我深入介绍它的实现之前，我想说下为什么把 Git 提交记录变成拥有文件夹的文件系统很有用。我的很多项目最终都没有真正使用过（比如 [dnspeep][6]），但我发现自己在做这个项目的时候确实使用到了一些。

目前为止我发现主要用处是：

* 查找已经删除的函数 - 可以用 `grep someFunction branch_histories/main/*/commit.go`  查找它的旧版本
* 快速查看其他分支的一个文件并从其拷贝一行，如 `vim branches/other-branch/go.mod`
* 在每个分支中搜索某个函数，如 `grep someFunction branches/*/commit.go`

所有这些操作都通过提交记录的符号链接，来替代提交记录的直接引用。

这些都不是最有效的方法（你可以用 `git show` 和 `git log -S` 或者 `git grep` 来完成类似操作），但是对我个人来说，我经常忘记 Git 语法，而浏览文件系统对我来说更简单。`git worktree` 还允许你同时签出多个分支，但对我来说，为了看一个文件而设置整个工作树感觉很奇怪。

接下来我想谈谈我遇到的一些问题。

### 问题 1: 用 WebDav 还是 NFS?

Mac OS 原生支持的两个文件系统是 WebDav 和 NFS。我说不出那个更新容易实现，所以我就索性尝试两个都支持。

起初，WebDav 的实现看起来更容易一些，在 golang.org/x/net 上有一个 [WebDav 实现][7]，这个很好配置。

但这个实现不支持符号链接，我想可能原因是它用的是 `io/fs` 接口，而 `io/fs` 还不支持 [符号链接][8]。不过看起来正在进行中。所以我放弃了 WebDav，而决定重点放在 NFS 实现上了，用 [go-nfs][9] NFSv3 的库文件来实现。

有人也提到了 Mac 上的 [FileProvider][10]，我还没有深入了解这个。

### 问题 2: 如何确保所有的实现保持一致？

我已经实现了三个不同的文件系统（FUSE、NFS 和 WebDav），但对我来说还是没搞清楚如何避免大量的重复代码。

我的朋友 Dave 建议写一个核心实现，然后写一个适配器（如 `fuse2nfs` 和 `fuse2dav`）来转换成 NFS 和 WebDav 版本。这个看起来需要我着手实现三个文件系统的接口：

* 对应 FUSE 的 `fs.FS` 
* 对应 NFS 的 `billy.Filesystem`
* 对应 WebDav 的 `webdav.Filesystem` 

因此我把所有的核心逻辑放到 `fs.FS` 接口上，然后写两个函数：

* `func Fuse2Dav(fs fs.FS) webdav.FileSystem`
* `func Fuse2NFS(fs fs.FS) billy.Filesystem`

所有的文件系统都比较类似，因此转换起来不是很难，但就是有大量的烦人的问题需要修复。

### 问题 3: 我不想罗列所有的提交记录怎么办

一些 Git 存储库有成千上万的提交记录。我的第一个想法是如何让 `commits/` 看起来是空的，这样就可以如下展示：

```
$ ls commits/
$ ls commits/80210c25a86f75440110e4bc280e388b2c098fbd/
fuse  fuse2nfs  go.mod  go.sum  main.go  README.md
```

因此所有的提交记录可以直接查看，但是又不能罗列它们。这个对文件系统是一个奇怪的事情，实际上 FUSE 可以做到。但我在 NFS 上无法实现。我认为这里的原因是，如果你告诉 NFS 某个目录是空的，它就会认为该目录实际上是空的，这是合理的。

我们最终是这样处理的：

* 按照 `.git/objects` 的方式，以前两个字符组织管理提交记录（因此 `ls commits` 会显示 `0b 03 05 06 07 09 1b 1e 3e 4a`），但这样做会分为两层，这样 `18d46e76d7c2eedd8577fae67e3f1d4db25018b0` 则为 `commits/18/18df/18d46e76d7c2eedd8577fae67e3f1d4db25018b0`
* 开始只罗列一次所有的已经打包的提交哈希，将它们缓存在内存中，然后后面仅更新稀疏对象。主要思路是版本库中几乎所有的提交都应该打包，而且 Git 不会经常重新打包提交

这个看起来在拥有百万提交记录的 Linux 内核的 Git 存储库上似乎效果不错。在我的机器上实测它初始化大概需要一分钟，之后只需快速增量更新即可。

每个提交哈希只有 20 个字节，因此缓存 1 百万个提交哈希也不是很大，大约 20MB。

我认为更聪明的做法是延迟加载提交列表 —— Git 会按提交 ID 对其打包文件进行排序，所以你可以很容易地进行二叉树搜索，找到所有以 `1b` 或 `1b8c` 开始的提交。我用的 [Git 库][11] 对此并不支持，因为罗列出来 Git 存储库所有的提交记录确实一个奇怪的事情。我花了 [几天时间][12] 尝试实现它，但没有达到我想要的性能，所以就放弃了。

### 问题 4: 不是目录

我常遇到下面这个错误：

```
"/tmp/mnt2/commits/59/59167d7d09fd7a1d64aa1d5be73bc484f6621894/": Not a directory (os error 20)
```

这起初真的把我吓了一跳，但事实证明，这只是表示在列出目录时出现了错误，而 NFS 库处理该错误的方式就是显示 “Not a directory”（不是目录）。这个错误遇到了很多次，我需要每次跟踪这个错误的根源。

有很多类似错误。我也遇到 `cd: system call interrupted`，令人沮丧的是，但最终也只是程序中的其他错误。

我意识到终极大法是用 Wireshark 查看 NFS 发送和接受的数据包，很多问题便可迎刃而解。

### 问题 5: inode 编号

在开始的时候我不小心将所有的文件夹的 inode 设为 0。这很糟糕，因为如果在每个目录的 inode 都为 0 的目录上运行查找，它就会抱怨文件系统循环并放弃，这个也是符合逻辑的。

我通过定义一个 `inode(string)` 来修复这个问题，通过散列字符串来获取 inode 编号，并使用树 ID / blob ID 作为散列字符串。

### 问题 6: 过期文件句柄

我一直遇到这个“Stale NFS file handle”（过期文件句柄）错误。问题是，我需要获取未知的 64 字节 NFS “文件句柄”，并将其映射到正确的目录。

我使用的 NFS 库的工作方式是为每个文件生成一个文件句柄，并通过固定大小的缓存来缓存这些引用。这对小型存储库来说没问题，但是如果对于拥有海量的文件的存储库来说，由于缓存就会溢出，就会导致“stale file handle” 错误。

这仍然是个问题，我不知道如何解决。我不明白真正的 NFS 服务器是如何做到这一点的，也许它们只是有一个非常大的缓存？

NFS 文件句柄占用 64 个字节（不是比特），确实很大，所以很多时候似乎可以将整个文件路径编码到句柄中，根本不需要缓存。也许我会在某个时候尝试实现这一点。

### 问题 7: 分支历史

`branch_histories/` 目录目前仅罗列对应分支的最近 100 个提交记录。我不知道该怎么做，如果能以某种方式列出分支的全部历史就更好了。也许我可以使用 `commits/` 目录中类似的子文件夹技巧。

### 问题 8: 子模块

Git 存储库有时包含了子模块。由于目前我对子模块的理解还不深入，我先忽略它吧。因此这个算是一个问题。

### 问题 9: NFSv4 是否更好？

我构建这个项目使用的是 NFSv3 库，因为我当时只能找到一个 NFSv3 的 Go 库文件。可当我搞完的时候才发现了一个名叫 buildbarn 的项目里有 [NFSv4 服务器][13]。有没有可能用它会更好一些？

我不知道这样做有什么问题，或者用 NFSv4 有哪些优点？我还有点不确定是否要使用 buildbarn NFS 库，因为不清楚他们是否希望其他人使用它。

### 就这些吧

之前已经解决了很多问题我都忘记了，这是我目前能回想起来的。我未来有可能解决或根本解决不了 NFS 的“过期文件句柄” 错误，或者“在 Linux 内核的存储库上启动需要 1 分钟”的问题，就这样吧。

感谢我的朋友 [vasi][14]，他给我了很多文件系统方面的帮助。

*（题图：DA/d22b1c01-e80a-4529-b88a-419ceef74b5e）*

---

via: https://jvns.ca/blog/2023/12/04/mounting-git-commits-as-folders-with-nfs/

作者：[Julia Evans](https://jvns.ca/)
选题：[lujun9972](https://github.com/lujun9972)
译者：[guevaraya](https://github.com/guevaraya)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://github.com/fanzeyi/giblefs
[2]: https://belkadan.com/blog/2023/11/GitMounter/
[3]: https://orib.dev/git9.html
[4]: https://github.com/jvns/git-commit-folders
[5]: https://jvns.ca/blog/2023/09/14/in-a-git-repository--where-do-your-files-live-/#commit-step-2-look-at-the-tree
[6]: https://github.com/jvns/dnspeep
[7]: https://pkg.go.dev/golang.org/x/net/webdav
[8]: https://github.com/golang/go/issues/49580
[9]: https://github.com/willscott/go-nfs/
[10]: https://developer.apple.com/documentation/fileprovider/
[11]: https://github.com/go-git/go-git
[12]: https://github.com/jvns/git-commit-folders/tree/fast-commits
[13]: https://github.com/buildbarn/bb-adrs/blob/master/0009-nfsv4.md
[14]: https://github.com/vasi
[0]: https://img.linux.net.cn/data/attachment/album/202401/08/164228vsaxcd4ssjs2d6z4.jpg