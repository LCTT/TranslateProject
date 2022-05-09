[#]: subject: "3 steps to start running containers today"
[#]: via: "https://opensource.com/article/22/2/start-running-containers"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

当下运行容器的 3 个步骤
======
在本教程中，你将学习如何在一个 pod 中运行两个容器来托管一个 WordPress 站点。
![堆积的运输容器][1]

无论你是将其作为工作的一部分、未来的工作机会或者仅仅是出于对新技术的兴趣，容器对很多人，即使是经验丰富的系统管理员，可能是非常难以应付的。那么如何真正开始使用容器呢？从容器到 [Kubernetes][2] 的成长路径是什么？另外，为什么有不止一条路径？如你所料，最好的起点就是现在。

### 1\. 了解容器

转念一想，从头开始可以追溯到早期 BSD 及其特殊的 chroot 监狱，时间久了还是直接跳到最近发生的事情吧。

不久前，Linux 内核引入和 _cgroups_，允许你能够使用 _namespace_ 来“标记”进程。当你将进程组合到一个命名空间时，这些进程的行为在命名空间之外好像不存在任何东西，就像你把这些进程放入某种容器一样。当然，容器是虚拟的，它位于计算机内部，它和你操作系统的其余进程使用相同的内核、RAM 和 CPU，但你已经包含了这些进程。

预制的容器仅包含运行它所包含的应用程序必须的内容。使用容器引擎，如 [Podman][3]、Docker 或 CRI-O，你可以运行容器化应用程序，而无需像之前一样操作很多配置。容器引擎通常是跨平台的，因此即使容器运行在 Linux 上，你也可以在其他 Linux、MacOS 或 Windows 上启动容器。

更重要的是，当需求量很大时，你可以运行同一应用程序的多个容器。

现在你知道了什么是容器，下一步是运行一个容器。

**[ 获取备忘录：[Pod、集群和容器之间有什么区别？][4] ]**

### 2\. 运行一个容器

在运行容器之前，你应该有一个想要运行它的理由。你可以编一个，这有助于你对让容器创建过程感兴趣，这样你在运行容器过程中会收到鼓舞。毕竟，运行容器但不使用它提供的应用程序只能证明你没有注意到任何故障，但使用容器证明它可以工作。

我推荐从 WordPress 开始，它是一个很流行的 Web 应用程序，容易使用，所以一旦容器运行，你就可以测试使用它。虽然你可以轻松地配置一个 WordPress 容器，但还是有很多配置选项可以引导你发现更多容器选项（例如运行数据库容器）以及容器如何通信。

我使用 Podman，它是一个友好、方便且无守护进程的容器引擎。如果你没有安装 Podman，可以改用 Docker 命令。它们都是很棒的开源容器引擎，而且它们的语法是相同的（只需输入 `docker` 而不是 `podman`）。因为 Podman 没有守护进程，所以它需要更多的配置，这种代价是值得的。

如果你使用 Docker，可以跳到 [WordPress 容器部分][5]，否则，打开终端安装并配置 Podman：


```
$ sudo dnf install podman
```

容器会产生许多进程，通常只有 root 用户有权创建数千个进程 ID。创建一个名为 `/etc/subuid` 的文件，定义一个适当的起始 UID 和大量合法的 PID，这样就可以为你添加一些额外的进程 ID：


```
seth:200000:165536
```

在名为 `/etc/subgid` 的文件中对你的组执行相同的操作。在这个例子中，我的主要组是 `staff`（对你来说可能是 `users`，或者和你的用户名一样，这取决于你的系统）。

```
staff:200000:165536
```

最后，确认你的用户可以管理很多命名空间：

```
$ sysctl --all --pattern user_namespaces
user.max_user_namespaces = 28633

```

如果你的用户无权管理超过 28,000 个命名空间，创建 `/etc/sysctl.d/userns.conf` 文件来增加数量并输入：

```
user.max_user_namespaces=28633
```

#### 运行 WordPress 容器

现在，无论你使用的是 Podman 还是 Docker，你都可以从在线容器仓库中下载 WordPress 容器并运行它。你可以使用以下 Podman 命令完成所有这些操作：

```
$ podman run --name mypress \
-p 8080:80 -d wordpress

```

给 Podman 一会来找到容器，从互联网下载它，然后启动。

在收到终端返回提示后启动 Web 浏览器，打开 `localhost:8080`。WordPress 正在运行，等待你进行设置。

![WordPress 容器][6]

(Seth Kenlon, [CC BY-SA 4.0][7])

不过，你很快就会遇到障碍，因为 WordPress 使用数据库来存储数据，因此你需要为其提供一个数据库。

在继续之前，停止并删除 WordPress 容器：

```
$ podman stop mypress
$ podman rm mypress

```

### 3\. 在 pod 中运行容器

容器在设计上是独立的，正如它们的名字所暗示的那样。在容器中运行的应用程序不应该与在容器外的应用程序或基础设置进行交互。因此，当一个容器需要另一个容器才能运行时，一种解决方案是将这两个容器放在一个更大的容器中，称为 _pod_。Pod 确保其容器可以共享重要的命名空间以便相互通信。

创建一个新的 pod，为 pod 提供一个名称，以及希望能够访问的端口：

```
$ podman pod create \
\--name wp_pod \
\--publish 8080:80

```

确认 pod 存在：


```
$ podman pod list
POD ID        NAME     STATUS    INFRA ID      # OF CONTAINERS
100e138a29bd  wp_pod   Created   22ace92df3ef   1

```

#### 将容器添加到 pod

现在你已经为相互依赖的容器创建了一个 pod，你可以通过指定一个运行的 pod 来启动每个容器。

首先，启动一个数据库容器。你可以创建自己的凭据，只要在 WordPress 连接到数据库时使用相同的凭据。


```
$ podman run --detach \
\--pod wp_pod \
\--restart=always \
-e MYSQL_ROOT_PASSWORD="badpassword0" \
-e MYSQL_DATABASE="wp_db" \
-e MYSQL_USER="tux" \
-e MYSQL_PASSWORD="badpassword1" \
\--name=wp_db mariadb

```

接下来，在同一个 pod 中启动 WordPress 容器：

```
$ podman run --detach \
\--restart=always --pod=wp_pod \
-e WORDPRESS_DB_NAME="wp_db" \
-e WORDPRESS_DB_USER="tux" \
-e WORDPRESS_DB_PASSWORD="badpassword1" \
-e WORDPRESS_DB_HOST="127.0.0.1" \
\--name mypress wordpress

```

现在启动你最喜欢的网络浏览器并打开 `localhost:8080`。

这一次，设置会正常进行。WordPress 会连接到数据库，因为你在启动容器时传递了这些环境变量。

![WordPress 启动][8]

(Seth Kenlon, [CC BY-SA 4.0][7])

创建用户账户后，你可以登录查看 WordPress 仪表板。

![WordPress dashboard running in a container][9]

(Seth Kenlon, [CC BY-SA 4.0][7])

### 下一步

你已经创建了两个容器，并在一个 pod 中运行了它们。你现在已经了解了如何在自己的服务器上运行容器及服务。如果你想迁移到云，容器非常适合你。使用像 Kubernetes 和 OpenShift 这样的工具，你可以自动化启动[集群上的容器和 pod][10]。如果你正在考虑采取下一步行动，阅读 Kevin Casey 的 [3 个开始使用 Kubernetes 的方法][11]，并尝试他提到的 Minikube 教程。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/start-running-containers

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-containers.png?itok=d_4QhZxT (Shipping containers stacked)
[2]: https://opensource.com/tags/kubernetes
[3]: https://www.redhat.com/sysadmin/podman-guides-2020
[4]: https://enterprisersproject.com/cheat-sheet-what-s-difference-between-pod-cluster-and-container
[5]: tmp.1zBHYsK8TH#wp
[6]: https://opensource.com/sites/default/files/uploads/podman-wordpress.jpg (WordPress running in a container)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/wordpress-setup.jpg (WordPress setup)
[9]: https://opensource.com/sites/default/files/uploads/wordpress-welcome.jpg (WordPress dashboard running in a container)
[10]: https://enterprisersproject.com/article/2020/9/pod-cluster-container-what-is-difference
[11]: https://enterprisersproject.com/article/2019/11/kubernetes-3-ways-get-started
