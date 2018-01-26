translated by cyleft

How To Manage Vim Plugins Using Vundle On Linux
======
![](https://www.ostechnix.com/wp-content/uploads/2018/01/Vundle-4-720x340.png)

**Vim** , undoubtedly, is one of the powerful and versatile tool to manipulate text files, manage the system configuration files and writing code. The functionality of Vim can be extended to different levels using plugins. Usually, all plugins and additional configuration files will be stored in **~/.vim** directory. Since all plugin files are stored in a single directory, the files from different plugins are mixed up together as you install more plugins. Hence, it is going to be a daunting task to track and manage all of them. This is where Vundle comes in help. Vundle, acronym of **V** im B **undle** , is an extremely useful plug-in to manage Vim plugins.

Vundle creates a separate directory tree for each plugin you install and stores the additional configuration files in the respective plugin directory. Therefore, there is no mix up files with one another. In a nutshell, Vundle allows you to install new plugins, configure existing plugins, update configured plugins, search for installed plugins and clean up unused plugins. All actions can be done in a single keypress with interactive mode. In this brief tutorial, let me show you how to install Vundle and how to manage Vim plugins using Vundle in GNU/Linux.

### Installing Vundle

If you need Vundle, I assume you have already installed **vim** on your system. If not, install vim and **git** (to download vundle). Both packages are available in the official repositories of most GNU/Linux distributions.For instance, you can use the following command to install these packages on Debian based systems.
```
sudo apt-get install vim git
```

**Download Vundle**

Clone Vundle GitHub repository:
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

**Configure Vundle**

To tell vim to use the new plugin manager, we need to create **~/.vimrc** file. This file is required to install, update, configure and remove plugins.
```
vim ~/.vimrc
```

Put the following lines on the top of this file:
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

The lines which are marked as "required" are Vundle's requirement. The rest of the lines are just examples. You can remove those lines if you don't want to install that specified plugins. Once you finished, type **:wq** to save and close file.

Finally, open vim:
```
vim
```

And type the following to install the plugins.
```
:PluginInstall
```

[![][1]][2]

A new split window will open and all the plugins which we added in the .vimrc file will be installed automatically.

[![][1]][3]

When the installation is completed, you can delete the buffer cache and close the split window by typing the following command:
```
:bdelete
```

You can also install the plugins without opening vim using the following command from the Terminal:
```
vim +PluginInstall +qall
```

For those using the [**fish shell**][4], add the following line to your **.vimrc** file.``
```
set shell=/bin/bash
```

### Manage Vim Plugins Using Vundle

**Add New Plugins**

First, search for the available plugins using command:
```
:PluginSearch
```

To refresh the local list from the from the vimscripts site, add **"! "** at the end.
```
:PluginSearch!
```

A new split window will open list all available plugins.

[![][1]][5]

You can also narrow down your search by using directly specifying the name of the plugin like below.
```
:PluginSearch vim
```

This will list the plugin(s) that contains the words "vim"

You can, of course, specify the exact plugin name like below.
```
:PluginSearch vim-dasm
```

To install a plugin, move the cursor to the correct line and hit **" i"**. Now, the selected plugin will be installed.

[![][1]][6]

Similarly, install all plugins you wanted to have in your system. Once installed, delete the Vundle buffer cache using command:
```
:bdelete
```

Now the plugin is installed. To make it autoload correctly, we need to add the installed plugin name to .vimrc file.

To do so, type:
```
:e ~/.vimrc
```

Add the following line.
```
[...]
Plugin 'vim-dasm'
[...]
```

Replace vim-dasm with your plugin name. Then, hit ESC key and type **:wq** to save the changes and close the file.

Please note that all of your Plugins must be added before the following line in your .vimrc file.
```
[...]
filetype plugin indent on
```

**List installed Plugins**

To list installed plugins, type the following from the vim editor:
```
:PluginList
```

[![][1]][7]

**Update plugins**

To update the all installed plugins, type:
```
:PluginUpdate
```

To reinstall all plugins, type:
```
:PluginInstall!
```

**Uninstall plugins**

First, list out all installed plugins:
```
:PluginList
```

Then place the cursor to the correct line, and press **" SHITF+d"**.

[![][1]][8]

Then, edit your .vimrc file:
```
:e ~/.vimrc
```

And delete the Plugin entry. Finally, type **:wq** to save the changes and exit from vim editor.

Alternatively, you can uninstall a plugin by removing its line from .vimrc file and run:
```
:PluginClean
```

This command will remove all plugins which are no longer present in your .vimrc but still present the bundle directory.

At this point, you should have learned the basic usage about managing plugins using Vundle. For details, refer the help section by typing the following in your vim editor.
```
:h vundle
```

**Also Read:**

And, that's all for now. I will be soon here with another useful guide. Until then, stay tuned with OSTechNix!

Cheers!

**Resource:**



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/manage-vim-plugins-using-vundle-linux/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
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
