Fixing vim in Debian – There and back again
======
I was wondering for quite some time why on my server vim behaves so stupid with respect to the mouse: Jumping around, copy and paste wasn't possible the usual way. All this despite having
```
 set mouse=
```

in my `/etc/vim/vimrc.local`. Finally I found out why, thanks to bug [#864074][1] and fixed it.

![][2]

The whole mess comes from the fact that, when there is no `~/.vimrc`, vim loads `defaults.vim` **after** ` vimrc.local` and thus overwriting several settings put in there.

There is a comment (I didn't see, though) in `/etc/vim/vimrc` explaining this:
```
" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1
```


I agree that this is a good way to setup vim on a normal installation of Vim, but the Debian package could do better. The problem is laid out clearly in the bug report: If there is no `~/.vimrc`, settings in `/etc/vim/vimrc.local` are overwritten.

This is as counterintuitive as it can be in Debian - and I don't know any other package that does it in a similar way.

Since the settings in `defaults.vim` are quite reasonable, I want to have them, but only fix a few of the items I disagree with, like the mouse. At the end what I did is the following in my `/etc/vim/vimrc.local`:
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


There is probably a better way to get a generic load statement that does not depend on the Vim version, but for now I am fine with that.

--------------------------------------------------------------------------------

via: https://www.preining.info/blog/2017/10/fixing-vim-in-debian/

作者：[Norbert Preining][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.preining.info/blog/author/norbert/
[1]:https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=864074
[2]:https://www.preining.info/blog/wp-content/uploads/2017/10/fixing-debian-vim.jpg
