translating---geekpi

Cool vim feature: sessions!
============================================================•

Yesterday I learned about an awesome vim feature while working on my [vimrc][5]! (to add fzf & ripgrep search plugins mainly). It’s a builtin feature, no fancy plugins needed.

So I drew a comic about it.

Basically you can save all your open files and current state with

```
:mksession ~/.vim/sessions/foo.vim

```

and then later restore it with either `:source ~/.vim/sessions/foo.vim` or `vim -S ~/.vim/sessions/foo.vim`. Super cool!

Some vim plugins that add extra features to vim sessions:

*   [https://github.com/tpope/vim-obsession][1]

*   [https://github.com/mhinz/vim-startify][2]

*   [https://github.com/xolox/vim-session][3]

Here’s the comic:

![](https://jvns.ca/images/vimsessions.png)

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2017/09/10/vim-sessions/

作者：[Julia Evans ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca/about
[1]:https://github.com/tpope/vim-obsession
[2]:https://github.com/mhinz/vim-startify
[3]:https://github.com/xolox/vim-session
[4]:https://jvns.ca/categories/vim
[5]:https://github.com/jvns/vimconfig/blob/master/vimrc
