[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12859-1.html)
[#]: subject: (Podman with capabilities on Fedora)
[#]: via: (https://fedoramagazine.org/podman-with-capabilities-on-fedora/)
[#]: author: (shiwanibiradar https://fedoramagazine.org/author/shiwanibiradar/)

在 Fedora 中结合权能使用 Podman
======

![][1]

容器化是一项蓬勃发展的技术。在不久的将来，多达百分之七十五的全球组织可能会运行某种类型的容器化技术。由于广泛使用的技术更容易成为黑客攻击的目标，因此保护容器的安全就显得尤为重要。本文将演示如何使用 POSIX <ruby>[权能][2]<rt>Capability</rt></ruby> 来保护 Podman 容器的安全。Podman 是 RHEL8 中默认的容器管理工具。

### 确定 Podman 容器的权限模式

容器以特权模式或无特权模式运行。在特权模式下，[容器的 uid 0 被映射到宿主机的 uid 0][3]。对于某些情况，无特权的容器[缺乏对宿主机资源的充分访问能力][4]。但不管其操作模式如何，包括<ruby>强制访问控制<rt>Mandatory Access Control</rt></ruby>（MAC：如 apparmor、SELinux 等）、seccomp 过滤器、删除<ruby>权能<rt>Capability</rt></ruby>、命名空间等在内的技术有助于确保容器的安全。

要从容器外部确定特权模式：

```
$ podman inspect --format="{{.HostConfig.Privileged}}" <container id>
```

如果上面的命令返回 `true`，那么容器在特权模式下运行。如果返回 `false`，那么容器在非特权模式下运行。

要从容器内部确定特权模式：

```
$ ip link add dummy0 type dummy
```

如果该命令允许你创建一个接口，那么你运行的是一个特权容器，否则你运行的是一个非特权容器。

### 权能

命名空间隔离了容器的进程，使其无法任意访问宿主机的资源，也无法访问在同一宿主机上运行的其他容器的资源。然而，在**特权**容器内的进程仍然可以做一些事情，如改变 IP 路由表、跟踪任意进程和加载内核模块。<ruby>权能<rt>Capability</rt></ruby>允许人们对容器内的进程可以访问或更改的资源施加更细微的限制，即使容器在特权模式下运行也一样。权能还允许人们为无特权的容器分配它本来不会拥有的特权。

例如，如果要将 `NET_ADMIN` 功能添加到一个无特权的容器中，以便在容器内部创建一个网络接口，你可以用下面的参数运行 `podman`：

```
[root@vm1 ~]# podman run -it --cap-add=NET_ADMIN centos
[root@b27fea33ccf1 /]# ip link add dummy0 type dummy
[root@b27fea33ccf1 /]# ip link
```

上面的命令演示了在一个无特权的容器中创建一个 `dummy0` 接口。如果没有 `NET_ADMIN` 权能，非特权容器将无法创建接口。上面的命令演示了如何将一个权能授予一个无特权的容器。

目前，大约有 [39 种权能][5]可以被授予或拒绝。特权容器默认会被授予许多权能。建议从特权容器中删除不需要的权能，以使其更加安全。

要从容器中删除所有权能：

```
$ podman run -it -d --name mycontainer --cap-drop=all centos
```

列出一个容器的权能：

```
$ podman exec -it 48f11d9fa512 capsh --print
```

上述命令显示没有向容器授予任何权能。

请参考 `capabilities` 手册页以获取完整的权能列表：

```
$ man capabilities
```

可以使用 `capsh` 命令来列出目前拥有的权能：

```
$ capsh --print
```

作为另一个例子，下面的命令演示了如何从容器中删除 `NET_RAW` 权能。如果没有 `NET_RAW` 权能，就不能从容器中 `ping` 互联网上的服务器。

```
$ podman run -it --name mycontainer1 --cap-drop=net_raw centos
>>> ping google.com (will output error, operation not permitted)
```

最后一个例子，如果你的容器只需要 `SETUID` 和 `SETGID` 权能，你可以删除所有权能，然后只重新添加这两个权能来实现这样的权限设置。

```
$ podman run -d --cap-drop=all --cap-add=setuid --cap-add=setgid fedora sleep 5 > /dev/null; pscap | grep sleep
```

上面的 `pscap` 命令会显示容器被授予的权能。

我希望你喜欢这个关于如何使用权能来保护 Podman 容器的简短探索。

谢谢！

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/podman-with-capabilities-on-fedora/

作者：[shiwanibiradar][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/shiwanibiradar/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/10/podman-816x345.jpg
[2]: https://www.linuxjournal.com/magazine/making-root-unprivileged
[3]: https://linuxcontainers.org/lxc/security/#privileged-containers
[4]: https://github.com/containers/podman/blob/master/rootless.md
[5]: https://man7.org/linux/man-pages/man7/capabilities.7.html
