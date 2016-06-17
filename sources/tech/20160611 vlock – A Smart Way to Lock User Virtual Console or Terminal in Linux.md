vlock – A Smart Way to Lock User Virtual Console or Terminal in Linux
=======================================================================

Virtual consoles are very important features of Linux, and they provide a system user a shell prompt to use the system in a non-graphical setup which you can only use on the physical machine but not remotely.

A user can use several virtual console sessions at the same time just by switching form one virtual console to another.

![](http://www.tecmint.com/wp-content/uploads/2016/05/vlock-Lock-User-Terminal-in-Linux.png)
>vlock Lock User Console or Terminal in Linux

In this how to guide, we shall look at how to lock user virtual console or terminal console in Linux systems using vlock program.

### What is vlock?

vlock is a utility used to lock one or several user virtual console sessions. vlock is important on a multi user system, it allows users to lock their own sessions while other users can still use the same system via other virtual consoles. Where necessary, the entire console can be locked down and also switching virtual console disabled.

vlock primarily works for console sessions and also has support for locking non-console sessions but this has not been tested fully.

### Installing vlock in Linux

To install vlock program on your respective Linux systems, use:

```
# yum install vlock           [On RHEL / CentOS / Fedora]
$ sudo apt-get install vlock  [On Ubuntu / Debian / Mint]
```

### How to use vlock in Linux

There are few options that you can use with vlock and the general syntax is:

```
# vlock option
# vlock option plugin
# vlock option -t <timeout> plugin
```

#### vlock common options and usage:

1. To lock current virtual console or terminal session of user, run the following command:

  ```
  # vlock --current
  ```
  
  ![](http://www.tecmint.com/wp-content/uploads/2016/05/Lock-User-Terminal-Session-in-Linux.png)
  >Lock User Terminal Session in Linux
  
  The options -c or --current, means lock the current session and it is the default behavior when you run vlock.

2. To lock all your virtual console sessions and also disable virtual console switching, run the command below:

  ```
  # vlock --all
  ```
  
  ![](http://www.tecmint.com/wp-content/uploads/2016/05/Lock-All-Linux-Terminal-Sessions.png)
  >Lock All Linux Terminal Sessions
  
  The options -a or --all, when used, it locks all user’s console sessions and also disables virtual console switching.

  These other options can only work when vlock was compiled with plugin support and they include:

3. The options -n or --new, when invoked, it means switch to a new virtual console before user’s console sessions are locked.
  ```
  # vlock --new
  ```

4. The options -s or --disable-sysrq, it disables the SysRq mechanism while virtual consoles are locked by a user and works only when -a or --all is invoked.

  ```
  # vlock -sa
  ```

5. The options -t or --timeout <time_in_seconds>, invoked to set a timeout for screensaver plugin.
  
  ```
  # vlock --timeout 5
  ```

You can use `-h` or `--help` and `-v` or `--version` to view help messages and version respectively.

We shall leave it at that and also know that you can include a `~/.vlockrc` file which is read by vlock program during system startup and [add the environmental variables][1] that you can check in the manaul entry page, especially users of Debian based distros.

To find out more or add any information which may not be included here, simply drop a message below in the comment section.
  
--------------------------------------------------------------------------------

via: http://www.tecmint.com/vlock-lock-user-virtual-console-terminal-linux/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+tecmint+%28Tecmint%3A+Linux+Howto%27s+Guide%29

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: http://www.tecmint.com/set-path-variable-linux-permanently/
