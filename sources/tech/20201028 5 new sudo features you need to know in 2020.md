[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 new sudo features you need to know in 2020)
[#]: via: (https://opensource.com/article/20/10/sudo-19)
[#]: author: (Peter Czanik https://opensource.com/users/czanik)

5 new sudo features you need to know in 2020
======
From central session recording through chroot support to Python API,
sudo 1.9 offers many new features.
![Wratchet set tools][1]

When you want to perform an action on a [POSIX system][2], one of the safest ways to do so is to use the sudo command. Unlike logging in as the root user and performing what could be a dangerous action, sudo grants any user [designated as a "sudoer"][3]  by the sysadmin temporary permission to perform a normally restricted activity.

This system has helped keep Linux, Unix, and macOS systems safe from silly mistakes and malicious attacks for decades, and it is the default administrative mechanism on all major Linux distributions today.

When it was released in May 2020, sudo 1.9 brought many new features, including central collection of session recordings, support for chroot within sudo, and a Python API. If you are surprised by any of these, read my article about some [lesser-known features of sudo][4].

Sudo is a lot more than just a prefix for administrative commands. You can fine-tune permissions, record what is happening on the terminal, extend sudo using plugins, store configurations in LDAP, do extensive logging, and much more.

Version 1.9.0 and subsequent minor releases added a variety of new features (which I'll describe below), including:

  * A recording service to collect sudo session recordings centrally
  * Audit plugin API
  * Approval plugin API
  * Python support for plugins
  * Chroot and CWD support built into sudo (starting with 1.9.3)



### Where to get sudo 1.9

Most Linux distributions still package the previous generation of sudo (version 1.8), and it will stay that way in long-term support (LTS) releases for several years. The most complete sudo 1.9 package I am aware of in a Linux distribution is openSUSE [Tumbleweed][5], which is a rolling distro, and the sudo package has Python support available in a subpackage. Recent [Fedora][6] releases include sudo 1.9 but without Python. [FreeBSD Ports][7] has the latest sudo version available, and you can enable Python support if you build sudo yourself instead of using the package.

If your favorite Linux distribution does not yet include sudo 1.9, check the [sudo binaries page][8] to see if a ready-to-use package is available for your system. This page also has packages for several commercial Unix variants.

As usual, before you start experimenting with sudo settings, _make sure you know the root password_. Yes, even on Ubuntu. Having a temporary "backdoor" is important; without it, you would have to hack your own system if something goes wrong. And remember: a syntactically correct configuration does not mean that anybody can do anything through sudo on that system!

### Recording service

The recording service collects session recordings centrally. This offers many advantages compared to local session log storage:

  * It is more convenient to search in one place instead of visiting individual machines for recordings
  * Recordings are available even if the sending machine is down
  * Recordings cannot be deleted by local users who want to cover their tracks



For a quick test, you can send sessions through non-encrypted connections to the recording service. My blog contains [instructions][9] for setting it up in just a few minutes. For a production setup, I recommend using encryption. There are many possibilities, so read the [documentation][10] that best suits your environment.

### Audit plugin API

The new audit plugin API is not a user-visible feature. In other words, you cannot configure it from the sudoers file. It is an API, meaning that you can access audit information from plugins, including ones written in Python. You can use it in many different ways, like sending events from sudo directly to Elasticsearch or Logging-as-a-Service (LaaS) when something interesting happens. You can also use it for debugging and print otherwise difficult-to-access information to the screen in whatever format you like.

Depending on how you want to use it, you can find its documentation in the sudo plugin manual page (for C) and the sudo Python plugin manual. [Sample Python code][11] is available in the sudo source code, and there is also a [simplified example][12] on my blog.

### Approval plugin API

The approval plugin API makes it possible to include extra restrictions before a command will execute. These will run only after the policy plugin succeeds, so you can effectively add additional policy layers without replacing the policy plugin and thus sudoers. Multiple approval plugins may be defined, and all must succeed for the command to execute.

As with the audit plugin API, you can use it both from C and Python. The [sample Python code][13] documented on my blog is a good introduction to the API. Once you understand how it works, you can extend it to connect sudo to ticketing systems and approve sessions only with a related open ticket. You can also connect to an HR database so that only the engineer on duty can gain administrative privileges.

### Python support for plugins

Even though I am not a programmer, my favorite new sudo 1.9 feature is Python support for plugins. You can use most of the APIs available from C with Python as well. Luckily, sudo is not performance-sensitive, so the relatively slow speed of running Python code is not a problem for sudo. Using Python for extending sudo has many advantages:

  * Easier, faster development
  * No need to compile; code might even be distributed by configuration management
  * Many APIs do not have ready-to-use C clients, but Python code is available



In addition to the audit and approval plugin APIs, there are a few others available, and you can do very interesting things with them.

By using the policy plugin API, you can replace the sudo policy engine. Note you will lose most sudo features, and there is no more sudoers-based configuration. This can still be useful in niche cases, but most of the time, it is better to keep using sudoers and create additional policies using the approval plugin API. If you want to give it a try, my [introduction to the Python plugin][14] provides a very simple policy: allowing only the `id` command. Once again, make sure you know the root password, as once this policy is enabled, it prevents any practical use of sudo.

Using the I/O logs API, you can access input and output from user sessions. This means you can analyze what is happening in a session and even terminate it if you find something suspicious. This API has many possible uses, such as data-leak prevention. You can monitor the screen for keywords and, if any of them appear in the data stream, you can break the connection before the keyword can appear on the user's screen. Another possibility is checking what the user is typing and using that data to reconstruct the command line the user is entering. For example, if a user enters `rm -fr /`, you can disconnect the user even before Enter is hit.

The group plugin API allows non-Unix group lookups. In a way, this is similar to the approval plugin API as it also extends the policy plugin. You can check if a user is part of a given group and act based on this in later parts of the configuration.

### Chroot and CWD support

The latest additions to sudo are chroot and change working directory (CWD) support. Neither option is enabled by default—you need to explicitly enable them in the sudoers file. When they're enabled, you can fine-tune target directories or allow users to specify which directory to use. The logs reflect when these settings were used.

On most systems, chroot is available only to root. If one of your users needs chroot, you need to give them root access, which gives them a lot more power than just chroot. Alternately, you can allow access to the chroot command through sudo, but it still allows loopholes where they can gain full access. When you use sudo's built-in chroot support, you can easily restrict access to a single directory. You can also give users the flexibility to specify the root directory. Of course, this might lead to disasters (e.g., `sudo --chroot / -s`), but at least the event is logged.

When you run a command through sudo, it sets the working directory to the current directory. This is the expected behavior, but there may be cases when the command needs to be run in a different directory. For example, I recall using an application that checked my privileges by checking whether my working directory was `/root`.

### Try the new features

I hope that this article inspires you to take a closer look at sudo 1.9. Central session recording is both more convenient and secure than storing session logs locally. Chroot and CWD support give you additional security and flexibility. And using Python to extend sudo makes it easy to custom-tailor sudo to your environment. You can try the new features by using one of the latest Linux distributions or the ready-to-use packages from the sudo website.

If you want to learn more about sudo, here are a few resources:

  * [Sudo website][15]
  * [Sudo blog][16]
  * [Sudo on Twitter][17]



--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/sudo-19

作者：[Peter Czanik][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/czanik
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_osyearbook2016_sysadmin_cc.png?itok=Y1AHCKI4 (Wratchet set tools)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://opensource.com/article/17/12/using-sudo-delegate
[4]: https://opensource.com/article/19/10/know-about-sudo
[5]: https://software.opensuse.org/distributions/tumbleweed
[6]: https://getfedora.org/
[7]: https://www.freebsd.org/ports/
[8]: https://www.sudo.ws/download.html#binary
[9]: https://blog.sudo.ws/posts/2020/03/whats-new-in-sudo-1.9-recording-service/
[10]: https://www.sudo.ws/man/sudo_logsrvd.man.html#EXAMPLES
[11]: https://github.com/sudo-project/sudo/blob/master/plugins/python/example_audit_plugin.py
[12]: https://blog.sudo.ws/posts/2020/06/sudo-1.9-using-the-new-audit-api-from-python/
[13]: https://blog.sudo.ws/posts/2020/08/sudo-1.9-using-the-new-approval-api-from-python/
[14]: https://blog.sudo.ws/posts/2020/01/whats-new-in-sudo-1.9-python/
[15]: https://www.sudo.ws/
[16]: https://blog.sudo.ws/
[17]: https://twitter.com/sudoproject
