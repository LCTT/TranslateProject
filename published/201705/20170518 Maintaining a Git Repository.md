如何瘦身 Git 仓库
============================================================

对 Git 仓库的维护通常是为了减少仓库的大小。如果你从另外一个版本控制系统导入了一个仓库，你可能需要在导入后清除掉不必要的文件。本文着重于从一个 Git 仓库中删除大文件，并且包含下列主题：

* 理解从 Git 的历史记录中删除文件
* 使用 BFG 重写历史记录
* 可选，使用 `git filter-branch` 重写历史记录
* 垃圾回收

> **请格外小心.....**

> 本文中的步骤和工具使用的高级技术涉及破坏性操作。确保您在开始之前仔细读过并**备份了你的仓库**，创建一个备份最容易的方式是使用 [--mirror][5] 标志对你的仓库克隆，然后对整个克隆的文件进行打包压缩。有了这个备份，如果在维护期间意外损坏了您的仓库的关键元素，那么你可以通过备份的仓库来恢复。

> 请记住，仓库维护对仓库的用户可能会是毁灭性的。与你的团队或者仓库的关注者进行沟通会是一个不错的主意。确保每个人都已经检查了他们的代码，并且同意在仓库维护期间停止开发。

### 理解从 Git 的历史记录中删除文件

回想一下，克隆仓库会克隆整个历史记录——包括每个源代码文件的所有版本。如果一个用户提交了一个较大的文件，比如一个 JAR，则随后的每次克隆都会包含这个文件。即使用户最终在后面的某次提交中删除了这个文件，但是这个文件仍然存在于这个仓库的历史记录中。要想完全的从你的仓库中删除这个文件，你必须：

* 从你的项目的*当前的*文件树中删除该文件;
* 从仓库的历史记录中删除文件——*重写* Git 历史记录，从包含该文件的*所有的*提交中删除这个文件;
* 删除指向*旧的*提交历史记录的所有 [reflog][6] 历史记录;
* 重新整理仓库，使用 [git gc][7] 对现在没有使用的数据进行垃圾回收。

Git 的 “gc”（垃圾回收）将通过你的任何一个分支或者标签来删除仓库中所有的实际没用的或者以某种方式引用的数据。为了使其发挥作用，我们需要重写包含不需要的文件的所有 Git 仓库历史记录，仓库将不再引用它—— git gc 将会丢弃所有没用的数据。

重写存储库历史是一个棘手的事情，因为每个提交都依赖它的父提交，所以任何一个很小的改变都会改变它的每一个随后的提交的提交 ID。有两个自动化的工具可以做到这：

1. [BFG Repo Cleaner][8] 快速、简单且易于使用，需要 Java 6 或者更高版本的运行环境。
2. [git filter-branch][9] 功能强大、配置麻烦，用于大于仓库时速度较慢，是核心 Git 套件的一部分。

切记，当你重写历史记录后，无论你是使用 BFG 还是使用 filter-branch，你都需要删除指向旧的历史记录的 `reflog` 条目，最后运行垃圾回收器来删除旧的数据。

### 使用 BFG 重写历史记录

[BFG][11] 是为将像大文件或者密码这些不想要的数据从 Git 仓库中删除而专门设计的，所以它有一一个简单的标志用来删除那些大的历史文件（不在当前的提交里面）：`--strip-blobs-bigger-than`

```
$ java -jar bfg.jar --strip-blobs-than 100M

```
大小超过 100MB 的任何文件（不包含在你*最近的*提交中的文件——因为 BFG [默认会保护你的最新提交的内容][12]）将会从你的 Git 仓库的历史记录中删除。如果你想用名字来指明具体的文件，你也可以这样做：

```
$ java -jar bfg.jar --delete-files *.mp4

```

BFG 的速度要比 `git filter-branch` 快 [10-1000 倍][13]，而且通常更容易使用——查看完整的[使用说明][14]和[示例][15]获取更多细节。

### 或者，使用 git filter-branch 来重写历史记录

`filter-branch` 命令可以对 Git 仓库的历史记录重写，就像 BFG 一样，但是过程更慢和更手动化。如果你不知道这些大文件在_哪里_，那么你第一步就需要找到它们：

#### 手动查看你 Git 仓库中的大文件

[Antony Stubbs][16] 写了一个可以很好地完成这个功能的 BASH 脚本。该脚本可以检查你的包文件的内容并列出大文件。在你开始删除文件之前，请执行以下操作获取并安装此脚本：

1、 [下载脚本][10]到你的本地的系统。

2、 将它放在一个可以访问你的 Git 仓库的易于找到的位置。

3、 让脚本成为可执行文件：

```
$ chmod 777 git_find_big.sh
```

4、 克隆仓库到你本地系统。

5、 改变当前目录到你的仓库根目录。

6、 手动运行 Git 垃圾回收器：

```
git gc --auto
```

7、 找出 .git 文件夹的大小

```
$ du -hs .git/objects
45M .git/objects
```

注意文件大小，以便随后参考。

8、 运行 `git_find_big.sh` 脚本来列出你的仓库中的大文件。

```
$ git_find_big.sh 
All sizes are in kB's. The pack column is the size of the object, compressed, inside the pack file.
size  pack  SHA                                       location
592   580   e3117f48bc305dd1f5ae0df3419a0ce2d9617336  media/img/emojis.jar
550   169   b594a7f59ba7ba9daebb20447a87ea4357874f43  media/js/aui/aui-dependencies.jar
518   514   22f7f9a84905aaec019dae9ea1279a9450277130  media/images/screenshots/issue-tracker-wiki.jar
337   92    1fd8ac97c9fecf74ba6246eacef8288e89b4bff5  media/js/lib/bundle.js
240   239   e0c26d9959bd583e5ef32b6206fc8abe5fea8624  media/img/featuretour/heroshot.png
```

大文件都是 JAR 文件，包的大小列是最相关的。`aui-dependencies.jar` 被压缩到 169kb，但是 `emojis.jar` 只压缩到 500kb。`emojis.jar` 就是一个待删除的对象。

#### 运行 filter-branch

你可以给这个命令传递一个用于重写 Git 索引的过滤器。例如，一个过滤器可以可以将每个检索的提交删除。这个用法如下：

```
git filter-branch --index-filter 'git rm --cached --ignore-unmatch  _pathname_ ' commitHASH
```

`--index-filter` 选项可以修改仓库的索引，`--cached ` 选项从索引中而不是磁盘来删除文件。这样会更快，因为你不需要在运行这个过滤器前检查每个修订版本。`git rm` 中的 `ignore-unmatch` 选项可以防止在尝试移走不存在的文件 `pathname` 的时候命令失败。通过指定一个提交 HASH 值，你可以从每个以这个 HASH 值开始的提交中删除`pathname`。要从开始处删除，你可以省略这个参数或者指定为 `HEAD`。

如果你的大文件在不同的分支，你将需要通过名字来删除每个文件。如果大文件都在一个单独的分支，你可以直接删除这个分支本身。

#### 选项 1：通过文件名删除文件

使用下面的步骤来删除大文件：

1、 使用下面的命令来删除你找到的第一个大文件：

```
git filter-branch --index-filter 'git rm --cached --ignore-unmatch filename' HEAD

```

2、 重复步骤 1 找到剩下的每个大文件。

3、 在你的仓库里更新引用。 `filter-branch` 会为你原先的引用创建一个 `refs/original/` 下的备份。一旦你确信已经删除了正确的文件，你可以运行下面的命令来删除备份文件，同时可以让垃圾回收器回收大的对象：

```
git filter-branch --index-filter 'git rm --cached --ignore-unmatch filename' HEAD

```

#### 选项 2：直接删除分支

如果你所有的大文件都在一个单独的分支上，你可以直接删除这个分支。删除这个分支会自动删除所有的引用。

1、 删除分支。

```
$ git branch -D PROJ567bugfix
```

2、 从后面的分支中删除所有的 reflog 引用。


### 对不用的数据垃圾回收

1、 删除从现在到后面的所有 reflog 引用（除非你明确地只在一个分支上操作）。

```
$ git reflog expire --expire=now --all
```

2、 通过运行垃圾回收器和删除旧的对象重新打包仓库。

```
$ git gc --prune=now
```

3、 把你所有的修改推送回仓库。

```
$ git push --all --force
```

4、 确保你所有的标签也是当前最新的:

```
$ git push --tags --force
```

----------
via: https://confluence.atlassian.com/bitbucket/maintaining-a-git-repository-321848291.html

作者：[atlassian.com][a]
译者：[zhousiyu325](https://github.com/zhousiyu325)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://confluence.atlassian.com/bitbucket/maintaining-a-git-repository-321848291.html
[1]:https://confluence.atlassian.com/bitbucket/maintaining-a-git-repository-321848291.html#MaintainingaGitRepository-UnderstandingfileremovalfromGithistory
[2]:https://confluence.atlassian.com/bitbucket/maintaining-a-git-repository-321848291.html#MaintainingaGitRepository-UsingtheBFGtorewritehistory
[3]:https://confluence.atlassian.com/bitbucket/maintaining-a-git-repository-321848291.html#MaintainingaGitRepository-Alternatively,usinggitfilter-branchtorewritehistory
[4]:https://confluence.atlassian.com/bitbucket/maintaining-a-git-repository-321848291.html#MaintainingaGitRepository-Garbagecollectingdeaddata
[5]:http://stackoverflow.com/questions/3959924/whats-the-difference-between-git-clone-mirror-and-git-clone-bare
[6]:http://git-scm.com/docs/git-reflog
[7]:http://git-scm.com/docs/git-gc
[8]:http://rtyley.github.io/bfg-repo-cleaner/
[9]:http://git-scm.com/docs/git-filter-branch
[10]:https://confluence.atlassian.com/bitbucket/files/321848291/321979854/1/1360604134990/git_find_big.sh
[11]:http://rtyley.github.io/bfg-repo-cleaner/
[12]:http://rtyley.github.io/bfg-repo-cleaner/#protected-commits
[13]:https://www.youtube.com/watch?v=Ir4IHzPhJuI
[14]:http://rtyley.github.io/bfg-repo-cleaner/#usage
[15]:http://rtyley.github.io/bfg-repo-cleaner/#examples
[16]:https://stubbisms.wordpress.com/2009/07/10/git-script-to-show-largest-pack-objects-and-trim-your-waist-line/