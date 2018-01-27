vim 的酷功能：会话！
============================================================

昨天我在编写我的[vimrc][5]的时候了解到一个很酷的 vim 功能！（主要为了添加 fzf 和 ripgrep 插件）。这是一个内置功能，不需要特别的插件。

所以我画了一个漫画。

基本上你可以用下面的命令保存所有你打开的文件和当前的状态

```
:mksession ~/.vim/sessions/foo.vim

```

接着用 `:source ~/.vim/sessions/foo.vim` 或者  `vim -S ~/.vim/sessions/foo.vim` 还原会话。非常酷！

一些 vim 插件给 vim 会话添加了额外的功能：

*   [https://github.com/tpope/vim-obsession][1]
*   [https://github.com/mhinz/vim-startify][2]
*   [https://github.com/xolox/vim-session][3]

这是漫画：

![](https://jvns.ca/images/vimsessions.png)

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2017/09/10/vim-sessions/

作者：[Julia Evans][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca/about
[1]:https://github.com/tpope/vim-obsession
[2]:https://github.com/mhinz/vim-startify
[3]:https://github.com/xolox/vim-session
[4]:https://jvns.ca/categories/vim
[5]:https://github.com/jvns/vimconfig/blob/master/vimrc
