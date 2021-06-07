[#]: collector: (lujun9972)
[#]: translator: (Chao-zhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13015-1.html)
[#]: subject: (Monitor and Manage Docker Containers with Portainer.io \(GUI tool\) – Part-2)
[#]: via: (https://www.linuxtechi.com/monitor-manage-docker-containers-portainer-io-part-2/)
[#]: author: (Shashidhar Soppin https://www.linuxtechi.com/author/shashidhar/)

用 Portainer.io 来监控和管理 Docker 容器（2）
======

![](https://img.linux.net.cn/data/attachment/album/202101/14/204401knuxjru53n5su6ns.jpg)

作为[第 1 部分](https://linux.cn/article-12634-1.html)的延续，本第 2 部分将介绍 Portainer 的其余功能。

### 监控 docker 容器镜像

```
root@linuxtechi ~}$ docker ps -a
CONTAINER ID        IMAGE                 COMMAND             CREATED             STATUS   PORTS                             NAMES
9ab9aa72f015        ubuntu                "/bin/bash"         14 seconds ago      Exited (0) 12 seconds ago                  suspicious_shannon
305369d3b2bb        centos                "/bin/bash"         24 seconds ago      Exited (0) 22 seconds ago                  admiring_mestorf
9a669f3dc4f6        portainer/portainer   "/portainer"        7 minutes ago       Up 7 minutes   0.0.0.0:9000->9000/tcp      trusting_keller
```

包括 `portainer`（docker 容器镜像），所有已退出和当前正在运行的 docker 镜像都会显示出来。下面的 Portainer GUI 屏幕截图显示了相同的情况。

![Docker_status][1]

### 监视事件

单击 portainer 网页中的“Events”选项，如下所示。

基于 docker 容器活动生成和创建的各种事件将被提取并显示在此页面中.

![Container-Events-Poratiner-GUI][3]

现在检查并验证“Events”部分是如何工作的。创建一个新的 docker 容器镜像 `redis`，如下所述，在 docker 命令行检查状态：`docker ps –a`：

```
root@linuxtechi ~}$ docker ps -a
CONTAINER ID        IMAGE                 COMMAND                  CREATED              STATUS         PORTS                    NAMES
cdbfbef59c31        redis                 "docker-entrypoint.s…"   About a minute ago   Up About a minute         6379/tcp                 angry_varahamihira
9ab9aa72f015        ubuntu                "/bin/bash"              10 minutes ago       Exited (0) 10 minutes ago                            suspicious_shannon
305369d3b2bb        centos                "/bin/bash"              11 minutes ago       Exited (0) 11 minutes ago                            admiring_mestorf
9a669f3dc4f6        portainer/portainer   "/portainer"             17 minutes ago       Up 17 minutes         0.0.0.0:9000->9000/tcp   trusting_keller
```

单击顶部的“Event List”刷新事件列表，

![events_updated][5]

现在事件的页面也更新了这个变化，

### 主机状态

下面是 portainer 显示主机状态的屏幕截图。这是一个简单的窗口。这显示了主机 Linux 机器的基本信息，如“CPU”、“主机名”、“操作系统信息”等。这个页面在不需要登录主机命令行的情况下提供了非常有用的信息，以便快速浏览。

![Host-names-Portainer][7]

### Portainer 中的仪表板

到目前为止，我们已经在“Local”部分看到了基于 portainer 的各种特性。现在跳到所选 Docker 容器镜像的“Dashboard”部分。

在 Portainer 的网页中单击“EndPoint”选项时，会出现以下窗口：

![End_Point_Settings][9]

对于主机容器镜像，此仪表板有许多状态和选项。

#### Stacks

单击此选项可提供任何堆栈（如果有的话）的状态。因为这里没有堆栈，所以显示为零。

#### Images

单击此选项可提供主机中可用的容器镜像。此选项将显示所有活动和退出的容器镜像。

![Docker-Container-Images-Portainer][11]

例如，再创建一个“Nginx”容器并刷新此列表以查看更新：

```
root@linuxtechi ~}$  sudo docker run nginx
Unable to find image 'nginx:latest' locally
latest: Pulling from library/nginx
27833a3ba0a5: Pull complete
ea005e36e544: Pull complete
d172c7f0578d: Pull complete
Digest: sha256:e71b1bf4281f25533cf15e6e5f9be4dac74d2328152edf7ecde23abc54e16c1c
Status: Downloaded newer image for nginx:latest
```

下面是刷新后的镜像界面：

![Nginx_Image_creation][13]

当 Nginx 镜像处于 `stopped`/`killed` 状态时，docker 的容器镜像会改变为 `unused` 状态。

**注**：你可以看到这里所有的镜像的细节都非常清楚，比如内存使用，创建日期和时间。与命令行选项相比，从这里维护和监视容器将非常容易。

#### Networks

此选项用于网络操作。例如分配 IP 地址、创建子网、提供 IP 地址范围、访问控制（管理员和普通用户）。下面的窗口提供了各种可能选项的详细信息。根据你的需要，可以进一步去自行研究这些选项。

![Conatiner-Network-Portainer][15]

输入所有各种网络参数后，单击“create network”按钮即可创建网络。

#### Container

此选项将提供容器状态。此列表将提供有关活动的和未运行的容器状态的详细信息。此输出类似于 docker ps 命令选项。

![Containers-Status-Portainer][17]

在该窗口中，通过选中复选框并选择上述按钮可以根据需要控制容器停止和启动。一个例子如下：

例如，“CentOS”和“Ubuntu”容器都处于停止状态，现在可以通过选中复选框并点击“Start”按钮来启动它们。

![start_containers1][19]

![start_containers2][21]

**注意：** 因为这两个都是 Linux 容器镜像，所以不会被启动。Portainer 尝试启动，但稍后又停止。试试启动“Nginx”，你会看到它变成了 `running` 状态。

![start_containers3][23]

#### Volume

参见本文章第一部分。

### Portainer 中的设置选项

到目前为止，我们已经在“Local”部分看到了基于 portainer 的各种特性。现在跳到所选 Docker 容器图像的“Settings”部分。

在 Portainer 的网页中单击“Settings”选项时，可以使用以下的配置选项：

#### Extensions

这是一个简单的 Portainer CE 订阅程序。详细信息和用途可以从附加的窗口中看到。这主要用于维护相应版本的许可证和订阅。

![Extensions][25]

#### Users

此选项用于添加具有或不具有管理权限的“用户”。下面的示例提供了相同的示例。

在本例中输入你的想好的用户名比如“shashi”和你选择的密码，然后点击下面的“Create User”按钮。

![create_user_portainer][27]

![create_user2_portainer][29]

![Internal-user-Portainer][31]

类似地，可以通过选中复选框并点击 “remove” 按钮来删除刚刚创建的用户“shashi”。

![user_remove_portainer][33]

#### Endpoints

此选项用于端点终端管理。终端可以添加和删除，如附加窗口中所示。

![Endpoint-Portainer-GUI][35]

新终端“shashi”是使用如下所示的各种默认参数创建的，

![Endpoint2-Portainer-GUI][37]

类似地，可以通过单击复选框并单击移除按钮来移除此端点。

#### Registries

此选项用于注册管理。由于 docker hub 有各种镜像的注册，因此此功能可用于类似的目的。

![Registry-Portainer-GUI][39]

使用默认选项就可以创建“shashi-registry”。

![Registry2-Portainer-GUI][41]

同样，如果不需要了，就可以移除它。

#### Settings

此选项用于设置以下各种选项，

* 设置快照间隔
* 设置自定义徽标
* 创建外部模板
* 安全功能，如：为非管理员禁用和启用 bin 挂载，为非管理员禁用/启用权限，启用主机管理功能

下面的屏幕截图显示了出于演示目的启用和禁用的一些选项。一旦全部完成点击“保存设置”按钮保存所有这些选项。

![Portainer-GUI-Settings][43]

现在点开“Authentication settings”就会弹出 LDAP、Internal 和 OAuth（extension）选项，如下所示：

![Authentication-Portainer-GUI-Settings][45]

根据我们想要的环境安全特性级别，选择相应的选项。

以上就是本文的内容，我希望这些介绍 portainer 的文章能帮助你更有效地管理和监视容器。请分享你的反馈和意见。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/monitor-manage-docker-containers-portainer-io-part-2/

作者：[Shashidhar Soppin][a]
选题：[lujun9972][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/shashidhar/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Docker_status-1024x423.jpg
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Docker_status.jpg
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Events-1024x404.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Events.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/05/events_updated-1024x414.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/05/events_updated.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Host_names-1024x408.jpg
[8]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Host_names.jpg
[9]: https://www.linuxtechi.com/wp-content/uploads/2019/05/End_Point_Settings-1024x471.jpg
[10]: https://www.linuxtechi.com/wp-content/uploads/2019/05/End_Point_Settings.jpg
[11]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Images-1024x398.jpg
[12]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Images.jpg
[13]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Nginx_Image_creation-1024x439.jpg
[14]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Nginx_Image_creation.jpg
[15]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Network-1024x463.jpg
[16]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Network.jpg
[17]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Containers-1024x364.jpg
[18]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Containers.jpg
[19]: https://www.linuxtechi.com/wp-content/uploads/2019/05/start_containers1-1024x432.jpg
[20]: https://www.linuxtechi.com/wp-content/uploads/2019/05/start_containers1.jpg
[21]: https://www.linuxtechi.com/wp-content/uploads/2019/05/start_containers2-1024x307.jpg
[22]: https://www.linuxtechi.com/wp-content/uploads/2019/05/start_containers2.jpg
[23]: https://www.linuxtechi.com/wp-content/uploads/2019/05/start_containers3-1024x435.jpg
[24]: https://www.linuxtechi.com/wp-content/uploads/2019/05/start_containers3.jpg
[25]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Extensions-1024x421.jpg
[26]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Extensions.jpg
[27]: https://www.linuxtechi.com/wp-content/uploads/2019/05/create_user-1024x350.jpg
[28]: https://www.linuxtechi.com/wp-content/uploads/2019/05/create_user.jpg
[29]: https://www.linuxtechi.com/wp-content/uploads/2019/05/create_user2-1024x372.jpg
[30]: https://www.linuxtechi.com/wp-content/uploads/2019/05/create_user2.jpg
[31]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Internal-user-Portainer-1024x257.jpg
[32]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Internal-user-Portainer.jpg
[33]: https://www.linuxtechi.com/wp-content/uploads/2019/05/user_remove-1024x318.jpg
[34]: https://www.linuxtechi.com/wp-content/uploads/2019/05/user_remove.jpg
[35]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Endpoint-1024x349.jpg
[36]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Endpoint.jpg
[37]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Endpoint2-1024x379.jpg
[38]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Endpoint2.jpg
[39]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Registry-1024x420.jpg
[40]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Registry.jpg
[41]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Registry2-1024x409.jpg
[42]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Registry2.jpg
[43]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Portainer-GUI-Settings-1024x418.jpg
[44]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Portainer-GUI-Settings.jpg
[45]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Authentication-Portainer-GUI-Settings-1024x344.jpg
[46]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Authentication-Portainer-GUI-Settings.jpg
