[#]: collector: (lujun9972)
[#]: translator: (LuuMing)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tracking down library injections on Linux)
[#]: via: (https://www.networkworld.com/article/3404621/tracking-down-library-injections-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Tracking down library injections on Linux
======
Library injections are less common on Linux than they are on Windows, but they're still a problem. Here's a look at how they work and how to identify them.
![Sandra Henry-Stocker][1]

While not nearly commonly seen on Linux systems, library (shared object files on Linux) injections are still a serious threat. On interviewing Jaime Blasco from AT&amp;T's Alien Labs, I've become more aware of how easily some of these attacks are conducted.

In this post, I'll cover one method of attack and some ways that it can be detected. I'll also provide some links that will provide more details on both attack methods and detection tools. First, a little background.

**[ Two-Minute Linux Tips: [Learn how to master a host of Linux commands in these 2-minute video tutorials][2] ]**

### Shared library vulnerability

Both DLL and .so files are shared library files that allow code (and sometimes data) to be shared by various processes. Commonly used code might be put into one of these files so that it can be reused rather than rewritten many times over for each process that requires it. This also facilitates management of commonly used code.

Linux processes often make use of many of these shared libraries. The **ldd** (display shared object dependencies) command can display these for any program file. Here are some examples:

```
$ ldd /bin/date
        linux-vdso.so.1 (0x00007ffc5f179000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f02bea15000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f02bec3a000)
$ ldd /bin/netstat
        linux-vdso.so.1 (0x00007ffcb67cd000)
        libselinux.so.1 => /lib/x86_64-linux-gnu/libselinux.so.1 (0x00007f45e5d7b000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f45e5b90000)
        libpcre.so.3 => /lib/x86_64-linux-gnu/libpcre.so.3 (0x00007f45e5b1c000)
        libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f45e5b16000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f45e5dec000)
        libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f45e5af5000)
```

The **linux-vdso.so.1** file (which may have a different name on some systems) is one that the kernel automatically maps into the address space of every process. Its job is to find and locate other shared libraries that the process requires.

One way that this library-loading mechanism is exploited is through the use of an environment variable called **LD_PRELOAD**. As Jaime Blasco explains in his research, "LD_PRELOAD is the easiest and most popular way to load a shared library in a process at startup. This environmental variable can be configured with a path to the shared library to be loaded before any other shared object."

To illustrate how easily this is done, I created an extremely simple shared library and assigned it to my (formerly non-existent) LD_PRELOAD environment variable. Then I used the **ldd** command to see how this would affect a commonly used Linux command.

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][3] ]**

```
$ export LD_PRELOAD=/home/shs/shownum.so
$ ldd /bin/date
        linux-vdso.so.1 (0x00007ffe005ce000)
        /home/shs/shownum.so (0x00007f1e6b65f000)     <== there it is
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f1e6b458000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f1e6b682000)
```

Note that doing nothing more than assigning my new library to LD_PRELOAD now affects any process that I run.

Since the libraries specified by the LD_PRELOAD setting are the first to load (following linux-vdso.so.1), those libraries could significantly change a process. They could, for example, redirect system calls to their own resources or make unexpected changes in how the process being run behaves.

### The osquery tool can detect library injections

The **osquery** tool (downloadable from [osquery.io][4] is a tool that provides a very unique way of looking at Linux systems. It basically represents the operating system as a high-performance relational database. And, as you probably suspect, that means it can be queried and SQL tables created that provide details on such things as:

  * Running processes
  * Loaded kernel modules
  * Open network connections



One kernel table that provides information on running processes is called **process_envs**. It provides details on environment variables used by various processes. With a fairly complicated query provided by Jaime Blasco, you can get osquery to identify processes that are using LD_PRELOAD.

Note that this query pulls data from the **process_envs** table. The attack ID (T1055) is a reference to [Mitre's explanation of the attack method][5]:

```
SELECT process_envs.pid as source_process_id, process_envs.key as environment_variable_key, process_envs.value as environment_variable_value, processes.name as source_process, processes.path as file_path, processes.cmdline as source_process_commandline, processes.cwd as current_working_directory, 'T1055' as event_attack_id, 'Process Injection' as event_attack_technique, 'Defense Evasion, Privilege Escalation' as event_attack_tactic FROM process_envs join processes USING (pid) WHERE key = 'LD_PRELOAD';
```

Note that the LD_PRELOAD environment variable is at times used legitimately. Various security monitoring tools, for example, could use it, as might developers while they are troubleshooting, debugging or doing performance analysis. However, its use is still quite uncommon and should be viewed with some suspicion.

It's also worth noting that osquery can be used interactively or be run as a daemon (osqueryd) for scheduled queries. See the reference at the bottom of this post for more on this.

You might also be able to locate use of LD_PRELOAD by examining users' environment settings. If LD_PRELOAD is configured in a user account, you might determine that with a command like this (after asssuming the individual's identity):

```
$ env | grep PRELOAD
LD_PRELOAD=/home/username/userlib.so
```

If you've not previously heard of osquery, don't take it too hard. It's now in the process of becoming a more popular tool. Just last week, in fact, the Linux Foundation announced its intention to support the osquery commmunity with a brand-new [osquery foundation][6].

#### Wrap-up

While library injection remains a serious threat, it's helpful to know that some excellent tools are available to help detect its use on your systems.

#### Additional resources

Links to important references and tools:

  * [Hunting for Linux library injection with osquery][7] from AT&amp;T Cybersecurity
  * [Linux: How's My Memory?][8] from TrustedSec
  * [Download site for osquery][4]
  * [osquery schema][9]
  * [osqueryd (osquery deamon)][10]
  * [Mitre's attack framework][11]
  * [New osquery foundation announced][6]



Join the Network World communities on [Facebook][12] and [LinkedIn][13] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3404621/tracking-down-library-injections-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/06/dll-injection-100800196-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[4]: https://osquery.io/
[5]: https://attack.mitre.org/techniques/T1055/
[6]: https://www.linuxfoundation.org/press-release/2019/06/the-linux-foundation-announces-intent-to-form-new-foundation-to-support-osquery-community/
[7]: https://www.alienvault.com/blogs/labs-research/hunting-for-linux-library-injection-with-osquery
[8]: https://www.trustedsec.com/2018/09/linux-hows-my-memory/
[9]: https://osquery.io/schema/3.3.2
[10]: https://osquery.readthedocs.io/en/stable/deployment/configuration/#schedule
[11]: https://attack.mitre.org/
[12]: https://www.facebook.com/NetworkWorld/
[13]: https://www.linkedin.com/company/network-world
