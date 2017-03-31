Using vi-mode in your shell
============================================================

> Get an introduction to using vi-mode for line editing at the command line.

 ![Using vi-mode at the command line](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/code_computer_development_programming.png?itok=wMspQJcO "Using vi-mode at the command line") 
>Image by : opensource.com

As a participant in the greater open source community, and more specifically as a member of the [Fedora Project][2], I have the opportunity to meet with many people and talk about all kinds of interesting technical topics. One of my favorites is the "command line," or [shell][3], because learning about how people use the shell proficiently can give you an insight into how they think, what kind of workflows they favor, and to some extent what makes them tick. Many developers and systems operators share their "dot files" (a common slang term for their shell's configuration files) publicly out on the Internet, which leads to an interesting collaboration opportunity that allows everyone to learn tips and tricks from seasoned veterans of the command line as well as share common shortcuts and productivity boosters.

I'll introduce one for you here by showing the shell's vi-mode.

In the large ecosystem of computing and operating systems, there are [many shells][4]. However, in the Linux world, the de facto standard has become [bash][5] and it is the default shell installed on all major Linux distributions at of the time of this writing. As such, that is the shell I'll be talking about today. Something to note, though, is that bash is also a reasonably popular option on other UNIX-style operating systems, so it's likely not far from your reach (and for you Windows users out there, there's always [cygwin][6]).

While exploring the shell, the first thing you do is type commands into it and most often get output, like so:

```
$ echo "Hello World!"
Hello World!
```

This is common practice and is probably something everyone reading this has done. Something that newcomers and novices alike might not realize is that the default input mode for the [bash][7] shell is [Emacs][8], which means that all line-editing functions you will carry out on commands will use ["Emacs-style" keyboard combinations][9]. (For those interested in the nuts and bolts of things, the function of line-editing is actually carried out by [GNU Readline][10].)

For example, if you had typed **echo "Hello Wrld!"** and realized that you wanted to quickly jump back one word (space delimited) to fix that typo without having to hold down your left arrow key then you would hit the **Alt+b** keys together and the cursor would jump backward to the **W**.

```
$ echo "Hello Wrld!"
              ^
        Cursor is here.
```

This was done using only one of the many Emacs keyboard combinations that is offered to the user of the shell. There are many more available for all kinds of things, such as copying text, pasting text, removing text, and using shortcuts to edit text. Using complex keyboard combinations and committing them to memory may seem silly, but they can be extremely powerful when working with longer commands or recalling a command from your shell history yet wanting to edit a couple things before executing the command again.

While Emacs key bindings are all well and good if you're familiar with the Emacs text editor or otherwise find them convenient to use, there are those who are more comfortable using "vi-style" keyboard bindings because of their time spent in the vi text editor (normally via [vim][11] or [nvim][12] these days). The bash shell (again, via GNU Readline) is able to provide this functionality for us. In order to enable it, you run the command **$ ****set**** -o vi**.

Just like magic, you're now in vi-mode and can easily line-edit using vi-style key bindings in order to copy text, remove text, and jump around to different positions in the line of text. This isn't much different in terms of capabilities of Emacs-mode but it's  _how_  you interact with the shell to perform these actions that changes, which is a powerful option pending your specific preference.

Let's take a look at the same example as before, but with the context that as soon as you land in vi-mode in your shell you're in INSERT mode, which means you can type commands just you did before but you can now hit the **Esc** key on your keyboard and you'll be in NORMAL mode, which is where you can navigate around freely and make text modifications.

Looking at the same example as before, if you had typed **echo "Hello Wrld!"** and realized you wanted to jump back one word (again, space delimited) to fix up that typo, then you would hit **Esc** to change from INSERT to NORMAL mode. Then you can type **B** (**Shift+b** for those following along at home), which would move the cursor back much like it did before. (For more information on vi-modes, go [here][13].):

```
$ echo "Hello Wrld!"
              ^
        Cursor is here.
```

Now, for the vi/vim/nvim users out there this is hopefully a fun "ah ha!" moment when you realize the potential of keeping your tried and true keyboard shortcuts close by at all times and not just while your writing things like code or documentation in your editor. If this is all new to you and you want to learn more, then I might suggest taking a trip to this [interactive vim tutorial][14] and see if the vi style of editing text is something you find useful.

If you enjoy interacting with your shell in this mode, you can set that persistently by editing the **~/.bashrc** file in your home directory and adding the following line at the bottom.

**set -o vi**

For the emacs mode users, hopefully this was a quick and fun look into "the other side" of your shell. At the end of the day I think everyone should use whatever editor and shell line-editing mode that makes them most productive and if that's vi-mode and this article was news to you, then congratulations! Now go forth and be productive.

Happy hacking...

--------------------------------------------------------------------------------

作者简介：

Adam Miller is a member of the Fedora Engineering team focusing on Fedora Release Engineering tooling. His work includes next-generation build systems, automation, RPM package maintenance, and infrastructure deployment. Adam has completed his Bachelors of Science in Computer Science and Masters of Science in Information Assurance and Security, both from Sam Houston State University. He is a Red Hat Certified Engineer (Cert# 110-008-810), and an active member of the open source community with a running history of contributions to the Fedora Project (FAS account name: maxamillion).


------------------------
via: https://opensource.com/article/17/3/fun-vi-mode-your-shell

作者：[Adam Miller ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/maxamillion
[1]:https://opensource.com/article/17/3/fun-vi-mode-your-shell?rate=5_eAB9UtByHOiZMysPcewU4Zz6hOrLwdcgIpu2Ub4vo
[2]:https://getfedora.org/
[3]:https://opensource.com/business/16/3/top-linux-shells
[4]:https://opensource.com/business/16/3/top-linux-shells
[5]:https://tiswww.case.edu/php/chet/bash/bashtop.html
[6]:http://cygwin.org/
[7]:https://tiswww.case.edu/php/chet/bash/bashtop.html
[8]:https://www.gnu.org/software/emacs/
[9]:https://en.wikipedia.org/wiki/GNU_Readline#Emacs_keyboard_shortcuts
[10]:http://cnswww.cns.cwru.edu/php/chet/readline/rltop.html
[11]:http://www.vim.org/
[12]:https://neovim.io/
[13]:https://en.wikibooks.org/wiki/Learning_the_vi_Editor/Vim/Modes
[14]:http://www.openvim.com/tutorial.html
[15]:https://opensource.com/user/10726/feed
[16]:https://opensource.com/article/17/3/fun-vi-mode-your-shell#comments
[17]:https://opensource.com/users/maxamillion
