# 用这样的 VI 配置来保存和组织你的笔记

![1][]

用 vi 来管理 wiki 笔记 , 这听起来不像是一个符合常规的主意 ; 但当你的日常工作都会用到 vi , 那它是有意义的 ；

作为一个软件开发人员 , 用编码工具来写笔记会更加简单 ; 我想将我的笔记变成一种编辑器命令 , 无论我在哪 , 都能够用管理我代码的方法来管理我的笔记 , 这便是我在我知识基础上建立这个 vi 配置的原因 ; 简单概括起来 ，在笔记本上我用 vi 插件 [Viwiki][2] 来管理我的本地百科 ; 用 GIT 来进行版本控制 ( 保持中心节点和更新版本 ) ; 用 Gitlab 来进行在线修改 ( 例如在我的手机上 ) .

## 为什么用百科来进行笔记保存是有意义

我尝试过许多不同的工具来持续的追踪我的笔记 , 笔记里保存着我的灵感以及不应该被忘记的任务模型 . 这包括离线笔记本 ( 是的 , 包含纸质笔记本 ) , 特殊的笔记软件 , 以及思维导图软件 .

但每种方案都有不好一面 , 没有一个能够满足我所有的需求 . 例如思维导图 , 能够很好的形象化你的想法 ( 因此得名 ) . 我尝试提供一些简单的搜索方法 ( 和纸质笔记一样 ) ; 但当一段时间过去 , 思维导图会变得很难阅读 , 所以思维导图不适合长时间保存的笔记 .

我为一个合作项目配置 [DokuWiki][2] , 我发现这个 wiki 模型符合了我大多数的需求 . 在百科上 , 你能够创建一个文件 ( 和你在文本编辑器中所作的一样 ) , 创建一个笔记的链接 . 如果一个链接指向一个不存在的页面 ( 你想让本页面添加一条还没有创建的信息 ) , wiki 会为你建立这个页面 . 这个特性使得 wiki 很好的适应了那些需要快速写下心中所想的人的需求 . 然而笔记页面仍保持在能够容易浏览和搜索关键字的界面 .

这看起来很有希望 , 并且配置 DokuWiki 也很容易 , 但我发现配置整个 wiki 太复杂 , 而仅仅只是为了追踪笔记 . 在一番搜索后 , 我发现了 Vimwiki , 我想要的 vi 插件 . 自从我每天使用 vi , 做笔记和修改代码一样简单 .  创建一个界面 , vimwiki 比 Dokuwiki 简单 . 你只需要在光标下的单词按下 Enter 键 , 如果本地没有文件是这个名字 , vimwiki 会为你创建一个 . 为了更一步的实现用每天都会使用的工具来做笔记的计划 , 我不仅用我最爱的 IDE 来写笔记 , 而且用 GIT - 我最爱的代码管理工具 , Gilab - 发布我的笔记并且在线访问 . 我也在 Gitlab markdown 在线工具上用 markdown 语法来写这篇文章 .

## 配置 vimwiki

用存在的插件管理工具来安装 vimwiki 很简单 , 只需要添加 vimwiki/vimwiki 到你的插件 . 对于我的喜爱的插件管理器 , Vundle , 你只需要在 /.vimrc 中添加  "plugin vimwiki/vimwiki " 这一行 . 然后执行 :source ~/.vimrc | PluginInstall .

下面是我的文件 .vimrc 的一部分 , 展示一些 vimwiki 配置 . 你能在 [vimwiki][2] 页面学到更多的配置和使用的的信息 .

```code
    let wiki_1 = {}
    let wiki_1.path = '~/vimwiki_work_md/'
    let wiki_1.syntax = 'markdown'
    let wiki_1.ext = '.md'

    let wiki_2 = {}
    let wiki_2.path = '~/vimwiki_personal_md/'
    let wiki_2.syntax = 'markdown'
    let wiki_2.ext = '.md'

    let g:vimwiki_list = [wiki_1, wiki_2]
    let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

```

我的配置有一个优点 , 你能简单的区分个人和工作相关的文件 , 而不用切换笔记软件 . 我想能随时随地访问我的个人笔记 , 而不想我的工作笔记同步到我私人的 GitLab 和 电脑 . 这样配置对于 vimwiki 要比其他软件简单 . 这个配置告诉 vimwiki 有两个不同 Wiki , 两个 wiki 都使用 markdown 语法 ( 我用 markdown 语法在每天的工作 ) . 同样的告诉 Vimwiki wiki 页面存储到那个文件夹 .

如果你操作 wiki 页面存储的文件夹 , 你会你的单一的 wiki 的 markdown 页面文件而没有其他特殊的 Vimwiki 内容 , 这使得很容易的初始化 GIT 仓库和同步你的 wiki 到中心仓库 .

## 同步你的 wiki 到 GitLab

这一步检查 GitLab 工程到本地的 VimWiki 文件夹 , 这步操作和你操作任何 GitHub 的仓库相同 . 只是我更喜欢保存我的笔记到我的私人 GitLab 仓库 , 所以我为我个人的工程保持运行 GitLab .

你可以使用 GitLab 的 wiki 功能来为你的工程创建 wiki 页面 . 这些 wiki 是 GIT 仓库本身 , 用 markdown 语法 , 你到主要的地址 .

只需要初始化你想要的笔记 , 那些你为你的笔记所创建的 wiki 工程 :

```codecd ~/vimwiki_personal_md/
    git init
    git remote add origin git@your.gitlab.com:your_user/vimwiki_personal_md.wiki
    git add .
    git commit -m "Initial commit"
    git push -u origin master
```

能够在 GitLab 创建一个新的工程后 , 这些步骤能复制到你导入的界面到新的工程 . 唯一的改变是仓库地址结尾是 .wiki ( 而不是 .git ) . 告诉 git 拷贝 wiki 仓库而不是工程本身 .

就是这样 ! 现在你能够通过 git 来管理你的笔记 , 通过 GitLab wiki 用户接口来修改笔记 .

你可能不想手动的为每个添加到笔记本的笔记创建提交 , 为了解决这个问题 , 我使用 Vim 插件 [chazy/dirsetting][4] , 我添加一个 .vimaddr 文件 , 通过下面的内容 :

```code
    :cd %:p:h
    silent! !git pull > /dev/null
    :e!
    autocmd! BufWritePost * silent! !git add .;git commit -m "vim autocommit" > /dev/null; git push > /dev/null&
```

当我打开 Wiki 文件时会更新到最新的版本 , 没一次的写入命令 ( :w ) 都会提交 ; 这样做会同步你的本地文件到中心仓库 . 如果你有合并冲突 ，通常你需要解决它们 .

目前 , 这就是以我的知识基础来互动的方法 , 我很喜欢这方法 ; 请告诉我你对于这个方法的想法 , 可以在评论区分享你最爱的方法 , 对于如何追踪笔记 .

-----------------------------------------------------

via: https://opensource.com/article/18/6/vimwiki-gitlab-notes

作者：[Manuel Dewald][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[octopus][5]
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出


[1]:https://camo.githubusercontent.com/9901c750dce2008ea7a459201121077c355fc257/68747470733a2f2f6f70656e736f757263652e636f6d2f73697465732f64656661756c742f66696c65732f7374796c65732f696d6167652d66756c6c2d73697a652f7075626c69632f6c6561642d696d616765732f636865636b6c6973745f68616e64735f7465616d5f636f6c6c61626f726174696f6e2e706e673f69746f6b3d753832516570506b
[2]:https://vimwiki.github.io/
[3]:https://www.dokuwiki.org/dokuwiki
[4]:https://github.com/chazy/dirsettings
[5]:https://github.com/singledo