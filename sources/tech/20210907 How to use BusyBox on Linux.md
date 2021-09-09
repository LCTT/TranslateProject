[#]: subject: "How to use BusyBox on Linux"
[#]: via: "https://opensource.com/article/21/8/what-busybox"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to use BusyBox on Linux
======
BusyBox is an open source (GPL) project providing simple implementations
of nearly 400 common commands.
![bash logo on green background][1]

It's easy to take Linux commands for granted. They come bundled with the system when you install Linux, and we often don't question why they're there. Some of the basic commands, such as [`cd`][2], [`kill`][3], and `echo` aren't always independent applications but are actually built into your shell. Others, such as [`ls`][4], [`mv`][5], and [`cat`][6] are part of a core utility package (often GNU `coreutils` specifically). But there are always alternatives in the world of open source, and one of the most interesting is [BusyBox][7].

### What is BusyBox in Linux?

BusyBox is an open source (GPL) project providing simple implementations of nearly 400 common commands, including `ls`, `mv`, `ln`, `mkdir`, `more`, `ps`, `gzip`, `bzip2`, `tar`, and `grep`. It also contains a version of the programming language `awk`, the stream editor `sed`, the filesystem checker `fsck`, the `rpm` and `dpkg` package managers, and of course, a shell (`sh`) that provides easy access to all of these commands. In short, it contains all the essential commands required for a POSIX system to perform common system maintenance tasks as well as many user and administrative tasks.

In fact, it even contains an `init` command which can be launched as PID 1 to serve as the parent process for all other system services. In other words, BusyBox can be used as an alternative to [systemd][8], OpenRC, sinit, init, and other launch daemons.

BusyBox is very small. As an executable, it's under 1 MB, so it has gained much of its popularity in the [embedded][9], [Edge][10], and [IoT][11] space, where drive space is at a premium. In the world of containers and cloud computing, it's also popular as a foundation for minimal Linux container images.

### Minimalism

Part of the appeal of BusyBox is its minimalism. All of its commands are compiled into a single binary (`busybox`), and its man page is a mere 81 pages (by my calculation of piping `man` to `pr`) but covers nearly 400 commands.

As an example comparison, here's the output of the `shadow` version of `useradd --help`:


```
 -b, --base-dir BASE_DIR       base directory for home
 -c, --comment COMMENT         GECOS field of the new account
 -d, --home-dir HOME_DIR       home directory of the new account
 -D, --defaults                print or change the default config
 -e, --expiredate EXPIRE_DATE  expiration date of the new account
 -f, --inactive INACTIVE       password inactivity
 -g, --gid GROUP               name or ID of the primary group
 -G, --groups GROUPS           list of supplementary groups
 -h, --help                    display this help message and exit
 -k, --skel SKEL_DIR           alternative skeleton dir
 -K, --key KEY=VALUE           override /etc/login.defs
 -l, --no-log-init             do not add the user to the lastlog
 -m, --create-home             create the user's home directory
 -M, --no-create-home          do not create the user's home directory
 -N, --no-user-group           do not create a group with the user's name
 -o, --non-unique              allow users with non-unique UIDs
 -p, --password PASSWORD       encrypted password of the new account
 -r, --system                  create a system account
 -R, --root CHROOT_DIR         directory to chroot into
 -s, --shell SHELL             login shell of the new account
 -u, --uid UID                 user ID of the new account
 -U, --user-group              create a group with the same name as a user
```

And here's the BusyBox version of the same command:


```
 -h DIR    Home directory
 -g GECOS  GECOS field
 -s SHELL  Login shell
 -G GRP    Group
 -S            Create a system user
 -D            Don't assign a password
 -H            Don't create home directory
 -u UID    User id
 -k SKEL   Skeleton directory (/etc/skel)
```

Whether or not this difference is a feature or a limitation depends on whether you prefer to have 20 options or ten options in your commands. For some users and use-cases, BusyBox's minimalism provides just enough for what needs to be done. For others, it's a good minimal environment to have as a fallback or as a foundation for installing more robust tools like [Bash][12], [Zsh][13], GNU [Awk][14], and so on.

### Installing BusyBox

On Linux, you can install BusyBox using your package manager. For example, on Fedora and similar:


```
`$ sudo dnf install busybox`
```

On Debian and derivatives:


```
`$ sudo apt install busybox`
```

On macOS, use [MacPorts][15] or [Homebrew][16]. On Windows, use [Chocolatey][17].

You can set BusyBox as your shell using the `chsh --shell` command, followed by the path to the BusyBox `sh` application. I keep BusyBox in `/lib64`, but its location depends on where your distribution installed it.


```
$ which busybox
/lib64/busybox/busybox
$ chsh --shell /lib64/busybox/sh
```

Replacing all common commands wholesale with BusyBox is a little more complex, because most distributions are "hard-wired" to look to specific packages for specific commands. In other words, while it's technically possible to replace `init` with BusyBox's `init`, your package manager may refuse to allow you to remove the package containing `init` for fear of you causing your system to become non-bootable. There are some distributions built upon BusyBox, so starting fresh is probably the easiest way to experience a system built around BusyBox.

### Try BusyBox

You don't have to change your shell to BusyBox permanently just to try it. You can launch a BusyBox shell from your current shell:


```
$ busybox sh
~ $
```

Your system still has the non-BusyBox versions of commands installed, though, so to experience BusyBox's tools, you must issue commands as arguments to the `busybox` executable:


```
~ $ busybox echo $0
sh
~ $ busybox ls --help
BusyBox vX.YY.Z (2021-08-25 07:31:48 NZST) multi-call binary.

Usage: ls [-1AaCxdLHRFplinshrSXvctu] [-w WIDTH] [FILE]...

List directory contents

 -1  One column output
 -a  Include entries that start with .
 -A  Like -a, but exclude . and ..
 -x  List by lines
[...]
```

For the "full" BusyBox experience, you can create symlinks to `busybox` for each command. This is easier than it sounds, as long as you use a [for-loop][18]:


```
$ mkdir bbx
$ for i in $(bbx --list); do \
ln -s /path/to/busybox bbx/$i \
done
```

Add your directory of symlinks at the _start_ of your [path][19], and launch BusyBox:


```
`$ PATH=$(pwd)/bbx:$PATH bbx/sh`
```

### Get busy

BusyBox is a fun project and an example of just how _minimal_ computing can be. Whether you use BusyBox as a lightweight environment for an [ancient computer][20] [you've rescued][21], as the userland for an [embedded device][22], to trial a new init system, or just as a curiosity, it can be fun reacquainting yourself with old familiar, yet somehow new, commands.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/what-busybox

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://opensource.com/article/21/8/navigate-linux-directories
[3]: https://opensource.com/article/18/5/how-kill-process-stop-program-linux
[4]: https://opensource.com/article/19/7/master-ls-command
[5]: https://opensource.com/article/19/8/moving-files-linux-depth
[6]: https://opensource.com/article/19/2/getting-started-cat-command
[7]: https://www.busybox.net
[8]: https://opensource.com/article/20/4/systemd
[9]: https://opensource.com/article/21/3/rtos-embedded-development
[10]: https://opensource.com/article/17/9/what-edge-computing
[11]: https://opensource.com/article/21/3/iot-measure-raspberry-pi
[12]: https://opensource.com/article/20/4/bash-sysadmins-ebook
[13]: https://opensource.com/article/19/9/getting-started-zsh
[14]: https://opensource.com/article/20/9/awk-ebook
[15]: https://opensource.com/article/20/11/macports
[16]: https://opensource.com/article/20/6/homebrew-mac
[17]: https://opensource.com/article/20/3/chocolatey
[18]: https://opensource.com/article/19/10/programming-bash-loops
[19]: https://opensource.com/article/17/6/set-path-linux
[20]: https://opensource.com/article/20/2/restore-old-computer-linux
[21]: https://opensource.com/article/19/7/how-make-old-computer-useful-again
[22]: https://opensource.com/article/20/6/open-source-rtos
