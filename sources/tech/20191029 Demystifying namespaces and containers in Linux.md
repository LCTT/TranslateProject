[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Demystifying namespaces and containers in Linux)
[#]: via: (https://opensource.com/article/19/10/namespaces-and-containers-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Demystifying namespaces and containers in Linux
======
Peek behind the curtains to understand the backend of Linux container
technology.
![cubes coming together to create a larger cube][1]

Containers have taken the world by storm. Whether you think of Kubernetes, Docker, CoreOS, Silverblue, or Flatpak when you hear the term, it's clear that modern applications are running in containers for convenience, security, and scalability.

Containers can be confusing to understand, though. What does it mean to run in a container? How can processes in a container interact with the rest of the computer they're running on? Open source dislikes mystery, so this article explains the backend of container technology, just as [my article on Flatpak][2] explained a common frontend.

### Namespaces

Namespaces are common in the programming world. If you dwell in the highly technical places of the computer world, then you have probably seen code like this:


```
`using namespace std;`
```

Or you may have seen this in XML:


```
`<book xmlns="http://docbook.org/ns/docbook" xml:lang="en">`
```

These kinds of phrases provide context for commands used later in a source code file. The only reason C++ knows, for instance, what programmers mean when they type **cout** is because C++ knows the **cout** namespace is a meaningful word.

If that's too technical for you to picture, you may be surprised to learn that we all use namespaces every day in real life, too. We don't call them namespaces, but we use the concept all the time. For instance, the phrase "I'm a fan of the Enterprise" has one meaning in an IT company that serves large businesses (which are commonly called "enterprises"), but it may have a different meaning at a science fiction convention. The question "what engine is it running?" has one meaning in a garage and a different meaning in web development. We don't always declare a namespace in casual conversation because we're human, and our brains can adapt quickly to determine context, but for computers, the namespace must be declared explicitly.

For containers, a namespace is what defines the boundaries of a process' "awareness" of what else is running around it.

### lsns

You may not realize it, but your Linux machine quietly maintains different namespaces specific to given processes. By using a recent version of the **util-linux** package, you can list existing namespaces on your machine:


```
$ lsns
        NS TYPE   NPROCS   PID USER    COMMAND
4026531835 cgroup     85  1571 seth /usr/lib/systemd/systemd --user
4026531836 pid        85  1571 seth /usr/lib/systemd/systemd --user
4026531837 user       80  1571 seth /usr/lib/systemd/systemd --user
4026532601 user        1  6266 seth /usr/lib64/firefox/firefox [...]
4026532928 net         1  7164 seth /usr/lib64/firefox/firefox [...]
[...]
```

If your version of **util-linux** doesn't provide the **lsns** command, you can see namespace entries in **/proc**:


```
$ ls /proc/*/ns
1571
6266
7164
[...]
$ ls /proc/6266/ns
ipc net pid user uts [...]
```

Each process running on your Linux machine is enumerated with a process ID (PID). Each PID is assigned a namespace. PIDs in the same namespace can have access to one another because they are programmed to operate within a given namespace. PIDs in different namespaces are unable to interact with one another by default because they are running in a different context, or _namespace_. This is why a process running in a "container" under one namespace cannot access information outside its container or information running inside a different container.

### Creating a new namespace

A usual feature of software dealing with containers is automatic namespace management. A human administrator starting up a new containerized application or environment doesn't have to use **lsns** to check which namespaces exist and then create a new one manually; the software using PID namespaces does that automatically with the help of the Linux kernel. However, you can mimic the process manually to gain a better understanding of what's happening behind the scenes.

First, you need to identify a process that is _not_ running on your computer. For this example, I'll use the Z shell ([Zsh][3]) because I'm running the Bash shell on my machine. If you're running Zsh on your computer, then use **Bash** or **tcsh** or some other shell that you're not currently running. The goal is to find something that you can prove is not running. You can prove something is not running with the **pidof** command, which queries your system to discover the PID of any application you name:


```
$ pidof zsh
$ sudo pidof zsh
```

As long as no PID is returned, the application you have queried is not running.

#### Unshare

The **unshare** command runs a program in a namespace _unshared_ from its parent process. There are many kinds of namespaces available, so read the **unshare** man page for all options available.

To create a new namespace for your test command:


```
$ sudo unshare --fork --pid --mount-proc zsh
%
```

Because Zsh is an interactive shell, it conveniently brings you into its namespace upon launch. Not all processes do that, because some processes run in the background, leaving you at a prompt in its native namespace. As long as you remain in the Zsh session, you can see that you have left the usual namespace by looking at the PID of your new forked process:


```
% pidof zsh
pid 1
```

If you know anything about Linux process IDs, then you know that PID 1 is always reserved, mostly by nature of the boot process, for the initialization application (systemd on most distributions outside of Slackware, Devuan, and maybe some customized installations of Arch). It's next to impossible for Zsh, or any application that isn't a boot initialization application, to be PID 1 (because without an init system, a computer wouldn't know how to boot up). Yet, as far as your shell knows in this demonstration, Zsh occupies the PID 1 slot.

Despite what your shell is now telling you, PID 1 on your system has _not_ been replaced. Open a second terminal or terminal tab on your computer and look at PID 1:


```
$ ps 1
init
```

And then find the PID of Zsh:


```
$ pidof zsh
7723
```

As you can see, your "host" system sees the big picture and understands that Zsh is actually running as some high-numbered PID (it probably won't be 7723 on your computer, except by coincidence). Zsh sees itself as PID 1 only because its scope is confined to (or _contained_ within) its namespace. Once you have forked a process into its own namespace, its children processes are numbered starting from 1, but only within that namespace.

Namespaces, along with other technologies like **cgroups** and more, form the foundation of containerization. Understanding that namespaces exist within the context of the wider namespace of a host environment (in this demonstration, that's your computer, but in the real world the host is typically a server or a hybrid cloud) can help you understand how and why containerized applications act the way they do. For instance, a container running a Wordpress blog doesn't "know" it's not running in a container; it knows that it has access to a kernel and some RAM and whatever configuration files you've provided it, but it probably can't access your home directory or any directory you haven't specifically given it permission to access. Furthermore, a runaway process within that blog software can't affect any other process on your system, because as far as it knows, the PID "tree" only goes back to 1, and 1 is the container it's running in.

Containers are a powerful Linux feature, and they're getting more popular every day. Now that you understand how they work, try exploring container technology such as Kubernetes, Silverblue, or Flatpak, and see what you can do with containerized apps. Containers are Linux, so start them up, inspect them carefully, and learn as you go.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/namespaces-and-containers-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cube_innovation_process_block_container.png?itok=vkPYmSRQ (cubes coming together to create a larger cube)
[2]: https://opensource.com/article/19/10/how-build-flatpak-packaging
[3]: https://opensource.com/article/19/9/getting-started-zsh
