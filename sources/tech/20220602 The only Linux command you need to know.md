[#]: subject: "The only Linux command you need to know"
[#]: via: "https://opensource.com/article/22/6/linux-cheat-command"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "Donkey"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

The only Linux command you need to know
======
The Linux cheat command is a utility to search for and display a list of example tasks you might do with a command.

![Command line prompt][1]

Image by: Opensource.com

Information about Linux and open source abounds on the internet, but when you're entrenched in your work there's often a need for quick documentation. Since the early days of Unix, well before Linux even existed, there's been the `man` (short for "manual") and `info` commands, both of which display official project documentation about commands, configuration files, system calls, and more.

There's a debate over whether `man` and `info` pages are meant as helpful reminders for users who already know how to use a tool, or an intro for first time users. Either way, both `man` and `info` pages describe tools and how to use them, and rarely address specific tasks and how to accomplish them. It's for that very reason that the `cheat` command was developed.

For instance, suppose you can't remember how to [unarchive a tar file][2]. The `man` page provides you with all the options you require, but it leaves it up to you to translate this information into a functional command:

```
tar -A [OPTIONS] ARCHIVE ARCHIVE
tar -c [-f ARCHIVE] [OPTIONS] [FILE...]
tar -d [-f ARCHIVE] [OPTIONS] [FILE...]
tar -t [-f ARCHIVE] [OPTIONS] [MEMBER...]
tar -r [-f ARCHIVE] [OPTIONS] [FILE...]
tar -u [-f ARCHIVE] [OPTIONS] [FILE...]
tar -x [-f ARCHIVE] [OPTIONS] [MEMBER...]
```

That's exactly what some users need, but it confounds other users. The cheat sheet for tar, by contrast, provides complete common commands:

```
$ cheat tar

# To extract an uncompressed archive:
tar -xvf /path/to/foo.tar

# To extract a .tar in specified Directory:
tar -xvf /path/to/foo.tar -C /path/to/destination/

# To create an uncompressed archive:
tar -cvf /path/to/foo.tar /path/to/foo/

# To extract a .tgz or .tar.gz archive:
tar -xzvf /path/to/foo.tgz
tar -xzvf /path/to/foo.tar.gz
[...]
```

It's exactly what you need, when you need it.

### The Linux cheat command

The `cheat` command is a utility to search for and display a list of example tasks you might do with a Linux command. As with many Unix commands, there are different implementations of the same concept, including one [written in Go][3] and one, which I help maintain, [written in just 100 lines of Bash][4].

To install the Go version, download [the latest release][5] and put it somewhere in [your path][6], such as `~/.local/bin/` or `/usr/local/bin`. To install the Bash version, download the latest release and run the `install-cheat.sh` script:

```
$ sh ./install-cheat.sh
```

Or to configure the installation, use [Autotools][7]:

```
$ aclocal ; autoconf
$ automake --add-missing ; autoreconf
$ ./configure --prefix=$HOME/.local
$ make
$ make install
```

### Get cheat sheets for your Linux terminal

Cheat sheets are just plain text files containing common commands. The main collection of cheat sheets is available at [Github.com/cheat/cheatsheets][8]. The Go version of cheat downloads cheatsheets for you when you first run the command. If you're using the Bash version of cheat, the `--fetch` option downloads cheatsheets for you:

```
$ cheat --fetch
```

As with `man` pages, you can have multiple collections of cheat sheets on your system. The Go version of cheat uses a [YAML][9] config file to define where each collection is located. The Bash version defines the path during the install, and by default downloads the [Github.com/cheat/cheatsheets][10] collection as well as [Opensource.com][11]'s own [Gitlab.com/opensource.com/cheatsheets][12] collection.

### List cheat sheets

To list the cheat sheets on your system, use the `--list` option:

```
$ cheat --list
7z
ab
acl
alias
ansi
ansible
ansible-galaxy
ansible-vault
apk
[...]
```

### View a Linux cheat sheet

Viewing a cheat sheet is as easy as viewing a `man` or `info` page. Just provide the name of the command you need help with:

```
$ cheat alias

# To show a list of your current shell aliases:
alias

# To alias `ls -l` to `ll`:
alias ll='ls -l'
```

By default, the `cheat` command uses your environment's pager. Your pager is set with the `PAGER` [environment variable][13]. You can override that temporarily by redefining the `PAGER` variable before running the `cheat` command:

```
$ PAGER=most cheat less
```

If you just want to [cat][14] the cheat sheet into your terminal without a pager, the Bash version has a `--cat` option for convenience:

```
$ cheat --cat less
```

### It's not actually cheating

The cheat system cuts to the chase. You don't have to piece together clues about how to use a command. You just follow the examples. Of course, for complex commands, it's not a shortcut for a thorough study of the actual documentation, but for quick reference, it's as fast as it gets.

You can even create your own cheat sheet just by placing a file in one of the cheat sheet collections. Good news! Because the projects are open source, you can contribute your personal cheat sheets to the GitHub collection. And more good news! When there's a new Opensource.com [cheat sheet][15] release, we'll include a plain text version from now on so you can add that to your collection.

The command is called `cheat`, but as any Linux user will assure you, it's not actually cheating. It's working smarter, the open source way.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/linux-cheat-command

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[Donkey](https://github.com/Donkey-Hao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/command_line_prompt.png
[2]: https://opensource.com/article/17/7/how-unzip-targz-file
[3]: https://github.com/cheat/cheat
[4]: https://gitlab.com/slackermedia/cheat
[5]: https://github.com/cheat/cheat/releases
[6]: https://opensource.com/article/17/6/set-path-linux
[7]: https://opensource.com/article/19/7/introduction-gnu-autotools
[8]: https://github.com/cheat/cheatsheets
[9]: https://opensource.com/article/21/9/yaml-cheat-sheet
[10]: https://github.com/cheat/cheatsheets
[11]: http://Opensource.com
[12]: https://gitlab.com/opensource.com/cheatsheets
[13]: https://opensource.com/article/19/8/what-are-environment-variables
[14]: https://opensource.com/article/19/2/getting-started-cat-command
[15]: https://opensource.com/downloads
