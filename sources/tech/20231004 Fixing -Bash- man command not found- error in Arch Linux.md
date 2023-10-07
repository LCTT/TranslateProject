[#]: subject: "Fixing 'Bash: man command not found' error in Arch Linux"
[#]: via: "https://itsfoss.com/man-command-not-found/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fixing 'Bash: man command not found' error in Arch Linux
======

After years, I have been experimenting with Arch Linux again. I had forgotten the [usage of the pacman command][1] so I tried accessing its man page.

What happened next shocked me (yeah! I have been reading BuzzFeed 😜). It showed me this error:

**bash: man: command not found**

And it was not just for pacman but for all commands, of course.

![][2]

It baffled me because I have never been in a situation before where man command was not available to use.

If you find yourself in a similar situation where man command is not found, let me assure you that t **he fix is easy** :

  * Install `man-db` package (to install man pages)
  * Update `mandb` cache (for indexing the man pages for all commands)



Let's see it in a bit more deatil.

### Install man pages in Linux

I never imagined that I would have to install man pages explictely. But [Arch Linux][3] puts you in uncharted territory. Which is good in a way, as you discover things you never encountered before.

**The key here is that the package that installs the man pages is named`man-db`**. That was also a discovery for me.

You can use your distribution's package manager to install it.

[For Arch and Manjaro][4], use:

```

    sudo pacman -S man-db

```

![][5]

For Ubuntu and Debian, use:

```

    sudo apt install man-db

```

For Fedora, use:

```

    sudo dnf install man-db

```

For Red Hat Linux, use:

```

    sudo yum install man-db

```

**You get the gist**. It is also a wise step to build the cache for manpages.

### Build man page cache

To refresh or build the man page cache, run the [mandb command][6]:

```

    sudo mandb

```

It will look for the manual pages at different locations and build the cache so that you can access the man pages quickly.

![][7]

Once that is done, I was able to use the man command as usual.

### Conclusion

This did come as shock to me because I always thought that manpages were a core part of Linux. Never imagined that I would have to install them explicitely.

Should I add it to the [list of things to do after installing Arch Linux][8]? Not sure.

Perhaps I am one of the rare few users who encountered this missing man command issue in Arch. Perhaps not. Do let me know in the comments if you ever encounted such an 'unexepected error'.

--------------------------------------------------------------------------------

via: https://itsfoss.com/man-command-not-found/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/pacman-command/
[2]: https://itsfoss.com/content/images/2023/10/bash-man-command-not-found-error.png
[3]: https://archlinux.org/
[4]: https://itsfoss.com/manjaro-vs-arch-linux/
[5]: https://itsfoss.com/content/images/2023/10/installing-man-command-arch-linux.png
[6]: https://www.man7.org/linux/man-pages/man8/mandb.8.html
[7]: https://itsfoss.com/content/images/2023/10/updating-man-command-database-linux.png
[8]: https://itsfoss.com/things-to-do-after-installing-arch-linux/
