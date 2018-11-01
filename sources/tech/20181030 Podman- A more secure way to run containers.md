Podman: A more secure way to run containers
======
Podman uses a traditional fork/exec model (vs. a client/server model) for running containers.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-cloud-safe.png?itok=yj2TFPzq)

Before I get into the main topic of this article, [Podman][1] and containers, I need to get a little technical about the Linux audit feature.

### What is audit?

The Linux kernel has an interesting security feature called **audit**. It allows administrators to watch for security events on a system and have them logged to the audit.log, which can be stored locally or remotely on another machine to prevent a hacker from trying to cover his tracks.

The **/etc/shadow** file is a common security file to watch, since adding a record to it could allow an attacker to get return access to the system. Administrators want to know if any process modified the file. You can do this by executing the command:

```
# auditctl -w /etc/shadow
```

Now let's see what happens if I modify the /etc/shadow file:

```
# touch /etc/shadow 
# ausearch -f /etc/shadow -i -ts recent

type=PROCTITLE msg=audit(10/10/2018 09:46:03.042:4108) : proctitle=touch /etc/shadow type=SYSCALL msg=audit(10/10/2018 09:46:03.042:4108) : arch=x86_64 syscall=openat success=yes exit=3 a0=0xffffff9c a1=0x7ffdb17f6704 a2=O_WRONLY|O_CREAT|O_NOCTTY| O_NONBLOCK a3=0x1b6 items=2 ppid=2712 pid=3727 auid=dwalsh uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=pts1 ses=3 comm=touch exe=/usr/bin/touch subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)`
```

There's a lot of information in the audit record, but I highlighted that it recorded that root modified the /etc/shadow file and the owner of the process' audit UID ( **auid** ) was **dwalsh**.

Did the kernel do that?

#### Tracking the login UID

**loginuid** , stored in **/proc/self/loginuid** , that is part of the proc struct of every process on the system. This field can be set only once; after it is set, the kernel will not allow any process to reset it.

There is a field called, stored in, that is part of the proc struct of every process on the system. This field can be set only once; after it is set, the kernel will not allow any process to reset it.

When I log into the system, the login program sets the loginuid field for my login process.

My UID, dwalsh, is 3267.

```
$ cat /proc/self/loginuid
3267
```

Now, even if I become root, my login UID stays the same.

```
$ sudo cat /proc/self/loginuid
3267
```

Note that every process that's forked and executed from the initial login process automatically inherits the loginuid. This is how the kernel knew that the person who logged was dwalsh.

### Containers

Now let's look at containers.

```
sudo podman run fedora cat /proc/self/loginuid
3267
```

Even the container process retains my loginuid. Now let's try with Docker.

```
sudo docker run fedora cat /proc/self/loginuid 
4294967295
```

### Why the difference?

Podman uses a traditional fork/exec model for the container, so the container process is an offspring of the Podman process. Docker uses a client/server model. The **docker** command I executed is the Docker client tool, and it communicates with the Docker daemon via a client/server operation. Then the Docker daemon creates the container and handles communications of stdin/stdout back to the Docker client tool.

The default loginuid of processes (before their loginuid is set) is 4294967295. Since the container is an offspring of the Docker daemon and the Docker daemon is a child of the init system, we see that systemd, Docker daemon, and the container processes all have the same loginuid, 4294967295, which audit refers to as the unset audit UID.

```
cat /proc/1/loginuid 
4294967295
```

### How can this be abused?

Let's look at what would happen if a container process launched by Docker modifies the /etc/shadow file.

```
$ sudo docker run --privileged -v /:/host fedora touch /host/etc/shadow 
$ sudo ausearch -f /etc/shadow -i type=PROCTITLE msg=audit(10/10/2018 10:27:20.055:4569) : proctitle=/usr/bin/coreutils --coreutils-prog-shebang=touch /usr/bin/touch /host/etc/shadow type=SYSCALL msg=audit(10/10/2018 10:27:20.055:4569) : arch=x86_64 syscall=openat success=yes exit=3 a0=0xffffff9c a1=0x7ffdb6973f50 a2=O_WRONLY|O_CREAT|O_NOCTTY| O_NONBLOCK a3=0x1b6 items=2 ppid=11863 pid=11882 auid=unset uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=(none) ses=unset comm=touch exe=/usr/bin/coreutils subj=system_u:system_r:spc_t:s0 key=(null)
```

In the Docker case, the auid is unset (4294967295); this means the security officer might know that a process modified the /etc/shadow file but the identity was lost.

If that attacker then removed the Docker container, there would be no trace on the system of who modified the /etc/shadow file.

Now let's look at the exact same scenario with Podman.

```
$ sudo podman run --privileged -v /:/host fedora touch /host/etc/shadow 
$ sudo ausearch -f /etc/shadow -i type=PROCTITLE msg=audit(10/10/2018 10:23:41.659:4530) : proctitle=/usr/bin/coreutils --coreutils-prog-shebang=touch /usr/bin/touch /host/etc/shadow type=SYSCALL msg=audit(10/10/2018 10:23:41.659:4530) : arch=x86_64 syscall=openat success=yes exit=3 a0=0xffffff9c a1=0x7fffdffd0f34 a2=O_WRONLY|O_CREAT|O_NOCTTY| O_NONBLOCK a3=0x1b6 items=2 ppid=11671 pid=11683 auid=dwalsh uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=(none) ses=3 comm=touch exe=/usr/bin/coreutils subj=unconfined_u:system_r:spc_t:s0 key=(null)
```

Everything is recorded correctly with Podman since it uses traditional fork/exec.

This was just a simple example of watching the /etc/shadow file, but the auditing system is very powerful for watching what processes do on a system. Using a fork/exec container runtime for launching containers (instead of a client/server container runtime) allows you to maintain better security through audit logging.

### Final thoughts

There are many other nice features about the fork/exec model versus the client/server model when launching containers. For example, systemd features include:

  * **SD_NOTIFY:** If you put a Podman command into a systemd unit file, the container process can return notice up the stack through Podman that the service is ready to receive tasks. This is something that can't be done in client/server mode.
  * **Socket activation:** You can pass down connected sockets from systemd to Podman and onto the container process to use them. This is impossible in the client/server model.



The nicest feature, in my opinion, is **running Podman and containers as a non-root user**. This means you never have give a user root privileges on the host, while in the client/server model (like Docker employs), you must open a socket to a privileged daemon running as root to launch the containers. There you are at the mercy of the security mechanisms implemented in the daemon versus the security mechanisms implemented in the host operating systems—a dangerous proposition.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/podman-more-secure-way-run-containers

作者：[Daniel J Walsh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rhatdan
[b]: https://github.com/lujun9972
[1]: https://podman.io
