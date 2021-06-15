[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12251-1.html)
[#]: subject: (Why strace doesn't work in Docker)
[#]: via: (https://jvns.ca/blog/2020/04/29/why-strace-doesnt-work-in-docker/)
[#]: author: (Julia Evans https://jvns.ca/)

为什么 strace 在 Docker 中不起作用？
======

在编辑“容器如何工作”爱好者杂志的能力页面时，我想试着解释一下为什么 `strace` 在 Docker 容器中无法工作。

这里的问题是 —— 如果我在笔记本上的 Docker 容器中运行 `strace`，就会出现这种情况：

```
$ docker run  -it ubuntu:18.04 /bin/bash
$ # ... install strace ...
[email protected]:/# strace ls
strace: ptrace(PTRACE_TRACEME, ...): Operation not permitted
```

`strace` 通过 `ptrace` 系统调用起作用，所以如果不允许使用 `ptrace`，它肯定是不能工作的! 这个问题很容易解决 —— 在我的机器上，是这样解决的：

```
docker run --cap-add=SYS_PTRACE  -it ubuntu:18.04 /bin/bash
```

但我对如何修复它不感兴趣，我想知道为什么会出现这种情况。为什么 `strace` 不能工作，为什么`--cap-add=SYS_PTRACE` 可以解决这个问题？

### 假设 1：容器进程缺少 `CAP_SYS_PTRACE` 能力。

我一直以为原因是 Docker 容器进程默认不具备 `CAP_SYS_PTRACE` 能力。这和它可以被 `--cap-add=SYS_PTRACE` 修复是一回事，是吧？

但这实际上是不合理的，原因有两个。

原因 1：在实验中，作为一个普通用户，我可以对我的用户运行的任何进程进行 `strace`。但如果我检查我的当前进程是否有 `CAP_SYS_PTRACE` 能力，则没有：

```
$ getpcaps $$
Capabilities for `11589': =
```

原因 2：`capabilities` 的手册页对 `CAP_SYS_PTRACE` 的介绍是：

```
CAP_SYS_PTRACE
       * Trace arbitrary processes using ptrace(2);
```

所以，`CAP_SYS_PTRACE` 的作用是让你像 root 一样，可以对任何用户拥有的**任意**进程进行  `ptrace`。你不需要用它来对一个只是由你的用户拥有的普通进程进行 `ptrace` 。

我用第三种方法测试了一下（LCTT 译注：此处可能原文有误） —— 我用 `docker run --cap-add=SYS_PTRACE -it ubuntu:18.04 /bin/bash` 运行了一个 Docker 容器，去掉了 `CAP_SYS_PTRACE` 能力，但我仍然可以跟踪进程，虽然我已经没有这个能力了。什么？为什么？！

### 假设 2：关于用户命名空间的事情？

我的下一个（没有那么充分的依据的）假设是“嗯，也许这个过程是在不同的用户命名空间里，而 `strace` 不能工作，因为某种原因而行不通？”这个问题其实并不相关，但这是我观察时想到的。

容器进程是否在不同的用户命名空间中？嗯，在容器中：

```
root@e27f594da870:/# ls /proc/$$/ns/user -l
... /proc/1/ns/user -> 'user:[4026531837]'
```

在宿主机：

```
bork@kiwi:~$ ls /proc/$$/ns/user -l
... /proc/12177/ns/user -> 'user:[4026531837]'
```

因为用户命名空间 ID（`4026531837`）是相同的，所以容器中的 root 用户和主机上的 root 用户是完全相同的用户。所以，绝对没有理由不能够对它创建的进程进行 `strace`!

这个假设并没有什么意义，但我（之前）没有意识到 Docker 容器中的 root 用户和主机上的 root 用户同一个，所以我觉得这很有意思。

### 假设 3：ptrace 系统的调用被 seccomp-bpf 规则阻止了

我也知道 Docker 使用 seccomp-bpf 来阻止容器进程运行许多系统调用。而 `ptrace` 在[被 Docker 默认的 seccomp 配置文件阻止的系统调用列表][2]中!（实际上，允许的系统调用列表是一个白名单，所以只是`ptrace` 不在默认的白名单中。但得出的结果是一样的。）

这很容易解释为什么 `strace` 在 Docker 容器中不能工作 —— 如果 `ptrace` 系统调用完全被屏蔽了，那么你当然不能调用它，`strace` 就会失败。

让我们来验证一下这个假设 —— 如果我们禁用了所有的 seccomp 规则，`strace` 能在 Docker 容器中工作吗？

```
$ docker run --security-opt seccomp=unconfined -it ubuntu:18.04  /bin/bash
$ strace ls
execve("/bin/ls", ["ls"], 0x7ffc69a65580 /* 8 vars */) = 0
... it works fine ...
```

是的，很好用！很好。谜底解开了，除了.....

### 为什么 `--cap-add=SYS_PTRACE` 能解决问题？

我们还没有解释的是：为什么 `--cap-add=SYS_PTRACE` 可以解决这个问题？

`docker run` 的手册页是这样解释 `--cap-add` 参数的。

```
--cap-add=[]
   Add Linux capabilities
```

这跟 seccomp 规则没有任何关系! 怎么回事？

### 我们来看看 Docker 源码

当文档没有帮助的时候，唯一要做的就是去看源码。

Go 语言的好处是，因为依赖关系通常是在一个 Go 仓库里，你可以通过 `grep` 来找出做某件事的代码在哪里。所以我克隆了 `github.com/moby/moby`，然后对一些东西进行 `grep`，比如 `rg CAP_SYS_PTRACE`。

我认为是这样的。在 `containerd` 的 seccomp 实现中，在 [contrib/seccomp/seccomp/seccomp_default.go][3] 中，有一堆代码来确保如果一个进程有一个能力，那么它也会（通过 seccomp 规则）获得访问权限，以使用与该能力相关的系统调用。

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

在 moby 中的 [profile/seccomp/seccomp.go][4] 和 [默认的 seccomp 配置文件][5]中，也有一些其他的代码似乎做了一些非常类似的事情，所以有可能就是这个代码在做这个事情。

所以我想我们有答案了!

### Docker 中的 `--cap-add` 做的事情比它说的要多

结果似乎是，`--cap-add` 并不像手册页里说的那样，它更像是 `--cap-add-and-also-whiteelist-some-extra-system-calls-if-required`。这很有意义! 如果你具有一个像 `--CAP_SYS_PTRACE` 这样的能力，可以让你使用 `process_vm_readv` 系统调用，但是该系统调用被 seccomp 配置文件阻止了，那对你没有什么帮助！

所以当你给容器 `CAP_SYS_PTRACE` 能力时，允许使用 `process_vm_readv` 和 `ptrace` 系统调用似乎是一个合理的选择。

### 就这样！

这是个有趣的小事情，我认为这是一个很好的例子，说明了容器是由许多移动的部件组成的，它们以不完全显而易见的方式一起工作。

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/04/29/why-strace-doesnt-work-in-docker/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://wizardzines.com/zines/containers
[2]: https://docs.docker.com/engine/security/seccomp/
[3]: https://github.com/containerd/containerd/blob/4be98fa28b62e8a012491d655a4d6818ef87b080/contrib/seccomp/seccomp_default.go#L527-L537
[4]: https://github.com/moby/moby/blob/cc0dfb6e7b22ad120c60a9ce770ea15415767cf9/profiles/seccomp/seccomp.go#L126-L132
[5]: https://github.com/moby/moby/blob/master/profiles/seccomp/default.json#L723-L739
