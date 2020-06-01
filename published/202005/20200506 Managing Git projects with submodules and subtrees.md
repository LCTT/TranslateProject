[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12244-1.html)
[#]: subject: (Managing Git projects with submodules and subtrees)
[#]: via: (https://opensource.com/article/20/5/git-submodules-subtrees)
[#]: author: (Manaswini Das https://opensource.com/users/manaswinidas)

使用子模块和子树来管理 Git 项目
======

> 使用子模块和子树来帮助你管理多个存储库中共有的子项目。

![](https://img.linux.net.cn/data/attachment/album/202005/23/201323myyhob22eg2y2jqt.jpg)

如果你参与了开源项目的开发，那么你很可能已经用了 Git 来管理你的源码。你可能遇到过有很多依赖和/或子项目的项目。你是如何管理它们的？

对于一个开源组织，要实现社区**和**产品的单一来源文档和依赖管理比较棘手。文档和项目往往会碎片化和变得冗余，这致使它们很难维护。

### 必要性

假设你想把单个项目作为一个存储库内的子项目，传统的方法是把该项目复制到父存储库中，但是，如果你想要在多个父项目中使用同一个子项目呢？如果把子项目复制到所有父项目中，当有更新时，你都要在每个父项目中做修改，这是不太可行的。这会导致父项目中的冗余和数据不一致，使更新和维护子项目变得很困难。

### Git 子模块和子树

如果你可以用一条命令把一个项目放进另一个项目中，会怎样呢？如果你随时可以把一个项目作为子项目添加到任意数目的项目中，并可以同步更新修改呢？Git 提供了这类问题的解决方案：Git <ruby>子模块<rt>submodule</rt></ruby>和 Git <ruby>子树<rt>subtree</rt></ruby>。创建这些工具的目的是以更加模块化的水平来支持共用代码的开发工作流，旨在 Git 存储库<ruby>源码管理<rt>source-code management</rt></ruby>（SCM）与它下面的子树之间架起一座桥梁。

![Cherry tree growing on a mulberry tree][2]

*生长在桑树上的樱桃树*

下面是本文要详细介绍的概念的一个真实应用场景。如果你已经很熟悉树形结构，这个模型看起来是下面这样：

![Tree with subtrees][3]

### Git 子模块是什么？

Git 在它默认的包中提供了子模块，子模块可以把 Git 存储库嵌入到其他存储库中。确切地说，Git 子模块指向子树中的某次提交。下面是我 [Docs-test][4] GitHub 存储库中的 Git 子模块的样子：

![Git submodules screenshot][5]

[文件夹@提交 Id][6] 格式表明这个存储库是一个子模块，你可以直接点击文件夹进入该子树。名为 `.gitmodules` 的配置文件包含所有子模块存储库的详细信息。我的存储库的 `.gitmodules` 文件如下：

![Screenshot of .gitmodules file][7]

你可以用下面的命令在你的存储库中使用 Git 子模块：

#### 克隆一个存储库并加载子模块

克隆一个含有子模块的存储库：

```
$ git clone --recursive <URL to Git repo>
```

如果你之前已经克隆了存储库，现在想加载它的子模块：

```
$ git submodule update --init
```

如果有嵌套的子模块：

```
$ git submodule update --init --recursive
```

#### 下载子模块

串行地连续下载多个子模块是很枯燥的工作，所以 `clone` 和 `submodule update` 会支持 `--jobs` （或 `-j`）参数：

例如，想一次下载 8 个子模块，使用：

```
$ git submodule update --init --recursive -j 8
$ git clone --recursive --jobs 8 <URL to Git repo>
```

#### 拉取子模块

在运行或构建父项目之前，你需要确保依赖的子项目都是最新的。

拉取子模块的所有修改：

```
$ git submodule update --remote
```

#### 使用子模块创建存储库：

向一个父存储库添加子树：

```
$ git submodule add <URL to Git repo>
```

初始化一个已存在的 Git 子模块：

```
$ git submodule init
```

你也可以通过为 `submodule update` 命令添加 `--update` 参数在子模块中创建分支和追踪提交：

```
$ git submodule update --remote
```

#### 更新子模块的提交

上面提到过，一个子模块就是一个指向子树中某次提交的链接。如果你想更新子模块的提交，不要担心。你不需要显式地指定最新的提交。你只需要使用通用的 `submodule update` 命令：

```
$ git submodule update
```

就像你平时创建父存储库和把父存储库推送到 GitHub 那样添加和提交就可以了。

#### 从一个父存储库中删除一个子模块

仅仅手动删除一个子项目文件夹不会从父项目中移除这个子项目。想要删除名为 `childmodule` 的子模块，使用：

```
$ git rm -f childmodule
```

虽然 Git 子模块看起来很容易上手，但是对于初学者来说，有一定的使用门槛。

### Git 子树是什么？

Git <ruby>子树<rt> subtree</rt></ruby>，是在 Git 1.7.11 引入的，让你可以把任何存储库的副本作为子目录嵌入另一个存储库中。它是 Git 项目可以注入和管理项目依赖的几种方法之一。它在常规的提交中保存了外部依赖信息。Git 子树提供了整洁的集成点，因此很容易复原它们。

如果你参考 [GitHub 提供的子树教程][8]来使用子树，那么无论你什么时候添加子树，在本地都不会看到 `.gittrees` 配置文件。这让我们很难分辨哪个是子树，因为它们看起来很像普通的文件夹，但是它们却是子树的副本。默认的 Git 包中不提供带 `.gittrees` 配置文件的 Git 子树版本，因此如果你想要带 `.gittrees` 配置文件的 git-subtree 命令，必须从 Git 源码存储库的 [/contrib/subtree 文件夹][9] 下载 git-subtree。

你可以像克隆其他常规的存储库那样克隆任何含有子树的存储库，但由于在父存储库中有整个子树的副本，因此克隆过程可能会持续很长时间。

你可以用下面的命令在你的存储库中使用 Git 子树。

#### 向父存储库中添加一个子树

想要向父存储库中添加一个子树，首先你需要执行 `remote add`，之后执行 `subtree add` 命令：

```
$ git remote add remote-name <URL to Git repo>
$ git subtree add --prefix=folder/ remote-name <URL to Git repo> subtree-branchname
```

上面的命令会把整个子项目的提交历史合并到父存储库。

#### 向子树推送修改以及从子树拉取修改

```
$ git subtree push-all
```

或者

```
$ git subtree pull-all
```

### 你应该使用哪个？

任何工具都有优缺点。下面是一些可能会帮助你决定哪种最适合你的特性：

  * Git 子模块的存储库占用空间更小，因为它们只是指向子项目的某次提交的链接，而 Git 子树保存了整个子项目及其提交历史。
  * Git 子模块需要在服务器中可访问，但子树是去中心化的。
  * Git 子模块大量用于基于组件的开发，而 Git 子树多用于基于系统的开发。

Git 子树并不是 Git 子模块的直接可替代项。有明确的说明来指导我们该使用哪种。如果有一个归属于你的外部存储库，使用场景是向它回推代码，那么就使用 Git 子模块，因为推送代码更容易。如果你有第三方代码，且不会向它推送代码，那么使用 Git 子树，因为拉取代码更容易。

自己尝试使用 Git 子树和子模块，然后在评论中留下你的使用感想。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/git-submodules-subtrees

作者：[Manaswini Das][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/manaswinidas
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://opensource.com/sites/default/files/uploads/640px-bialbero_di_casorzo.jpg (Cherry tree growing on a mulberry tree)
[3]: https://opensource.com/sites/default/files/subtree_0.png (Tree with subtrees)
[4]: https://github.com/manaswinidas/Docs-test/
[5]: https://opensource.com/sites/default/files/uploads/git-submodules_github.png (Git submodules screenshot)
[6]: mailto:folder@commitId
[7]: https://opensource.com/sites/default/files/uploads/gitmodules.png (Screenshot of .gitmodules file)
[8]: https://help.github.com/en/github/using-git/about-git-subtree-merges
[9]: https://github.com/git/git/tree/master/contrib/subtree
