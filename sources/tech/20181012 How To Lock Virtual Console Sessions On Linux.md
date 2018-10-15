How To Lock Virtual Console Sessions On Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/vlock-720x340.png)

When you’re working on a shared system, you might not want the other users to sneak peak in your console to know what you’re actually doing. If so, I know a simple trick to lock your own session while still allowing other users to use the system on other virtual consoles. Thanks to **Vlock** , stands for **V** irtual Console **lock** , a command line program to lock one or more sessions on the Linux console. If necessary, you can lock the entire console and disable the virtual console switching functionality altogether. Vlock is especially useful for the shared Linux systems which have multiple users with access to the console.

### Installing Vlock

On Arch-based systems, the Vlock package is replaced with **kpd** package which is preinstalled by default, so you need not to bother with installation.

On Debian, Ubuntu, Linux Mint, run the following command to install Vlock:

```
    $ sudo apt-get install vlock
```

On Fedora:

```
    $ sudo dnf install vlock
```

On RHEL, CentOS:

```
    $ sudo yum install vlock
```

### Lock Virtual Console Sessions On Linux

The general syntax for Vlock is:

```
    vlock [ -acnshv ] [ -t <timeout> ] [ plugins... ]
```

Where,

  * **a** – Lock all virtual console sessions,
  * **c** – Lock current virtual console session,
  * **n** – Switch to new empty console before locking all sessions,
  * **s** – Disable SysRq key mechanism,
  * **t** – Specify the timeout for the screensaver plugins,
  * **h** – Display help section,
  * **v** – Display version.



Let me show you some examples.

**1\. Lock current console session**

When running Vlock without any arguments, it locks the current console session (TYY) by default. To unlock the session, you need to enter either the current user’s password or the root password.

```
    $ vlock
```

![](https://www.ostechnix.com/wp-content/uploads/2018/10/vlock-1-1.gif)

You can also use **-c** flag to lock the current console session.

```
    $ vlock -c
```

Please note that this command will only lock the current console. You can switch to other consoles by pressing **ALT+F2**. For more details about switching between TTYs, refer the following guide.

Also, if the system has multiple users, the other users can still access their respective TTYs.

**2\. Lock all console sessions**

To lock all TTYs at the same time and also disable the virtual console switching functionality, run:

```
    $ vlock -a
```

Again, to unlock the console sessions, just press ENTER key and type your current user’s password or root user password.

Please keep in mind that the **root user can always unlock any vlock session** at any time, unless disabled at compile time.

**3. Switch to new virtual console before locking all consoles
**

It is also possible to make Vlock to switch to new empty virtual console from X session before locking all consoles. To do so, use **-n** flag.

```
    $ vlock -n
```

**4. Disable SysRq mechanism
**

As you may know, the Magic SysRq key mechanism allows the users to perform some operations when the system freeze. So the users can unlock the consoles using SysRq. In order to prevent this, pass the **-s** option to disable SysRq mechanism. Please remember, this only works if the **-a** option is given.

```
    $ vlock -sa
```

For more options and its usage, refer the help section or the man pages.

```
    $ vlock -h
    $ man vlock
```

Vlock prevents the unauthorized users from gaining the console access. If you’re looking for a simple console locking mechanism to your Linux machine, Vlock is worth checking!

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-lock-virtual-console-sessions-on-linux/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
