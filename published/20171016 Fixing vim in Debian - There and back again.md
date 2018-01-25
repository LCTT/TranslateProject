修复 Debian 中的 vim 奇怪行为
======

我一直在想，为什么我服务器上 vim 为什么在鼠标方面表现得如此愚蠢：不能像平时那样跳转、复制、粘贴。尽管在 `/etc/vim/vimrc.local` 中已经设置了。

```
set mouse=
```

最后我终于知道为什么了，多谢 bug [#864074][1] 并且修复了它。

![][2]

原因是，当没有 `~/.vimrc` 的时候，vim 在 `vimrc.local` **之后**加载 `defaults.vim`，从而覆盖了几个设置。

在 `/etc/vim/vimrc` 中有一个注释（虽然我没有看到）解释了这一点：

```
" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1
```

我同意这是在正常安装 vim 后设置 vim 的好方法，但 Debian 包可以做得更好。在错误报告中清楚地说明了这个问题：如果没有 `~/.vimrc`，`/etc/vim/vimrc.local` 中的设置被覆盖。

这在Debian中是违反直觉的 - 而且我也不知道其他包中是否采用类似的方法。

由于 `defaults.vim` 中的设置非常合理，所以我希望使用它，但只修改了一些我不同意的项目，比如鼠标。最后，我在 `/etc/vim/vimrc.local` 中做了以下操作：

```
if filereadable("/usr/share/vim/vim80/defaults.vim")
  source /usr/share/vim/vim80/defaults.vim
endif
" now set the line that the defaults file is not reloaded afterwards!
let g:skip_defaults_vim = 1
 
" turn of mouse
set mouse=
" other override settings go here
```

可能有更好的方式来获得一个不依赖于 vim 版本的通用加载语句, 但现在我对此很满意。

--------------------------------------------------------------------------------

via: https://www.preining.info/blog/2017/10/fixing-vim-in-debian/

作者：[Norbert Preining][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.preining.info/blog/author/norbert/
[1]:https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=864074
[2]:https://www.preining.info/blog/wp-content/uploads/2017/10/fixing-debian-vim.jpg
