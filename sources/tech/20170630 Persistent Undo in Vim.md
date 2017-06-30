erlinux is translating

about a 2 minute

*This post presents a chapter from my upcoming bookMastering Vim Quickly: From WTF to OMG in no time*

As you already saw in the chapter on Undo/redo, Vim is pretty powerful when it comes to these features. However, there’s one more feature which I didn’t mention, as it takes a bit of configuration.

In Vim, like in every other text editor, you can perform undo/redo in your current session. Once the session is closed, and you reopen the same file, running undo will do nothing – as you will be already at the oldest change.

**Vim supports persistent undo, which means that you can run undo/redo even from your previous sessions.**

This is great feature indeed. This way you can go back historically through changes of any of your files.

**How this works? **Vim creates hidden file where it stores the undo history, for every file you edit. Now, configuration is very simple. You could add only this line to your `.vimrc`:

`set undofile " Maintain undo history between sessions`

and it would work.

However, Vim will write undo history files in the same directory as the file you edit. Overtime, this will become messy. You don’t want that. That’s why, I recommend you complete the next two steps as well.

First, create a dedicated directory for these undo history files, by running a command like:

`$ mkdir ~/.vim/undodir`

My assumption is that `~/.vim` is your Vim directory, where your `.vimrc`, among others, is located.

Then, once you have created the directory, you need to add only one more line to your `.vimrc` file:

`set undodir=~/.vim/undodir`

That’s all. Vim will store all the undo history files in that directory, and you’ll have persistent undo working flawlessly.

------

 via: [https://jovicailic.org/2017/04/vim-persistent-undo/](https://jovicailic.org/2017/04/vim-persistent-undo/)

作者：JOLE 译者：[erlinux](https://github.com/erlinux/) 校对：[校对者ID](https://github.com/%E6%A0%A1%E5%AF%B9%E8%80%85ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出
