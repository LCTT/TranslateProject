教你用NeoBundle管理Vim插件
================================================================================
[NeoBundle][1] 是一个 [Vim][2] 的插件管理器，以 [Vundle][3] 为基础（Vundle 是一个基于 [Pathogen][4] 的 Vim 插件管理器）。在之前的文章中，我[非常不推荐使用 Neobundle][5]，原因是它当时还处于高速开发阶段（LCTT：意味着不稳定、变数大），并且当时它的英文文档很少。现在，已经过了一年多了，这两个问题都早已不再是问题。

我们为什么要使用插件管理器？Vim 支持大量插件，但是由于它没有严格定义框架，插件的文件可以胡乱分布在不同目录下，导致用户管理起来会很困难（LCTT：当然，前提是你有很多插件，还有点小小的强迫症，觉得理一理这些插件心里会舒服点）。而一款插件管理器能让管理变得简单许多。Pathogen, Vundle 和 NeoBundle 的工作就是为不同插件建立一个目录，然后将这些目录扔到 ~/.vim/bundle 目录下。这个文件整理方法可以让你方便彻底地删除插件，使用 'rm -rf <插件目录>' 或直接在文件管理器里面把插件所在的目录删除就可以了，绝对绿色环保无残留。同时，这种方法还能最大程度避免插件与插件之间的不兼容性。

NeoBundle 是一个基于 Vundle 的项目，如同 Vundle，它们都可以安装和升级插件。然而 NeoBundle 的说明文件上明确指出：“NeoBundle 不是一个稳定的插件管理器，如果你想要一个稳定的，请选择 Vundle”。最新的 release-note 上也有警告“可能会造成兼容性问题”——这是一个开发者写的注解，说明这个管理器还不能让人放心使用。

所以，我们为什么要使用 NeoBundle？它都不能保证稳定运行！好吧，它还是有可取之处的。Vundle 只支持 [Git][6] 这种版本控制系统，而 NeoBundle 可以支持 [Subversion][7] 和 [Mercurial][8]。另一个原因是如果你不想插件升级时破坏你的 Vim 生态环境，你可以锁住 NeoBundle，让它只使用某个插件的固定版本。

另外，NeoBundle 创建者，Shougo Matsuishita（LCTT：名字看着像日本人），正在将它的命令接口添加到其他插件项目，以便减少他们的命令使用量。现在 NeoBundle 支持3种插件：[unite.vim][9]，Vim 使用的文件和缓存管理器；[vimshell.vim][10]，Vim 使用的脚本程序；[vimproc.vim][11]，运行于 vimshell.vim 中，用于对异步事件的支持。上面说的都是特殊案例，缺少英文文档，所以用户希望有人能完善它们。在正式使用它们之前，我们需要把注意力先集中在一些基本操作上。

### 安装并初始化 NeoBundle ###

NeoBundle 支持 Vim 7.2.051 或更高版本，需要 git 和 [cURL][12]（用于下载文件）。你可以手动下载 NeoBundle，也可以使用 cURL 下载它在 GitHub 上的库。在你的 home 目录下使用如下命令，可以将 NeoBundle 插件下载到 .vim/bundle/neobundle.vim 目录里，然后 NeoBundle 就能管理它自己了。

    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

你还需要修改 .vimrc 文件。NeoBundle 的 GitHub 主页提供一个 .vimrc 范本，但是直接使用这个范本，NeoBundle 需要你安装5个可能不需要插件。如果不需要它们，你可以使用下面的最小配置：

    if has('vim_starting')
    set nocompatible    
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    call neobundle#end()
    filetype plugin indent on

上述配置的作用是：启动 NeoBundle 并且像其他插件一样升级自己。NeoBundle 默认从 GitHub 下载并升级，如果你正好在使用 GitHub，你只需要为这个插件指定维护者的用户名和路径。在上面的配置中，NeoBundleFetch 只需要指定为“Shougo/neobundle.vim”，而不是完整的 GitHub 路径。如果你想使用其他网站，比如是 Subversion 或 Mecurial 的网站，你就需要添加完整的 URL。

如果你想安装其他插件，你可以使用下面的命令：

    curl -k https://github.com/[项目维护者]/[插件路径] > ~/.vim/bundle/[插件路径]

举个例子：你想安装 [vim-abolish][13]，一个超级 NB 的文本搜索和替换插件，就使用下面的命令：

    curl -k https://github.com/tpope/vim-abolish > ~/.vim/bundle/abolish

如果要让它自动升级，在 NeoBundleFetch 那行下面添加一行：

    NeoBundle 'tpope/vim-abolish'

再介绍一个小技巧：你可以为插件指定一个分支或版本号。什么意思？NeoBundle 只会使用这个插件的某个分支或版本，而忽略其版本更新。如果你使用的某个插件处于高速开发过程，你就可以使用这个技巧，避免用到有 bug 的插件版本。举个例子：

    NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

还有一个技巧：在 .vimtc 文件内添加一行关于“NeoBundleCheck”的属性。NeoBundle 会根据配置检查没安装的插件，并提示你安装它们。你也可以使用命令“:NeoBundleInstall”（LCTT：这是要在 Vim 编辑器的命令模式下输入）来安装或升级插件。

### NeoBundle 用法 ###

很多 NeoBundle 命令用起来和 Vundle 类似，但命令的名字不一样。下面是 NeoBundle 命令的用法：

- `:NeoBundleUpdate`：安装或升级插件，如果你手动把一个插件的目录删除了，这个命令会重新安装这个插件。在这个命令后面加上插件名称，就只升级一个插件；不加参数，会将所有己安装但没被记录在案的插件给记录下来。`:NeoBundleInstall` 命令效果相同。
- `:NeoBundle {REPOSITORY URI} [[REVISION}] [,OPTIONS}]]`：将一个插件锁定到固定版本，防止胡乱升级。
- `:NeoBundleList`：列出所有未初始化的插件。
- `:NeoBundleClean`：进入交互界面，删除插件。

这些命令在配合 unite.vim （LCTT：就是上面举过的32个例子之一）使用时，效果会稍微有些出入。你可以使用“:help neobundle”命令了解更多信息。

### 是否使用 NeoBundle，自己决定 ###

NeoBundle 是强大的工具，正处于高速开发状态。任何处于这种状态的项目，都会被帖上“有前途”和“不稳定”两个标签，看你自己怎么选。如果你想要最新的稳定版本的插件，NeoBundle 能够把 Vundle 和 Pathogen 甩出几条街。

然而在线帮助文档已经给出警告，它不是个稳定的产品，不及时更新版本可能造成一些插件运行出错。最后，你需要在 .vimrc 文件为你的 Neoundle 和其他插件指定一个稳定的版本。记住这警告，然后你可以在使用这些尖端技术产品时游刃有余。

--------------------------------------------------------------------------------

via: http://www.openlogic.com/wazi/bid/348084/Managing-Vim-extensions-with-NeoBundle

译者：[bazz2](https://github.com/bazz2) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://github.com/Shougo/neobundle.vim
[2]:http://olex.openlogic.com/packages/vim
[3]:https://github.com/gmarik/Vundle.vim
[4]:https://github.com/tpope/vim-pathogen
[5]:http://www.openlogic.com/wazi/bid/262302/Three-tools-for-managing-Vim-plugins
[6]:http://olex.openlogic.com/packages/git
[7]:http://olex.openlogic.com/packages/subversion
[8]:http://olex.openlogic.com/packages/mercurial
[9]:https://github.com/Shougo/unite.vim
[10]:https://github.com/Shougo/vimshell.vim/blob/master/doc/vimshell.txt
[11]:https://github.com/Shougo/vimproc.vim/blob/master/doc/vimproc.txt
[12]:http://olex.openlogic.com/packages/curl
[13]:https://github.com/tpope/vim-abolish
