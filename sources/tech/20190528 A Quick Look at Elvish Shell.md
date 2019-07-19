Translating by name1e5s
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A Quick Look at Elvish Shell)
[#]: via: (https://itsfoss.com/elvish-shell/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

A Quick Look at Elvish Shell
======

Everyone who comes to this site has some knowledge (no matter how slight) of the Bash shell that comes default of so many systems. There have been several attempts to create shells that solve some of the shortcomings of Bash that have appeared over the years. One such shell is Elvish, which we will look at today.

### What is Elvish Shell?

![Pipelines In Elvish][1]

[Elvish][2] is more than just a shell. It is [also][3] “an expressive programming language”. It has a number of interesting features including:

  * Written in Go
  * Built-in file manager, inspired by the [Ranger file manager][4] (`Ctrl + N`)
  * Searchable command history (`Ctrl + R`)
  * History of directories visited (`Ctrl + L`)
  * Powerful pipelines that support structured data, such as lists, maps, and functions
  * Includes a “standard set of control structures: conditional control with `if`, loops with `for` and `while`, and exception handling with `try`“
  * Support for [third-party modules via a package manager to extend Elvish][5]
  * Licensed under the BSD 2-Clause license



“Why is it named Elvish?” I hear you shout. Well, according to [their website][6], they chose their current name because:

> In roguelikes, items made by the elves have a reputation of high quality. These are usually called elven items, but “elvish” was chosen because it ends with “sh”, a long tradition of Unix shells. It also rhymes with fish, one of the shells that influenced the philosophy of Elvish.

### How to Install Elvish Shell

Elvish is available in several mainstream distributions.

Note that the software is very young. The most recent version is 0.12. According to the project’s [GitHub page][3]: “Despite its pre-1.0 status, it is already suitable for most daily interactive use.”

![Elvish Control Structures][7]

#### Debian and Ubuntu

Elvish packages were introduced into Debian Buster and Ubuntu 17.10. Unfortunately, those packages are out of date and you will need to use a [PPA][8] to install the latest version. You will need to use the following commands:

```
sudo add-apt-repository ppa:zhsj/elvish
sudo apt update
sudo apt install elvish
```

#### Fedora

Elvish is not available in the main Fedora repos. You will need to add the [FZUG Repository][9] to install Evlish. To do so, you will need to use these commands:

```
sudo dnf config-manager --add-repo=http://repo.fdzh.org/FZUG/FZUG.repol
sudo dnf install elvish
```

#### Arch

Elvish is available in the [Arch User Repository][10].

I believe you know [how to change shell in Linux][11] so after installing you can switch to Elvish to use it.

### Final Thoughts on Elvish Shell

Personally, I have no reason to install Elvish on any of my systems. I can get most of its features by installing a couple of small command line programs or using already installed programs.

For example, the search past commands feature already exists in Bash and it works pretty well. If you want to improve your ability to search past commands, I would recommend installing [fzf][12] instead. Fzf uses fuzzy search, so you don’t need to remember the exact command you are looking for. Fzf also allows you to preview and open files.

I do think that the fact that Elvish is also a programming language is neat, but I’ll stick with Bash shell scripting until Elvish matures a little more.

Have you every used Elvish? Do you think it would be worthwhile to install Elvish? What is your favorite Bash replacement? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][13].

--------------------------------------------------------------------------------

via: https://itsfoss.com/elvish-shell/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/pipelines-in-elvish.png?fit=800%2C421&ssl=1
[2]: https://elv.sh/
[3]: https://github.com/elves/elvish
[4]: https://ranger.github.io/
[5]: https://github.com/elves/awesome-elvish
[6]: https://elv.sh/ref/name.html
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/Elvish-control-structures.png?fit=800%2C425&ssl=1
[8]: https://launchpad.net/%7Ezhsj/+archive/ubuntu/elvish
[9]: https://github.com/FZUG/repo/wiki/Add-FZUG-Repository
[10]: https://aur.archlinux.org/packages/elvish/
[11]: https://linuxhandbook.com/change-shell-linux/
[12]: https://github.com/junegunn/fzf
[13]: http://reddit.com/r/linuxusersgroup
