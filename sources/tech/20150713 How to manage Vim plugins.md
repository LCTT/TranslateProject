XLCYun 翻译中
How to manage Vim plugins
================================================================================
Vim is a versatile, lightweight text editor on Linux. While its initial learning curve can be overwhelming for an average Linux user, its benefits are completely worthy. As far as the functionality goes, Vim is fully customizable by means of plugins. Due to its high level of configuration, though, you need to spend some time with its plugin system to be able to personalize Vim in an effective way. Luckily, we have several tools that make our life with Vim plugins easier. The one I use on a daily basis is Vundle.

### What is Vundle? ###

[Vundle][1], which stands for Vim Bundle, is a Vim plugin manager. Vundle allows you to install, update, search and clean up Vim plugins very easily. It can also manage your runtime and help with tags. In this tutorial, I am going to show how to install and use Vundle.

### Installing Vundle ###

First, [install Git][2] if you don't have it on your Linux system.

Next, create a directory where Vim plugins will be downloaded and installed. By default, this directory is located at ~/.vim/bundle

    $ mkdir -p ~/.vim/bundle 

Now go ahead and install Vundle as follows. Note that Vundle itself is another Vim plugin. Thus we install Vundle under ~/.vim/bundle we created earlier.

    $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim 

### Configuring Vundle ###

Now set up you .vimrc file as follows:

    set nocompatible              " This is required
    filetype off                  " This is required
     
    " Here you set up the runtime path
    set rtp+=~/.vim/bundle/Vundle.vim
     
    " Initialize vundle
    call vundle#begin()
     
    " This should always be the first
    Plugin 'gmarik/Vundle.vim'
     
    " This examples are from https://github.com/gmarik/Vundle.vim README
    Plugin 'tpope/vim-fugitive'
     
    " Plugin from http://vim-scripts.org/vim/scripts.html
    Plugin 'L9'
     
    "Git plugin not hosted on GitHub
    Plugin 'git://git.wincent.com/command-t.git'
     
    "git repos on your local machine (i.e. when working on your own plugin)
    Plugin 'file:///home/gmarik/path/to/plugin'
     
    " The sparkup vim script is in a subdirectory of this repo called vim.
    " Pass the path to set the runtimepath properly.
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
     
    " Avoid a name conflict with L9
    Plugin 'user/L9', {'name': 'newL9'}
     
    "Every Plugin should be before this line
     
    call vundle#end()            " required

Let me explain the above configuration a bit. By default, Vundle downloads and installs Vim plugins from github.com or vim-scripts.org. You can modify the default behavior.

To install from Github:
	
    Plugin 'user/plugin'

To install from http://vim-scripts.org/vim/scripts.html:
	
    Plugin 'plugin_name'

To install from another git repo:
	
    Plugin 'git://git.another_repo.com/plugin'

To install from a local file:

    Plugin 'file:///home/user/path/to/plugin'

Also you can customize others such as the runtime path of you plugins, which is really useful if you are programming a plugin yourself, or just want to load it from another directory that is not ~/.vim.

    Plugin 'rstacruz/sparkup', {'rtp': 'another_vim_path/'}

If you have plugins with the same names, you can rename you plugin so that it doesn't conflict.

    Plugin 'user/plugin', {'name': 'newPlugin'}

### Using Vum Commands ###

Once you have set up you plugins with Vundle, you can use it to to install, update, search and clean unused plugins using several Vundle commands.

#### Installing a new plugin ####

The PluginInstall command will install all plugins listed in your .vimrc file. You can also install just one specific plugin by passing its name.
	
    :PluginInstall
    :PluginInstall <plugin-name>

![](https://farm1.staticflickr.com/559/18998707843_438cd55463_c.jpg)

#### Cleaning up an unused plugin ####

If you have any unused plugin, you can remove it by using the PluginClean command.
	
    :PluginClean

![](https://farm4.staticflickr.com/3814/19433047689_17d9822af6_c.jpg)

#### Searching for a plugin ####

If you want to install a plugin from a plugin list provided, search functionality can be useful.
	
:PluginSearch <text-list>

![](https://farm1.staticflickr.com/541/19593459846_75b003443d_c.jpg)

While searching, you can install, clean, research or reload the same list on the interactive split. Installing plugins won't load your plugins automatically. To do so, add them to you .vimrc file.

### Conclusion ###

Vim is an amazing tool. It can not only be a great default text editor that can make your work flow faster and smoother, but also be turned into an IDE for almost any programming language available. Vundle can be a big help in personalizing the powerful Vim environment quickly and easily.

Note that there are several sites that allow you to find the right Vim plugins for you. Always check [http://www.vim-scripts.org][3], Github or [http://www.vimawesome.com][4] for new scripts or plugins. Also remember to use the help provider for you plugin.

Keep rocking with your favorite text editor!

--------------------------------------------------------------------------------

via: http://xmodulo.com/manage-vim-plugins.html

作者：[Christopher Valerio][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/valerio
[1]:https://github.com/VundleVim/Vundle.vim
[2]:http://ask.xmodulo.com/install-git-linux.html
[3]:http://www.vim-scripts.org/
[4]:http://www.vimawesome.com/
