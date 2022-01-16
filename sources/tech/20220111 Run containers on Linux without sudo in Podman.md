[#]: subject: "Run containers on Linux without sudo in Podman"
[#]: via: "https://opensource.com/article/22/1/run-containers-without-sudo-podman"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Run containers on Linux without sudo in Podman
======
Configure your system for rootless containers.
![Command line prompt][1]

Containers are an important part of modern computing, and as the infrastructure around containers evolves, new and better tools have started to surface. It used to be that you could run containers with just [LXC][2], and then Docker gained popularity, and things started getting more complex. Eventually, we got the container management system we all deserved with [Podman][3], a daemonless container engine that makes containers and pods easy to build, run, and manage.

Containers interface directly with Linux kernel abilities like cgroups and namespaces, and they spawn lots of new processes within those namespaces. In short, running a container is literally running a Linux system _inside_ a Linux system. From the operating system's viewpoint, it looks very much like an administrative and privileged activity. Normal users don't usually get to have free reign over system resources the way containers demand, so by default, root or `sudo` permissions are required to run Podman. However, that's only the default setting, and it's by no means the only setting available or intended. This article demonstrates how to configure your Linux system so that a normal user can run Podman without the use of `sudo` ("rootless").

### Namespace user IDs

A [kernel namespace][4] is essentially an imaginary construct that helps Linux keep track of what processes belong together. It's the red queue ropes of Linux. There's not actually a difference between processes in one queue and another, but it's helpful to cordon them off from one another. Keeping them separate is the key to declaring one group of processes a "container" and the other group of processes your OS.

Linux tracks what user or group owns each process by User ID (UID) and Group ID (GID). Normally, a user has access to a thousand or so subordinate UIDs to assign to child processes in a namespace. Because Podman runs an entire subordinate operating system assigned to the user who started the container, you need a lot more than the default allotment of subuids and subgids.

You can grant a user more subuids and subgids with the `usermod` command. For example, to grant more subuids and subgids to the user `tux`, choose a suitably high UID that has no user assigned to it (such as 200,000) and increment it by several thousand:


```


$ sudo usermod \
\--add-subuids 200000-265536 \
\--add-subgids 200000-265536 \
tux

```

### Namespace access

There are limits on namespaces, too. This usually gets set very high, but you can verify the user allotment of namespaces with `systctl`, the kernel parameter tool:


```


$ sysctl --all --pattern user_namespaces
user.max_user_namespaces = 28633

```

That's plenty of namespaces, and it's probably what your distribution has set by default. If your distribution doesn't have that property or has it set very low, then you can create it by entering this text into the file `/etc/sysctl.d/userns.conf`:


```
`user.max_user_namespaces=28633`
```

Load that setting:


```
`$ sudo sysctl -p /etc/sysctl.d/userns.conf`
```

### Run a container without root

Once you've got your configuration set, reboot your computer to ensure that the changes to your user and kernel parameters are loaded and active.

After you reboot, try running a container image:


```


$ podman run -it busybox echo "hello"
hello

```

### Containers like commands

Containers may feel mysterious if you're new to them, but actually, they're no different than your existing Linux system. They are literally processes running on your system, without the cost or barrier of an emulated environment or virtual machine. All that separates a container from your OS are kernel namespaces, so they're really just native processes with different labels on them. Podman makes this more evident than ever, and once you configure Podman to be a rootless command, containers feel more like commands than virtual environments. Podman makes containers and pods easy, so give it a try.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/run-containers-without-sudo-podman

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://opensource.com/article/18/11/behind-scenes-linux-containers
[3]: http://podman.io
[4]: https://opensource.com/article/19/10/namespaces-and-containers-linux
