[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11268-1.html)
[#]: subject: (Podman and user namespaces: A marriage made in heaven)
[#]: via: (https://opensource.com/article/18/12/podman-and-user-namespaces)
[#]: author: (Daniel J Walsh https://opensource.com/users/rhatdan)

Podman 和用户名字空间：天作之合
======

> 了解如何使用 Podman 在单独的用户空间运行容器。

![](https://img.linux.net.cn/data/attachment/album/201908/25/220204khh9psjo1phllkok.jpg)

[Podman][1] 是 [libpod][2] 库的一部分，使用户能够管理 pod、容器和容器镜像。在我的上一篇文章中，我写过将 [Podman 作为一种更安全的运行容器的方式][3]。在这里，我将解释如何使用 Podman 在单独的用户命名空间中运行容器。

作为分离容器的一个很棒的功能，我一直在思考<ruby>[用户命名空间][4]<rt>user namespace</rt></ruby>，它主要是由 Red Hat 的 Eric Biederman 开发的。用户命名空间允许你指定用于运行容器的用户标识符（UID）和组标识符（GID）映射。这意味着你可以在容器内以 UID 0 运行，在容器外以 UID 100000 运行。如果容器进程逃逸出了容器，内核会将它们视为以 UID 100000 运行。不仅如此，任何未映射到用户命名空间的 UID 所拥有的文件对象都将被视为 `nobody` 所拥有（UID 是 `65534`， 由 `kernel.overflowuid` 指定），并且不允许容器进程访问，除非该对象可由“其他人”访问（即世界可读/可写）。

如果你拥有一个权限为 [660][5] 的属主为“真实” `root` 的文件，而当用户命名空间中的容器进程尝试读取它时，会阻止它们访问它，并且会将该文件视为 `nobody` 所拥有。

### 示例

以下是它是如何工作的。首先，我在 `root` 拥有的系统中创建一个文件。

```
$ sudo bash -c "echo Test > /tmp/test"
$ sudo chmod 600 /tmp/test
$ sudo ls -l /tmp/test
-rw-------. 1 root root 5 Dec 17 16:40 /tmp/test
```

接下来，我将该文件卷挂载到一个使用用户命名空间映射 `0:100000:5000` 运行的容器中。

```
$ sudo podman run -ti -v /tmp/test:/tmp/test:Z --uidmap 0:100000:5000 fedora sh
# id
uid=0(root) gid=0(root) groups=0(root)
# ls -l /tmp/test
-rw-rw----. 1 nobody nobody 8 Nov 30 12:40 /tmp/test
# cat /tmp/test
cat: /tmp/test: Permission denied
```

上面的 `--uidmap` 设置告诉 Podman 在容器内映射一系列的 5000 个 UID，从容器外的 UID 100000 开始的范围（100000-104999）映射到容器内 UID 0 开始的范围（0-4999）。在容器内部，如果我的进程以 UID 1 运行，则它在主机上为 100001。

由于实际的 `UID=0` 未映射到容器中，因此 `root` 拥有的任何文件都将被视为 `nobody` 所拥有。即使容器内的进程具有 `CAP_DAC_OVERRIDE` 能力，也无法覆盖此种保护。`DAC_OVERRIDE` 能力使得 root 的进程能够读/写系统上的任何文件，即使进程不是 `root` 用户拥有的，也不是全局可读或可写的。

用户命名空间的功能与宿主机上的功能不同。它们是命名空间的功能。这意味着我的容器的 root 只在容器内具有功能 —— 实际上只有该范围内的 UID 映射到内用户命名空间。如果容器进程逃逸出了容器，则它将没有任何非映射到用户命名空间的 UID 之外的功能，这包括 `UID=0`。即使进程可能以某种方式进入另一个容器，如果容器使用不同范围的 UID，它们也不具备这些功能。

请注意，SELinux 和其他技术还限制了容器进程破开容器时会发生的情况。

### 使用 podman top 来显示用户名字空间

我们在 `podman top` 中添加了一些功能，允许你检查容器内运行的进程的用户名，并标识它们在宿主机上的真实 UID。

让我们首先使用我们的 UID 映射运行一个 `sleep` 容器。

```
$ sudo podman run --uidmap 0:100000:5000 -d fedora sleep 1000
```

现在运行 `podman top`：

```
$ sudo podman top --latest user huser
USER   HUSER
root   100000

$ ps -ef | grep sleep
100000   21821 21809  0 08:04 ?         00:00:00 /usr/bin/coreutils --coreutils-prog-shebang=sleep /usr/bin/sleep 1000
```

注意 `podman top` 报告用户进程在容器内以 `root` 身份运行，但在宿主机（`HUSER`）上以 UID  100000 运行。此外，`ps` 命令确认 `sleep` 过程以 UID 100000 运行。

现在让我们运行第二个容器，但这次我们将选择一个单独的 UID 映射，从 200000 开始。

```
$ sudo podman run --uidmap 0:200000:5000 -d fedora sleep 1000
$ sudo podman top --latest user huser
USER   HUSER
root   200000

$ ps -ef | grep sleep
100000   21821 21809  0 08:04 ?         00:00:00 /usr/bin/coreutils --coreutils-prog-shebang=sleep /usr/bin/sleep 1000
200000   23644 23632  1 08:08 ?         00:00:00 /usr/bin/coreutils --coreutils-prog-shebang=sleep /usr/bin/sleep 1000
```

请注意，`podman top` 报告第二个容器在容器内以 `root` 身份运行，但在宿主机上是 UID=200000。

另请参阅 `ps` 命令，它显示两个 `sleep` 进程都在运行：一个为 100000，另一个为 200000。

这意味着在单独的用户命名空间内运行容器可以在进程之间进行传统的 UID 分离，而这从一开始就是 Linux/Unix 的标准安全工具。

### 用户名字空间的问题

几年来，我一直主张用户命名空间应该作为每个人应该有的安全工具，但几乎没有人使用过。原因是没有任何文件系统支持，也没有一个<ruby>移动文件系统<rt>shifting file system</rt></ruby>。

在容器中，你希望在许多容器之间共享**基本**镜像。上面的每个示例中使用了 Fedora 基本镜像。Fedora 镜像中的大多数文件都由真实的 `UID=0` 拥有。如果我在此镜像上使用用户名称空间 `0:100000:5000` 运行容器，默认情况下它会将所有这些文件视为 `nobody` 所拥有，因此我们需要移动所有这些 UID 以匹配用户名称空间。多年来，我想要一个挂载选项来告诉内核重新映射这些文件 UID 以匹配用户命名空间。上游内核存储开发人员还在继续研究，在此功能上已经取得一些进展，但这是一个难题。

由于由 Nalin Dahyabhai 领导的团队开发的自动 [chown][6] 内置于[容器/存储][7]中，Podman 可以在同一镜像上使用不同的用户名称空间。当 Podman 使用容器/存储，并且 Podman 在新的用户命名空间中首次使用一个容器镜像时，容器/存储会 “chown”（如，更改所有权）镜像中的所有文件到用户命名空间中映射的 UID 并创建一个新镜像。可以把它想象成一个 `fedora:0:100000:5000` 镜像。

当 Podman 在具有相同 UID 映射的镜像上运行另一个容器时，它使用“预先 chown”的镜像。当我在`0:200000:5000` 上运行第二个容器时，容器/存储会创建第二个镜像，我们称之为 `fedora:0:200000:5000`。

请注意，如果你正在执行 `podman build` 或 `podman commit` 并将新创建的镜像推送到容器注册库，Podman 将使用容器/存储来反转该移动，并将推送所有文件属主变回真实 UID=0 的镜像。

这可能会导致在新的 UID 映射中创建容器时出现真正的减速，因为 `chown` 可能会很慢，具体取决于镜像中的文件数。此外，在普通的 [OverlayFS][8] 上，镜像中的每个文件都会被复制。普通的 Fedora 镜像最多可能需要 30 秒才能完成 `chown` 并启动容器。

幸运的是，Red Hat 内核存储团队（主要是 Vivek Goyal 和 Miklos Szeredi）在内核 4.19 中为 OverlayFS 添加了一项新功能。该功能称为“仅复制元数据”。如果使用 `metacopy=on` 选项来挂载层叠文件系统，则在更改文件属性时，它不会复制较低层的内容；内核会创建新的 inode，其中包含引用指向较低级别数据的属性。如果内容发生变化，它仍会复制内容。如果你想试用它，可以在 Red Hat Enterprise Linux 8 Beta 中使用此功能。

这意味着容器 `chown` 可能在两秒钟内发生，并且你不会倍增每个容器的存储空间。

这使得像 Podman 这样的工具在不同的用户命名空间中运行容器是可行的，大大提高了系统的安全性。

### 前瞻

我想向 Podman 添加一个新选项，比如 `--userns=auto`，它会为你运行的每个容器自动选择一个唯一的用户命名空间。这类似于 SELinux 与单独的多类别安全（MCS）标签一起使用的方式。如果设置环境变量 `PODMAN_USERNS=auto`，则甚至不需要设置该选项。

Podman 最终允许用户在不同的用户名称空间中运行容器。像 [Buildah][9] 和 [CRI-O][10] 这样的工具也可以利用用户命名空间。但是，对于 CRI-O，Kubernetes 需要了解哪个用户命名空间将运行容器引擎，上游正在开发这个功能。

在我的下一篇文章中，我将解释如何在用户命名空间中将 Podman 作为非 root 用户运行。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/podman-and-user-namespaces

作者：[Daniel J Walsh][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rhatdan
[b]: https://github.com/lujun9972
[1]: https://podman.io/
[2]: https://github.com/containers/libpod
[3]: https://linux.cn/article-11261-1.html
[4]: http://man7.org/linux/man-pages/man7/user_namespaces.7.html
[5]: https://chmodcommand.com/chmod-660/
[6]: https://en.wikipedia.org/wiki/Chown
[7]: https://github.com/containers/storage
[8]: https://en.wikipedia.org/wiki/OverlayFS
[9]: https://buildah.io/
[10]: http://cri-o.io/
