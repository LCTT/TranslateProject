如何恢复丢弃的 git stash 数据
============================================================

> 不要让 git 命令中的错误抹去数天的工作

![How to recover from a git mistake](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bubblehands_fromRHT_520_0612LL.png?itok=_iQ2dO3S "How to recover from a git mistake")

今天我的同事几乎失去了他在四天工作中所做的一切。由于不正确的 `git` 命令，他把保存在 [stash][20] 中的更改删除了。在这悲伤的情节之后，我们试图寻找一种恢复他所做工作的方法，而且我们做到了！

首先警告一下：当你在实现一个大功能时，请将它分成小块并定期提交。长时间工作而不做提交并不是一个好主意。

现在我们已经搞定了那个错误，下面就演示一下怎样从 stash 中恢复误删的更改。

我用作示例的仓库中，只有一个源文件 “main.c”，如下所示：

![Repository with one source file](https://opensource.com/sites/default/files/u128651/missing_data_from_stash_01.jpeg "Repository with one source file")

它只有一次提交，即 “Initial commit”：

![One commit](https://opensource.com/sites/default/files/u128651/missing_data_from_stash_02.jpeg "One commit")

该文件的第一个版本是：

![First version of the file](https://opensource.com/sites/default/files/u128651/missing_data_from_stash_03.jpeg "First version of the file")

我将在文件中写一些代码。对于这个例子，我并不需要做什么大的改动，只需要有什么东西放进 stash 中即可，所以我们仅仅增加一行。“git diff” 的输出如下：

![git-diff output ](https://opensource.com/sites/default/files/u128651/missing_data_from_stash_04.jpeg "git-diff output ")

现在，假设我想从远程仓库中拉取一些新的更改，当时还不打算提交我自己的更改。于是，我决定先 stash 它，等拉取远程仓库中的更改后，再把我的更改恢复应用到主分支上。我执行下面的命令将我的更改移动到 stash 中：

```
git stash
```

使用命令 `git stash list` 查看 stash，在这里能看到我的更改：

![Output of changes in our stash](https://opensource.com/sites/default/files/u128651/missing_data_from_stash_06.jpeg "Output of changes in our stash")

我的代码已经在一个安全的地方，而且主分支目前是干净的（使用命令 `git status` 检查）。现在我只需要拉取远程仓库的更改，然后把我的更改恢复应用到主分支上，而且我也应该是这么做的。

但是我错误地执行了命令：

```
git stash drop
```

它删除了 stash，而不是执行了下面的命令：

```
git stash pop
```

这条命令会在从栈中删除 stash 之前应用它。如果我再次执行命令 `git stash list`，就能看到在没有从栈中将更改恢复到主分支的之前，我就删除了它。OMG！接下来怎么办？

好消息是：`git` 并没有删除包含了我的更改的对象，它只是移除了对它的引用。为了证明这一点，我使用命令 `git fsck`，它会验证数据库中对象的连接和有效性。这是我对该仓库执行了 `git fsck` 之后的输出：

![Output after executing the git-fsck command on the repository](https://opensource.com/sites/default/files/u128651/missing_data_from_stash_07.jpeg "Output after executing the git-fsck command on the repository")

由于使用了参数 `--unreachable`，我让 `git-fsck` 显示出所有不可访问的对象。正如你看到的，它显示并没有不可访问的对象。而当我从 stash 中删除了我的更改之后，再次执行相同的指令，得到了一个不一样的输出：

![Output after dropping changes on stash](https://opensource.com/sites/default/files/u128651/missing_data_from_stash_08.jpeg "Output after dropping changes on stash")

现在有三个不可访问对象。那么哪一个才是我的更改呢？实际上，我不知道。我需要通过执行命令 `git show` 来搜索每一个对象。

![Output after executing the git-show command ](https://opensource.com/sites/default/files/u128651/missing_data_from_stash_09.jpeg "Output after executing the git-show command ")

就是它！ID 号 `95ccbd927ad4cd413ee2a28014c81454f4ede82c` 对应了我的更改。现在我已经找到了丢失的更改，我可以恢复它。其中一种方法是将此 ID 取出来放进一个新的分支，或者直接提交它。如果你得到了你的更改对象的 ID 号，就可以决定以最好的方式，将更改再次恢复应用到主分支上。对于这个例子，我使用 `git stash` 将更改恢复到我的主分支上。

```
git stash apply 95ccbd927ad4cd413ee2a28014c81454f4ede82c
```

另外需要重点记住的是 `git` 会周期性地执行它的垃圾回收程序（`gc`），它执行之后，使用 `git fsck` 就不能再看到不可访问对象了。

 _本文[最初发表][18]于作者的博客，并得到了转载授权。_


（题图：opensource.com，附图：José Guilherme Vanz, [CC BY][1]）

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/8/recover-dropped-data-stash

作者：[Jose Guilherme Vanz][a]
译者：[firmianay](https://github.com/firmianay)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jvanz
[1]:https://creativecommons.org/licenses/by/4.0/
[2]:https://creativecommons.org/licenses/by/4.0/
[3]:https://creativecommons.org/licenses/by/4.0/
[4]:https://creativecommons.org/licenses/by/4.0/
[5]:https://creativecommons.org/licenses/by/4.0/
[6]:https://creativecommons.org/licenses/by/4.0/
[7]:https://creativecommons.org/licenses/by/4.0/
[8]:https://creativecommons.org/licenses/by/4.0/
[9]:https://opensource.com/file/366691
[10]:https://opensource.com/file/366696
[11]:https://opensource.com/file/366701
[12]:https://opensource.com/file/366706
[13]:https://opensource.com/file/366711
[14]:https://opensource.com/file/366716
[15]:https://opensource.com/file/366721
[16]:https://opensource.com/file/366726
[17]:https://opensource.com/article/17/8/recover-dropped-data-stash?rate=BUOLRB3pka4kgSQFTTEfX7_HJrX6duyjronp9GABnGU
[18]:http://jvanz.com/recovering-missed-data-from-stash.html#recovering-missed-data-from-stash
[19]:https://opensource.com/user/94726/feed
[20]:https://www.git-scm.com/docs/git-stash
[21]:https://opensource.com/users/jvanz
[22]:https://opensource.com/users/jvanz
[23]:https://opensource.com/article/17/8/recover-dropped-data-stash#comments
