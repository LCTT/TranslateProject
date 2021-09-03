[#]: subject: "20 essential Linux commands for every user"
[#]: via: "https://opensource.com/article/21/9/essential-linux-commands"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

20 essential Linux commands for every user
======
From new user to power user, here are 20 Linux commands that will make
your life easier.
![Command line prompt][1]

Typing commands into a darkened terminal window may seem antiquated to some, but for many computer users, it's the most efficient, most accessible, and clearest way to accomplish nearly any task a computer is capable of performing. These days, thanks to all the projects that bring open source commands to non-open platforms like macOS and Windows, terminal commands are relevant to everybody, not just Linux and BSD users. It may surprise you to learn that there are thousands of commands installed on an average [POSIX][2] computer, but of course, a good many of those aren't really intended to be used, at least not directly or regularly. Some commands are more universally useful than others, and still fewer are absolutely essential for effective terminal use.

Here are the top 20 commands a terminal user might find themselves using:

### cd

Outside of a terminal, you click on icons to move from one folder to another, but in the terminal, you use `cd`. The `cd` command, which stands for _change directory_, is how you move through a Linux system. It's the fastest and most direct route from one place to another.

For instance, on the desktop, when you want to move from your home directory (the place you keep all of your folders) to a folder called `presentations`, then you might first have to open your `Documents` folder, then open a folder called `work`, then a `projects` folder, and then the `conference` folder, and finally the `presentations` folder, which contains your exciting LibreOffice Impress slideshow. That's a lot of double-clicking. It may also be a lot of moving around on the screen, depending on where new windows appear, and a lot of waypoints for your brain to track. Many people circumvent this seemingly minor task by keeping _everything_ on their desktop.

Terminal users avoid this issue by just typing:


```
`$ cd ~/Documents/work/projects/conference/presentations`
```

Experienced terminal users don't even bother typing all of that. They use the **Tab** key to autocomplete the words for them. And sometimes, you don't even have to resort to autocompletion. You can use wildcards instead:


```
`$ cd ~/Doc*/work/*/conf*/p*`
```

### pwd

In the words of Buckaroo Banzai: "No matter where you go, there you are."

When you need to figure out where exactly that is, you use the `pwd` command. The `pwd` stands for _print working directory,_ and that's exactly what it does. The `--physical` (or just `-P` in some implementations) shows your location with all symlinks resolved.


```
$ pwd
/home/tux/presentation

$ pwd --physical
/home/tux/Documents/work/projects/conference/presentations
```

### sed

Better known as `sed`, the stream editor is a powerful bulk _find and replace_ command, but it's also a legitimate text editor. You can learn to use it by reading my [introductory article][3], and then become an expert with my [advanced tutorial and cheat sheet][4].

### grep

The `grep` command is so ubiquitous that it's often used as a verb ("I'll grep through some files") and a gerund ("grepping some output"). It's a key component when parsing text in your shell, whether you're looking through log files or parsing the output of some other command. It's a way for the busy user to focus on specific information. Given just how much data there is in the computing world, there's no wonder it's a popular command. Go grok grep by reading my [introductory article][5], and then download the [cheat sheet][6].

### file

Use the `file` command when you need to know what type of data a file contains:


```
$ file example.foo
example.foo: RIFF (little-endian) data, Web/P image [...]

$ file example.bar
example.bar: ELF 64-bit LSB executable, x86-64 [...]
```

The `file` command isn't magic, of course. It only reports based on how a file identifies itself, and files can be wrong, corrupted, or disguised. A rigorous inspection with [`hexdump`][7] provides more certainty, but for casual use, the `file` command is convenient.

### awk

Awk isn't just a command; it's a literal [programming language][8]. [Download our free Awk ebook][9], learn it, and you'll be writing scripts you never thought possible.

### curl

The `curl` command is a [non-interactive web browser][10] for your terminal. It's a [development tool][11] for web and API developers. It's a complex command for its flexibility, but it's worth learning if you want to interact with network services from your terminal smoothly.

Download our free [`curl` cheat sheet][12], so you can internalize its many options.

### ps

Managing your system's resources is mostly up to the kernel, but when you prefer or require a manual approach, there's the `ps` command. Learn about `ps` in my [monitor your Linux system with procps-ng][13] article.

### cat

The [`cat` command][14] is short for _concatenate_, and it was very useful once for joining files that had been split (with a command intuitively called `split`) into several small files due to size limitations. Today, `cat` is mostly used as a way to dump the contents of a text file into your terminal for quick reference, unless you use `head`, `tail`, `more`, or `less` for that.

Despite its almost deprecated original purpose, and despite that several other commands also perform its secondary function, `cat` is still a useful utility. For instance, it can be a stand-in for the copy (`cp`) command:


```
`$ cat myfile.ogg > /backups/myfile.ogg`
```

It can reveal inconvenient invisible characters in files. The **Tab** character, which breaks [YAML][15], shows up as `^I` with the `--show-tabs` option:


```
$ cat --show-tabs my.yaml

\---

\- hosts: all
  tasks:
  - name: Make sure the current version of 'sysstat' is installed.
    dnf:
     name:
^I- sysstat
^I- httpd
^I- mariadb-server
     state: latest
```

It can show non-printing characters with `--show-nonprinting`, mark the ends of lines with `--show-ends`, provide line numbers with `--number`, and more.

### find

The `find` command helps you find files, but thanks to its many options, it can help you find files with a variety of filters and parameters. Learn the basics from my [introductory article][16].

And in case you've been wondering why the most fundamental command of all, the humble [`ls` command][17], isn't on this list, it's because of the flexibility of `find`. Not only can find list files:


```
$ find .
./bar.txt
./baz.xml
./foo.txt
[...]
```

It can also provide long listings:


```
$ find . -ls
3014803  464 -rw-rw-r--   1 tux users  473385 Jul 26 07:25 ./foo.txt
3014837  900 -rwxrwxr-x   1 tux users  918217 Nov  6  2019 ./baz.xml
3026891  452 -rw-rw-r--   1 tux users  461354 Aug 10 13:41 ./foo.txt
[...]
```

It's a technicality, but a neat trick to know.

### tar

People sometimes joke about Linux commands by citing BSD's `tar` syntax. In spite of its reputation, the `tar` command can actually be very intuitive. Read my [how to unzip a tar.gz file][18] article to learn the simple secret to rattling off a `tar` command on demand.

### more or less or most

Pagers are like `cat`, except they pause their output at the bottom of your screen until you scroll down for more. It's a simple application, but there's nuance to each implementation. Do you scroll with arrow keys or the spacebar? Do you have to quit manually, or does the pager exit at the end of the file it's displaying? What's your preferred search behavior? Choose your favorite pager and set it in your `.bashrc`!

### ssh and scp

OpenSSH not only helps secure connections to remote systems it also enables other commands. For instance, for many users, it's their `.ssh` directory that makes it possible for them to interact smoothly with Git repositories, post updates to a website, or log in to their cloud's control plane.

### mv

The `mv` command does double-duty: It both [moves files][19] and it [renames files][20]. It has several available safeguards, including `--interactive` and `--no-clobber` options to avoid clobbering an existing file, a `--backup` command to ensure data is preserved until it is verified at its new location, and the `--update` option to ensure that an older version doesn't replace a newer file.

### sudo

When you have a single user with a known user name and _all_ the privileges on a system, that user quickly becomes the target of attacks. By eliminating the need for a literal `root` user, the `sudo` command elegantly removes important information about your system from general knowledge. That's not all it does, though. With `sudo`, you can easily manage privileges down to individual commands, users, and groups. You can enable password-less execution of select commands, record user sessions, verify commands with digest validation, [and more][21].

### alias

Turn long commands into easy-to-remember shortcuts by using the `alias` command:


```
`$ alias ls='ls --classify --almost-all --ignore-backups --color'`
```

### clear

Sometimes your terminal gets cluttered. There's nothing like a nice, fresh screen after typing `clear` (or pressing **Ctrl+L** in some shells).

### setfacl

Traditionally, POSIX file permissions were determined by `chown` and `chmod`. Systems have become more complex, though, so there's a command to provide a little more flexibility. The `setfacl` command lets you create an [Access Control List (ACL)][22], granting permissions to arbitrary users and setting default permissions for folders and the contents created within them.

### netcat

Not every user needs netcat (`nc`), but few who use it ever want to give it up. The `nc` command is an all-purpose network connection tool.

It can connect to a port, similar to `telnet`:


```
`$ nc -u 192.168.0.12 80`
```

It can ping a port, similar to `ping`:


```
`$ nc -zvn 192.168.0.12 25`
```

It can probe for open ports, similar to `nmap`:


```
`$ nc -zv 192.168.0.12 25-80`
```

And that's just a small sample.

### you

The Linux terminal is, in part, about creative problem-solving. When you learn commands, you're also learning building blocks you can use to create your own commands. Many of the commands in my [shell history][23] are shell scripts I've written myself. The result is that my workflow is customized to how I want to work. Essential commands in your shell can also be the ones you design for your own efficacy and comfort. Spend some time getting to know some great commands, and then build your own. And when you hit upon something really good, make it open source so you can share your ideas with others!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/essential-linux-commands

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://opensource.com/article/20/12/sed
[4]: https://opensource.com/article/21/3/sed-cheat-sheet
[5]: https://opensource.com/article/21/3/grep-cheat-sheet
[6]: https://opensource.com/downloads/grep-cheat-sheet
[7]: https://opensource.com/article/19/8/dig-binary-files-hexdump
[8]: https://opensource.com/article/21/1/learn-awk
[9]: https://opensource.com/article/20/9/awk-ebook
[10]: https://opensource.com/article/20/5/curl-cheat-sheet
[11]: https://www.redhat.com/sysadmin/use-curl-api
[12]: https://opensource.com/downloads/curl-command-cheat-sheet
[13]: https://opensource.com/article/21/8/linux-procps-ng
[14]: https://opensource.com/article/19/2/getting-started-cat-command
[15]: https://www.redhat.com/sysadmin/yaml-beginners
[16]: https://opensource.com/article/21/8/find-files-and-directories-find
[17]: https://opensource.com/article/19/7/master-ls-command
[18]: https://opensource.com/article/17/7/how-unzip-targz-file
[19]: https://opensource.com/article/21/8/move-files-linux
[20]: https://opensource.com/article/21/8/rename-file-linux-terminal
[21]: https://opensource.com/article/19/10/know-about-sudo
[22]: https://opensource.com/article/20/3/external-drives-linux
[23]: https://opensource.com/article/18/6/history-command
