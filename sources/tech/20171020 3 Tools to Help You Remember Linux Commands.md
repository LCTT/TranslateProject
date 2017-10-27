3 Tools to Help You Remember Linux Commands
============================================================


![apropos](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/commands-main.jpg?itok=OESH_Evp "apropos")
The apropos tool, which is installed by default on nearly every Linux distribution, can help you find the command you need.[Used with permission][5]

The Linux desktop has come a very long way from its humble beginnings. Back in my early days of using Linux, knowledge of the command line was essential—even for the desktop. That’s no longer true. Many users might never touch the command line. For Linux system administrators, however, that’s not the case. In fact, for any Linux admin (be it server or desktop), the command line is a requirement. From managing networks, to security, to application and server settings—there’s nothing like the power of the good ol’ command line.

But, the thing is… there are a  _lot_ of commands to be found on a Linux system. Consider  _/usr/bin_  alone and you’ll find quite a lot of commands (you can issue  _ls /usr/bin/ | wc -l_ to find out exactly how many you have). Of course, these aren’t all user-facing executables, but it gives you a good idea of the scope of Linux commands. On my Elementary OS system, there are 2029 executables within  _/usr/bin_ . Even though I will use only a fraction of those commands, how am I supposed to remember even that amount?

Fortunately, there are various tricks and tools you can use, so that you’re not struggling on a daily basis to remember those commands. I want to offer up a few such tips that will go a long way to helping you work with the command line a bit more efficiently (and save a bit of brain power along the way).

We’ll start with a built-in tool and then illustrate two very handy applications that can be installed.

### Bash history

You may or may not know this, but Bash (the most popular Linux shell) retains a history of the commands you run. Want to see it in action? There are two ways. Open up a terminal window and tap the Up arrow key. You should see commands appear, one by one. Once you find the command you’re looking for, you can either use it as is, by hitting the Enter key, or modify it and then execute with the Enter key.

This is a great way to re-run (or modify and run) a command you’ve previously issued. I use this Linux feature regularly. It not only saves me from having to remember the minutiae of a command, it also saves me from having to type out the same command over and over.

Speaking of the Bash history, if you issue the command  _history_ , you will be presented with a listing of commands you have run in the past (Figure 1).


![Bash history](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/commands_1.jpg?itok=2eqm9ii_ "Bash history")
Figure 1: Can you spot the mistake in one of my commands?[Used with permission][1]

The number of commands your Bash history holds is configured within the ~/.bashrc file. In that file, you’ll find two lines:

```
HISTSIZE=1000

HISTFILESIZE=2000
```

HISTSIZE is the maximum number of commands to remember on the history list, whereas HISTFILESIZE is the maximum number of lines contained in the history file.

Clearly, by default, Bash will retain 1000 commands in your history. That’s a lot. For some, this is considered an issue of security. If you’re concerned about that, you can shrink the number to whatever gives you the best ratio of security to practicality. If you don’t want Bash to remember your history, set HISTSIZE to 0.

If you make any changes to the ~/.bashrc file, make sure to log out and log back in (otherwise the changes won’t take effect).

### Apropos

This is the first of two tools that can be installed to assist you in recalling Linux commands. Apropos is able to search the Linux man pages to help you find the command you're looking for. Say, for instance, you don’t remember which firewall tool your distribution uses. You could type  _apropos “firewall” _ and the tool would return any related command (Figure 2).


![apropos](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/commands_2.jpg?itok=MX5zHfet "apropos")
Figure 2: What is your firewall command?[Used with permission][2]

What if you needed a command to work with a directory, but had no idea what command was required? Type  _apropos “directory” _ to see every command that contains the word “directory” in its man page (Figure 3).


![apropos directory](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/commands_3.jpg?itok=ALEsfP4q "apropos directory")
Figure 3: What was that tool you used on a directory?[Used with permission][3]

The apropos tool is installed, by default, on nearly every Linux distribution.

### Fish

There’s another tool that does a great job of helping you recall commands. Fish is a command line shell for Linux, Unix, and Mac OS that has a few nifty tricks up its sleeve:

*   Autosuggestions

*   VGA Color

*   Full scriptability

*   Web Based configuration

*   Man Page Completions

*   Syntax highlighting

*   And more

The autosuggestions make fish a really helpful tool (especially when you can’t recall those commands).

As you might expect, fish isn’t installed by default. For Ubuntu (and its derivatives), you can install fish with the following commands:

```
sudo apt-add-repository ppa:fish-shell/release-2

sudo apt update

sudo apt install fish
```

For the likes of CentOS, fish can be installed like so. Add the repository with the commands:

```
sudo -s

cd /etc/yum.repos.d/

wget http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo
```

Update the repository list with the commands:

```
yum repolist

yum update
```

Install fish with the command:

```
yum install fish
```

Using fish isn’t quite as intuitive as you might expect. Remember, fish is a shell, so you have to enter the shell before using the command. From your terminal, issue the command fish and you will find yourself in the newly install shell (Figure 4).


![fish shell](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/commands_4.jpg?itok=8TBGVhVk "fish shell")
Figure 4: The fish interactive shell.[Used with permission][4]

Start typing a command and fish will automatically complete the command. If the suggested command is not the one you’re looking for, hit the Tab key on your keyboard for more suggestions. If it is the command you want, type the right arrow key on your keyboard to complete the command and then hit Enter to execute. When you’re done using fish, type exit to leave that shell.

Fish does quite a bit more, but with regards to helping you remember your commands, the autosuggestions will go a very long way.

### Keep learning

There are so many commands to learn on Linux. But don’t think you have to commit every single one of them to memory. Thanks to the Bash history and tools like apropos and fish, you won’t have to strain your memory much to recall the commands you need to get your job done.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/10/3-tools-help-you-remember-linux-commands

作者：[JACK WALLEN ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/used-permission
[3]:https://www.linux.com/licenses/category/used-permission
[4]:https://www.linux.com/licenses/category/used-permission
[5]:https://www.linux.com/licenses/category/used-permission
[6]:https://www.linux.com/files/images/commands1jpg
[7]:https://www.linux.com/files/images/commands2jpg
[8]:https://www.linux.com/files/images/commands3jpg
[9]:https://www.linux.com/files/images/commands4jpg
[10]:https://www.linux.com/files/images/commands-mainjpg
[11]:http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo
