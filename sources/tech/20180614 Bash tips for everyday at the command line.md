Bash tips for everyday at the command line
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_keyboard_code.jpg?itok=YEtvcZOj)

As the default shell for many of the Linux and Unix variants, Bash includes a wide variety of underused features, so it was hard to decide what to discuss. Ultimately, I decided to focus on Bash tips that make day-to-day activities easier.

As a consultant, I see a plurality of diverse environments and work styles. I drew on this experience to narrow the tips to four broad categories: Terminal and line tricks, navigation and files, history, and helpful commands. These categories are completely arbitrary and serve more to organize my own thoughts than as any kind of definitive classification. Many of the tips included here might subjectively fit in more than one category.

Without further ado, here are some of the most helpful Bash tricks I have encountered.

### Working with Bash history

One of the best ways to increase your productivity is to learn to use the Bash history more effectively. With that in mind, perhaps one of the most important tweaks you can make in a multi-user environment is to enable the `histappend` option to your shell. To do that, simply run the following command:
```
shopt -s histappend

```

This allows multiple terminal sessions to write to the history at the same time. In most environments this option is not enabled. That means that histories are often lost if you have more than a single Bash session open (either locally or over SSH).

Another common task is to repeat the last command with `sudo`. For example, suppose you want to create a directory `mkdir /etc/ansible/facts.d`. Unless you are root, this command will fail. From what I have observed, most users hit the `up` arrow, scroll to the beginning of the line, and add the `sudo` command. There is an easier way. Simply run the command like this:
```
sudo !!

```

Bash will run `sudo` and then the entirety of the previous command. Here is exactly what it looks like when run in sequence:
```
[user@centos ~]$ mkdir -p /etc/ansible/facts.d

mkdir: cannot create directory ‘/etc/ansible’: Permission denied



[user@centos ~]$ sudo !!

sudo mkdir -p /etc/ansible/facts.d

```

When the **`!!`** is run, the full command is echoed out to the terminal so you know what was just executed.

Similar but used much less frequently is the **`!*`** shortcut. This tells Bash that you want all of the *arguments* from the previous command to be repeated in the current command. This could be useful for a command that has a lot of arguments you want to reuse. A simple example is creating a bunch of files and then changing the permissions on them:
```
[user@centos tmp]$ touch file1 file2 file3 file4

[user@centos tmp]$ chmod 777 !*

chmod 777 file1 file2 file3 file4

```

It is handy only in a specific set of circumstances, but it may save you some keystrokes.

Speaking of saving keystrokes, let's talk about finding commands in your history. Most users will do something like this:
```
history |grep <some command>

```

However, there is an easier way to search your history. If you press
```
ctrl + r

```

Bash will do a reverse search of your history. As you start typing, results will begin to appear. For example:
```
(reverse-i-search)`hist': shopt -s histappend

```

In the above example, I typed `hist` and it matched the `shopt` command we covered earlier. If you continue pressing `ctrl + r`, Bash will continue to search backward through all of the other matches.

Our last trick isn't a trick as much as a helpful command you can use to count and display the most-used commands in your history.
```
[user@centos tmp]$ history | awk 'BEGIN {FS="[ \t]+|\\|"} {print $3}' | sort | uniq -c | sort -nr | head

81 ssh

50 sudo

46 ls

45 ping

39 cd

29 nvidia-xrun

20 nmap

19 export

```

In this example, you can see that `ssh` is by far the most-used command in my history at the moment.

### Navigation and file naming

`tab` key once to complete the wording for you. This works if there is a single exact match. However, you might not know that if you hit `tab` twice, it will show you all of the matches based on what you have typed. For example:
```
[user@centos tmp]$ cd /lib <tab><tab>

lib/ lib64/

```

You probably already know that if you type a command, filename, or folder name, you can hit thekey once to complete the wording for you. This works if there is a single exact match. However, you might not know that if you hittwice, it will show you all of the matches based on what you have typed. For example:

This can be very useful for file system navigation. Another helpful trick is to enable `cdspell` in your shell. You can do this by issuing the `shopt -s cdspell` command. This will help correct your typos:
```
[user@centos etc]$ cd /tpm

/tmp

[user@centos tmp]$ cd /ect

/etc

```

It's not perfect, but every little bit helps!

Once you have successfully changed directories, what if you need to return to your previous directory? This is not a big deal if you are not very deep into the directory tree. But if you are in a fairly deep path, such as `/var/lib/flatpak/exports/share/applications/`, you could type:
```
cd /va<tab>/lib/fla<tab>/ex<tab>/sh<tab>/app<tab>

```

Fortunately, Bash remembers your previous directory, and you can return there by simply typing `cd -`. Here is what it would look like:
```
[user@centos applications]$ pwd

/var/lib/flatpak/exports/share/applications



[user@centos applications]$ cd /tmp

[user@centos tmp]$ pwd

/tmp



[user@centos tmp]$ cd -

/var/lib/flatpak/exports/share/applications

```

That's all well and good, but what if you have a bunch of directories you want to navigate within easily? Bash has you covered there as well. There is a variable you can set that will help you navigate more effectively. Here is an example:
```
[user@centos applications]$ export CDPATH='~:/var/log:/etc'

[user@centos applications]$ cd hp

/etc/hp



[user@centos hp]$ cd Downloads

/home/user/Downloads



[user@centos Downloads]$ cd ansible

/etc/ansible



[user@centos Downloads]$ cd journal

/var/log/journal

```

In the above example, I set my home directory (indicated with the tilde: `~`), `/var/log` and `/etc`. Anything at the top level of these directories will be auto-filled in when you reference them. Directories that are not at the base of the directories listed in `CDPATH` will not be found. If, for example, the directory you are after was `/etc/ansible/facts.d/` this would not complete by typing `cd facts.d`. This is because while the directory `ansible` is found under `/etc`, `facts.d` is not. Therefore, `CDPATH` is useful for getting to the top of a tree that you access frequently, but it may get cumbersome to manage when you're browsing a large folder structure.

Finally, let's talk about two common use cases that everyone does at some point: Changing a file extension and renaming files. At first glance, this may sound like the same thing, but Bash offers a few different tricks to accomplish these tasks.

While it may be a "down-and-dirty" operation, most users at some point need to create a quick copy of a file they are working on. Most will copy the filename exactly and simply append a file extension like `.old` or `.bak`. There is a quick shortcut for this in Bash. Suppose you have a filename like `spideroak_inotify_db.07pkh3` that you want to keep a copy of. You could type:
```
cp spideroak_inotify_db.07pkh3 spideroak_inotify_db.07pkh3.bak

```

You can make quick work of this by using copy/paste operations, using the tab complete, possibly using one of the shortcuts to repeat an argument, or simply typing the whole thing out. However, the command below should prove even quicker once you get used to typing it:
```
cp spideroak_inotify_db.07pkh3{,.old}

```

This (as you can guess) copies the file by appending the `.old` file extension to the file. That's great, you might say, but I want to rename a large number of files at once. Sure, you could write a for loop to deal with these (and in fact, I often do this for something complicated) but why would you when there is a handy utility called `rename`? There is some difference in the usage of this utility between Debian/Ubuntu and CentOS/Arch. The Debian-based rename uses a SED-like syntax:
```
user@ubuntu-1604:/tmp$ for x in `seq 1 5`; do touch old_text_file_${x}.txt; done



user@ubuntu-1604:/tmp$ ls old_text_file_*

old_text_file_1.txt old_text_file_3.txt old_text_file_5.txt

old_text_file_2.txt old_text_file_4.txt



user@ubuntu-1604:/tmp$ rename 's/old_text_file/shiney_new_doc/' *.txt



user@ubuntu-1604:/tmp$ ls shiney_new_doc_*

shiney_new_doc_1.txt shiney_new_doc_3.txt shiney_new_doc_5.txt

shiney_new_doc_2.txt shiney_new_doc_4.txt

```

On a CentOS or Arch box it would look similar:
```
[user@centos /tmp]$ for x in `seq 1 5`; do touch old_text_file_${x}.txt; done



[user@centos /tmp]$ ls old_text_file_*

old_text_file_1.txt old_text_file_3.txt old_text_file_5.txt

old_text_file_2.txt old_text_file_4.txt



[user@centos tmp]$ rename old_text_file centos_new_doc *.txt



[user@centos tmp]$ ls centos_new_doc_*

centos_new_doc_1.txt centos_new_doc_3.txt centos_new_doc_5.txt

centos_new_doc_2.txt centos_new_doc_4.txt

```

### Bash key bindings

Bash has a lot of built-in keyboard shortcuts. You can find a list of them by typing `bind -p`. I thought it would be useful to highlight several, although some may be well-known.
```
    ctrl + _ (undo)

    ctrl + t (swap two characters)

    ALT + t (swap two words)

    ALT + . (prints last argument from previous command)

    ctrl + x + * (expand glob/star)

    ctrl + arrow (move forward a word)

    ALT + f (move forward a word)

    ALT + b (move backward a word)

    ctrl + x + ctrl + e (opens the command string in an editor so that you can edit it before execution)

    ctrl + e (move cursor to end)

    ctrl + a (move cursor to start)

    ctrl + xx (move to the opposite end of the line)

    ctrl + u (cuts everything before the cursor)

    ctrl + k (cuts everything after the cursor)

    ctrl + y (pastes from the buffer)

    ctrl + l (clears screen)s

```

I won't discuss the more obvious ones. However, some of the most useful shortcuts I have found are the ones that let you delete words (or sections of text) and undo them. Suppose you were going to stop a bunch of services using `systemd`, but you only wanted to start a few of them after some operation has completed. You might do something like this:
```
systemctl stop httpd mariadb nfs smbd

<hit the up button to get the previous command>

<use 'ctrl + w' to remove the unwanted arguments>

```

But what if you removed one too many? No problem—simply use `ctrl + _` to undo the last edit.

The other cut commands allow you to quickly remove everything from the cursor to the end or beginning of the line (using `Ctrl + k` and `Ctrl + u`, respectively). This has the added benefit of placing the cut text into the terminal buffer so you can paste it later on (using `ctrl + y`). These commands are hard to demonstrate here, so I strongly encourage you to try them out on your own.

Last but not least, I'd like to mention a seldom-used key combination that can be extremely handy in confined environments such as containers. If you ever have a command look garbled by previous output, there is a solution: Pressing `ctrl + x + ctrl + e` will open the command in whichever editor is set in the environment variable EDITOR. This will allow you to edit a long or garbled command in a text editor that (potentially) can wrap text. Saving your work and exiting, just as you would when working on a normal file, will execute the command upon leaving the editor.

### Miscellaneous tips

You may find that having colors displayed in your Bash shell can enhance your experience. If you are using a session that does not have colorization enabled, below are a series of commands you can place in your `.bash_profile` to add color to your session. These are fairly straightforward and should not require an in-depth explanation:
```
# enable colors

eval "`dircolors -b`"



# force ls to always use color and type indicators

alias ls='ls -hF --color=auto'



# make the dir command work kinda like in windows (long format)

alias dir='ls --color=auto --format=long'



# make grep highlight results using color

export GREP_OPTIONS='--color=auto'



# Add some colour to LESS/MAN pages

export LESS_TERMCAP_mb=$'\E[01;31m'

export LESS_TERMCAP_md=$'\E[01;33m'

export LESS_TERMCAP_me=$'\E[0m'

export LESS_TERMCAP_se=$'\E[0m'

export LESS_TERMCAP_so=$'\E[01;42;30m'

export LESS_TERMCAP_ue=$'\E[0m'

export LESS_TERMCAP_us=$'\E[01;36m'

```

Along with adjusting the various options within Bash, you can also use some neat tricks to save time. For example, to run two commands back-to-back, regardless of each one's exit status, use the `;` to separate the commands, as seen below:
```
[user@centos /tmp]$ du -hsc * ; df -h

```

This simply calculates the amount of space each file in the current directory takes up (and sums it), then it queries the system for the disk usage per block device. These commands will run regardless of any errors generated by the `du` command.

What if you want an action to be taken upon successful completion of the first command? You can use the `&&` shorthand to indicate that you want to run the second command only if the first command returns a successful exit status. For example, suppose you want to reboot a machine only if the updates are successful:
```
[root@arch ~]$ pacman -Syu --noconfirm && reboot

```

Sometimes when running a command, you may want to capture its output. Most people know about the `tee` command, which will copy standard output to both the terminal and a file. However, if you want to capture more complex output from, say, `strace`, you will need to start working with [I/O redirection][1]. The details of I/O redirection are beyond the scope of this short article, but for our purposes we are concerned with `STDOUT` and `STDERR`. The best way to capture exactly what you are seeing is to combine the two in one file. To do this, use the `2>&1` redirection.
```
[root@arch ~]$ strace -p 1140 > strace_output.txt 2>&1

```

This will put all of the relevant output into a file called `strace_output.txt` for viewing later.

Sometimes during a long-running command, you may need to pause the execution of a task. You can use the 'stop' shortcut `ctrl + z` to stop (but not kill) a job. The job gets added to the job queue, but you will no longer see the job until you resume it. This job may be resumed at a later time by using the foreground command `fg`.

In addition, you may also simply pause a job with `ctrl + s`. The job and its output stay in the terminal foreground, and use of the shell is not returned to the user. The job may be resumed by pressing `ctrl + q`.

If you are working in a graphical environment with many terminals open, you may find it handy to have keyboard shortcuts for copying and pasting output. To do so, use the following shortcuts:
```
# Copies highlighted text

ctrl + shift + c



# Pastes text in buffer

ctrl + shift + v

```

Suppose in the output of an executing command you see another command being executed, and you want to get more information. There are a few ways to do this. If this command is in your path somewhere, you can run the `which` command to find out where that command is located on your disk:
```
[root@arch ~]$ which ls

/usr/bin/ls

```

With this information, you can inspect the binary with the `file` command:
```
[root@arch ~]$ file /usr/bin/ls

/usr/bin/ls: ELF 64-bit LSB pie executable x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=d4e02b88e596e4f82c6cc62a5bc4ce5827209a49, stripped

```

You can see all sorts of information, but the most important for most users is the `ELF 64-bit LSB` nonsense. This essentially means that it is a precompiled binary as opposed to a script or other type of executable. A related tool you can use to inspect commands is the `command` tool itself. Simply running `command -V <command>` will give you different types of information:
```
[root@arch ~]$ command -V ls

ls is aliased to `ls --color=auto`



[root@arch ~]$ command -V bash

bash is /usr/bin/bash



[root@arch ~]$ command -V shopt

shopt is a shell builtin

```

Last but definitely not least, one of my favorite tricks, especially when working with containers or in environments where I have little knowledge or control, is the `echo` command. This command can be used to do everything from checking to make sure your `for` loop will run the expected sequence to allowing you to check if remote ports are open. The syntax is very simple to check for an open port: `echo > /dev/<udp or tcp>/<server ip>/<port>`. For example:
```
user@ubuntu-1604:~$ echo > /dev/tcp/192.168.99.99/222

-bash: connect: Connection refused

-bash: /dev/tcp/192.168.99.99/222: Connection refused



user@ubuntu-1604:~$ echo > /dev/tcp/192.168.99.99/22

```

If the port is closed to the type of connection you are trying to make, you will get a `Connection refused` message. If the packet is successfully sent, there will be no output.

I hope these tips make Bash more efficient and enjoyable to use. There are many more tricks hidden in Bash than I've listed here. What are some of your favorites?

#### Appendix 1. List of tips and tricks covered

```
# History related

ctrl + r (reverse search)

!! (rerun last command)

!* (reuse arguments from previous command)

!$ (use last argument of last command)

shopt -s histappend (allow multiple terminals to write to the history file)

history | awk 'BEGIN {FS="[ \t]+|\\|"} {print $3}' | sort | uniq -c | sort -nr | head (list the most used history commands)



# File and navigation

cp /home/foo/realllylongname.cpp{,-old}

cd -

rename 's/text_to_find/been_renamed/' *.txt

export CDPATH='/var/log:~' (variable is used with the cd built-in.)



# Colourize bash



# enable colors

eval "`dircolors -b`"

# force ls to always use color and type indicators

alias ls='ls -hF --color=auto'

# make the dir command work kinda like in windows (long format)

alias dir='ls --color=auto --format=long'

# make grep highlight results using color

export GREP_OPTIONS='--color=auto'



export LESS_TERMCAP_mb=$'\E[01;31m'

export LESS_TERMCAP_md=$'\E[01;33m'

export LESS_TERMCAP_me=$'\E[0m'

export LESS_TERMCAP_se=$'\E[0m' # end the info box

export LESS_TERMCAP_so=$'\E[01;42;30m' # begin the info box

export LESS_TERMCAP_ue=$'\E[0m'

export LESS_TERMCAP_us=$'\E[01;36m'



# Bash shortcuts

    shopt -s cdspell (corrects typoos)

    ctrl + _ (undo)

    ctrl + arrow (move forward a word)

    ctrl + a (move cursor to start)

    ctrl + e (move cursor to end)

    ctrl + k (cuts everything after the cursor)

    ctrl + l (clears screen)

    ctrl + q (resume command that is in the foreground)

    ctrl + s (pause a long running command in the foreground)

    ctrl + t (swap two characters)

    ctrl + u (cuts everything before the cursor)

    ctrl + x + ctrl + e (opens the command string in an editor so that you can edit it before it runs)

    ctrl + x + * (expand glob/star)

    ctrl + xx (move to the opposite end of the line)

    ctrl + y (pastes from the buffer)

    ctrl + shift + c/v (copy/paste into terminal)



# Running commands in sequence

&& (run second command if the first is successful)

; (run second command regardless of success of first one)



# Redirecting I/O

2>&1 (redirect stdout and stderr to a file)



# check for open ports

echo > /dev/tcp/<server ip>/<port>

`` (use back ticks to shell out)



# Examine executable

which <command>

file <path/to/file>

command -V <some command binary> (tells you whether <some binary> is a built-in, binary or alias)

```

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/bash-tricks

作者：[Steve Ovens][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/stratusss
[1]:https://www.digitalocean.com/community/tutorials/an-introduction-to-linux-i-o-redirection
