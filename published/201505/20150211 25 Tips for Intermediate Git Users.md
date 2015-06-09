25个 Git 进阶技巧
================================================================================
我已经使用git差不多18个月了，觉得自己对它应该已经非常了解。然后来自GitHub的[Scott Chacon][1]过来给LVS做培训（[LVS是一个赌博软件供应商和开发商][2]，从2013年开始的合同），而我在第一天里就学到了很多。

作为一个对git感觉良好的人，我觉得分享从社区里掌握的一些有价值的信息，也许能帮某人解决问题而不用做太深入研究。

### 基本技巧 ###

#### 1. 安装后的第一步 ####

在安装好git后，你第一件该做的事是设置你的名字和电子邮箱，因为每次提交都要用到这些信息：

    $ git config --global user.name "Some One"
    $ git config --global user.email "someone@gmail.com"

#### 2. Git是基于指针的 ####

保存在git里的一切都是文件。当你创建一个提交的时候，会建立一个包含你的提交信息和相关数据（名字，邮件地址，日期/时间，前一个提交，等等）的文件，并把它链接到一个树文件中。这个树文件中包含了对象或其他树的列表。这里的提到的对象（或二进制大对象）是和本次提交相关的实际内容（它也是一个文件，另外，尽管文件名并没有包含在对象里，但是存储在树中）。所有这些文件都使用对象的SHA-1哈希值作为文件名。

用这种方式，分支和标签就是简单的文件（基本上是这样），包含指向该提交的SHA-1哈希值。使用这些索引会带来优秀的灵活性和速度，比如创建一个新分支就是简单地用分支名字和所分出的那个提交的SHA-1索引来创建一个文件。当然，你不需要自己做这些，而只要使用Git命令行工具（或者GUI），但是实际上就是这么简单。

你也许听说过叫HEAD的索引。这只是简单的一个文件，包含了你当前指向的那个提交的SHA-1索引值。如果你正在解决一次合并冲突然后看到了HEAD，这并不是一个特别的分支或分支上的一个必需的特殊位置，只是标明你当前所在位置。

所有的分支指针都保存在.git/refs/heads里，HEAD在.git/HEAD里，而标签保存在.git/refs/tags里 - 自己可以随便进去看看。

#### 3. 两个爸爸（父节点） - 你没看错！ ####

在历史中查看一个合并提交的信息时，你将看到有两个父节点（不同于工作副本上的常规提交的情况）。第一个父节点是你所在的分支，第二个是你合并过来的分支。

#### 4. 合并冲突 ####

目前我相信你碰到过合并冲突并且解决过。通常是编辑一下文件，去掉<<<<，====，>>>>标志，保留需要留下的代码。有时能够看到这两个修改之前的代码会很不错，比如，在这两个现在冲突的分支之前的改动。下面是一种方式：

    $ git diff --merge
    diff --cc dummy.rb  
    index 5175dde,0c65895..4a00477  
    --- a/dummy.rb
    +++ b/dummy.rb
    @@@ -1,5 -1,5 +1,5 @@@
      class MyFoo
        def say
    -     puts "Bonjour"
     -    puts "Hello world"
    ++    puts "Annyong Haseyo"
        end
      end

如果是二进制文件，比较差异就没那么简单了...通常你要做的就是测试这个二进制文件的两个版本来决定保留哪个（或者在二进制文件编辑器里手工复制冲突部分）。从一个特定分支获取文件拷贝（比如说你在合并master和feature123两个分支）：

    $ git checkout master flash/foo.fla # 或者...
    $ git checkout feature132 flash/foo.fla
    $ # 然后...
    $ git add flash/foo.fla

另一种方式是通过git输出文件 - 你可以输出到另外的文件名，然后当你决定了要用哪个后，再将选定的正确文件复制为正常的文件名：

    $ git show master:flash/foo.fla > master-foo.fla
    $ git show feature132:flash/foo.fla > feature132-foo.fla
    $ # 检出master-foo.fla和feature132-foo.fla
    $ # 假如说我们决定来自feature132的文件是正确的
    $ rm flash/foo.fla
    $ mv feature132-foo.fla flash/foo.fla
    $ rm master-foo.fla
    $ git add flash/foo.fla

更新：感谢Carl在原博客文章上评论里的提醒，你实际上可以用“git checkout —ours flash/foo.fla”和“git checkout —theirs flash/foo.fla”来检出特定版本的文件，而不用记住你在合并的分支名字。就我个人来说喜欢更精确一点，但这也是一种方式...

记着在解决完冲突后要将文件加入提交（像我上面做的那样）。

### 服务器，分支和标签 ###

#### 5. 远端服务器 ####

git的一个超强大的功能就是可以有不止一个远端服务器（实际上你一直都在一个本地仓库上工作）。你并不是一定都要有这些服务器的写权限，你可以有多个可以读取的服务器（用来合并他们的工作）然后写入到另外一个仓库。添加一个新的远端服务器很简单：

    $ git remote add john git@github.com:johnsomeone/someproject.git

如果你想查看远端服务器的信息可以这样做：

    # 显示每个远端服务器的URL
    $ git remote -v 
    
    # 提供更多详细信息
    $ git remote show name 

你随时都可以查看本地分支和远端分支的差异：

    $ git diff master..john/master

你也可以查看没有在远端分支上的HEAD的改动：

    $ git log remote/branch..
    # 注意：..后面没有结束的特定引用

#### 6. 标签 ####

在git里有两种类型的标签 - 轻量级标签和带注释标签。记住技巧2里说过git是基于指针的，这两者之间的差异也很简单。轻量级标签只是一个简单的指向一次提交的带名字指针。你随时都可以将它指向另一个提交。带注释标签是一个指向标签对象的带名字指针，带有自己的信息和历史。因为有自己的信息，它可以根据需要用GPG签名。

建立这两种类型的标签都很简单（只有一个命令行开关的差异）

    $ git tag to-be-tested
    $ git tag -a v1.1.0 # 会提示输入标签的信息

#### 7. 建立分支 ####

在git里建立分支非常简单（而且像闪电一样快，因为它只需要创建一个小于100字节的文件）。用普通方式建立新分支并切换过去：

    $ git branch feature132
    $ git checkout feature132

当然，如果你确定自己直接切换到新建的分支，可以用一个命令实现：

    $ git checkout -b feature132

如果你想重命名一个本地分支也很简单（可以显示发生了什么的较长的方式）：

    $ git checkout -b twitter-experiment feature132
    $ git branch -d feature132

更新：你也可以（像Brian Palmer在原博客文章的评论里提出的）只用“git branch”的-m开关在一个命令里实现（像Mike提出的，如果你只指定了一个分支参数，就会重命名当前分支）：

    $ git branch -m twitter-experiment
    $ git branch -m feature132 twitter-experiment

#### 8. 合并分支 ####

也许在将来的某个时候，你希望将改动合并。有两种方式：

    $ git checkout master
    $ git merge feature83 # 或者...
    $ git rebase feature83

merge和rebase之间的差别是merge会尝试处理改动并建立一个新的混合了两者的提交。rebase会尝试把你从一个分支最后一次分离后的所有改动，一个个加到该分支的HEAD上。不过，在已经将分支推到远端服务器后不要再rebase了 - 这会引起冲突/问题。

如果你不确定在哪些分支上还有独有的工作 - 所以你也不知道哪些分支需要合并而哪些可以删除，git branch有两个开关可以帮你：

    # 显示已经全部合并到当前分支的分支
    $ git branch --merged
    
    # 显示没有合并到当前分支的分支
    $ git branch --no-merged

#### 9. 远端分支 ####

如果你在本地有一个分支希望推到远端服务器上，你可以用一行命令推送上去：

    $ git push origin twitter-experiment:refs/heads/twitter-experiment
    # origin是我们服务器的名字，而twitter-experiment是分支名字

更新：感谢Erlend在原博客文章上的评论 - 这个实际上和`git push origin twitter-experiment`效果一样，不过使用完整的语法，你可以在两者之间使用不同的分支名（这样本地分支可以是`add-ssl-support`而远端是`issue-1723`）。

如果你想在远端服务器上删除一个分支（注意分支名前面的冒号）：

    $ git push origin :twitter-experiment

如果你想查看所有远端分支的状态可以这样做：

    $ git remote show origin

这个命令可能会列出服务器上一些以前有过但现在已经不在了的分支。如果碰到这种情况你可以用下面的命令从你本地分支里清理掉：

    $ git remote prune

最后，如果你想在本地跟踪一个远端分支，普通的方式是：

    $ git branch --track myfeature origin/myfeature
    $ git checkout myfeature

不过，新版的git在使用-b标记检出分支时会自动设定跟踪：

    $ git checkout -b myfeature origin/myfeature

### 在储藏点，索引和文件系统中保存内容 ###

#### 10. 储藏 ####

在git里你可以把当前工作状态放进一个储藏堆栈中，然后可以再取出来。最简单的情形是下面这样：

    $ git stash
    # 做点其他事情...
    $ git stash pop

许多人建议使用`git stash apply`来代替pop，不过如果这样做的话最后会遗留一个很长的储藏列表。而“pop”会在全部加载后自动从堆栈中移除。如果使用过`git stash apply`，你也可以使用下面的命令从堆栈上移除最后一项：

    $ git stash drop

git会基于当前的提交信息自动创建评论。如果你更希望有自定义信息的话（因为它可能和前一个提交没有任何联系）：

    $ git stash save "My stash message"

如果你希望从列表中取出一个特定的储藏点（不一定非得是最后一个）可以先列出它们然后用下面的方式取出：

    $ git stash list
      stash@{0}: On master: Changed to German
      stash@{1}: On master: Language is now Italian
    $ git stash apply stash@{1}

#### 11. 交互式添加 ####

在subversion的世界里你只能修改文件然后提交所有改动。而在git里你有强大得多的方式来提交部分文件或者甚至是部分补丁。提交部分文件或文件中的部分改动你需要进入交互式模式：

    $ git add -i
               staged     unstaged path
    
    
    *** Commands ***
      1: status      2: update   3: revert   4: add untracked
      5: patch      6: diff     7: quit     8: help
    What now>  

这会让你进入一个基于菜单的交互式提示。你可以使用命令中的数字或高亮的字母（如果你在终端里打开了高亮的话）来进入相应的模式。然后就只是输入你希望操作的文件的数字了（你可以使用这样的格式，1或者1-4或2,4,7）。

如果你想进入补丁模式（交互式模式下按‘p’或‘5’），你也可以直接进入：

    $ git add -p    
    diff --git a/dummy.rb b/dummy.rb  
    index 4a00477..f856fb0 100644  
    --- a/dummy.rb
    +++ b/dummy.rb
    @@ -1,5 +1,5 @@
     class MyFoo
       def say
    -    puts "Annyong Haseyo"
    +    puts "Guten Tag"
       end
     end
    Stage this hunk [y,n,q,a,d,/,e,?]?  

你可以看到下方会有一些选项供选择用来添加该文件的这个改动、该文件的所有改动，等等。使用‘?’命令可以详细解释这些选项。

#### 12. 从文件系统里保存/取回改动 ####

有些项目（比如Git项目本身）在git文件系统中直接保存额外文件而并没有将它们加入到版本控制中。

让我们从在git中存储一个随机文件开始：

    $ echo "Foo" | git hash-object -w --stdin
    51fc03a9bb365fae74fd2bf66517b30bf48020cb  

这样这个目标文件就已经保存到数据库中了，但是如果你没有设定一个指向它的指针的话它会被当做垃圾回收。最简单的方式是设定一个标签：

    $ git tag myfile 51fc03a9bb365fae74fd2bf66517b30bf48020cb

注意这里我们使用了标签myfile。当我们需要使用这个文件的时候可以这样做：

    $ git cat-file blob myfile

这个对于一些工具文件很有用，开发者可能会用到（密码，GPG密钥，等等）但是又不希望每次都检出到硬盘（尤其是在实际工作中）。

### 日志以及有哪些改动？ ###

#### 13. 查看日志 ####

长时间使用 Git 的话，不会没用过‘git log’来查看最近的提交。不过，有一些技巧来更好地应用。比如，你可以使用下面的命令来查看每次提交的具体改动：

    $ git log -p

或者你可以仅仅查看有哪些文件改动：

    $ git log --stat

有个很不错的别名你可以试试，会显示简短提交名和一个不错的分支图并在一行里显示提交信息（有点像gitk，但是是在命令行下）：

    $ git config --global alias.lol "log --pretty=oneline --abbrev-commit --graph --decorate"
    $ git lol
    * 4d2409a (master) Oops, meant that to be in Korean
    * 169b845 Hello world

#### 14. 搜索日志 ####

如果你想找特定提交者可以这样做：

    $ git log --author=Andy

更新：感谢Johannes的评论，我已经去掉了之前这里的一些有混淆的地方。

或者你想在提交信息里找一些相关字段：

    $ git log --grep="Something in the message"

也有一个更强大的叫做pickaxe的命令用来查找包含了删除或添加的某个特定内容的提交（比如，该内容第一次出现或被删除）。这可以告诉你什么时候增加了一行（但这一行里的某个字符后面被改动过就不行了）：

    $ git log -S "TODO: Check for admin status"

假如你改动了一个特定的文件，比如`lib/foo.rb`

    $ git log lib/foo.rb

比如说你有一个`feature/132`分支和`feature/145`分支，然后你想看看这两个分支上不在master分支里的提交（注意^符号是不在的意思）：

    $ git log feature/132 feature/145 ^master

你也可以使用ActiveSupport格式的日期来缩小到某个日期范围：

    $ git log --since=2.months.ago --until=1.day.ago

默认情况下会用OR来组合查询，但你可以轻易地改为AND（如果你有超过一条的查询标准）

    $ git log --since=2.months.ago --until=1.day.ago --author=andy -S "something" --all-match

#### 15. 查看/修改版本 ####

有很多方式可以用来引用一个版本，看你记得哪个：

    $ git show 12a86bc38 # 根据版本
    $ git show v1.0.1 # 根据标签
    $ git show feature132 # 根据分支名
    $ git show 12a86bc38^ # 一次提交的父节点
    $ git show 12a86bc38~2 # 一次提交的祖父节点
    $ git show feature132@{yesterday} # 时间相关
    $ git show feature132@{2.hours.ago} # 时间相关

注意和之前部分有些不同，末尾的^的意思是该提交的父节点 - 开始位置的^的意思是不在这个分支。

#### 16. 选择范围 ####

最简单的方式：

    $ git log origin/master..new
    # [old]..[new] - 所有你还没有推送的提交

你也可以省略[new]，将使用当前的HEAD。

### 时光回溯和后悔药 ###

#### 17. 重置改动 ####

如果你还没有提交的话可以用下面的命令轻松地取消改动：

    $ git reset HEAD lib/foo.rb

通常会使用‘unstage’的别名，因为上面的看上去有些不直观。

    $ git config --global alias.unstage "reset HEAD"
    $ git unstage lib/foo.rb

如果你已经提交了该文件，你可以做两件事 - 如果是最后一次提交你还可以改正：

    $ git commit --amend

这会取消最后一次提交，把工作分支回退到提交前标记了所有改动的状态，而且提交信息也都准备好可以修改或直接提交。

如果你已经提交过多次而且希望全部回退，你可以将分支重置到合适的位置。

    $ git checkout feature132
    $ git reset --hard HEAD~2

如果你实际上希望将分支指向一个完全不同的SHA1（也许你要将一个分支的HEAD替换到另一个分支，或者之后的某次提交）你可以使用下面的较长的方式：

    $ git checkout FOO
    $ git reset --hard SHA

实际上有一个快速的方式（不需要先把你的工作分支切换到FOO再前进到SHA）：

    $ git update-ref refs/heads/FOO SHA

#### 18. 提交到了错误的分支 ####

好吧，假如说你已经提交到了master，但却应该创建一个叫experimental的主题分支更合适。要移动这些改动，你可以在当前位置创建分支，回退HEAD再检出新分支：

    $ git branch experimental   # 创建一个指向当前master的位置的指针
    $ git reset --hard master~3 # 移动master分支的指针到3个版本之前
    $ git checkout experimental

如果你的改动是在分支的分支的分支上会更复杂。那样你需要做的是将分支基础切换到其他地方：

    $ git branch newtopic STARTPOINT
    $ git rebase oldtopic --onto newtopic

#### 19. 交互式切换基础 ####

这是一个我之前看过展示却没真正理解过的很赞的功能，现在觉得它就很简单了。假如说你提交了3次但是你希望更改顺序或编辑（或者合并）：

    $ git rebase -i master~3

然后这会启动你的编辑器并带有一些指令。你所要做的就是修改这些指令来选择/插入/编辑（或者删除）提交和保存/退出。然后在编辑完后你可以用`git rebase --continue`命令来让每一条指令生效。

如果你有修改，将会切换到你提交时所处的状态，之后你需要使用命令git commit --amend来编辑。

**注意：在rebase的时候千万不要提交 - 只能先添加然后使用参数--continue，--skip或--abort。**

#### 20. 清理 ####

如果你提交了一些内容到你的分支（也许你从SVN导入了一些旧仓库），然后你希望把某个文件从历史记录中全部删掉：

    $ git filter-branch --tree-filter 'rm -f *.class' HEAD

如果你已经推送到origin了，但之后提交了一些垃圾改动，你也可以在推送前在本地系统里这样做：

    $ git filter-branch --tree-filter 'rm -f *.class' origin/master..HEAD

### 其他技巧 ###

#### 21. 你查看过的前一个引用 ####

如果你知道自己之前查看过一个SHA-1，但是随后做了一些重置/回退的操作，你可以使用reflog命令来列出最近查看过的SHA-1记录：

    $ git reflog
    $ git log -g # 和上面一样，但是使用'log'格式输出

#### 22. 分支命名 ####

一个可爱的小技巧 - 别忘了分支名并不限于a-z和0-9。名字中可以用/和.将非常方便用来建立伪命名空间或版本，例如：

    $ # 生成版本132的改动历史
    $ git shortlog release/132 ^release/131
    $ # 贴上v1.0.1的标签
    $ git tag v1.0.1 release/132

#### 23. 找出谁是凶手 ####

通常找出来谁改动了某个文件里的某行代码会很有用。实现这个功能的最简单命令是：

    $ git blame FILE

有时候这些改动来自其他文件（如果你合并了两个文件，或者你移动了某个函数）所以你可以使用下面的命令：

    $ # 显示内容来自哪个文件
    $ git blame -C FILE

有时候通过点击各个改动然后回到很早很早以前来跟踪改动会很不错。有一个很好的内建GUI命令来做这个：

    $ git gui blame FILE

#### 24. 数据维护 ####

通常git不需要经常维护，它把自己照顾的很好。不过，你可以通过下面的命令查看数据统计：

    $ git count-objects -v

如果占用很多空间的话，你可以选择在你的本地仓库做垃圾回收。这不会影响推送或其他人，却会让一些命令运行更快而且减少空间占用：

    $ git gc

经常运行完整性检查也很有意义：

    $ git fsck --full

你也可以在末尾加上`--auto`参数（如果你在服务器上通过crontab经常/每天都运行这个命令的话），然后它只会在必要的时候才执行fsck动作。
 
在检查的时候，看到“dangling”或“unreachable”是正常的，通常这是由回退HEAD或切换基础的结果。而看到“missing”或“sha1 mismatch”就不对了...找专业人士帮忙吧！

#### 25. 恢复遗失的分支 ####

如果你使用-D参数删除了experimental分支，可以用下面的命令重新建立：

    $ git branch experimental SHA1_OF_HASH

如果你最近访问过的话，你通常可以用git reflog来找到SHA1哈希值。

另一种方式是使用`git fsck —lost-found`。其中一个dangling的提交就是丢失的HEAD（它只是已删除分支的HEAD，而HEAD^被引用为当前的HEAD所以它并不处于dangling状态）

### 搞定！ ###

哇，这是我写过的最长的一篇博客，我希望有人能觉得有用。如果你这么觉得，或者你有任何疑问请在评论里留言让我知道...

--------------------------------------------------------------------------------

via: https://www.andyjeffries.co.uk/25-tips-for-intermediate-git-users/

作者：[Andy Jeffries][a]
译者：[zpl1025](https://github.com/zpl1025)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://www.andyjeffries.co.uk/author/andy-jeffries/
[1]:http://gitcasts.com/about
[2]:http://www.lvs.co.uk/
