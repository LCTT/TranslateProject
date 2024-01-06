[#]: subject: "Mounting git commits as folders with NFS"
[#]: via: "https://jvns.ca/blog/2023/12/04/mounting-git-commits-as-folders-with-nfs/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "guevaraya"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "


# 使用 NFS 将 Git 提交记录显示成文件目录

大家好!某天，我突发奇想-是否能把 git 仓库制作一个FUSE文件系统然后把所有的提交记录做成文件夹呢？很显然这是可能的！这就是9号计划：[giblefs](https://github.com/fanzeyi/giblefs), [GitMounter](https://belkadan.com/blog/2023/11/GitMounter/), and [git9](https://orib.dev/git9.html)。

在 Mac 上使用 FUSE 实在很烦人 - 你需要安装一个内核扩展，但由于安全的原因 Mac OS 上安装内核扩展看起来越来越难了。对比这些如何去整合文件系统的项目，我也有一些不同的思路。

而我一直认为能在 Mac OS 上加载 FUSE 文件系统很有趣的事情,因此我创建了一个名为 [git-commit-folders](https://github.com/jvns/git-commit-folders) 的项目来做这个事。它目前以FUSE 和 NFS 文件系统均可运行（至少在我的电脑上），WebDav 的实现起来还有点问题。

这个一个很不错的经验（我不能确定这个能不能实际跑起来作为要给有用的项目还是仅仅可以运行的玩具）但我对我来说在一些小项目上实践很有用，虽然它有时在写操作上有点问题。

### 目标：像文件夹一样显示提交记录

我做这个事的主要目的是给大家一些启发：git 核心是如何运行的。总结来说，git提交记录实际上和文件夹非常类似-相当于每个文件的所有 Git 提交是一个目录[包含目录列表](https://jvns.ca/blog/2023/09/14/in-a-git-repository--where-do-your-files-live-/#commit-step-2-look-at-the-tree)，这个目录也可以有子目录，依此类推。

实际上 git 提交记录并不是以文件夹的形式保存到磁盘空间。

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

### 分支其实都是符号链接

通过`git-commit-folders`挂载的文件系统中，提交记录只是一些文件夹-其余（分支，标签等）就是一个提交记录的链接了。这些镜像文件展示了 git 内部是如何运行工作的。

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

这个并不能完全呈现 git 的所有工作机理（相比简单的类似文件夹的提交记录还有很多复杂的细节），但是我希望大家对“历史提交记录如同文件夹”有一个直观的认识，并引发进一步的思考。

### 这么做有什么好处呢？

在我深入介绍它的实现之前，我想说下为什么把 Git 提交记录变成拥有文件夹的文件系统很有用。我完成了很多项目后我发现大部分我们几乎不用他们（比如[dnspeep](https://github.com/jvns/dnspeep)）。但我发现这个项目我到现在还一直还在用它。

目前为止我发现主要用处是：

* 查找已经删除的函数 - 可以用 `grep someFunction branch_histories/main/*/commit.go`  查找旧版本的修改
* 快速查看其他分支的一个文件并从其拷贝一行，如`vim branches/other-branch/go.mod`
* 为某个功能查找所有分支，如`grep someFunction branches/*/commit.go`

所有这些操作都通过提交记录的一个链接来替代提交记录的直接引用。

而这些引用操作没有一个是最高效的（你可以用`git show`和`git log -S`或者 `git grep`来完成类似操作），但是对我个人来说我经常忘记 git 语法而文件系统对我来说最简单。`git worktree`也让人同时需要检查多个分支，让人直观感受为了查看一个文件而要配置整个工作区有点突兀。

下面我分享一些我运行过程的问题。

### 问题1: 用webdav 还是 NFS?

有两个文件系统 WebDav 和 NFS 可以在 Mac OS 上作为原生支持。我说不出那个更新容易实现所以我就索性尝试两个都支持。

首先 webdav 的实现看起来更容易一些，在 golang.org/x/net 上有一个[webdav implementation](https://pkg.go.dev/golang.org/x/net/webdav) 成果展示，这个很好配置。

但这个实现不支持符号链接，我想可能原因是它用的是 `io/fs` 而 `io/fs` 还不支持 [support symlinks yet](https://github.com/golang/go/issues/49580)。看到这里，我就放弃了 webdav 而决定重点放在 NFS 实现上了，用 [go-nfs](https://github.com/willscott/go-nfs/) NFSv3 的库文件来实现。

有人也提到了 Mac 上的 [FileProvider](https://developer.apple.com/documentation/fileprovider/) 我还没有深入了解这个。

### 问题 2: 如何确保所有实现的数据同步？

我已经实现了三个不同的文件系统（FUSE，NFS和WebDav），但对我来说还是没搞清楚如何去避免大量的重复代码。

我的朋友 Dave 建议写一个核心实现然后写一个适配器（如`fuse2nfs` 和 `fuse2dav`）来转换成 NFS 和 WebDav 版本。这个看起来需要我着手实现三个文件系统的接口：

* 对应 FUSE 的`fs.FS` 
* 对应 NFS的`billy.Filesystem`
* 对应 webdav 的`webdav.Filesystem`
因此我把所有的核心逻辑放到 \`fs.FS 接口上，然后写两个功能：
* `func Fuse2Dav(fs fs.FS) webdav.FileSystem`
* `func Fuse2NFS(fs fs.FS) billy.Filesystem`

所有的文件系统都比较类似因此转换起来不是很难，但就是有大量的烦人的 bug 需要修复。

### 问题 3: 我不想罗列所有的提交记录怎么办

一些 git 仓有成千上万的提交记录。我的第一个想法是如何让 `commits/`看起来是空的，这样就可以如下展示：

```
    $ ls commits/
    $ ls commits/80210c25a86f75440110e4bc280e388b2c098fbd/
    fuse  fuse2nfs  go.mod  go.sum  main.go  README.md

```

因此所有的提交记录可以直接查看，但是又不能罗列他们。这个对文件系统是一个奇怪的事情，实际上 FUSE 可以做到。但在NFS上不容易做到。我假定情况是这样告诉 NFS 文件夹是空的，它就会将其实际解释为空，这个是合理的。

我们最终是这样处理的：
* 通过 `.git/objects`的前两个字符组织管理提交记录（因此`ls commits` 会显示`0b 03 05 06 07 09 1b 1e 3e 4a`），但两级显示`18d46e76d7c2eedd8577fae67e3f1d4db25018b0`则为 `commits/18/18df/18d46e76d7c2eedd8577fae67e3f1d4db25018b0`
* 开始只罗列所有的已经打包的提交哈希一次，将他们在内存中缓存，然后后面仅更新松散的对象。主要思路是将仓库中的所有的提交都打包而 git 不会经常重新打包它的提交

这个看起来在拥有百万提交记录的 Linux 内核是运行正常的。在我的机器上实测它初始化需要花些时间，后面更新会越来越快。
每个提交哈希只有20个字节因此缓存1百万个提交哈希也不是很大，大约20MB。

我想有一个最明智最偷懒的加载提交记录的方式是 - 通过提交 ID 分类 Git 的打包文件，因此你们可以`1b` 或者 `1b8c`开头很容易且快速的二进制形式查找所有的提交记录。我用的[git library](https://github.com/go-git/go-git)对上面提交的方式还没有更多的支持，因为罗列出来 Git 仓库所有的提交记录确实一个奇怪的事情。我花了很多天\[去实现它]。

### 问题 4: “ Not a directory”

我常遇到下面这个错误：

```
    "/tmp/mnt2/commits/59/59167d7d09fd7a1d64aa1d5be73bc484f6621894/": Not a directory (os error 20)

```

当罗列文件夹的时候它开始报出来一个错误，是处理 NFS 库的“Not a directory”错误。这个错误遇到了很多次，我需要每次跟踪这个错误的根源。

有很多类似错误。我也遇到`cd: system call interrupted`令人沮丧的是这个总是我的程序的一些问题。

我意识到终极大法是用 Wireshark 查看 NFS 发送和接受的数据包，很多问题便可迎刃而解。

### 问题 5: inode 索引节点

在开始的时候我不小心将所有的文件夹的索引节点设为 0。如果我在 文件夹上执行 `find` 操作，所有的文件夹为 0，就会导致文件系统循环和崩溃，这个也是复合逻辑的。

我通过定义一个 `inode(string)` 来修复这个问题，这个字符串便是索引节点的哈希，也就是将目录树或block的 ID 转换为字符串形式的哈希。

### 问题 6: stale file handles

我一直遇到这个“Stale NFS file handle” 错误。问题是，我需要处理这个一个不透明的64字节的文件句柄并将他映射到正确的目录上。

我用的方式是用 NFS 库为每个文件产生一个文件句柄将他们以固定大小缓存起来。这个对小仓库来说没问题，但是如果对于拥有海量的文件的仓来说由于缓存有限就会导致“stale file handle”错误。

不过之后还有一个我不能确定如何去解决的问题。我不能深入理解真正的 NFS 是如何运行的，可能他们就是需要一个大缓冲？

NFS 文件句柄占用64个字节（不是比特）确实很大，这就是你花费很多时间要加密所有的文件和目录但不缓冲它。也许我将在未来会这样实现它。

### 问题 7: branch histories

`branch_histories/` 目录目前仅罗列对应分支的最近100个提交记录。不能确定哪一个是正确的修改-那就需要罗列该分支的所有历史记录。可能后面我用一个子目录跟踪这个`commits/`目录。

### 问题 8: submodules

Git仓有时包含了子仓。由于目前我对子仓的理解还不深入我先忽略它吧。因此这个算是一个bug。

### 问题 9: is NFSv4 better?

我构建这个项目使用的是 NFSv3 库，因为我当时只能找到一个 NFSv3de Go 库文件。可当我搞完的时候才发现了一个名叫 buildbarn 的项目里有 [NFSv4 server](https://github.com/buildbarn/bb-adrs/blob/master/0009-nfsv4.md)。有没有可能用它会更好一些？

我不知道这样做有什么问题或者用 NFSv4 有哪些优点？我也有点担心 buildbarn 的 NFS 库是否能达到预期。

### 就这些吧

之前已经解决了很多问题我都忘记了这是我目前能回想起来的。我未来有可能解决或根本解决不了 NFS 的“stale file handle”错误，或者启动 linux 内核会多话一分钟，就这样吧。

感谢我的朋友[vasi](https://github.com/vasi) 他给我了很多文件系统方面的帮助。

---

via: <https://jvns.ca/blog/2023/12/04/mounting-git-commits-as-folders-with-nfs/>

作者：[Julia Evans](https://jvns.ca/)
选题：[lujun9972](https://github.com/lujun9972)
译者：[guevaraya](https://github.com/guevaraya)
校对：[校对者ID](https://github.com/校对者ID)

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
