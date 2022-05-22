[#]: subject: "Run containers on your Mac with Lima"
[#]: via: "https://opensource.com/article/21/9/run-containers-mac-lima"
[#]: author: "Moshe Zadka https://opensource.com/users/moshez"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13824-1.html"

用 Lima 在你的 Mac 上运行容器
======

> Lima 可以帮助克服在 Mac 上运行容器的挑战。

![](https://img.linux.net.cn/data/attachment/album/202109/27/091509kx8u9uqdzcz8c6ud.jpg)

在你的 Mac 上运行容器可能是一个挑战。毕竟，容器是基于 Linux 特有的技术，如控制组和命名空间。

幸运的是，macOS 拥有一个内置的<ruby>虚拟机监控程序<rt>hypervisor</rt></ruby>，允许在 Mac 上运行虚拟机（VM）。虚拟机监控程序是一个底层的内核功能，而不是一个面向用户的功能。

hyperkit 是一个可以使用 macOS 虚拟机监控程序运行虚拟机的 [开源项目][2]。hyperkit 被设计成一个“极简化”的虚拟机运行器。与 VirtualBox 不同，它没有花哨的 UI 功能来管理虚拟机。

你可以获取 hyperkit，这是一个运行容器管理器的极简 Linux 发行版，并将所有部分组合在一起。但这将有很多变动组件，且听起来像有很多工作。特别是如果你想通过使用 `vpnkit` （一个开源项目，用于创建感觉更像是主机网络一部分的虚拟机网络）使网络连接更加无缝。

### Lima

当 [lima 项目][3] 已经解决了这些细节问题时，就没有理由再去做这些努力了。让 `lima` 运行的最简单方法之一是使用 [Homebrew][4]。你可以用这个命令安装 `lima`：

```
$ brew install lima
```

安装后，可能需要一些时间，就享受一些乐趣了。为了让 `lima` 知道你已经准备好了，你需要启动它。下面是命令：

```
$ limactl start
```

如果这是你第一次运行，你会被问到是否喜欢默认值，或者是否要改变其中的任何一项。默认值是非常安全的，但我喜欢生活在疯狂的一面。这就是为什么我跳进一个编辑器，从以下地方进行修改：

```
- location: "~"
  # CAUTION: `writable` SHOULD be false for the home directory.
  # Setting `writable` to true is possible but untested and dangerous.
  writable: false
```

变成：

```
 - location: "~"
  # I *also* like to live dangerously -- Austin Powers
  writable: true
```

正如评论中所说，这可能是危险的。可悲的是，许多现有的工作流程都依赖于挂载是可读写的。

默认情况下，`lima` 运行 `containerd` 来管理容器。`containerd` 管理器也是一个非常简洁的管理器。虽然使用一个包装的守护程序，如 `dockerd`，来增加这些漂亮的工效是很常见的，但也有另一种方法。

### nerdctl 工具

`nerdctl` 工具是 Docker 客户端的直接替换，它将这些功能放在客户端，而不是服务器上。`lima` 工具允许无需在本地安装就可以直接从虚拟机内部运行 `nerdctl`。

做完这些后，可以运行一个容器了！这个容器将运行一个 HTTP 服务器。你可以在你的 Mac 上创建这些文件：

```
$ ls
index.html
$ cat index.html
hello
```

现在，挂载并转发端口：

```
$ lima nerdctl run --rm -it -p 8000:8000 -v $(pwd):/html --entrypoint bash python
root@9486145449ab:/#
```

在容器内，运行一个简单的 Web 服务器：

```
$ lima nerdctl run --rm -it -p 8000:8000 -v $(pwd):/html --entrypoint bash python
root@9486145449ab:/# cd /html/
root@9486145449ab:/html# python -m http.server 8000
Serving HTTP on 0.0.0.0 port 8000 (<http://0.0.0.0:8000/>) ...
```

在另一个终端，你可以检查一切看起来都很好：

```
$ curl localhost:8000
hello
```

回到容器上，有一条记录 HTTP 客户端连接的日志信息：

```
10.4.0.1 - - [09/Sep/2021 14:59:08] "GET / HTTP/1.1" 200 -
```

一个文件是不够的，所以还要做些优化。 在服务器上执行 `CTRL-C`，并添加另一个文件：

```
^C
Keyboard interrupt received, exiting.
root@9486145449ab:/html# echo goodbye &gt; foo.html
root@9486145449ab:/html# python -m http.server 8000
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
```

检查你是否能看到新的文件：

```
$ curl localhost:8000/foo.html
goodbye
```

### 总结

总结一下，安装 `lima` 需要一些时间，但完成后，你可以做以下事情：

  * 运行容器。
  * 将你的主目录中的任意子目录挂载到容器中。
  * 编辑这些目录中的文件。
  * 运行网络服务器，在 Mac 程序看来，它们是在 localhost 上运行的。

这些都是通过 `lima nerdctl` 实现的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/run-containers-mac-lima

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_2015-2-osdc-lead.png?itok=kAfHrBoy (Containers for shipping overseas)
[2]: https://www.docker.com/blog/docker-unikernels-open-source/
[3]: https://github.com/lima-vm/lima
[4]: https://brew.sh/
