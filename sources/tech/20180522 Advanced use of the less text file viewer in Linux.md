Advanced use of the less text file viewer in Linux
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_terminals_0.png?itok=XwIRERsn)

I recently read Scott Nesbitt's article "[Using less to view text files at the Linux command line][1]" and was inspired to share additional tips and tricks I use with `less`.

### LESS env var

If you have an environment variable `LESS` defined (e.g., in your `.bashrc`), `less` treats it as a list of options, as if passed on the command line.

I use this:
```
LESS='-C -M -I -j 10 -# 4'

```

These mean:

  * `-C` – Make full-screen reprints faster by not scrolling from the bottom.
  * `-M` – Show more information from the last (status) line. You can customize the information shown with `-PM`, but I usually do not bother.
  * `-I` – Ignore letter case (upper/lower) in searches.
  * `-j 10` – Show search results in line 10 of the terminal, instead of the first line. This way you have 10 lines of context each time you press `n` (or `N`) to jump to the next (or previous) match.
  * `-# 4` – Jump four characters to the right or left when pressing the Right or Left arrow key. The default is to jump half of the screen, which I usually find to be too much. Generally speaking, `less` seems to be (at least partially) optimized to the environment it was initially developed in, with slow modems and low-bandwidth internet connections, when it made sense to jump half a screen.



### PAGER env var

Many programs show information using the command set in the `PAGER` environment variable (if it's set). So, you can set `PAGER=less` in your `.bashrc` and have your program run `less`. Check the man page environ(7) (`man 7 environ`) for other such variables.

### -S

`-S` tells `less` to chop long lines instead of wrapping them. I rarely find a need for this unless (and until) I've started viewing a file. Fortunately, you can type all command-line options inside `less` as if they were keyboard commands. So, if I want to chop long lines while I'm already in a file, I can simply type `-S`.

The command-line optiontellsto chop long lines instead of wrapping them. I rarely find a need for this unless (and until) I've started viewing a file. Fortunately, you can type all command-line options insideas if they were keyboard commands. So, if I want to chop long lines while I'm already in a file, I can simply type

Here's an example I use a lot:
```
    su - postgres

    export PAGER=less  # Because I didn't bother editing postgres' .bashrc on all the machines I use it on

    psql

```

Sometimes when I later view the output of a `SELECT` command with a very wide output, I type `-S` so it will be formatted nicely. If it jumps too far when I press the Right arrow to see more (because I didn't set `-#`), I can type `-#8`, then each Right arrow press will move eight characters to the right.

Sometimes after typing `-S` too many times, I exit psql and run it again after entering:
```
export LESS=-S

```

### F

The command `F` makes `less` work like `tail -f`—waiting until more data is added to the file before showing it. One advantage this has over `tail -f` is that highlighting search matches still works. So you can enter `less /var/log/logfile`, search for something—which will highlight all occurrences of it (unless you used `-g`)—and then press `F`. When more data is written to the log, `less` will show it and highlight the new matches.

After you press `F`, you can press `Ctrl+C` to stop it from looking for new data (this will not kill it); go back into the file to see older stuff, search for other things, etc.; and then press `F` again to look at more new data.

### Searching

Searches use the system's regexp library, and this usually means you can use extended regular expressions. In particular, searching for `one|two|three` will find and highlight all occurrences of one, two, or three.

Another pattern I use a lot, especially with wide log lines (e.g., ones that span more than one terminal line), is `.*something.*`, which highlights the entire line. This pattern makes it much easier to see where a line starts and finishes. I also combine these, such as: `.*one thing.*|.*another thing.*`, or `key: .*|.*marker.*` to see the contents of `key` (e.g., in a log file with a dump of some dictionary/hash) and highlight relevant marker lines (so I have a context), or even, if I know the value is surrounded by quotes:
```
key: '[^']*'|.*marker.*

```

`less` maintains a history of your search items and saves them to disk for future invocations. When you press `/` (or `?`), you can go through this history with the Up or Down arrow (as well as do basic line editing).

I stumbled upon what seems to be a very useful feature when skimming through the `less` man page while writing this article: skipping uninteresting lines with `&!pattern`. For example, while looking for something in `/var/log/messages`, I used to iterate through this list of commands:
```
    cat /var/log/messages | egrep -v 'systemd: Started Session' | less

    cat /var/log/messages | egrep -v 'systemd: Started Session|systemd: Starting Session' | less

    cat /var/log/messages | egrep -v 'systemd: Started Session|systemd: Starting Session|User Slice' | less

    cat /var/log/messages | egrep -v 'systemd: Started Session|systemd: Starting Session|User Slice|dbus' | less

    cat /var/log/messages | egrep -v 'systemd: Started Session|systemd: Starting Session|User Slice|dbus|PackageKit Daemon' | less

```

But now I know how to do the same thing within `less`. For example, I can type `&!systemd: Started Session`, then decide I want to get rid of `systemd: Starting Session`, so I add it by typing `&!` and use the Up arrow to get the previous search from the history. Then I type `|systemd: Starting Session` and press `Enter`, continuing to add more items the same way until I filter out enough to see the more interesting stuff.

### =

The command `=` shows more information about the file and location, even more than `-M`. If the file is very long, and calculating `=` takes too long, you can press `Ctrl+C` and it will stop trying.

If the content you're viewing is from a pipe rather than a file, `=` (and `-M`) will not show what it does not know, including the number of lines and bytes in the file. To see that data, if you know that `command` will finish quickly, you can jump to the end with `G`, and then `less` will start showing that information.

If you press `G` and the command writing to the pipe takes longer than expected, you can press `Ctrl+C`, and the command will be killed. Pressing `Ctrl+C` will kill it even if you didn't press `G`, so be careful not to press `Ctrl+C` accidentally if you don't intend to kill it. For this reason, if the command does something (that is, it's not only showing information), it's usually safer to write its output to a file and view the file in a separate terminal, instead of using a pipe.

### Why you need less

`less` is a very powerful program, and contrary to newer contenders in this space, such as `most` and `moar`, you are likely to find it on almost all the systems you use, just like `vi`. So, even if you use GUI viewers or editors, it's worth investing some time going through the `less` man page, at least to get a feeling of what's available. This way, when you need to do something that might be covered by existing functionality, you'll know to search the manual page or the internet to find what you need.

For more information, visit the [less home page][2]. The site has a nice FAQ with more tips and tricks.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/advanced-use-less-text-file-viewer

作者：[Yedidyah Bar David][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/didib
[1]:http://opensource.com/article/18/4/using-less-view-text-files-command-line
[2]:http://www.greenwoodsoftware.com/less/
