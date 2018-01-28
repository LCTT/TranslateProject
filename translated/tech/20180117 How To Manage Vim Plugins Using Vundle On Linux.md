如何在 Linux 上使用 Vundle 管理 Vim 插件
======
![](https://www.ostechnix.com/wp-content/uploads/2018/01/Vundle-4-720x340.png)

毋庸置疑，**Vim** 是一款强大的文本文件处理的通用工具，能够管理系统配置文件，编写代码。通过插件，vim 可以被拓展出不同层次的功能。通常，所有的插件和附属的配置文件都会存放在 **~/.vim** 目录中。由于所有的插件文件都被存储在同一个目录下，所以当你安装更多插件时，不同的插件文件之间相互混淆。因而，跟踪和管理它们将是一个恐怖的任务。然而，这正是 Vundle 所能处理的。Vundle，分别是 **V** im 和 B **undle** 的缩写，它是一款能够管理 Vim 插件的极其实用的工具。

Vundle 为每一个你安装和存储的拓展配置文件创建各自独立的目录树。因此，相互之间没有混淆的文件。简言之，Vundle 允许你安装新的插件、配置已存在的插件、更新插件配置、搜索安装插件和清理不使用的插件。所有的操作都可以在单一按键的交互模式下完成。在这个简易的教程中，让我告诉你如何安装 Vundle，如何在 GNU/Linux 中使用它来管理 Vim 插件。

### Vundle 安装

如果你需要 Vundle，那我就当作你的系统中，已将安装好了 **vim**。如果没有，安装 vim，尽情 **git**（下载 vundle）去吧。在大部分 GNU/Linux 发行版中的官方仓库中都可以获取到这两个包。比如，在 Debian 系列系统中，你可以使用下面的命令安装这两个包。

```
sudo apt-get install vim git
```

**下载 Vundle**

复制 Vundle 的 GitHub 仓库地址:
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

**配置 Vundle**

创建 **~/.vimrc** 文件，通知 vim 使用新的插件管理器。这个文件获得有安装、更新、配置和移除插件的权限。

```
vim ~/.vimrc
```

在此文件顶部，加入如下若干行内容：
```
set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList - lists configured plugins
" :PluginInstall - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
```

被标记的行中，是 Vundle 的请求项。其余行仅是一些例子。如果你不想安装那些特定的插件，可以移除它们。一旦你安装过，键入 **:wq** 保存退出。

最后，打开 vim
```
vim
```

然后键入下列命令安装插件。
```
:PluginInstall
```

[![][1]][2]

将会弹出一个新的分窗口，.vimrc 中陈列的项目都会自动安装。

[![][1]][3]

安装完毕之后，键入下列命令，可以删除高速缓存区缓存并关闭窗口。
```
:bdelete
```

在终端上使用下面命令，规避使用 vim 安装插件
```
vim +PluginInstall +qall
```

使用 [**fish shell**][4] 的朋友，添加下面这行到你的 **.vimrc** 文件中。

```
set shell=/bin/bash
```

### 使用 Vundle 管理 Vim 插件

**添加新的插件**

首先，使用下面的命令搜索可以使用的插件。
```
:PluginSearch
```

命令之后添加 **"! "**，刷新 vimscripts 网站内容到本地。
```
:PluginSearch!
```

一个陈列可用插件列表的新分窗口将会被弹出。

[![][1]][5]

你还可以通过直接指定插件名的方式，缩小搜索范围。
```
:PluginSearch vim
```

这样将会列出包含关键词“vim”的插件。

当然你也可以指定确切的插件名，比如：
```
:PluginSearch vim-dasm
```

移动焦点到正确的一行上，点击 **" i"** 来安装插件。现在，被选择的插件将会被安装。

[![][1]][6]

在你的系统中，所有想要的的插件都以类似的方式安装。一旦安装成功，使用下列命令删除 Vundle 缓存：
```
:bdelete
```

现在，插件已经安装完成。在 .vimrc 文件中添加安装好的插件名，让插件正确加载。

这样做：
```
:e ~/.vimrc
```

添加这一行：
```
[...]
Plugin 'vim-dasm'
[...]
```

用自己的插件名替换 vim-dasm。然后，敲击 ESC，键入 **:wq** 保存退出。

请注意，所有插件都必须在 .vimrc 文件中追加如下内容。
```
[...]
filetype plugin indent on
```

**列出已安装的插件**

键入下面命令列出所有已安装的插件：
```
:PluginList
```

[![][1]][7]

**更新插件**

键入下列命令更新插件：
```
:PluginUpdate
```

键入下列命令重新安装所有插件
```
:PluginInstall!
```

**卸载插件**

首先，列出所有已安装的插件：
```
:PluginList
```

之后将焦点置于正确的一行上，敲 **" SHITF+d"** 组合键。

[![][1]][8]

然后编辑你的 .vimrc 文件：
```
:e ~/.vimrc
```

再然后删除插件入口。最后，键入 **:wq** 保存退出。

或者，你可以通过移除插件所在 .vimrc 文件行，并且执行下列命令，卸载插件：
```
:PluginClean
```

这个命令将会移除所有不在你的 .vimrc 文件中但是存在于 bundle 目录中的插件。

你应该已经掌握了 Vundle 管理插件的基本方法了。在 vim 中使用下列命令，查询帮助文档，获取更多细节。
```
:h vundle
```

**捎带看看：**

现在我已经把所有内容都告诉你了。很快，我就会出下一篇教程。保持关注 OSTechNix！

干杯！

**来源：**

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/manage-vim-plugins-using-vundle-linux/

作者：[SK][a]
译者：[CYLeft](https://github.com/CYLeft)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/01/Vundle-1.png ()
[3]:http://www.ostechnix.com/wp-content/uploads/2018/01/Vundle-2.png ()
[4]:https://www.ostechnix.com/install-fish-friendly-interactive-shell-linux/
[5]:http://www.ostechnix.com/wp-content/uploads/2018/01/Vundle-3.png ()
[6]:http://www.ostechnix.com/wp-content/uploads/2018/01/Vundle-4-2.png ()
[7]:http://www.ostechnix.com/wp-content/uploads/2018/01/Vundle-5-1.png ()
[8]:http://www.ostechnix.com/wp-content/uploads/2018/01/Vundle-6.png ()
