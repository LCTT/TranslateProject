8 个基本的 Docker 容器管理命令
======
利用这 8 个命令可以学习 Docker 容器的基本管理方式。这是一个为 Docker 初学者准备的，带有示范命令输出的指南。

![Docker 容器管理命令][1]

在这篇文章中，我们将带你学习 8 个基本的 Docker 容器命令，它们操控着 Docker 容器的基本活动，例如 <ruby>运行<rt>run</rt></ruby>, <ruby>列举<rt>list</rt></ruby>, <ruby>停止<rt>stop</rt></ruby>, <ruby>查看历史纪录<rt>view logs</rt></ruby>, <ruby>删除<rt>delete</rt></ruby>, 等等。如果你对 Docker 的概念很陌生，推荐你看看我们的 [介绍指南][2]，来了解 Docker 的基本内容以及 [如何][3] 在 Linux 上安装 Docker. 现在让我们赶快进入要了解的命令：

### 如何运行 Docker 容器？

众所周知，Docker 容器只是一个运行于<ruby>宿主操作系统<rt>host OS</rt></ruby>上的应用进程，所以你需要一个镜像来运行它。Docker 镜像运行时的进程就叫做 Docker 容器。你可以加载本地 Docker 镜像，也可以从 Docker Hub 上下载。Docker Hub 是一个提供公有和私有镜像来进行<ruby>拉取<rt>pull</rt></ruby>操作的集中仓库。官方的 Docker Hub 位于 [hub.docker.com][4]. 当你指示 Docker 引擎运行容器时，它会首先搜索本地镜像，如果没有找到，它会从 Docker Hub 上拉取相应的镜像。

让我们运行一个 Apache web-server 的 Docker 镜像，比如 httpd 进程。你需要运行 `docker container run` 命令。旧的命令为 `docker run`, 但后来 Docker 添加了子命令部分，所以新版本支持<ruby>附属命令<rt>below command</rt></ruby> -

```
root@kerneltalks # docker container run -d -p 80:80 httpd
Unable to find image 'httpd:latest' locally
latest: Pulling from library/httpd
3d77ce4481b1: Pull complete
73674f4d9403: Pull complete
d266646f40bd: Pull complete
ce7b0dda0c9f: Pull complete
01729050d692: Pull complete
014246127c67: Pull complete
7cd2e04cf570: Pull complete
Digest: sha256:f4610c3a1a7da35072870625733fd0384515f7e912c6223d4a48c6eb749a8617
Status: Downloaded newer image for httpd:latest
c46f2e9e4690f5c28ee7ad508559ceee0160ac3e2b1688a61561ce9f7d99d682
```

Docker 的 `run` 命令将镜像名作为强制参数，另外还有很多可选参数。常用的参数有 -

  * `-d` : Detach container from current shell
  * `-p X:Y` : Bind container port Y with host’s port X
  * `--name` : Name your container. If not used, it will be assigned randomly generated name
  * `-e` : Pass environmental variables and their values while starting container



通过以上输出你可以看到，我们将 `httpd` 作为镜像名来运行容器。接着，本地镜像没有找到，Docker 引擎从 Docker Hub 拉取了它。注意，它下载了镜像 **httpd:latest**, 其中 : 后面跟着版本号。如果你需要运行特定版本的容器，你可以在镜像名后面注明版本名。如果不提供版本名，Docker 引擎会自动拉取最新的版本。

输出的最后一行显示了你新运行的 httpd 容器的特有 ID。

### 如何列出所有运行中的 Docker 容器？

现在，你的容器已经运行起来了，你可能想要确认这一点，或者你想要列出你的机器上运行的所有容器。你可以使用 `docker container ls` 命令。在旧的 Docker 版本中，对应的命令为 `docker ps`。

```
root@kerneltalks # docker container ls
CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS              PORTS                NAMES
c46f2e9e4690        httpd               "httpd-foreground"   11 minutes ago      Up 11 minutes       0.0.0.0:80->80/tcp   cranky_cori
```

列出的结果是按列显示的。每一列的值分别为 - 

1. Container ID ：一开始的几个字符对应你特有的容器 ID
2. Image ：你运行容器的镜像名
3. Command ：容器启动后运行的命令
4. Created ：创建时间
5. Status ：容器当前状态
6. Ports ：与宿主端口相连接的端口信息
7. Names ：容器名（如果你没有命名你的容器，那么会随机创建）



### 如何查看 Docker 容器的历史纪录？

在第一步我们使用了 -d 参数来将容器，在它一开始运行的时候，就从当前的 shell 中分离出来。在这种情况下，我们不知道容器里面发生了什么。所以为了查看容器的历史纪录，Docker 提供了 `logs` 命令。它采用容器名称或 ID 作为参数。

```
root@kerneltalks # docker container logs cranky_cori
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[Thu May 31 18:35:07.301158 2018] [mpm_event:notice] [pid 1:tid 139734285989760] AH00489: Apache/2.4.33 (Unix) configured -- resuming normal operations
[Thu May 31 18:35:07.305153 2018] [core:notice] [pid 1:tid 139734285989760] AH00094: Command line: 'httpd -D FOREGROUND'
```

这里我使用了容器名称作为参数。你可以看到在我们的 httpd 容器中与 Apache 相关的历史纪录。

### 如何确定 Docker 容器的进程？

容器是一个使用宿主资源来运行的进程。这样，你可以在宿主系统的进程表中定位容器的进程。让我们在宿主系统上确定容器进程。

Docker 使用著名的 `top` 命令作为子命令的名称，来查看容器产生的进程。它采用容器的名称或 ID 作为参数。在旧版本的 Docker 中，只可运行 `docker top` 命令。在新版本中，`docker top` 和 `docker container top` 命令都可以生效。

```
root@kerneltalks # docker container top  cranky_cori
UID                 PID                 PPID                C                   STIME               TTY                 TIME                CMD
root                15702               15690               0                   18:35               ?                   00:00:00            httpd -DFOREGROUND
bin                 15729               15702               0                   18:35               ?                   00:00:00            httpd -DFOREGROUND
bin                 15730               15702               0                   18:35               ?                   00:00:00            httpd -DFOREGROUND
bin                 15731               15702               0                   18:35               ?                   00:00:00            httpd -DFOREGROUND
 
root@kerneltalks # ps -ef |grep -i 15702
root     15702 15690  0 18:35 ?        00:00:00 httpd -DFOREGROUND
bin      15729 15702  0 18:35 ?        00:00:00 httpd -DFOREGROUND
bin      15730 15702  0 18:35 ?        00:00:00 httpd -DFOREGROUND
bin      15731 15702  0 18:35 ?        00:00:00 httpd -DFOREGROUND
root     15993 15957  0 18:59 pts/0    00:00:00 grep --color=auto -i 15702
```

在第一个输出中，列出了容器产生的进程的列表。它包含了所有细节，包括用途，<ruby>进程号<rt>pid</rt></ruby>，<ruby>父进程号<rt>ppid</rt></ruby>，开始时间，命令，等等。这里所有的进程号你都可以在宿主的进程表里搜索到。这就是我们在第二个命令里做得。这证明了容器确实是宿主系统中的进程。

### 如何停止 Docker 容器？

只需要 `stop` 命令！同样，它采用容器名称或 ID 作为参数。

```
root@kerneltalks # docker container stop cranky_cori
cranky_cori
```

### 如何列出停止的或不活动的 Docker 容器？

现在我们停止了我们的容器，这时如果我们使用 `ls` 命令，它将不会出现在列表中。

```
root@kerneltalks # docker container ls
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

所以，在这种情况下，如果想要查看停止的或不活动的容器，你需要在 `ls` 命令里同时使用 `-a` 参数。


```
root@kerneltalks # docker container ls -a
CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS                     PORTS               NAMES
c46f2e9e4690        httpd               "httpd-foreground"   33 minutes ago      Exited (0) 2 minutes ago                       cranky_cori
```

有了 `-a` 参数，现在我们可以查看已停止的容器。注意这些容器的状态被标注为 <ru by>已退出<rt>exited</rt></ruby>。既然容器只是一个进程，那么用“退出”比“停止”更合适！

### 如何（重新）启动 Docker 容器？

现在，我们来启动这个已停止的容器。这和运行一个容器有所区别。当你运行一个容器时，你将启动一个全新的容器。当你启动一个容器时，你将开始一个已经停止并保存了当时运行状态的容器。它将以停止时的状态重新开始运行。

```
root@kerneltalks #  docker container start c46f2e9e4690
c46f2e9e4690
 
root@kerneltalks # docker container ls -a
CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS              PORTS                NAMES
c46f2e9e4690        httpd               "httpd-foreground"   35 minutes ago      Up 8 seconds        0.0.0.0:80->80/tcp   cranky_cori
```

### 如何移除 Docker 容器？

我们使用 `rm` 命令来移处容器。你不可以移除运行中的容器。移除之前需要先停止容器。你可以使用 `-f` 参数搭配 `rm` 命令来强制移除容器，但并不推荐这么做。

```
root@kerneltalks # docker container rm cranky_cori
cranky_cori
root@kerneltalks # docker container ls -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

你看，一旦移除了容器，即使再使用 `ls -a` 命令也查看不到容器了。

--------------------------------------------------------------------------------

via: https://kerneltalks.com/virtualization/8-basic-docker-container-management-commands/

作者：[Shrikant Lavhate][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[lonaparte](https://github.com/译者ID/lonaparte)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://kerneltalks.com
[1]:https://a4.kerneltalks.com/wp-content/uploads/2018/06/basic-Docker-container-management-commands.png
[2]:https://kerneltalks.com/virtualization/what-is-docker-introduction-guide-to-docker/
[3]:https://kerneltalks.com/virtualization/how-to-install-docker-in-linux/
[4]:https://hub.docker.com/
