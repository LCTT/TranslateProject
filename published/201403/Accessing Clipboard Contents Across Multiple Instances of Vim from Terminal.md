跨越终端中多个vim实例访问剪切板内容
================================================================================
**Vim (Vi IMproved)**是一款在程序员之间非常受欢迎的文本编辑器。它在执行不同的快捷命令操作上有它自己的特长。

![从Vim访问剪切板](http://www.tecmint.com/wp-content/uploads/2014/02/vim-clipboard-content.jpeg)

比如，要拷贝高亮的文本，我们使用‘**y**’命令，并用‘x’来剪切。但是，**vim**(不是**gVim**)剪切板的内容默认情况下是不能被其他的vim实例访问的。

Vim版本信息中使用‘**+**’表示启用了系统剪切板。你可以运行‘**vim ­­–version**’，如果你看不到像“**+xterm_clipboard**”而是显示“­**xterm_clipboard**“，那么会使用内部剪切板，其将不能被其它的**vim**实例访问。

### 安装gvim和parcellite ###

为了访问vim剪切板的内容，你需要安装**gvim**包。**gVim**是vim编辑器的GUI模式，它的剪切板选项默认启用。

    # yum install -y gvim

然后，使用[RPMForge 仓库][1]安装**parcellite** 包。Parcellite是一款轻量级，小巧而免费的Linux剪切板管理工具。

    # yum install -y parcellite

一旦安装后，运行下面的命令。这里的参数‘**&**’是使parcellite以后台进程运行。

    # parcellite &

检查选项已经在gvim中启用。

    # gvim --version

确保“**+xterm_clipboard**”选项显示在下面的输出中。

    VIM - Vi IMproved 7.2 (2008 Aug 9, compiled Apr  5 2012 10:12:08)
    Included patches: 1-411
    Modified by <bugzilla@redhat.com>
    Compiled by <bugzilla@redhat.com>
    Huge version with GTK2 GUI.  Features included (+) or not (-):
    +arabic +autocmd +balloon_eval +browse ++builtin_terms +byte_offset +cindent 
    +clientserver +clipboard +cmdline_compl +cmdline_hist +cmdline_info +comments 
    +cryptv +cscope +cursorshape +dialog_con_gui +diff +digraphs +dnd -ebcdic 
    +emacs_tags +eval +ex_extra +extra_search +farsi +file_in_path +find_in_path 
    +float +folding -footer +fork() +gettext -hangul_input +iconv +insert_expand 
    +jumplist +keymap +langmap +libcall +linebreak +lispindent +listcmds +localmap 
    +menu +mksession +modify_fname +mouse +mouseshape +mouse_dec +mouse_gpm 
    -mouse_jsbterm +mouse_netterm -mouse_sysmouse +mouse_xterm +multi_byte 
    +multi_lang -mzscheme +netbeans_intg -osfiletype +path_extra +perl +postscript 
    +printer +profile +python +quickfix +reltime +rightleft -ruby +scrollbind 
    +signs +smartindent -sniff +startuptime +statusline -sun_workshop +syntax 
    +tag_binary +tag_old_static -tag_any_white -tcl +terminfo +termresponse 
    +textobjects +title +toolbar +user_commands +vertsplit +virtualedit +visual 
    +visualextra +viminfo +vreplace +wildignore +wildmenu +windows +writebackup 
    +X11 -xfontset +xim +xsmp_interact +xterm_clipboard -xterm_save

打开用户的.bashrc文件。

    # vim ~/.bashrc

加入别名并保存文件(按下‘**i**’来插入行并按下**ESC**,接着运行**:wq**来保存并退出)。

    # .bashrc

    # User specific aliases and functions

    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'
    alias vim='gvim -v'
    # Source global definitions
    if [ -f /etc/bashrc ]; then
            . /etc/bashrc
    fi

这个alias是内置的用于将一些命令绕到其他命令上。这样每次当vim命令运行时，相应的别名会启动默认带剪切板的gVim。

现在，用类似的方式编辑你的‘**.vimrc**’文件(以防你没有 **.vimrc**文件，生成这样一个文件然后再回来)。

    # vim ~/.vimrc

追加下面这行并保存文件。

    autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xsel -ib")

现在在vim中打开任何文件并高亮部分文本(使用'v'命令)并按下'y'。尝试在vim外面的任何地方粘帖(关不关vim都行)，你就发现vim里面复制的内容被粘帖出来了。

### 附：生成 .vimrc 文件 ###

运行下面的命令来生成**.vimrc**文件（如果你已做了就跳过这部分）。

    # cd   [返回到你的主目录]       
    # vim .vimrc

在vim中在按下ESC键后运行下面的命令（在vim中，每个命令是在按下ESC键后也就是带你进入命令模式后运行的）。

    :r $VIMRUNTIME/vimrc_example.vim 
    :w

--------------------------------------------------------------------------------

via: http://www.tecmint.com/accessing-clipboard-contents-across-multiple-instances-of-vim-from-terminal/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/install-and-enable-rpmforge-repository-in-rhel-centos-6-5-4/
