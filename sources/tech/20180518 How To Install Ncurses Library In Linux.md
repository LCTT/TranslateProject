translating---geekpi

How To Install Ncurses Library In Linux
======
![](https://www.ostechnix.com/wp-content/uploads/2018/05/install-ncurses-720x340.png)

**GNU Ncurses** is a programming library that allows the users to write text-based user interfaces(TUI). Many text-based games are created using this library. One popular example is [**PacVim**][1], a CLI game to learn VIM commands. In this brief guide, I will be explaining how to install Ncurses library in Unix-like operating systems.

### Install Ncurses Library In Linux

Ncurses is available in the default repositories of most Linux distributions. For instance, you can install it on Arch-based systems using the following command:
```
$ sudo pacman -S ncurses

```

On RHEL, CentOS:
```
$ sudo yum install ncurses-devel

```

On Fedora 22 and newer versions:
```
$ sudo dnf install ncurses-devel

```

On Debian, Ubuntu, Linux Mint:
```
$ sudo apt-get install libncurses5-dev libncursesw5-dev

```

The GNU ncureses might be bit old in the default repositories. If you want a most recent stable version, you can compile and install from the source as shown below.

Download the latest ncurses version from [**here**][2]. As of writing this guide, the latest version was 6.1.
```
$ wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.1.tar.gz

```

Extract the tar file:
```
$ tar xzf ncurses-6.1.tar.gz

```

This will create a folder named ncurses-6.1 in the current directory. Cd to the directory:
```
$ cd ncurses-6.1

$ ./configure --prefix=/opt/ncurses

```

Finally, compile and install using the following commands:
```
$ make

$ sudo make install

```

Verify the installation using command:
```
$ ls -la /opt/ncurses

```

That’s it. Ncurses have been installed on the Linux distribution. Go ahead and create your nice looking TUIs using Ncurses.

More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-install-ncurses-library-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/pacvim-a-cli-game-to-learn-vim-commands/
[2]:https://ftp.gnu.org/pub/gnu/ncurses/
