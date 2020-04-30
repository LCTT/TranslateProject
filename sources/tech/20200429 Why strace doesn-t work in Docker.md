[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why strace doesn't work in Docker)
[#]: via: (https://jvns.ca/blog/2020/04/29/why-strace-doesnt-work-in-docker/)
[#]: author: (Julia Evans https://jvns.ca/)

Why strace doesn't work in Docker
======

While editing the capabilities page of the [how containers work][1] zine, I found myself trying to explain why `strace` doesn’t work in a Docker container.

The problem here is – if you run `strace` in a Docker container, this happens:

```
$ docker run  -it ubuntu:18.04 /bin/bash
$ # ... install strace ...
[email protected]:/# strace ls
strace: ptrace(PTRACE_TRACEME, ...): Operation not permitted
```

strace works using the `ptrace` system call, so if `ptrace` isn’t allowed, it’s definitely not gonna work! This is pretty easy to fix – on my machine, this fixes it:

```
docker run --cap-add=SYS_PTRACE  -it ubuntu:18.04 /bin/bash
```

But I wasn’t interested in fixing it, I wanted to know why it happens. So why does strace not work, and why does `--cap-add=SYS_PTRACE` fix it?

### hypothesis 1: container processes are missing the `CAP_SYS_PTRACE` capability

I always thought the reason was that Docker container processes by default didn’t have the `CAP_SYS_PTRACE` capability. This is consistent with it being fixed by `--cap-add=SYS_PTRACE`, right?

But this actually doesn’t make sense for 2 reasons.

**Reason 1**: Experimentally, as a regular user, I can strace on any process run by my user. But if I check if my current process has the `CAP_SYS_PTRACE` capability, I don’t:

```
$ getpcaps $$
Capabilities for `11589': =
```

**Reason 2**: `man capabilities` says this about `CAP_SYS_PTRACE`:

```
CAP_SYS_PTRACE
       * Trace arbitrary processes using ptrace(2);
```

So the point of `CAP_SYS_PTRACE` is to let you ptrace **arbitrary** processes owned by any user, the way that root usually can. You shouldn’t need it to just ptrace a regular process owned by your user.

And I tested this a third way – I ran a Docker container with `docker run --cap-add=SYS_PTRACE -it ubuntu:18.04 /bin/bash`, dropped the `CAP_SYS_PTRACE` capability, and I could still strace processes even though I didn’t have that capability anymore. What? Why?

### hypothesis 2: something about user namespaces???

My next (much less well-founded) hypothesis was something along the lines of “um, maybe the process is in a different user namespace and strace doesn’t work because of… reasons?” This isn’t really coherent but here’s what happened when I looked into it.

Is the container process in a different user namespace? Well, in the container:

```
[email protected]:/# ls /proc/$$/ns/user -l
... /proc/1/ns/user -> 'user:[4026531837]'
```

On the host:

```
[email protected]:~$ ls /proc/$$/ns/user -l
... /proc/12177/ns/user -> 'user:[4026531837]'
```

Because the user namespace ID (`4026531837`) is the same, the root user in the container is the exact same user as the root user on the host. So there’s definitely no reason it shouldn’t be able to strace processes that it created!

This hypothesis doesn’t make much sense but I hadn’t realized that the root user in a Docker container is the same as the root user on the host, so I thought that was interesting.

### hypothesis 3: the ptrace system call is being blocked by a seccomp-bpf rule

I also knew that Docker uses seccomp-bpf to stop container processes from running a lot of system calls. And ptrace is in the [list of system calls blocked by Docker’s default seccomp profile][2]! (actually the list of allowed system calls is a whitelist, so it’s just that ptrace is not in the default whitelist. But it comes out to the same thing.)

That easily explains why strace wouldn’t work in a Docker container – if the `ptrace` system call is totally blocked, then of course you can’t call it at all and strace would fail.

Let’s verify this hypothesis – if we disable all seccomp rules, can we strace in a Docker container?

```
$ docker run --security-opt seccomp=unconfined -it ubuntu:18.04  /bin/bash
$ strace ls
execve("/bin/ls", ["ls"], 0x7ffc69a65580 /* 8 vars */) = 0
... it works fine ...
```

Yes! It works! Great. Mystery solved, except…

### why does `--cap-add=SYS_PTRACE` fix the problem?

What we still haven’t explained is: why does `--cap-add=SYS_PTRACE` would fix the problem?

The man page for `docker run` explains the `--cap-add` argument this way:

```
--cap-add=[]
   Add Linux capabilities
```

That doesn’t have anything to do with seccomp rules! What’s going on?

### let’s look at the Docker source code.

When the documentation doesn’t help, the only thing to do is go look at the source.

The nice thing about Go is, because dependencies are often vendored in a Go repository, you can just grep the repository to figure out where the code that does a thing is. So I cloned `github.com/moby/moby` and grepped for some things, like `rg CAP_SYS_PTRACE`.

Here’s what I think is going on. In containerd’s seccomp implementation, in [contrib/seccomp/seccomp_default.go][3], there’s a bunch of code that makes sure that if a process has a capability, then it’s also given access (through a seccomp rule) to use the system calls that go with that capability.

```
case "CAP_SYS_PTRACE":
       s.Syscalls = append(s.Syscalls, specs.LinuxSyscall{
           Names: []string{
               "kcmp",
               "process_vm_readv",
               "process_vm_writev",
               "ptrace",
           },
           Action: specs.ActAllow,
           Args:   []specs.LinuxSeccompArg{},
       })
```

There’s some other code that seems to do something very similar in [profiles/seccomp/seccomp.go][4] in moby and the [default seccomp profile][5], so it’s possible that that’s what’s doing it instead.

So I think we have our answer!

### `--cap-add` in Docker does a little more than what it says

The upshot seems to be that `--cap-add` doesn’t do exactly what it says it does in the man page, it’s more like `--cap-add-and-also-whitelist-some-extra-system-calls-if-required`. Which makes sense! If you have a capability like `CAP_SYS_PTRACE` which is supposed to let you use the `process_vm_readv` system call but that system call is blocked by a seccomp profile, that’s not going to help you much!

So allowing the `process_vm_readv` and `ptrace` system calls when you give the container `CAP_SYS_PTRACE` seems like a reasonable choice.

### that’s all!

This was a fun small thing to investigate, and I think it’s a nice example of how containers are made of lots of moving pieces that work together in not-completely-obvious ways.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/04/29/why-strace-doesnt-work-in-docker/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://wizardzines.com/zines/containers
[2]: https://docs.docker.com/engine/security/seccomp/
[3]: https://github.com/containerd/containerd/blob/4be98fa28b62e8a012491d655a4d6818ef87b080/contrib/seccomp/seccomp_default.go#L527-L537
[4]: https://github.com/moby/moby/blob/cc0dfb6e7b22ad120c60a9ce770ea15415767cf9/profiles/seccomp/seccomp.go#L126-L132
[5]: https://github.com/moby/moby/blob/master/profiles/seccomp/default.json#L723-L739
