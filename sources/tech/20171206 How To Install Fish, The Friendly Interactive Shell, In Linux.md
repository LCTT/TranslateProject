Translating by kimii
How To Install Fish, The Friendly Interactive Shell, In Linux
======
Fish, acronym of friendly interactive shell, is a well equipped, smart and user-friendly shell for Unix-like systems. Fish comes with many significant features, such as autosuggestions, syntax highlighting, searchable history (like CTRL+r in Bash), smart search functionality, glorious VGA color support, web based configuration, man page completions and many, out of the box. Just install it and start using it in no time. No more extra configuration or you don’t have to install any extra add-ons/plug-ins!

In this tutorial, let us discuss how to install and use fish shell in Linux.

#### Install Fish

Even though fish is very user-friendly and feature-rich shell, it is not included in the default repositories of most Linux distributions. It is available in the official repositories of only few Linux distributions such as Arch Linux, Gentoo, NixOS, and Ubuntu etc. However, installing fish is not a big deal.

On Arch Linux and its derivatives, run the following command to install it.

```
sudo pacman -S fish
```

On CentOS 7 run the following as root:

```
cd /etc/yum.repos.d/
```

```
wget https://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo
```

```
yum install fish
```

On CentOS 6 run the following as root:

```
cd /etc/yum.repos.d/
```

```
wget https://download.opensuse.org/repositories/shells:fish:release:2/CentOS_6/shells:fish:release:2.repo
```

```
yum install fish
```

On Debian 9 run the following as root:

```
wget -nv https://download.opensuse.org/repositories/shells:fish:release:2/Debian_9.0/Release.key -O Release.key
```

```
apt-key add - < Release.key
```

```
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_9.0/ /' > /etc/apt/sources.list.d/fish.list
```

```
apt-get update
```

```
apt-get install fish
```

On Debian 8 run the following as root:

```
wget -nv https://download.opensuse.org/repositories/shells:fish:release:2/Debian_8.0/Release.key -O Release.key
```

```
apt-key add - < Release.key
```

```
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' > /etc/apt/sources.list.d/fish.list
```

```
apt-get update
```

```
apt-get install fish
```

On Fedora 26 run the following as root:

```
dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:fish:release:2/Fedora_26/shells:fish:release:2.repo
```

```
dnf install fish
```

On Fedora 25 run the following as root:

```
dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:fish:release:2/Fedora_25/shells:fish:release:2.repo
```

```
dnf install fish
```

On Fedora 24 run the following as root:

```
dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:fish:release:2/Fedora_24/shells:fish:release:2.repo
```

```
dnf install fish
```

On Fedora 23 run the following as root:

```
dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:fish:release:2/Fedora_23/shells:fish:release:2.repo
```

```
dnf install fish
```

On openSUSE: run the following as root:

```
zypper install fish
```

On RHEL 7 run the following as root:

```
cd /etc/yum.repos.d/
```

```
wget https://download.opensuse.org/repositories/shells:fish:release:2/RHEL_7/shells:fish:release:2.repo
```

```
yum install fish
```

On RHEL-6 run the following as root:

```
cd /etc/yum.repos.d/
```

```
wget https://download.opensuse.org/repositories/shells:fish:release:2/RedHat_RHEL-6/shells:fish:release:2.repo
```

```
yum install fish
```

On Ubuntu and its derivatives:

```
sudo apt-get update
```

```
sudo apt-get install fish
```

That’s it. It is time explore fish shell.

### Usage

To switch to fish from your default shell, do:

```
$ fish
Welcome to fish, the friendly interactive shell
```

You can find the default fish configuration at ~/.config/fish/config.fish (similar to .bashrc). If it doesn’t exist, just create it.

#### Auto suggestions

When I type a command, it automatically suggests a command in a light grey color. So, I had to type a first few letters of a Linux and hit tab key to complete the command.

 [![](http://www.ostechnix.com/wp-content/uploads/2017/12/fish-1.png)][2] 

If there are more possibilities, it will list them. You can select the listed commands from the list by using up/down arrow keys. After choosing the command you want to run, just hit the right arrow key and press ENTER to run it.

 [![](http://www.ostechnix.com/wp-content/uploads/2017/12/fish-2.png)][3] 

No more CTRL+r! As you already know, we do reverse search by pressing ctrl+r to search for commands from history in Bash shell. But it is not necessary in fish shell. Since it has autosuggestions capability, just type first few letters of a command, and pick the command from the list that you already executed, from the history. Cool, yeah?

#### Smart search

We can also do smart search to find a specific command, file or directory. For example, I type the substring of a command, then hit the down arrow key to enter into smart search and again type a letter to pick the required command from the list.

 [![](http://www.ostechnix.com/wp-content/uploads/2017/12/fish-6.png)][4] 

#### Syntax highlighting

You will notice the syntax highlighting as you type a command. See the difference in below screenshots when I type the same command in Bash and fish shells.

Bash:

 [![](http://www.ostechnix.com/wp-content/uploads/2017/12/fish-3.png)][5] 

Fish:

 [![](http://www.ostechnix.com/wp-content/uploads/2017/12/fish-4.png)][6] 

As you see, “sudo” has been highlighted in fish shell. Also, it will display the invalid commands in red color by default.

#### Web based configuration

This is yet another cool feature of fish shell. We can can set our colors, change fish prompt, and view functions, variables, history, key bindings all from a web page.

To start the web configuration interface, just type:

```
fish_config
```

 [![](http://www.ostechnix.com/wp-content/uploads/2017/12/fish-5.png)][7] 

#### Man page completions

Bash and other shells supports programmable completions, but only fish generates them automatically by parsing your installed man pages.

To do so, run:

```
fish_update_completions
```

Sample output would be:

```
Parsing man pages and writing completions to /home/sk/.local/share/fish/generated_completions/
 3435 / 3435 : zramctl.8.gz
```

#### Disable greetings

By default, fish greets you (Welcome to fish, the friendly interactive shell) at startup. If you don’t this greeting message, you can disable it. To do so, edit fish configuration file:

```
vi ~/.config/fish/config.fish
```

Add the following line:

```
set -g -x fish_greeting ''
```

Instead of disabling fish greeting, you can also set any custom greeting message.

```
set -g -x fish_greeting 'Welcome to OSTechNix'
```

#### Getting help

This one is another impressive feature that caught my attention. To open fish documentation page in your default web browser from Terminal, just type:

```
help
```

The official documentation will be opened in your default browser. Also, you can use man pages to display the help section of any command.

```
man fish
```

#### Set Fish as default shell

Liked it very much? Great! Just set it as default shell. To do so, use chsh command:

```
chsh -s /usr/bin/fish
```

Here, /usr/bin/fish is the path to the fish shell. If you don’t know the correct path, the following command will help you.

```
which fish
```

Log out and log in back to use the new default shell.

Please remember that many shell scripts written for Bash may not fully compatible with fish.

To switch back to Bash, just run:

```
bash
```

If you want Bash as your default shell permanently, run:

```
chsh -s /bin/bash
```

And, that’s all for now folks. At this stage, you might get a basic idea about fish shell usage. If you’re looking for a Bash alternatives, fish might be a good option.

Cheers!

Resource:

*   [fish shell website][1]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/install-fish-friendly-interactive-shell-linux/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://fishshell.com/
[2]:http://www.ostechnix.com/wp-content/uploads/2017/12/fish-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2017/12/fish-2.png
[4]:http://www.ostechnix.com/wp-content/uploads/2017/12/fish-6.png
[5]:http://www.ostechnix.com/wp-content/uploads/2017/12/fish-3.png
[6]:http://www.ostechnix.com/wp-content/uploads/2017/12/fish-4.png
[7]:http://www.ostechnix.com/wp-content/uploads/2017/12/fish-5.png
