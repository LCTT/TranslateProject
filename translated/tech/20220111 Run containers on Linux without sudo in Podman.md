[#]: subject: "Run containers on Linux without sudo in Podman"
[#]: via: "https://opensource.com/article/22/1/run-containers-without-sudo-podman"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Podman 中无需 sudo 在 Linux 上运行容器
======
为 rootless 容器配置你的系统。
![Command line prompt][1]

容器是现代计算的一个重要组成部分，随着围绕容器的基础设施的发展，新的和更好的工具开始浮出水面。过去，你只需用 [LXC][2] 就可以运行容器，然后 Docker 得到了普及，事情开始变得越来越复杂。最终，我们得到了我们所期望的容器管理系统 [Podman][3]，一个无守护程序的容器引擎，使容器和 pod 易于构建、运行和管理。

容器直接与 Linux 内核能力（如 cgroups 和命名空间）交互，它们在这些命名空间中产生大量的新进程。简而言之，运行一个容器实际上就是在 Linux 系统内部运行一个 Linux 系统。从操作系统的角度来看，它看起来非常像一种管理和特权活动。普通用户通常不能像容器那样自由支配系统资源，所以默认情况下，运行 Podman 需要 root 或 `sudo` 权限。然而，这只是默认设置，而且这绝不是唯一可用的设置。本文演示了如何配置你的 Linux 系统，使普通用户可以在不使用 `sudo` 的情况下运行 Podman（“rootless”）。

### 命名空间的用户 ID

[内核命名空间][4]本质上是一种虚构的结构，可帮助 Linux 跟踪哪些进程属于同一类。 这是 Linux 中的队列分组。 一个队列中的进程与另一个队列中的进程之间实际上没有区别，但将它们彼此隔离是有帮助的。 将它们分开是声明一组进程为“容器”而另一组进程为你的操作系统的关键。

Linux 通过用户 ID（UID）和组 ID（GID）来跟踪哪个用户或组拥有的进程。通常情况下，一个用户可以访问一千个左右的从属 UID，以分配给命名空间的子进程。由于 Podman 运行的是分配给启动容器的用户的整个从属操作系统，因此你需要的不仅仅是默认分配的 subuid 和 subgid。

你可以用 `usermod` 命令授予一个用户更多的 subuid 和 subgid。例如，要授予用户 `tux` 更多的 subuid 和 subgid，选择一个还没分配用户的适当的高 UID（如 200,000），然后将其增加几千：


```


$ sudo usermod \
\--add-subuids 200000-265536 \
\--add-subgids 200000-265536 \
tux

```

### 命名空间访问

对命名空间也有限制。这通常被设置得很高，但你可以用 `systctl`，即内核参数工具来验证用户的命名空间分配：


```


$ sysctl --all --pattern user_namespaces
user.max_user_namespaces = 28633

```

这是很充足的命名空间，而且可能是你的发行版默认设置的。如果你的发行版没有这个属性或者设置得很低，那么你可以在文件 `/etc/sysctl.d/userns.conf` 中输入这样的文本来创建它：


```
`user.max_user_namespaces=28633`
```

加载该设置：


```
`$ sudo sysctl -p /etc/sysctl.d/userns.conf`
```

### 在没有 root 权限的情况下运行一个容器

当你设置好你的配置，重启你的计算机，以确保你的用户和内核参数的变化被加载和激活。

重启后，试着运行一个容器镜像：


```


$ podman run -it busybox echo "hello"
hello

```

### 容器像命令一样

如果你是第一次接触容器，可能会觉得很神秘，但实际上，它们与你现有的 Linux 系统没有什么不同。它们实际上是在你的系统上运行的进程，没有仿真环境或虚拟机的成本和障碍。容器和你的操作系统之间的区别只是内核命名空间，所以它们实际上只是带有不同标签的本地进程。Podman 使这一点比以往更加明显，当你将 Podman 配置为 rootless 命令，容器感觉更像命令而不是虚拟环境。Podman 使容器和 pod 变得简单，所以请试一试。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/run-containers-without-sudo-podman

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://opensource.com/article/18/11/behind-scenes-linux-containers
[3]: http://podman.io
[4]: https://opensource.com/article/19/10/namespaces-and-containers-linux
