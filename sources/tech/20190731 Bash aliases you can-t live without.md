[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bash aliases you can’t live without)
[#]: via: (https://opensource.com/article/19/7/bash-aliases)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/marcobravohttps://opensource.com/users/samwebstudiohttps://opensource.com/users/greg-phttps://opensource.com/users/greg-p)

Bash aliases you can’t live without
======
Tired of typing the same long commands over and over? Do you feel
inefficient working on the command line? Bash aliases can make a world
of difference.
![bash logo on green background][1]

A Bash alias is a method of supplementing or overriding Bash commands with new ones. Bash aliases make it easy for users to customize their experience in a [POSIX][2] terminal. They are often defined in **$HOME/.bashrc** or **$HOME/bash_aliases** (which must be loaded by **$HOME/.bashrc**).

Most distributions add at least some popular aliases in the default **.bashrc** file of any new user account. These are simple ones to demonstrate the syntax of a Bash alias:


```
alias ls='ls -F'
alias ll='ls -lh'
```

Not all distributions ship with pre-populated aliases, though. If you add aliases manually, then you must load them into your current Bash session:


```
$ source ~/.bashrc
```

Otherwise, you can close your terminal and re-open it so that it reloads its configuration file.

With those aliases defined in your Bash initialization script, you can then type **ll** and get the results of **ls -l**, and when you type **ls** you get, instead of the output of plain old ****[ls][3].

Those aliases are great to have, but they just scratch the surface of what’s possible. Here are the top 10 Bash aliases that, once you try them, you won’t be able to live without.

### Set up first

Before beginning, create a file called **~/.bash_aliases**:


```
$ touch ~/.bash_aliases
```

Then, make sure that this code appears in your **~/.bashrc** file:


```
if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi
```

If you want to try any of the aliases in this article for yourself, enter them into your **.bash_aliases** file, and then load them into your Bash session with the **source ~/.bashrc** command.

### Sort by file size

If you started your computing life with GUI file managers like Nautilus in GNOME, the Finder in MacOS, or Explorer in Windows, then you’re probably used to sorting a list of files by their size. You can do that in a terminal as well, but it’s not exactly succinct.

Add this alias to your configuration on a GNU system:


```
alias lt='ls --human-readable --size -1 -S --classify'
```

This alias replaces **lt** with an **ls** command that displays the size of each item, and then sorts it by size, in a single column, with a notation to indicate the kind of file. Load your new alias, and then try it out:


```
$ source ~/.bashrc
$ lt
total 344K
140K configure*
 44K aclocal.m4
 36K LICENSE
 32K config.status*
 24K Makefile
 24K Makefile.in
 12K config.log
8.0K README.md
4.0K info.slackermedia.Git-portal.json
4.0K git-portal.spec
4.0K flatpak.path.patch
4.0K Makefile.am*
4.0K dot-gitlab.ci.yml
4.0K configure.ac*
   0 autom4te.cache/
   0 share/
   0 bin/
   0 install-sh@
   0 compile@
   0 missing@
   0 COPYING@
```

On MacOS or BSD, the **ls** command doesn’t have the same options, so this alias works instead:


```
alias lt='du -sh * | sort -h'
```

The results of this version are a little different:


```
$ du -sh * | sort -h
0       compile
0       COPYING
0       install-sh
0       missing
4.0K    configure.ac
4.0K    dot-gitlab.ci.yml
4.0K    flatpak.path.patch
4.0K    git-portal.spec
4.0K    info.slackermedia.Git-portal.json
4.0K    Makefile.am
8.0K    README.md
12K     config.log
16K     bin
24K     Makefile
24K     Makefile.in
32K     config.status
36K     LICENSE
44K     aclocal.m4
60K     share
140K    configure
476K    autom4te.cache
```

In fact, even on Linux, that command is useful, because ****using **ls** lists directories and symlinks as being 0 in size, which may not be the information you actually want. It’s your choice.

_Thanks to Brad Alexander for this alias idea._

### View only mounted drives

The **mount** command used to be so simple. With just one command, you could get a list of all the mounted filesystems on your computer, and it was frequently used for an overview of what drives were attached to a workstation. It used to be impressive to see more than three or four entries because most computers don’t have many more USB ports than that, so the results were manageable.

Computers are a little more complicated now, and between LVM, physical drives, network storage, and virtual filesystems, the results of **mount** can be difficult to parse:


```
sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime,seclabel)
proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
devtmpfs on /dev type devtmpfs (rw,nosuid,seclabel,size=8131024k,nr_inodes=2032756,mode=755)
securityfs on /sys/kernel/security type securityfs (rw,nosuid,nodev,noexec,relatime)
[...]
/dev/nvme0n1p2 on /boot type ext4 (rw,relatime,seclabel)
/dev/nvme0n1p1 on /boot/efi type vfat (rw,relatime,fmask=0077,dmask=0077,codepage=437,iocharset=ascii,shortname=winnt,errors=remount-ro)
[...]
gvfsd-fuse on /run/user/100977/gvfs type fuse.gvfsd-fuse (rw,nosuid,nodev,relatime,user_id=100977,group_id=100977)
/dev/sda1 on /run/media/seth/pocket type ext4 (rw,nosuid,nodev,relatime,seclabel,uhelper=udisks2)
/dev/sdc1 on /run/media/seth/trip type ext4 (rw,nosuid,nodev,relatime,seclabel,uhelper=udisks2)
binfmt_misc on /proc/sys/fs/binfmt_misc type binfmt_misc (rw,relatime)
```

To solve that problem, try an alias like this:


```
alias mnt='mount | awk -F' ' '{ printf "%s\t%s\n",$1,$3; }' | column -t | egrep ^/dev/ | sort'
```

This alias uses **awk** to parse the output of **mount** by column, reducing the output to what you probably looking for (what hard drives, and not file systems, are mounted):


```
$ mnt
/dev/mapper/fedora-root  /
/dev/nvme0n1p1           /boot/efi
/dev/nvme0n1p2           /boot
/dev/sda1                /run/media/seth/pocket
/dev/sdc1                /run/media/seth/trip
```

On MacOS, the **mount** command doesn’t provide terribly verbose output, so an alias may be overkill. However, if you prefer a succinct report, try this:


```
alias mnt='mount | grep -E ^/dev | column -t'
```

The results:


```
$ mnt
/dev/disk1s1  on  /                (apfs,  local,  journaled)
/dev/disk1s4  on  /private/var/vm  (apfs,  local,  noexec,     journaled,  noatime,  nobrowse)
```

### Find a command in your grep history

Sometimes you figure out how to do something in the terminal, and promise yourself that you’ll never forget what you’ve just learned. Then an hour goes by, and you’ve completely forgotten what you did.

Searching through your Bash history is something everyone has to do from time to time. If you know exactly what you’re searching for, you can use **Ctrl+R** to do a reverse search through your history, but sometimes you can’t remember the exact command you want to find.

Here’s an alias to make that task a little easier:


```
alias gh='history|grep'
```

Here’s an example of how to use it:


```
$ gh bash
482 cat ~/.bashrc | grep _alias
498 emacs ~/.bashrc
530 emacs ~/.bash_aliases
531 source ~/.bashrc
```

### Sort by modification time

It happens every Monday: You get to work, you sit down at your computer, you open a terminal, and you find you’ve forgotten what you were doing last Friday. What you need is an alias to list the most recently modified files.

You can use the **ls** command to create an alias to help you find where you left off:


```
alias left='ls -t -1'
```

The output is simple, although you can extend it with the --**long** option if you prefer. The alias, as listed, displays this:


```
$ left
demo.jpeg
demo.xcf
design-proposal.md
rejects.txt
brainstorm.txt
query-letter.xml
```

### Count files

If you need to know how many files you have in a directory, the solution is one of the most classic examples of UNIX command construction: You list files with the **ls** command, control its output to be only one column with the **-1** option, and then pipe that output to the **wc** (word count) command to count how many lines of single files there are.

It’s a brilliant demonstration of how the UNIX philosophy allows users to build their own solutions using small system components. This command combination is also a lot to type if you happen to do it several times a day, and it doesn’t exactly work for a directory of directories without using the **-R** option, which introduces new lines to the output and renders the exercise useless.

Instead, this alias makes the process easy:


```
alias count='find . -type f | wc -l'
```

This one counts files, ignoring directories, but _not_ the contents of directories. If you have a project folder containing two directories, each of which contains two files, the alias returns four, because there are four files in the entire project.


```
$ ls
foo   bar
$ count
4
```

### Create a Python virtual environment

Do you code in Python?

Do you code in Python a lot?

If you do, then you know that creating a Python virtual environment requires, at the very least, 53 keystrokes.
That’s 49 too many, but that’s easily circumvented with two new aliases called **ve** and **va**:


```
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
```

Running **ve** creates a new directory, called **venv**, containing the usual virtual environment filesystem for Python3. The **va** alias activates the environment in your current shell:


```
$ cd my-project
$ ve
$ va
(venv) $
```

### Add a copy progress bar

Everybody pokes fun at progress bars because they’re infamously inaccurate. And yet, deep down, we all seem to want them. The UNIX **cp** command has no progress bar, but it does have a **-v** option for verbosity, meaning that it echoes the name of each file being copied to your terminal. That’s a pretty good hack, but it doesn’t work so well when you’re copying one big file and want some indication of how much of the file has yet to be transferred.

The **pv** command provides a progress bar during copy, but it’s not common as a default application. On the other hand, the **rsync** command is included in the default installation of nearly every POSIX system available, and it’s widely recognized as one of the smartest ways to copy files both remotely and locally.

Better yet, it has a built-in progress bar.


```
alias cpv='rsync -ah --info=progress2'
```

Using this alias is the same as using the **cp** command:


```
$ cpv bigfile.flac /run/media/seth/audio/
          3.83M 6%  213.15MB/s    0:00:00 (xfr#4, to-chk=0/4)
```

An interesting side effect of using this command is that **rsync** copies both files and directories without the **-r** flag that **cp** would otherwise require.

### Protect yourself from file removal accidents

You shouldn’t use the **rm** command. The **rm** manual even says so:

> _Warning_: If you use ‘rm’ to remove a file, it is usually possible to recover the contents of that file. If you want more assurance that the contents are truly unrecoverable, consider using ‘shred’.

If you want to remove a file, you should move the file to your Trash, just as you do when using a desktop.

POSIX makes this easy, because the Trash is an accessible, actual location in your filesystem. That location may change, depending on your platform: On a [FreeDesktop][4], the Trash is located at **~/.local/share/Trash**, while on MacOS it’s **~/.Trash**, but either way, it’s just a directory into which you place files that you want out of sight until you’re ready to erase them forever.

This simple alias provides a way to toss files into the Trash bin from your terminal:


```
alias tcn='mv --force -t ~/.local/share/Trash '
```

This alias uses a little-known **mv** flag that enables you to provide the file you want to move as the final argument, ignoring the usual requirement for that file to be listed first. Now you can use your new command to move files and folders to your system Trash:


```
$ ls
foo  bar
$ tcn foo
$ ls
bar
```

Now the file is "gone," but only until you realize in a cold sweat that you still need it. At that point, you can rescue the file from your system Trash; be sure to tip the Bash and **mv** developers on the way out.

**Note:** If you need a more robust **Trash** command with better FreeDesktop compliance, see [Trashy][5].

### Simplify your Git workflow

Everyone has a unique workflow, but there are usually repetitive tasks no matter what. If you work with Git on a regular basis, then there’s probably some sequence you find yourself repeating pretty frequently. Maybe you find yourself going back to the master branch and pulling the latest changes over and over again during the day, or maybe you find yourself creating tags and then pushing them to the remote, or maybe it’s something else entirely.

No matter what Git incantation you’ve grown tired of typing, you may be able to alleviate some pain with a Bash alias. Largely thanks to its ability to pass arguments to hooks, Git has a rich set of introspective commands that save you from having to perform uncanny feats in Bash.

For instance, while you might struggle to locate, in Bash, a project’s top-level directory (which, as far as Bash is concerned, is an entirely arbitrary designation, since the absolute top level to a computer is the root directory), Git knows its top level with a simple query. If you study up on Git hooks, you’ll find yourself able to find out all kinds of information that Bash knows nothing about, but you can leverage that information with a Bash alias.

Here’s an alias to find the top level of a Git project, no matter where in that project you are currently working, and then to change directory to it, change to the master branch, and perform a Git pull:


```
alias startgit='cd `git rev-parse --show-toplevel` &amp;&amp; git checkout master &amp;&amp; git pull'
```

This kind of alias is by no means a universally useful alias, but it demonstrates how a relatively simple alias can eliminate a lot of laborious navigation, commands, and waiting for prompts.

A simpler, and probably more universal, alias returns you to the Git project’s top level. This alias is useful because when you’re working on a project, that project more or less becomes your "temporary home" directory. It should be as simple to go "home" as it is to go to your actual home, and here’s an alias to do it:


```
alias cg='cd `git rev-parse --show-toplevel`'
```

Now the command **cg** takes you to the top of your Git project, no matter how deep into its directory structure you have descended.

### Change directories and view the contents at the same time

It was once (allegedly) proposed by a leading scientist that we could solve many of the planet’s energy problems by harnessing the energy expended by geeks typing **cd** followed by **ls**.
It’s a common pattern, because generally when you change directories, you have the impulse or the need to see what’s around.

But "walking" your computer’s directory tree doesn’t have to be a start-and-stop process.

This one’s cheating, because it’s not an alias at all, but it’s a great excuse to explore Bash functions. While aliases are great for quick substitutions, Bash allows you to add local functions in your **.bashrc** file (or a separate functions file that you load into **.bashrc**, just as you do your aliases file).

To keep things modular, create a new file called **~/.bash_functions** and then have your **.bashrc** load it:


```
if [ -e $HOME/.bash_functions ]; then
    source $HOME/.bash_functions
fi
```

In the functions file, add this code:


```
function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" &amp;&amp; \
    # use your preferred ls command
        ls -F --color=auto
}
```

Load the function into your Bash session and then try it out:


```
$ source ~/.bash_functions
$ cl Documents
foo bar baz
$ pwd
/home/seth/Documents
$ cl ..
Desktop  Documents  Downloads
[...]
$ pwd
/home/seth
```

Functions are much more flexible than aliases, but with that flexibility comes the responsibility for you to ensure that your code makes sense and does what you expect. Aliases are meant to be simple, so keep them easy, but useful. For serious modifications to how Bash behaves, use functions or custom shell scripts saved to a location in your **PATH**.

For the record, there _are_ some clever hacks to implement the **cd** and **ls** sequence as an alias, so if you’re patient enough, then the sky is the limit even using humble aliases.

### Start aliasing and functioning

Customizing your environment is what makes Linux fun, and increasing your efficiency is what makes Linux life-changing. Get started with simple aliases, graduate to functions, and post your must-have aliases in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/bash-aliases

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/marcobravohttps://opensource.com/users/samwebstudiohttps://opensource.com/users/greg-phttps://opensource.com/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://opensource.com/article/19/7/master-ls-command
[4]: https://www.freedesktop.org/wiki/
[5]: https://gitlab.com/trashy/trashy
