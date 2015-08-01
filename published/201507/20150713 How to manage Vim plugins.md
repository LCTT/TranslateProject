如何管理 Vim 插件
================================================================================

Vim是Linux上一个轻量级的通用文本编辑器。虽然它开始时的学习曲线对于一般的Linux用户来说可能很困难，但比起它的好处，这些付出完全是值得的。vim 可以通过完全可定制的插件来增加越来越多的功能。但是，由于它的功能配置比较难，你需要花一些时间去了解它的插件系统，然后才能够有效地去个性化定置Vim。幸运的是，我们已经有一些工具能够使我们在使用Vim插件时更加轻松。而我日常所使用的就是Vundle。

### 什么是Vundle ###
    
[Vundle][1]意即Vim Bundle，是一个vim插件管理器。Vundle能让你很简单地实现插件的安装、升级、搜索或者清除。它还能管理你的运行环境并且在标签方面提供帮助。在本教程中我们将展示如何安装和使用Vundle。

### 安装Vundle ###
    
首先，如果你的Linux系统上没有Git的话，先[安装Git][2]。
    
接着，创建一个目录，Vim的插件将会被下载并且安装在这个目录上。默认情况下，这个目录为~/.vim/bundle。
    
    $ mkdir -p ~/.vim/bundle 
   
现在，使用如下指令安装Vundle。注意Vundle本身也是一个vim插件。因此我们同样把vundle安装到之前创建的目录~/.vim/bundle下。
    
    $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
    
### 配置Vundle　###
    
现在配置你的.vimrc文件如下：
    
    set nocompatible              " 必需。 
    filetype off                  " 必须。
         
    " 在这里设置你的运行时环境的路径。
    set rtp+=~/.vim/bundle/Vundle.vim
         
    " 初始化vundle
    call vundle#begin()
         
    " 这一行应该永远放在开头。
    Plugin 'gmarik/Vundle.vim'
         
    " 这个示范来自https://github.com/gmarik/Vundle.vim README
    Plugin 'tpope/vim-fugitive'
         
    " 取自http://vim-scripts.org/vim/scripts.html的插件
    Plugin 'L9'
        
    "　该Git插件没有放在GitHub上。
    Plugin 'git://git.wincent.com/command-t.git'
         
    "本地计算机上的Git仓库路径　（例如，当你在开发你自己的插件时）
    Plugin 'file:///home/gmarik/path/to/plugin'
         
    " vim脚本sparkup存放在这个名叫vim的仓库下的一个子目录中。
    " 将这个路径正确地设置为runtimepath。
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
         
    "　避免与L9发生名字上的冲突
    Plugin 'user/L9', {'name': 'newL9'}
         
    "所有的插件都应该在这一行之前。
    call vundle#end()            " 必需。
    
容我简单解释一下上面的设置：默认情况下，Vundle将从github.com或者vim-scripts.org下载和安装vim插件。你也可以改变这个默认行为。
    
要从github安装插件:	

    Plugin 'user/plugin'
    
要从 http://vim-scripts.org/vim/scripts.html 处安装:

    Plugin 'plugin_name'
    
要从另外一个git仓库中安装:
    	
    Plugin 'git://git.another_repo.com/plugin'
   
从本地文件中安装：
    
    Plugin 'file:///home/user/path/to/plugin'
    
你同样可以定制其它东西，例如你的插件的运行时路径，当你自己在编写一个插件时，或者你只是想从其它目录——而不是~/.vim——中加载插件时，这样做就非常有用。
    
    Plugin 'rstacruz/sparkup', {'rtp': 'another_vim_path/'}
    
如果你有同名的插件，你可以重命名你的插件，这样它们就不会发生冲突了。
    
    Plugin 'user/plugin', {'name': 'newPlugin'}
    
### 使用Vum命令 ###

一旦你用vundle设置好你的插件，你就可以通过几个vundle命令来安装、升级、搜索插件，或者清除没有用的插件。
    
#### 安装一个新的插件 ####
    
`PluginInstall`命令将会安装所有列在你的.vimrc文件中的插件。你也可以通过传递一个插件名给它，来安装某个的特定插件。
	
    :PluginInstall
    :PluginInstall <插件名>
    
![](https://farm1.staticflickr.com/559/18998707843_438cd55463_c.jpg)
    
#### 清除没有用的插件 ####
    
如果你有任何没有用到的插件，你可以通过`PluginClean`命令来删除它。	

    :PluginClean
    
![](https://farm4.staticflickr.com/3814/19433047689_17d9822af6_c.jpg)
    
#### 查找一个插件 ####
    
如果你想从提供的插件清单中安装一个插件，搜索功能会很有用。

    :PluginSearch <文本>
    
![](https://farm1.staticflickr.com/541/19593459846_75b003443d_c.jpg)
    
在搜索的时候，你可以在交互式分割窗口中安装、清除、重新搜索或者重新加载插件清单。安装后的插件不会自动加载生效，要使其加载生效，可以将它们添加进你的.vimrc文件中。

### 总结 ###
    
Vim是一个妙不可言的工具。它不单单是一个能够使你的工作更加顺畅高效的默认文本编辑器，同时它还能够摇身一变，成为现存的几乎任何一门编程语言的IDE。
    
注意，有一些网站能帮你找到适合的vim插件。猛击 [http://www.vim-scripts.org][3], Github或者 [http://www.vimawesome.com][4] 获取新的脚本或插件。同时记得使用为你的插件提供的帮助。
    
和你最爱的编辑器一起嗨起来吧!
    
--------------------------------------------------------------------------------
    
via: http://xmodulo.com/manage-vim-plugins.html
    
作者：[Christopher Valerio][a]
译者：[XLCYun(袖里藏云)](https://github.com/XLCYun)
校对：[wxy](https://github.com/wxy)
    
本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出
    
[a]:http://xmodulo.com/author/valerio
[1]:https://github.com/VundleVim/Vundle.vim
[2]:http://ask.xmodulo.com/install-git-linux.html
[3]:http://www.vim-scripts.org/
[4]:http://www.vimawesome.com/
    
