[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12407-1.html)
[#]: subject: (Add nodes to your private cloud using Cloud-init)
[#]: via: (https://opensource.com/article/20/5/create-simple-cloud-init-service-your-homelab)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)

使用 Cloud-init 将节点添加到你的私有云中
======

> 像主流云提供商的处理方式一样，在家中添加机器到你的私有云。

![](https://img.linux.net.cn/data/attachment/album/202007/12/100823rj096h3ax4hhehey.jpg)

[Cloud-init][2] 是一种广泛使用的行业标准方法，用于初始化云实例。云提供商使用 Cloud-init 来定制实例的网络配置、实例信息，甚至用户提供的配置指令。它也是一个可以在你的“家庭私有云”中使用的很好的工具，可以为你的家庭实验室的虚拟机和物理机的初始设置和配置添加一点自动化 —— 并了解更多关于大型云提供商是如何工作的信息。关于更多的细节和背景，请看我之前的文章《[在你的树莓派家庭实验室中使用 Cloud-init][3]》。

![A screen showing the boot process for a Linux server running Cloud-init ][4]

*运行 Cloud-init 的 Linux 服务器的启动过程（Chris Collins，[CC BY-SA 4.0][5]）*

诚然，Cloud-init 对于为许多不同客户配置机器的云提供商来说，比对于由单个系统管理员运行的家庭实验室更有用，而且 Cloud-init 解决的许多问题对于家庭实验室来说可能有点多余。然而，设置它并了解它的工作原理是了解更多关于这种云技术的好方法，更不用说它是首次启动时配置设备的好方法。

本教程使用 Cloud-init 的 NoCloud 数据源，它允许 Cloud-init 在传统的云提供商环境之外使用。本文将向你展示如何在客户端设备上安装 Cloud-init，并设置一个运行 Web 服务的容器来响应客户端的请求。你还将学习如何审查客户端从 Web 服务中请求的内容，并修改 Web 服务的容器，以提供基本的、静态的 Cloud-init 服务。

### 在现有系统上设置 Cloud-init

Cloud-init 可能在新系统首次启动时最有用，它可以查询配置数据，并根据指令对系统进行定制。它可以[包含在树莓派和单板计算机的磁盘镜像中][6]，也可以添加到用于<ruby>配给<rt>provision</rt></ruby>虚拟机的镜像中。对于测试用途来说，无论是在现有系统上安装并运行 Cloud-init，还是安装一个新系统，然后设置 Cloud-init，都是很容易的。

作为大多数云提供商使用的主要服务，大多数 Linux 发行版都支持 Cloud-init。在这个例子中，我将使用 Fedora 31 Server 来安装树莓派，但在 Raspbian、Ubuntu、CentOS 和大多数其他发行版上也可以用同样的方式来完成。

#### 安装并启用云计算初始服务

在你想作为 Cloud-init 客户端的系统上，安装 Cloud-init 包。如果你使用的是 Fedora：

```
# Install the cloud-init package
dnf install -y cloud-init
```

Cloud-init 实际上是四个不同的服务（至少在 systemd 下是这样），这些服务负责检索配置数据，并在启动过程的不同阶段进行配置更改，这使得可以做的事情更加灵活。虽然你不太可能直接与这些服务进行太多交互，但在你需要排除一些故障时，知道它们是什么还是很有用的。它们是：

  * cloud-init-local.service
  * cloud-init.service
  * cloud-config.service
  * cloud-final.service

启用所有四个服务：

```
# Enable the four cloud-init services
systemctl enable cloud-init-local.service
systemctl enable cloud-init.service
systemctl enable cloud-config.service
systemctl enable cloud-final.service
```

#### 配置数据源以查询

启用服务后，请配置数据源，客户端将从该数据源查询配置数据。有[许多数据源类型][7]，而且大多数都是为特定的云提供商配置的。对于你的家庭实验室，请使用 NoCloud 数据源，（如上所述）它是为在没有云提供商的情况下使用 Cloud-init 而设计的。

NoCloud 允许以多种方式包含配置信息：以内核参数中的键/值对，用于在启动时挂载的 CD（或虚拟机中的虚拟 CD）；包含在文件系统中的文件中；或者像本例中一样，通过 HTTP 从指定的 URL（“NoCloud Net” 选项）获取配置信息。

数据源配置可以通过内核参数提供，也可以在 Cloud-init 配置文件 `/etc/cloud/cloud.cfg` 中进行设置。该配置文件对于使用自定义磁盘镜像设置 Cloud-init 或在现有主机上进行测试非常方便。

Cloud-init 还会合并在 `/etc/cloud/cloud.cfg.d/` 中找到的任何 `*.cfg` 文件中的配置数据，因此为了保持整洁，请在 `/etc/cloud/cloud.cfg.d/10_datasource.cfg` 中配置数据源。Cloud-init 可以通过使用以下语法从 `seedfrom` 键指向的 HTTP 数据源中读取数据。

```
seedfrom: http://ip_address:port/
```

IP 地址和端口是你将在本文后面创建的 Web 服务。我使用了我的笔记本电脑的 IP 和 8080 端口。这也可以是 DNS 名称。

创建 `/etc/cloud/cloud.cfg.d/10_datasource.cfg` 文件：

```
# Add the datasource:
# /etc/cloud/cloud.cfg.d/10_datasource.cfg

# NOTE THE TRAILING SLASH HERE!
datasource:
  NoCloud:
    seedfrom: http://ip_address:port/
```

客户端设置就是这样。现在，重新启动客户端后，它将尝试从你在 `seedfrom` 键中输入的 URL 检索配置数据，并进行必要的任何配置更改。

下一步是设置一个 Web 服务器来侦听客户端请求，以便你确定需要提供的服务。

### 设置网络服务器以审查客户请求

你可以使用 [Podman][8] 或其他容器编排工具（如 Docker 或 Kubernetes）快速创建和运行 Web 服务器。这个例子使用的是 Podman，但同样的命令也适用于 Docker。

要开始，请使用 `fedora:31` 容器镜像并创建一个容器文件（对于 Docker 来说，这会是一个 Dockerfile）来安装和配置 Nginx。从该容器文件中，你可以构建一个自定义镜像，并在你希望提供 Cloud-init 服务的主机上运行它。

创建一个包含以下内容的容器文件：

```
FROM fedora:31

ENV NGINX_CONF_DIR "/etc/nginx/default.d"
ENV NGINX_LOG_DIR "/var/log/nginx"
ENV NGINX_CONF "/etc/nginx/nginx.conf"
ENV WWW_DIR "/usr/share/nginx/html"

# Install Nginx and clear the yum cache
RUN dnf install -y nginx \
      && dnf clean all \
      && rm -rf /var/cache/yum

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout ${NGINX_LOG_DIR}/access.log \
    && ln -sf /dev/stderr ${NGINX_LOG_DIR}/error.log

# Listen on port 8080, so root privileges are not required for podman
RUN sed -i -E 's/(listen)([[:space:]]*)(\[\:\:\]\:)?80;$/\1\2\38080 default_server;/' $NGINX_CONF
EXPOSE 8080

# Allow Nginx PID to be managed by non-root user
RUN sed -i '/user nginx;/d' $NGINX_CONF
RUN sed -i 's/pid \/run\/nginx.pid;/pid \/tmp\/nginx.pid;/' $NGINX_CONF

# Run as an unprivileged user
USER 1001

CMD ["nginx", "-g", "daemon off;"]
```

注：本例中使用的容器文件和其他文件可以在本项目的 [GitHub 仓库][9]中找到。

上面容器文件中最重要的部分是改变日志存储方式的部分（写到 STDOUT 而不是文件），这样你就可以在容器日志中看到进入该服务器的请求。其他的一些改变使你可以在没有 root 权限的情况下使用 Podman 运行容器，也可以在没有 root 权限的情况下运行容器中的进程。

在 Web 服务器上的第一个测试并不提供任何 Cloud-init 数据；只是用它来查看 Cloud-init 客户端的请求。

创建容器文件后，使用 Podman 构建并运行 Web 服务器镜像：

```
# Build the container image
$ podman build -f Containerfile -t cloud-init:01 .

# Create a container from the new image, and run it
# It will listen on port 8080
$ podman run --rm -p 8080:8080 -it cloud-init:01
```

这会运行一个容器，让你的终端连接到一个伪 TTY。一开始看起来什么都没有发生，但是对主机 8080 端口的请求会被路由到容器内的 Nginx 服务器，并且在终端窗口中会出现一条日志信息。这一点可以用主机上的 `curl` 命令进行测试。

```
# Use curl to send an HTTP request to the Nginx container
$ curl http://localhost:8080
```

运行该 `curl` 命令后，你应该会在终端窗口中看到类似这样的日志信息：

```
127.0.0.1 - - [09/May/2020:19:25:10 +0000] "GET / HTTP/1.1" 200 5564 "-" "curl/7.66.0" "-"
```

现在，有趣的部分来了：重启 Cloud-init 客户端，并观察 Nginx 日志，看看当客户端启动时， Cloud-init 向 Web 服务器发出了什么请求。

当客户端完成其启动过程时，你应该会看到类似的日志消息。

```
2020/05/09 22:44:28 [error] 2#0: *4 open() "/usr/share/nginx/html/meta-data" failed (2: No such file or directory), client: 127.0.0.1, server: _, request: "GET /meta-data HTTP/1.1", host: "instance-data:8080"
127.0.0.1 - - [09/May/2020:22:44:28 +0000] "GET /meta-data HTTP/1.1" 404 3650 "-" "Cloud-Init/17.1" "-"
```

注：使用 `Ctrl+C` 停止正在运行的容器。

你可以看到请求是针对 `/meta-data` 路径的，即 `http://ip_address_of_the_webserver:8080/meta-data`。这只是一个 GET 请求 —— Cloud-init 并没有向 Web 服务器发送任何数据。它只是盲目地从数据源 URL 中请求文件，所以要由数据源来识别主机的要求。这个简单的例子只是向任何客户端发送通用数据，但一个更大的家庭实验室应该需要更复杂的服务。

在这里，Cloud-init 请求的是[实例元数据][10]信息。这个文件可以包含很多关于实例本身的信息，例如实例 ID、分配实例的主机名、云 ID，甚至网络信息。

创建一个包含实例 ID 和主机名的基本元数据文件，并尝试将其提供给 Cloud-init 客户端。

首先，创建一个可复制到容器镜像中的 `meta-data` 文件。

```
instance-id: iid-local01
local-hostname: raspberry
hostname: raspberry
```

实例 ID（`instance-id`）可以是任何东西。但是，如果你在 Cloud-init 运行后更改实例 ID，并且文件被送达客户端，就会触发 Cloud-init 再次运行。你可以使用这种机制来更新实例配置，但你应该意识到它是这种工作方式。

`local-hostname` 和 `hostname` 键正如其名，它们会在 Cloud-init 运行时为客户端设置主机名信息。

在容器文件中添加以下行以将 `meta-data` 文件复制到新镜像中。

```
# Copy the meta-data file into the image for Nginx to serve it
COPY meta-data ${WWW_DIR}/meta-data
```

现在，用元数据文件重建镜像（使用一个新的标签以方便故障排除），并用 Podman 创建并运行一个新的容器。

```
# Build a new image named cloud-init:02
podman build -f Containerfile -t cloud-init:02 .

# Run a new container with this new meta-data file
podman run --rm -p 8080:8080 -it cloud-init:02
```

新容器运行后，重启 Cloud-init 客户端，再次观察 Nginx 日志。

```
127.0.0.1 - - [09/May/2020:22:54:32 +0000] "GET /meta-data HTTP/1.1" 200 63 "-" "Cloud-Init/17.1" "-"
2020/05/09 22:54:32 [error] 2#0: *2 open() "/usr/share/nginx/html/user-data" failed (2: No such file or directory), client: 127.0.0.1, server: _, request: "GET /user-data HTTP/1.1", host: "instance-data:8080"
127.0.0.1 - - [09/May/2020:22:54:32 +0000] "GET /user-data HTTP/1.1" 404 3650 "-" "Cloud-Init/17.1" "-"
```

你看，这次 `/meta-data` 路径被提供给了客户端。成功了！

然而，客户端接着在 `/user-data` 路径上寻找第二个文件。该文件包含实例所有者提供的配置数据，而不是来自云提供商的数据。对于一个家庭实验室来说，这两个都是你自己提供的。

你可以使用[许多 user-data 模块][11]来配置你的实例。对于这个例子，只需使用 `write_files` 模块在客户端创建一些测试文件，并验证 Cloud-init 是否工作。

创建一个包含以下内容的用户数据文件：

```
#cloud-config

# Create two files with example content using the write_files module
write_files:
 - content: |
    "Does cloud-init work?"
   owner: root:root
   permissions: '0644'
   path: /srv/foo
 - content: |
   "IT SURE DOES!"
   owner: root:root
   permissions: '0644'
   path: /srv/bar
```

除了使用 Cloud-init 提供的 `user-data` 模块制作 YAML 文件外，你还可以将其制作成一个可执行脚本供 Cloud-init 运行。

创建 `user-data` 文件后，在容器文件中添加以下行，以便在重建映像时将其复制到镜像中：

```
# Copy the user-data file into the container image
COPY user-data ${WWW_DIR}/user-data
```

重建镜像，并创建和运行一个新的容器，这次使用用户数据信息：

```
# Build a new image named cloud-init:03
podman build -f Containerfile -t cloud-init:03 .

# Run a new container with this new user-data file
podman run --rm -p 8080:8080 -it cloud-init:03
```

现在，重启 Cloud-init 客户端，观察 Web 服务器上的 Nginx 日志：

```
127.0.0.1 - - [09/May/2020:23:01:51 +0000] "GET /meta-data HTTP/1.1" 200 63 "-" "Cloud-Init/17.1" "-"
127.0.0.1 - - [09/May/2020:23:01:51 +0000] "GET /user-data HTTP/1.1" 200 298 "-" "Cloud-Init/17.1" "-
```

成功了！这一次，元数据和用户数据文件都被送到了 Cloud-init 客户端。

### 验证 Cloud-init 已运行

从上面的日志中，你知道 Cloud-init 在客户端主机上运行并请求元数据和用户数据文件，但它用它们做了什么？你可以在 `write_files` 部分验证 Cloud-init 是否写入了你在用户数据文件中添加的文件。

在 Cloud-init 客户端上，检查 `/srv/foo` 和 `/srv/bar` 文件的内容：

```
# cd /srv/ && ls
bar foo
# cat foo
"Does cloud-init work?"
# cat bar
"IT SURE DOES!"
```

成功了！文件已经写好了，并且有你期望的内容。

如上所述，还有很多其他模块可以用来配置主机。例如，用户数据文件可以配置成用 `apt` 添加包、复制 SSH 的 `authorized_keys`、创建用户和组、配置和运行配置管理工具等等。我在家里的私有云中使用它来复制我的 `authorized_keys`、创建一个本地用户和组，并设置 sudo 权限。

### 你接下来可以做什么

Cloud-init 在家庭实验室中很有用，尤其是专注于云技术的实验室。本文所演示的简单服务对于家庭实验室来说可能并不是超级有用，但现在你已经知道 Cloud-init 是如何工作的了，你可以继续创建一个动态服务，可以用自定义数据配置每台主机，让家里的私有云更类似于主流云提供商提供的服务。

在数据源稍显复杂的情况下，将新的物理（或虚拟）机器添加到家中的私有云中，可以像插入它们并打开它们一样简单。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/create-simple-cloud-init-service-your-homelab

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://cloudinit.readthedocs.io/
[3]: https://linux.cn/article-12371-1.html
[4]: https://opensource.com/sites/default/files/uploads/cloud-init.jpg (A screen showing the boot process for a Linux server running Cloud-init )
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://linux.cn/article-12277-1.html
[7]: https://cloudinit.readthedocs.io/en/latest/topics/datasources.html
[8]: https://podman.io/
[9]: https://github.com/clcollins/homelabCloudInit/tree/master/simpleCloudInitService/data
[10]: https://cloudinit.readthedocs.io/en/latest/topics/instancedata.html#what-is-instance-data
[11]: https://cloudinit.readthedocs.io/en/latest/topics/modules.html
