Git 分支操作介绍
======

> 在这个 Git 入门系列的第三篇中，我们来学习一下如何添加和删除 Git 分支。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/arrows_translation_lead.jpg?itok=S4vAh9CP)

在本系列的前两篇文章中，我们[开始使用 Git][1]，学会如何[克隆项目，修改、增加和删除内容][2]。在这第三篇文章中，我将介绍 Git 分支，为何以及如何使用分支。

![树枝][3]

不妨用树来描绘 Git 仓库。图中的树有很多分支，或长或短，或从树干延伸或从其它分支延伸。在这里，我们用树干比作仓库的 master 分支，其中 `master` 代指 ”master 分支”，是 Git 仓库的中心分支或第一个分支。为简单起见，我们假设 `master` 是树干，其它分支都是从该分支分出的。

### 为何在 Git 仓库中使用分支

使用分支的主要理由为：

  * 如果你希望为项目增加新特性，但很可能会影响当前可正常工作的代码。对于该项目的活跃用户而言，这是很糟糕的事情。与其将特性加入到其它人正在使用的 `master` 分支，更好的方法是在仓库的其它分支中变更代码，下面会给出具体的工作方式。
  * 更重要的是，[Git 其设计][4]用于协作。如果所有人都在你代码仓库的 `master` 分支上操作，会引发很多混乱。对编程语言或项目的知识和阅历因人而异；有些人可能会编写有错误或缺陷的代码，也可能会编写你觉得不适合该项目的代码。使用分支可以让你核验他人的贡献并选择适合的加入到项目中。（这里假设你是代码库唯一的所有者，希望对增加到项目中的代码有完全的控制。在真实的项目中，代码库有多个具有合并代码权限的所有者）

### 创建分支

让我们回顾[本系列上一篇文章][2]，看一下在我们的 Demo 目录中分支是怎样的。如果你没有完成上述操作，请按照文章中的指示从 GitHub 克隆代码并进入 Demo 目录。运行如下命令：

```
pwd
git branch
ls -la
```

`pwd` 命令（是当前工作目录的英文缩写）返回当前你所处的目录（以便确认你在 `Demo` 目录中），`git branch` 列出该项目在你主机上的全部分支，`ls -la` 列出当前目录下的所有文件。你的终端输出类似于：

![终端输出][5]

在 `master` 分支中，只有一个文件 `README.md`。（Git 会友好地忽略掉其它目录和文件。）

接下来，运行如下命令：

```
git status
git checkout -b myBranch
git status
```

第一条命令 `git status` 告知你当前位于 `branch master`，（就像在终端中看到的那样）它与 `origin/master` 处于同步状态，这意味着 master 分支的本地副本中的全部文件也出现在 GitHub 中。两份副本没有差异，所有的提交也是一致的。

下一条命令 `git checkout -b myBranch` 中的 `-b` 告知 Git 创建一个名为 `myBranch` 的新分支，然后 `checkout` 命令将我们切换到新创建的分支。运行第三条命令 `git status` 确保你已经位于刚创建的分支下。

如你所见，`git status` 告知你当前处于 `myBranch` 分支，没有变更需要提交。这是因为我们既没有增加新文件，也没有修改已有文件。

![终端输出][6]

如果希望以可视化的方式查看分支，可以运行 `gitk` 命令。如果遇到报错 `bash: gitk: command not found...`，请先安装 `gitk` 软件包（找到你操作系统对应的安装文档，以获得安装方式）。

（LCTT 译注：需要在有 X 服务器的终端运行 `gitk`，否则会报错）

下图展示了我们在 Demo 项目中的所作所为：你最后一次提交（的对应信息）是 `Delete file.txt`，在此之前有三次提交。当前的提交用黄点标注，之前的提交用蓝点标注，黄点和 `Delete file.txt` 之间的三个方块展示每个分支所在的位置（或者说每个分支中的最后一次提交的位置）。由于 `myBranch` 刚创建，提交状态与 `master` 分支及其对应的记为 `remotes/origin/master` 的远程 `master` 分支保持一致。（非常感谢来自 Red Hat 的 [Peter Savage][7] 让我知道 `gitk` 这个工具）

![Gitk 输出][8]

下面让我们在 `myBranch` 分支下创建一个新文件并观察终端输出。运行如下命令：

```
echo "Creating a newFile on myBranch" > newFile
cat newFile
git status
```

第一条命令中的 `echo` 创建了名为 `newFile` 的文件，接着 `cat newFile` 打印出文件内容，最后 `git status` 告知你我们 `myBranch` 分支的当前状态。在下面的终端输出中，Git 告知 `myBranch` 分支下有一个名为 `newFile` 的文件当前处于 `untracked` 状态。这表明我们没有让 Git 追踪发生在文件 `newFile` 上的变更。

![终端输出][9]

下一步是增加文件，提交变更并将 `newFile` 文件推送至 `myBranch` 分支（请回顾本系列上一篇文章获得更多细节）。

```
git add newFile
git commit -m "Adding newFile to myBranch"
git push origin myBranch
```

在上述命令中，`push` 命令使用的分支参数为 `myBranch` 而不是 `master`。Git 添加 `newFile` 并将变更推送到你 GitHub 账号下的 Demo 仓库中，告知你在 GitHub 上创建了一个与你本地副本分支 `myBranch` 一样的新分支。终端输出截图给出了运行命令的细节及命令输出。

![终端输出][10]

当你访问 GitHub 时，在分支选择的下拉列表中可以发现两个可供选择的分支。

![GitHub][11]

点击 `myBranch` 切换到 `myBranch` 分支，你可以看到在此分支上新增的文件。

![GitHub][12]

截至目前，我们有两个分支：一个是 `master` 分支，只有一个 `README.md` 文件；另一个是 `myBranch` 分支，有两个文件。

你已经知道如何创建分支了，下面我们再创建一个分支。输入如下命令：

```
git checkout master
git checkout -b myBranch2
touch newFile2
git add newFile2
git commit -m "Adding newFile2 to myBranch2"
git push origin myBranch2
```

我不再给出终端输出，需要你自己尝试，但你可以在 [GitHub 代码库][13] 中验证你的结果。

### 删除分支

由于我们增加了两个分支，下面删除其中的一个（`myBranch`），包括两步：

1. **删除本地分支** 你不能删除正在操作的分支，故切换到 `master` 分支 （或其它你希望保留的分支），命令及终端输出如下：

	![](https://opensource.com/sites/default/files/pictures/kulkarni_fig_new.png)

	`git branch` 可以列出可用的分支，使用 `checkout` 切换到 `master` 分支，然后使用 `git branch -D myBranch` 删除该分支。再次运行 `git branch` 检查是否只剩下两个分支（而不是三个）。

2. **删除 GitHub 上的分支** 使用如下命令删除 `myBranch` 的远程分支：

	```
git push origin :myBranch
```

	![Terminal output][14]

上面 `push` 命令中分支名称前面的冒号（`:`）告知 GitHub 删除分支。另一种写法为：

```
git push -d origin myBranch
```

其中 `-d` (也可以用 `--delete`) 也用于告知 GitHub 删除你的分支。

我们学习了 Git 分支的使用，在本系列的下一篇文章中，我们将介绍如何执行 `fetch` 和 `rebase` 操作，对于多人同时的贡献的项目而言，这是很必须学会的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/git-branching

作者：[Kedar Vijay Kulkarni][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[pinewall](https://github.com/pinewall)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/kkulkarn
[1]:https://linux.cn/article-9319-1.html
[2]:https://linux.cn/article-9517-1.html
[3]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/tree-branches.jpg?itok=bQGpa5Uc (tree branches)
[4]:https://en.wikipedia.org/wiki/Git
[5]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/gitbranching_terminal1.png?itok=ZcAzRdlR (Terminal output)
[6]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/gitbranching_terminal2.png?itok=nIcfy2Vh (Terminal output)
[7]:https://opensource.com/users/psav
[8]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/gitbranching_commit3.png?itok=GoP51yE4 (Gitk output)
[9]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/gitbranching_terminal4.png?itok=HThID5aU (Terminal output)
[10]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/gitbranching_terminal5.png?itok=rHVdrJ0m (Terminal output)
[11]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/gitbranching_github6.png?itok=EyaKfCg2 (GitHub)
[12]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/gitbranching_github7.png?itok=0ZSu0W2P (GitHub)
[13]:https://github.com/kedark3/Demo/tree/myBranch2
[14]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/gitbranching_terminal9.png?itok=B0vaRkyI (Terminal output)
