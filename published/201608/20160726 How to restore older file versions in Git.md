Git 系列（四）：在 Git 中进行版本回退
=============================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/file_system.jpg?itok=s2b60oIB)

在这篇文章中，你将学到如何查看项目中的历史版本，如何进行版本回退，以及如何创建 Git 分支以便你可以大胆尝试而不会出现问题。

在你的 Git 项目的历史中，你的位置就像是摇滚专辑中的一个片段，由一个被称为 HEAD 的 标记来确定（如磁带录音机或录音播放器的播放头）。要在你的 Git 时间线上前后移动 HEAD ，需要使用 `git checkout` 命令。

git checkout 命令的使用方式有两种。最常见的用途是从一个以前的提交中恢复文件，你也可以整个倒回磁带，切换到另一个分支。


### 恢复一个文件

当你意识到一个本来很好文件被你完全改乱了。我们都这么干过：我们把文件放到一个地方，添加并提交，然后我们发现它还需要做点最后的调整，最后这个文件被搞得面目全非了。

要把它恢复到最后的完好状态，使用 git checkout 从最后的提交（即 HEAD）中恢复：

```
$ git checkout HEAD filename
```

如果你碰巧提交了一个错误的版本，你需要找回更早的版本，使用 git log 查看你更早的提交，然后从合适的提交中找回它：

```
$ git log --oneline
79a4e5f bad take
f449007 The second commit
55df4c2 My great project, first commit.

$ git checkout 55df4c2 filename

```

现在，以前的文件恢复到了你当前的位置。（任何时候你都可以用 git status 命令查看你的当前状态）因为这个文件改变了，你需要添加这个文件，再进行提交：

```
$ git add filename
$ git commit -m 'restoring filename from first commit.'
```

使用 Git log 验证你所提交的：

```
$ git log --oneline
d512580 restoring filename from first commit
79a4e5f bad take
f449007 The second commit
55df4c2 My great project, first commit.
```

从本质上讲，你已经倒好了磁带并修复了坏的地方，所以你需要重新录制正确的。

### 回退时间线

恢复文件的另一种方式是回退整个 Git 项目。这里使用了分支的思想，这是另一种替代方法。

如果你要回到历史提交，你要将 Git HEAD 回退到以前的版本才行。这个例子将回到最初的提交处：

```
$ git log --oneline
d512580 restoring filename from first commit
79a4e5f bad take
f449007 The second commit
55df4c2 My great project, first commit.

$ git checkout 55df4c2
```

当你以这种方式倒回磁带，如果你按下录音键再次开始，就会丢失以前的工作。Git 默认假定你不想这样做，所以将 HEAD 从项目中分离出来，可以让你如所需的那样工作，而不会因为偶尔的记录而影响之后的工作。

如果你想看看以前的版本，想要重新做或者尝试不同的方法，那么安全一点的方式就是创建一个新的分支。可以将这个过程想象为尝试同一首歌曲的不同版本，或者创建一个混音的。原始的依然存在，关闭那个分支做你想做的版本吧。

就像记录到一个空白磁带一样，把你的 Git HEAD 指到一个新的分支处：

```
$ git checkout -b remix
Switched to a new branch 'remix'
```

现在你已经切换到了另一个分支，在你面前的是一个替代的干净工作区，准备开始工作吧。

也可以不用改变时间线来做同样的事情。也许你很想这么做，但切换到一个临时的工作区只是为了尝试一些疯狂的想法。这在工作中完全是可以接受的，请看：

```
$ git status
On branch master
nothing to commit, working directory clean

$ git checkout -b crazy_idea
Switched to a new branch 'crazy_idea'
```

现在你有一个干净的工作空间，在这里你可以完成一些奇怪的想法。一旦你完成了，可以保留你的改变，或者丢弃他们，并切换回你的主分支。

若要放弃你的想法，切换到你的主分支，假装新分支不存在：

```
$ git checkout master
```

想要继续使用你的疯狂的想法，需要把它们拉回到主分支，切换到主分支然后合并新分支到主分支：

```
$ git checkout master
$ git merge crazy_idea
```

git 的分支功能很强大，开发人员在克隆仓库后马上创建一个新分支是很常见的做法；这样，他们所有的工作都在自己的分支上，可以提交并合并到主分支。Git 是很灵活的，所以没有“正确”或“错误”的方式（甚至一个主分支也可以与其所属的远程仓库分离），但分支易于分离任务和提交贡献。不要太激动，你可以如你所愿的有很多的 Git 分支。完全自由。

### 远程协作

到目前为止你已经在自己舒适而私密的家中维护着一个 Git 仓库，但如何与其他人协同工作呢？

有好几种不同的方式来设置 Git 以便让多人可以同时在一个项目上工作，所以首先我们要克隆仓库，你可能已经从某人的 Git 服务器或 GitHub 主页，或在局域网中的共享存储上克隆了一个仓库。

工作在私人仓库下和共享仓库下唯一不同的是你需要把你的改变 `push` 到别人的仓库。我们把工作的仓库称之为本地（local）仓库，其他仓库称为远程（remote）仓库。

当你以读写的方式克隆一个仓库时，克隆的仓库会继承自被称为 origin 的远程库。你可以看看你的克隆仓库的远程仓库：

```
$ git remote --verbose
origin  seth@example.com:~/myproject.Git (fetch)
origin  seth@example.com:~/myproject.Git (push)
```

有一个 origin 远程库非常有用，因为它有异地备份的功能，并允许其他人在该项目上工作。

如果克隆没有继承 origin 远程库，或者如果你选择以后再添加，可以使用 `git remote` 命令：

```
$ git remote add seth@example.com:~/myproject.Git
```

如果你修改了文件，想把它们发到有读写权限的 origin 远程库，使用 `git push`。第一次推送改变，必须也发送分支信息。不直接在主分支上工作是一个很好的做法，除非你被要求这样做：

```
$ git checkout -b seth-dev
$ git add exciting-new-file.txt
$ git commit -m 'first push to remote'
$ git push -u origin HEAD
```

它会推送你当前的位置（HEAD）及其存在的分支到远程。当推送过一次后，以后每次推送可以不使用 -u 选项：

```
$ git add another-file.txt
$ git commit -m 'another push to remote'
$ git push origin HEAD
```

### 合并分支

当你工作在一个 Git 仓库时，你可以合并任意测试分支到主分支。当团队协作时，你可能想在将它们合并到主分支之前检查他们的改变：

```
$ git checkout contributor
$ git pull
$ less blah.txt  ### 检查改变的文件
$ git checkout master
$ git merge contributor
```

如果你正在使用 GitHub 或 GitLab 以及类似的东西，这个过程是不同的。但克隆项目并把它作为你自己的仓库都是相似的。你可以在本地工作，将改变提交到你的 GitHub 或 GitLab 帐户，而不用其它人的许可，因为这些库是你自己的。

如果你想要让你克隆的仓库接受你的改变，需要创建了一个拉取请求（pull request），它使用 Web 服务的后端发送补丁到真正的拥有者，并允许他们审查和拉取你的改变。

克隆一个项目通常是在 Web 服务端完成的，它和使用 Git 命令来管理项目是类似的，甚至推送的过程也是。然后它返回到 Web 服务打开一个拉取请求，工作就完成了。

下一部分我们将整合一些有用的插件到 Git 中来帮你轻松的完成日常工作。

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/7/how-restore-older-file-versions-git

作者：[Seth Kenlon][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
