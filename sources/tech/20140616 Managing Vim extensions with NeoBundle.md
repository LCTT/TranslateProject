[bazz2 hehehe]
Managing Vim extensions with NeoBundle
================================================================================
[NeoBundle][1] is a third-generation extension manager for [Vim][2], building on [Vundle][3], which builds on [Pathogen][4]. In an earlier article, I [advised against using Neobundle][5] because of its rapid development and minimal English documentation. Now, more than a year later, both problems are more manageable.

Why use an extension manager? Vim supports a healthy number of plugins, but its unmodified structure makes administering them difficult because extension files can be spread over several directories. Vim extension managers simplify things. Pathogen, Vundle, and NeoBundle create the directory ~/.vim/bundle, with a separate subdirectory for all the files of each extension. This structure allows users to easily and thoroughly delete extensions, either manually or via a file manager, and helps minimize potential conflicts when you have a couple of dozen extensions.

NeoBundle openly models itself on Vundle. Like Vundle, it both installs and updates extensions. However, the help file openly admits that "Neobundle is not a stable plugin manager. If you want [a] stable plugin manager, you should use Vundle." New releases, the help warns, "may break compatibility" – a comment that is less than reassuring, coming from the developers.

So why should you use NeoBundle? One reason is that Vundle works only with [Git][6], while NeoBundle also supports [Subversion][7] and [Mercurial][8] repositories. Another reason is that, if you want to keep extension updates from breaking your Vim ecosystem, you can lock NeoBundle so that it uses only a specific version of any particular extension.

In addition, NeoBundle's creator, Shougo Matsuishita, is adding its command structures to several other extensions in order to reduce the list of commands they use. Currently, NeoBundle supports three such extensions: [unite.vim][9], a file and buffer manager that works within Vim; [vimshell.vim][10], a scripting shell for Vim; and [vimproc.vim][11], which works within vimshell.vim to allow asynchronous events. That's an idiosyncratic collection, and all three are poorly documented in English, so average users may wish to forgo them. Before tackling any of them, most users should focus on the basics of NeoBundle.

### Installing and initializing NeoBundle ###

NeoBundle requires Vim 7.2.051 or higher and requires git be installed, and depends on [cURL][12] for downloading files. You can install NeoBundle manually, but the fast way to install it is to clone its repository on GitHub using cURL. From your home directory, enter the following command to copy the files for NeoBundle into .vim/bundle/neobundle.vim, where the extension can manage itself:

    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

You also need to modify your .vimrc file. NeoBundle's GitHub page offers a sample .vimrc file, but copying it means installing five plugins you may not want. This is the minimal content that you need:

    if has('vim_starting')
    set nocompatible    
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    call neobundle#end()
    filetype plugin indent on

These lines set up and start NeoBundle, and set NeoBundle to update itself just like any other plugin. NeoBundle defaults to updating itself from GitHub repositories, so if you use GitHub, all you have to do is specify the maintainer's username and the directory for the plugin; in the lines above, NeoBundleFetch needs to specify only "Shougo/neobundle.vim" instead of the complete path on GitHub. If you want to use another site instead, including one that supports Subversion or Mecurial, you need to add the complete URL to the repository.

If you want to install other NeoBundle plugins, use this generic form:

    curl -k https://github.com/[MAINTAINER]/ [PLUGIN PATH] > ~/.vim/bundle/[PLUGIN PATH]

or, to give a more specific example, you can install the [vim-abolish plugin][13], a super-charged search and replace extension, with the command

    curl -k https://github.com/tpope/vim-abolish > ~/.vim/bundle/abolish

To have the extension updated automatically, add a line below the NeoBundleFetch line that gives the path to its repository. For example:

    NeoBundle 'tpope/vim-abolish'

Optionally, you can specify a particular branch or revision of NeoBundle to use, preventing any updates. This option can be useful if you are using extensions that are in rapid development and you want to avoid having them break when you update any other extensions. For instance:

    NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

Another option is to place the directive NeoBundleCheck on a line at the end of the NeoBundle stanza in .vimrc. When this line is present, NeoBundle checks for uninstalled bundles and prompts you to install them. You can also run the utility `:NeoBundleInstall` from within NeoBundle to initialize or update installed extensions.

### NeoBundle utilities ###

Many of NeoBundle's utilities function similarly to Vundle's, but they are differently named. You use the utilities to administer plugins from within NeoBundle:

- Run `:NeoBundleUpdate` when you install or update extensions, and when you manually remove an extension's files. It can be followed by a specific plugin, such as "/Shougo/neobundle.vim," or without a plugin name to configure all plugins that are installed but not configured. The command NeoBundleInstall! provides the same functionality.
- `:NeoBundle {REPOSITORY URI} [[REVISION}] [,OPTIONS}]]` configures an extension while locking it into a specified version, preventing any updates.
- `:NeoBundleList` lists unintialized extensions.
- `:NeoBundleClean` runs an interactive utility for removing unused extensions.

These utilities are also available in slightly different forms when you run NeoBundle with unite.vim. You can learn more about the utilities in all their forms by running the command `:help neobundle`.

    Deciding whether to use NeoBundle

NeoBundle is a powerful tool, but its seemingly permanent state of rapid development can be a blessing or a curse, depending on your preferences. If you want the latest features and extensions, NeoBundle can make Vundle and Pathogen look decidedly old-fashioned.

However, with the online help itself warning of instability, ignoring the possibility of the latest version of one extension interfering with the proper functioning of another would be rash. At the very least, you should specify in your .vimrc a version of NeoBundle that you know to be stable. You might also do the same for any extension that you use regularly. With this precaution, you can enjoy following the development of NeoBundle and its related extensions while avoiding the consequence of working on the bleeding edge.

--------------------------------------------------------------------------------

via: http://www.openlogic.com/wazi/bid/348084/Managing-Vim-extensions-with-NeoBundle

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

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
