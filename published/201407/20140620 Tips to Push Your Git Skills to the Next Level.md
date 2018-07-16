已经会用Git了？不会这十招怎么行
================================================================================

之前我们发了一些教程让你熟悉[Git基础][1]和[在团队合作环境中使用Git][2].我们讨论的这些Git命令足够让一个开发者在Git的世界里生存下去。在这篇教程里，我们试着探索如何高效地管理你的时间以及如何充分利用Git提供的特性。

> 注意：这里介绍的命令中有的包含方括号(例如：`git add -p [file_name]`)。在这些例子中，你应该用你自己的数字、标识符等替代方括号里的内容，并且去掉方括号。

### 1. Git自动补全 ###

如果你在命令行环境中运行Git命令，每次都手动地逐个输入命令是一件很无聊的事。为此，你可以花几分钟时间配置一下Git命令的自动补全功能。

在*nix系统运行下列命令下载自动补全脚本：

    cd ~
    curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

然后，添加下面的行到你的~/.bash_profile文件：

    if [ -f ~/.git-completion.bash ]; then
        . ~/.git-completion.bash
    fi

尽管我之前已经提到过，但我还是想再强调一下：如果你想使用完整的Git特性，你绝bi应该切换到命令行环境。

### 2. 在Git中忽略文件 ###

你是不是对出现在你Git库里面的编译生成文件（比如`.pyc`)感到很无语？或者你是不是很厌恶不小心将他们添加到了Git？直接看这里，这里有一个方法可以让你告诉Git忽略所有这些文件和目录。只需要创建一个名字为`.gitignore`的文件，里面列出你不想要Git跟踪的文件和目录。可以用感叹号(!)列出例外情况。

    *.pyc
    *.exe
    my_db_config/
     
    !main.pyc

### 3. 谁动了我的代码？ ###

当事情出了乱子时立马责怪别人这是人类的天性。如果你的服务器程序不能正常工作了，要找出罪魁祸首是非常简单的--只需要执行`git blame`。这个命令告诉你文件里的每一行的作者是谁，最后改动那一行的提交，以及提交的时间戳。

    git blame [file_name]

![git blame demonstration](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/06/1402946443git-ninja-01.png)

在下面的截图里，你可以看到在一个更大的库里这个命令的输出是什么样的：

![git blame on the ATutor repository](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/06/1402946441git-ninja-02.png)

### 4. 查看库的历史 ###

在之前的教程里，我们已经看过了如何使用`git log`命令。不管怎样，有3个选项你应该知道。

- **--oneline** - 压缩每次的提交信息，只保留一个缩减的Hash值和说明文字，然后把这些都展示在一行里。
- **--graph** - 这个选项将在左边画出一个文字界面的提交历史图。如果你只有一个分支，用这个选项查看历史时是没什么意义的。
- **--all** - 显示所有分支历史。

这是这3个选项合起来使用的效果：

![Use of git log with all, graph and oneline](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/06/1402946444git-ninja-03.png)

### 5. 不要丢失对某个提交的跟踪 ###

假设你提交了一些不需要的东西，然后你进行了hard重置回到之前的状态。后来，你发现在这个过程中你丢失了其他一些重要的信息，你想要把这些信息找回来，或者至少可以查看一下这些信息。这就需要`git reflog`帮忙。

简单的`git log`只能告诉你最近的提交，这个提交的父提交，父提交的父提交，等等。但是`git reflog`是一个HEAD指向的提交的列表。记住，这个列表依赖于你自己的本地操作环境，它不是库的一部分，也不包含在push或者merge中。

如果执行`git log`命令，可以看到提交历史，这是我的库的一部分：

![Project history](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/06/1402946446git-ninja-04.png)

但是，`git reflog`命令显示了一个被我用hard重置丢掉的提交(`b1b0ee9`-`HEAD@{4}`).

![Git reflog](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/06/1402946447git-ninja-05.png)

### 6. 暂存文件的一部分更改以便进行一次提交 ###

通常依据特性来提交是一个好的实践方法，意思是说，每一个提交都只添加一个特性或者修复一个bug。想一下如果你一次修复了两个bug或者添加了两个特性但是都还没有逐个提交该怎么办。这种场景下，你可以将他们一起提交。但是有一个更好的办法：单独暂存这些文件，然后分开提交。

让我们假设你对一个文件做了多个更改，然后想让这些更改分开提交。这时，我们用带`-p`的添加命令。

    git add -p [file_name]

我们来试试这种用法。我添加了3个新行到`file_name`，但是我只想让第1行和第3行出现在我的提交里。让我们看看`git diff`的输出是什么样的。

![Changes in repo](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/06/1402946449git-ninja-06.png)

然后，我们看看带`-p`选项的`add`命令会发生什么。

![Running add with -p](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/06/1402946450git-ninja-07.png)

看起来Git认为所有的更改都是同一个目的的一部分，所以把他们分组到同一个块里。这时，你可以：

- 输入 y 暂存块
- 输入 n 不暂存块
- 输入 e 手动编辑块
- 输入 d 退出或者跳转到下一个文件
- 输入 s 分割块

在我们这个例子中，我们想把这个块分割成更小的部分，然后选择其中一些忽略另外一些。

![Adding all hunks](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/06/1402946452git-ninja-08.png)

如你所见，我们已经逐个添加了第1和第3行，忽略了第2行。你可以看到库的状态并且进行一次提交。

![Repository after selectively adding a file](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/06/1402946454git-ninja-09.png)

### 7. 合并多个提交 ###

为了进行核查或者发起一个合并请求（这经常发生在开源项目里），对代码进行了修改提交。但在最后代码被接受之前，你也许会需要修改你的代码。于是你修改代码，但是下一次核查的时候又一次需要进行修改。不知不觉中，你就已经有了好几个提交。理论上你应该用rebase命令把他们合并起来。

    git rebase -i HEAD~[number_of_commits]

如果你想合并最后的两次提交，你应该运行下面的命令。

    git rebase -i HEAD~2

一旦你运行这个命令，你将进入一个交互式界面，它将询问你想要合并哪些提交。你`pick`(拣选)最近的提交然后`squash`(合并)旧的提交。

![Git squash interactive](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/06/1402946455git-ninja-10.png)

接着你应该提供一个对新提交的说明。这个过程会重写你的提交历史。

![Adding a commit message](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/06/1402946457git-ninja-11.png)

### 8. 储藏没有提交的更改 ###

假设你正在修复一个bug或者添加一个特性，突然你被要求展示一下你的工作成果。你现在的工作还没有完成，不够进行一次提交。这时，`git stash`命令可以用来急救一下。Stash命令跟踪你所有的更改，然后把他们储藏起来以便以后使用。命令如下-

    git stash

可以多次储藏更改，查看储藏列表，你可以运行下面的命令：

    git stash list

![Stash list](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/06/1402946458git-ninja-12.png)

如果你想取消储藏，覆盖当前的更改，你可以通过下面的命令使用储藏：

    git stash apply

在最后的这个截图里，你可以看到每个储藏都有一个标识符，是一个唯一的数字（尽管在这里我们只有一个储藏）。如果你想使用某个储藏，你在apply命令后面加上这个唯一的标识符：

    git stash apply stash@{2}

![After un-stashing changes](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/06/1402946461git-ninja-13.png)

### 9. 检查丢失的提交 ###

尽管`reflog`是一种检查丢失提交的方法，大型的库里却不太实用。这个时候，应该用`fsck`（文件系统检查）命令。

    git fsck --lost-found

![Git fsck results](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/06/1402946463git-ninja-14.png)

这里你可以看到一个丢失的提交。你可以通过`git show [commit_hash]` 查看提交的更改或者通过运行`git merge [commit_hash]`命令进行恢复。

`git fsck`跟`reflog`命令相比有一个优点。假设你删除了一个远程分支，然后clone了这个库。用`fsck`命令你可以找到并且恢复这个删除的远程分支。

### 10. 最佳选择 ###

之前我已经存记下了那些最优雅的Git命令。但是目前为止，`cherry-pick`命令是我最喜欢的Git命令，因为它直白的名字和实用的功能！

最简单的情况下，`cherry-pick`从另一个分支里选出单独的一个提交，然后合并到当前分支。如果你正并行工作在两个或者更多的分支上，你也许会发现一个存在于所有分支上的bug。如果你解决了一个分支上的这个bug，你可以拣选这个对应的提交应用到其他分支上，而不会弄乱其他文件或者提交。

让我们来考虑一个可以使用这个命令的场景。我有两个分支，我想拣选`b20fd14: Cleaned junk`这个提交到另一个分支上。

![Before cherry pick](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/06/1402946465git-ninja-15.png)

我切换到想要应用这个拣选出来的提交的分支，然后运行下面的命令：

    git cherry-pick [commit_hash]

![After cherry pick](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/06/1402946467git-ninja-16.png)

尽管这次我们很干净的用了`cherry-pick`命令，但你应该知道这个命令经常会引起冲突，所以请小心使用。

### 总结 ###

到了这里，我们结束了这个能使你Git能力提升一个级别的列表。Git是最好的版本控制器，它能完成你能想象到的任何事情。所以，经常试着用Git挑战你自己。一不小心你就会学到很多新东西。

--------------------------------------------------------------------------------

via: http://www.sitepoint.com/10-tips-git-next-level/

译者：[love\_daisy\_love](https://github.com/CNprober) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.sitepoint.com/git-for-beginners/
[2]:http://www.sitepoint.com/getting-started-git-team-environment/
