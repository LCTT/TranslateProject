How To Know What A Command Or Program Will Exactly Do Before Executing It
======
Ever wondered what a Unix command will do before executing it? Not everyone knows what a particular command or program will do. Of course, you can check it with [Explainshell][2]. You need to copy/paste the command in Explainshell website and it let you know what each part of a Linux command does. However, it is not necessary. Now, we can easily know what a command or program will exactly do before executing it, right from the Terminal. Say hello to “maybe”, a simple tool that allows you to run a command and see what it does to your files without actually doing it! After reviewing the output listed, you can then decide whether you really want to run it or not.

#### How “maybe” works?

According to the developer,

> “maybe” runs processes under the control of ptrace with the help of python-ptrace library. When it intercepts a system call that is about to make changes to the file system, it logs that call, and then modifies CPU registers to both redirect the call to an invalid syscall ID (effectively turning it into a no-op) and set the return value of that no-op call to one indicating success of the original call. As a result, the process believes that everything it is trying to do is actually happening, when in reality nothing is.

Warning: You should be very very careful when using this utility in a production system or in any systems you care about. It can still do serious damages, because it will block only a handful of syscalls.

#### Installing “maybe”

Make sure you have installed pip in your Linux system. If not, install it as shown below depending upon the distribution you use.

On Arch Linux and its derivatives like Antergos, Manjaro Linux, install pip using the following command:

```
sudo pacman -S python-pip
```

On RHEL, CentOS:

```
sudo yum install epel-release
```

```
sudo yum install python-pip
```

On Fedora:

```
sudo dnf install epel-release
```

```
sudo dnf install python-pip
```

On Debian, Ubuntu, Linux Mint:

```
sudo apt-get install python-pip
```

On SUSE, openSUSE:

```
sudo zypper install python-pip
```

Once pip installed, run the following command to install “maybe”.

```
sudo pip install maybe
```

#### Know What A Command Or Program Will Exactly Do Before Executing It

Usage is absolutely easy! Just add “maybe” in front of a command that you want to execute.

Allow me to show you an example.

```
$ maybe rm -r ostechnix/
```

As you can see, I am going to delete a folder called “ostechnix” from my system. Here is the sample output.

```
maybe has prevented rm -r ostechnix/ from performing 5 file system operations:

 delete /home/sk/inboxer-0.4.0-x86_64.AppImage
 delete /home/sk/Docker.pdf
 delete /home/sk/Idhayathai Oru Nodi.mp3
 delete /home/sk/dThmLbB334_1398236878432.jpg
 delete /home/sk/ostechnix

Do you want to rerun rm -r ostechnix/ and permit these operations? [y/N] y
```

 [![](http://www.ostechnix.com/wp-content/uploads/2017/12/maybe-1.png)][3] 

The “maybe” tool performs 5 file system operations and shows me what this command (rm -r ostechnix/) will exactly do. Now I can decide whether I should perform this operation or not. Cool, yeah? Indeed!

Here is another example. I am going to install [Inboxer][4] desktop client for Gmail. This is what I got.

```
$ maybe ./inboxer-0.4.0-x86_64.AppImage 
fuse: bad mount point `/tmp/.mount_inboxemDzuGV': No such file or directory
squashfuse 0.1.100 (c) 2012 Dave Vasilevsky

Usage: /home/sk/Downloads/inboxer-0.4.0-x86_64.AppImage [options] ARCHIVE MOUNTPOINT

FUSE options:
 -d -o debug enable debug output (implies -f)
 -f foreground operation
 -s disable multi-threaded operation

open dir error: No such file or directory
maybe has prevented ./inboxer-0.4.0-x86_64.AppImage from performing 1 file system operations:

create directory /tmp/.mount_inboxemDzuGV

Do you want to rerun ./inboxer-0.4.0-x86_64.AppImage and permit these operations? [y/N]
```

If it not detects any file system operations, then it will simply display a result something like below.

For instance, I run this command to update my Arch Linux.

```
$ maybe sudo pacman -Syu
sudo: effective uid is not 0, is /usr/bin/sudo on a file system with the 'nosuid' option set or an NFS file system without root privileges?
maybe has not detected any file system operations from sudo pacman -Syu.
```

See? It didn’t detect any file system operations, so there were no warnings. This is absolutely brilliant and exactly what I was looking for. From now on, I can easily know what a command or a program will do even before executing it. I hope this will be useful to you too. More good stuffs to come. Stay tuned!

Cheers!

Resource:

*   [“maybe” GitHub page][1]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/know-command-program-will-exactly-executing/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://github.com/p-e-w/maybe
[2]:https://www.ostechnix.com/explainshell-find-part-linux-command/
[3]:http://www.ostechnix.com/wp-content/uploads/2017/12/maybe-1.png
[4]:https://www.ostechnix.com/inboxer-unofficial-google-inbox-desktop-client/
