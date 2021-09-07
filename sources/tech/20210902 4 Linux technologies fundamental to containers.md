[#]: subject: "4 Linux technologies fundamental to containers"
[#]: via: "https://opensource.com/article/21/8/container-linux-technology"
[#]: author: "Nived V https://opensource.com/users/nivedv"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

4 Linux technologies fundamental to containers
======
Namespaces, cgroups, seccomp, and SELinux are the Linux technologies
that make up the foundations of building and running a container process
on your system.
![Penguin driving a car with a yellow background][1]

In previous articles, I have written about [container images][2] and [runtimes][3]. In this article, I look at how containers are made possible by a foundation of some special Linux technologies, including namespaces and control groups.

![layers of linux technologies][4]

Figure 1: Linux technologies that contribute to containers
(Nived Velayudhan, [CC BY-SA 4.0][5])

Linux technologies make up the foundations of building and running a container process on your system. Technologies include:

  1. Namespaces
  2. Control groups (cgroups)
  3. Seccomp
  4. SELinux



### Namespaces

_Namespaces_ provide a layer of isolation for the containers by giving the container a view of what appears to be its own Linux filesystem. This limits what a process can see and therefore restricts the resources available to it.

There are several namespaces in the Linux kernel that are used by Docker or Podman and others while creating a container:
 


```
$ docker container run alpine ping 8.8.8.8
$ sudo lsns -p 29413
        NS TYPE   NPROCS PID USER COMMAND
4026531835 cgroup   299   1  root /usr/lib/systemd/systemd --
switched...
4026533105 mnt 1 29413 root ping 8.8.8.8
4026533106 uts 1 29413 root ping 8.8.8.8
4026533105 ipc 1 29413 root ping 8.8.8.8
[...]
```

#### **User**

The user namespace isolates users and groups within a container. This is done by allowing containers to have a different view of UID and GID ranges compared to the host system. The user namespace enables the software to run inside the container as the root user. If an intruder attacks the container and then escapes to the host machine, they're confined to only a non-root identity.

#### **Mnt**

The mnt namespace allows the containers to have their own view of the system's file system hierarchy. You can find the mount points for each container process in the _/proc/&lt;PID&gt;/mounts_ location in your Linux system.

#### **UTS**

The Unix Timesharing System (UTS) namespace allows containers to have a unique hostname and domain name. When you run a container, a random ID is used as the hostname even when using the `— name` tag. You can use the [`unshare` command][6] to get an idea of how this works.


```
$ docker container run -it --name nived alpine sh
/ # hostname
9c9a5edabdd6
/ #
$ sudo unshare -u sh
# hostname isolated.hostname
# hostname
# exit
$ hostname
homelab.redhat.com
```

#### **IPC**

The Inter-Process Communication (IPC) namespace allows different container processes to communicate by accessing a shared range of memory or using a shared message queue.
 


```
# ipcmk -M 10M
Shared memory id: 0
# ipcmk -M 20M
Shared memory id: 1
# ipcs
\---- Message Queues ----
key  msqid  owner  perms  used-bytes  messages

\---- Shared Memory Segments
key        shmid owner perms bytes    nattch status
0xd1df416a 0     root  644   10485760 0
0xbd487a9d 1     root  644   20971520 0
[...]
```

#### **PID**

The Process ID (PID) namespace ensures that the processes running inside a container are isolated from the external world. When you run a `ps` command inside a container, you only see the processes running inside the container and not on the host machine because of this namespace.

#### **Net**

The network namespace allows the container to have its own view of network interface, IP addresses, routing tables, port numbers, and so on. How does a container able to communicate to the external world? All containers you create get attached to a special virtual network interface for communication.

### Control groups (cgroups)

Cgroups are fundamental blocks of making a container. A cgroup allocates and limits resources such as CPU, memory, network I/O that are used by containers. The container engine automatically creates a cgroup filesystem of each type, and sets values for each container when the container is run.

### SECCOMP

Seccomp basically stands for _secure computing_. It is a Linux feature used to restrict the set of system calls that an application is allowed to make. The default seccomp profile for Docker, for example, disables around 44 syscalls (over 300 are available).

The idea here is to provide containers access to only those resources which the container might need. For example, if you don't need the container to change the clock time on your host machine, you probably have no use for the _clock_adjtime_ and _clock_settime_ syscalls, and it makes sense to block them out. Similarly, you don't want the containers to change the kernel modules, so there is no need for them to make _create_module, delete_module_ syscalls.

### SELinux

SELinux stands for _security-enhanced Linux_. If you are running a Red Hat distribution on your hosts, then SELinux is enabled by default. SELinux lets you limit an application to have access only to its own files and prevent any other processes from accessing them. So, if an application is compromised, it would limit the number of files that it can affect or control. It does this by setting up contexts for files and processes and by defining policies that would enforce what a process can see and make changes to.

SELinux policies for containers are defined by the `container-selinux` package. By default, containers are run with the **container_t** label and are allowed to read (r) and execute (x) under the _/usr_ directory and read most content from the _/etc_ directory. The label **container_var_lib_t** is common for files relating to containers.

### Wrap up

Containers are a critical part of today's IT infrastructure and a pretty interesting technology, too. Even if your role doesn't involve containerization directly, understanding a few fundamental container concepts and approaches gives you an appreciation for how they can help your organization. The fact that containers are built on open source Linux technologies makes them even better!

* * *

_This article is based on a [techbeatly][7] article and has been adapted with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/container-linux-technology

作者：[Nived V][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nivedv
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/car-penguin-drive-linux-yellow.png?itok=twWGlYAc (Penguin driving a car with a yellow background)
[2]: https://opensource.com/article/21/8/container-fundamentals-2
[3]: https://opensource.com/article/21/8/deep-dive-container-runtimes
[4]: https://opensource.com/sites/default/files/1linuxtechs.png (layers of linux technologies)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/article/19/10/namespaces-and-containers-linux
[7]: https://nivedv.medium.com/container-internals-deep-dive-5cc424957413
