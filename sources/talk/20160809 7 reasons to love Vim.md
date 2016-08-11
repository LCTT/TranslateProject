7 reasons to love Vim
====================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/BUS_OpenSourceExperience_520x292_cm.png?itok=APna2N9Y)

When I started using the vi text editor, I hated it. I thought it was the most painful and counter-intuitive editor ever designed. But I'd decided I had to learn the thing, because if you're using Unix, vi was everywhere and was the only editor you were guaranteed to have access to. That was back in 1998, but it remains true today—vi is available, usually as part of the base install, on almost every Linux distribution in existence.

It took about a month before I could do anything with any proficiency in vi and I still didn't love it, but by then I'd realized that there was an insanely powerful editor hiding behind this bizarre facade. So I stuck with it, and eventually found out that once you know what you're doing, it's an incredibly fast editor.

The name "vi" is short for "visual." When vi originated, line editing was the norm and being able to display and edit multiple lines at once was unusual. Vim, a contraction of "Vi IMproved" and originally released by Bram Moolenaar in 1991, has become the dominant vi clone and continued to extend the capabilities of an already powerful editor. Vim's powerful regex and ":" command-line syntax started in the world of line editing and teletypes.

Vim, with its 40 years of history, has had time to develop a massive and complex bag of tricks that even the most knowledgeable users don't fully grasp. Here are a few reasons to love Vim:

1. Colour schemes: You probably know Vim has colour syntax highlighting. Did you know you can download literally hundreds of colour schemes? [Find some of the better ones here][1].
2. You never need to take your hands off the keyboard or reach for the mouse.
3. Vi or Vim is everywhere. Even [OpenWRT][2] has vi (okay, it's [BusyBox][3], but it works).
4. Vimscript: You've probably remapped a few keys, but did you know that Vim has its own programming language? You can rewrite the behaviour of your editor, or create language-specific editor extensions. (Recently I've spent time customizing Vim's behaviour with Ansible.) The best entry point to the language is Steve Losh's brilliant [Learn Vimscript the Hard Way][4].
5. Vim has plugins. Use [Vundle][5] (my choice) or [Pathogen][6] to manage your plugins to improve Vim's capabilities.
6. Plugins to integrate git (or your VCS of choice) into Vim are available.
7. The online community is huge and active, and if you ask your question about Vim online, it will be answered.

The irony of my original hatred of vi is that I'd been bouncing from editor to editor for five years, always looking for "something better." I never hated any editor as much as I hated vi, and now I've stuck with it for 17 years because I can no longer imagine a better editor. Well, maybe a little better: Go try Neovim—it's the future. It looks like Bram Moolenaar will be merging most of Neovim into Vim version 8, which will mean a 30% reduction in the code base, better tab completion, real async, built-in terminal, built-in mouse support, and complete compatibility.

In his [LinuxCon talk][7] in Toronto, Giles will explain some of the features you may have missed in the welter of extensions and improvements added in the past four decades. The class isn't for beginners, so if you don't know why "hjklia:wq" are important, this probably isn't the talk for you. He'll also cover a bit about the history of vi, because knowing some history helps to understand how we've ended up where we are now. Attend his talk to find out how to make your favourite editor better and faster.




--------------------------------------------------------------------------------

via: https://opensource.com/business/16/8/7-reasons-love-vim

作者：[Giles Orr][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gilesorr
[1]: http://www.gilesorr.com/blog/vim-colours.html
[2]: https://www.openwrt.org/
[3]: https://busybox.net/
[4]: http://learnvimscriptthehardway.stevelosh.com/
[5]: https://github.com/VundleVim/Vundle.vim
[6]: https://github.com/tpope/vim-pathogen
[7]: http://sched.co/7JWz
