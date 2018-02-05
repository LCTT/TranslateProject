为小白准备的重要 Docker 命令说明
======

在早先的教程中，我们学过了[在 RHEL CentOS 7 上安装 Docker 并创建 docker 容器][1]。 在本教程中，我们会学习管理 docker 容器的其他命令。

### Docker 命令语法

```
$ docker [option] [command] [arguments]
```

要列出 docker 支持的所有命令，运行

```
$ docker
```

我们会看到如下结果，

```
attach Attach to a running container
build  Build an image from a Dockerfile
commit  Create a new image from a container's changes
cp  Copy files/folders between a container and the local filesystem
create  Create a new container
diff  Inspect changes on a container's filesystem
events  Get real time events from the server
exec  Run a command in a running container
export  Export a container's filesystem as a tar archive
history  Show the history of an image
images  List images
import  Import the contents from a tarball to create a filesystem image
info  Display system-wide information
inspect  Return low-level information on a container or image
kill  Kill a running container
load  Load an image from a tar archive or STDIN
login  Log in to a Docker registry
logout  Log out from a Docker registry
logs  Fetch the logs of a container
network  Manage Docker networks
pause  Pause all processes within a container
port  List port mappings or a specific mapping for the CONTAINER
ps  List containers
pull  Pull an image or a repository from a registry
push  Push an image or a repository to a registry
rename  Rename a container
restart  Restart a container
rm  Remove one or more containers
rmi  Remove one or more images
run  Run a command in a new container
save  Save one or more images to a tar archive
search  Search the Docker Hub for images
start  Start one or more stopped containers
stats  Display a live stream of container(s) resource usage statistics
stop  Stop a running container
tag  Tag an image into a repository
top  Display the running processes of a container
unpause  Unpause all processes within a container
update  Update configuration of one or more containers
version  Show the Docker version information
volume  Manage Docker volumes
wait  Block until a container stops, then print its exit code
```

要进一步查看某个命令支持的选项，运行：

```
$ docker docker-subcommand info
```

就会列出 docker 子命令所支持的选项了。

### 测试与 Docker Hub 的连接

默认，所有镜像都是从 Docker Hub 中拉取下来的。我们可以从 Docker Hub 上传或下载操作系统镜像。为了检查我们是否能够正常地通过 Docker Hub 上传/下载镜像，运行

```
$ docker run hello-world
```

结果应该是：

```
Hello from Docker.
This message shows that your installation appears to be working correctly.
…
```

输出结果表示你可以访问 Docker Hub 而且也能从 Docker Hub 下载 docker 镜像。

### 搜索镜像

搜索容器的镜像，运行

```
$ docker search Ubuntu
```

我们应该会得到可用的 Ubuntu 镜像的列表。记住，如果你想要的是官方的镜像，请检查 `official` 这一列上是否为 `[OK]`。

### 下载镜像

一旦搜索并找到了我们想要的镜像，我们可以运行下面语句来下载它：

```
$ docker pull Ubuntu
```

要查看所有已下载的镜像，运行：

```
$ docker images
```

### 运行容器

使用已下载镜像来运行容器，使用下面命令：

```
$ docker run -it Ubuntu
```

这里，使用 `-it` 会打开一个 shell 与容器交互。容器启动并运行后，我们就可以像普通机器那样来使用它了，我们可以在容器中执行任何命令。

### 显示所有的 docker 容器

要列出所有 docker 容器，运行：

```
$ docker ps
```

会输出一个容器列表，每个容器都有一个容器 id 标识。

### 停止 docker 容器

要停止 docker 容器，运行：

```
$ docker stop container-id
```

### 从容器中退出

要从容器中退出，执行：

```
$ exit
```

### 保存容器状态

容器运行并更改后（比如安装了 apache 服务器），我们可以保存容器状态。这会在本地系统上保存新创建镜像。

运行下面语句来提交并保存容器状态：

```
$ docker commit 85475ef774 repository/image_name
```

这里，`commit` 命令会保存容器状态，`85475ef774`，是容器的容器 id，`repository`，通常为 docker hub 上的用户名 （或者新加的仓库名称）`image_name`，是新镜像的名称。

我们还可以使用 `-m` 和 `-a` 来添加更多信息。通过 `-m`，我们可以留个信息说 apache 服务器已经安装好了，而 `-a` 可以添加作者名称。

像这样：

```
 docker commit -m "apache server installed"-a "Dan Daniels" 85475ef774 daniels_dan/Cent_container
```

我们的教程至此就结束了，本教程讲解了一下 Docker 中的那些重要的命令，如有疑问，欢迎留言。


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/important-docker-commands-beginners/

作者：[Shusain][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/create-first-docker-container-beginners-guide/
