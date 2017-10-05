ucasFL translating

Seven things about Linux you may not have known so far
============================================================

![Hidden features of Linux](https://i0.wp.com/opensourceforu.com/wp-content/uploads/2015/12/Linux-Kernel-sys-visual5.jpg?resize=750%2C563)

One of the coolest parts about using Linux is the knowledge you gain over time. Each day, you’re likely to come across a new utility or maybe just an unfamiliar flag that does something helpful. These bits and pieces aren’t always life-changing, but they are the building blocks for expertise.

Even experts don’t know that all, though. No matter how much experience you might have, there is always more to learn, so we’ve put together this list of seven things about Linux you may not have known.

**There is an interactive mode for command history**

You’re probably familiar with `history`, which reads your bash history to `stdout`in a handy numbered list. However, if you find yourself searching for a specific URL in a sea of `curl` commands, this list isn’t always easy to read.

As an alternative, Linux comes with an interactive reverse search that helps you to avoid the headache. You can activate it with `ctrl+r`. This enables an interactive prompt that will search backwards through your bash history for a string you provide. You can cycle back through older commands by pressing `ctrl+r` again or cycle forward using `ctrl+s`.

Note that `ctrl+s` sometimes collides with XON/XOFF flow control, you can disable the same by running `stty –ixon`. This will usually be fine on your own personal machines, but as always, make sure you don’t need XON/XOFF before you disable it.

**Cron isn’t the only way to schedule jobs**

Cron jobs are incredibly useful for sysadmins of any level — from absolute beginner to seasoned expert. But if you need to schedule a one-off task, the `at` command provides a quick way to create jobs without touching your crontab.

Run the `at` command followed by the time you’d like to run your job. The time is flexible and accepts a variety of time formats. A few examples include:

“at 12:00 PM September 30 2017”
“at now + 1 hour”
“at 9:00 AM tomorrow”

Once you enter the `at` command with arguments, you’ll be prompted for the commands you would like to run on your Linux machine. This can be a backup script, a set of maintenance tasks or even a normal bash command. To finalise the job, enter `ctrl+d`.

Further, you can view all jobs for the current user with `atq` or for all users with `sudo atq`. This will display the scheduled jobs with an ID for each one. To cancel a scheduled job, use `atrm` with the job ID as an argument.

**You can search commands by function, not just name**

Remembering command names can be difficult, especially as a beginner. Luckily, Linux comes with a tool to search the man pages by both name and description.

Next time, if you would struggle to remember the name of the tool you want to use, you can try `apropos` with a description of what you are trying to achieve. For instance, `apropos build filesystem` will return a list of names and descriptions of utilities that include the words “build” or “filesystem.”

The `apropos` command accepts a string or multiple strings as arguments, but it also has options like `-r`, which allows you to search by regular expression.

**An alternatives system allows you to manage versions**

If you have ever been involved in software development, you know the importance of managing support for different versions of a language across projects. Many Linux distributions have tools to handle different versions built in.

Executables like `java` are often symbolically linked to `/etc/alternatives`. This directory, in turn, stores symlinks to binary files and offers an interface for managing those links. Java is probably the most commonly used language with alternatives, but with a bit of configuration, it can also act as a replacement for applications like NVM and RVM (version managers for NodeJS and Ruby, respectively).

In Debian-based systems, you can create and manage these links with `update-alternatives`. In CentOS, the tool is simply called `alternatives`. By changing the links in your alternatives file, you can install multiple versions of a language and use different binaries in different situations. Of course, this is not just limited to programming languages. The alternatives system also offers support for any executable that you might want to run from the command line.

**Shred command is a more secure way to delete files**

Most of us probably use `rm` to delete files. But where do those files go? The truth is that `rm` might not be doing what you think — it simply removes the hardlink between the filesystem and the data on disk. The 1s and 0s remain in storage until they are overwritten by another application. For extremely sensitive data, this can be a huge security concern.

The `shred` command is a hardcore version of `rm`. When you shred a file, its data is randomly overwritten multiple times. There is even an option to run a final pass and “zero out” the data after the random overwrites.

To securely delete a file and overwrite it with zeros:

`shred -u -z [file name]`

You can also add the `-n` option with a number as an argument. This allows you to specify how many iterations will be made when randomly overwriting the data.

**Autocorrect to avoid frustration when typing long filepaths**

How many times have you typed out an absolute file path only to see the “No such file or directory” message? Even the best of us know the pain of a typo in a long string. Fortunately, there is an easy fix.

The built-in `shopt` command allows you to set different options to change the behavior of your shell. Setting the `cdspell` option is a simple way to avoid the headache of one-letter mistakes when typing out file paths. You can turn it on by running `shopt -s cdspell`. Once it has been activated, file paths will autocorrect to the closest match when you try to change directories.

Shell options are a great way to save time (not to mention hassle), and there are plenty of others. To see a full list of options on your system, run `shopt` with no arguments. Be aware that this is a feature of bash, so if you’re running zsh or another alternative shell, you may not have access to it.

**Easily return to the current directory with subshells**

If you’ve ever had to configure a system with even a moderate level of complexity, you’ve probably found yourself changing directories so often that it can be hard to keep track of where you are. Wouldn’t it be great if there was a way to automatically return to your current location after running a command?

Linux actually offers a solution to this problem, and it’s dead simple. If you need to `cd` to another location to do something and then return to your current working directory, wrap the command in parentheses. Here’s an example you can try on your machine. Make a note of your current directory, then run:

`(cd /etc && ls -a)`

This will output the contents of your `/etc` directory. Now recheck your current working directory. It should be the same one you were in before, not `/etc`.

So how does it work? Running a command in parentheses spawns a subshell or a forked copy of the current shell process. The subshell has access to all of the parent’s variables, but not vice versa, so keep that in mind if you’re running an especially complex one-liner.

Subshells are often used in scripts for parallel processing, but you can bring that same power to the command line to make your life easier when navigating the filesystem.

--------------------------------------------------------------------------------

作者简介：

Phil Zona

The author is a technical writer for Linux Academy. He has written guides and tutorials on AWS, Microsoft Azure, and Linux systems administration. He also manages the Cloud Assessments blog, which aims to help individuals reach their career goals through technology.

-----------------

via: http://opensourceforu.com/2017/09/top-7-things-linux-may-not-known-far/

作者：[PHIL ZONA ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://opensourceforu.com/author/phil-zona/
[1]:http://opensourceforu.com/2017/09/top-7-things-linux-may-not-known-far/#disqus_thread
[2]:http://opensourceforu.com/author/phil-zona/
