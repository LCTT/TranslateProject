使用 Cockpit 方便地管理容器
============================================================

 ![cockpit](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/cockpit-containers.jpg?itok=D3MMNlkg "cockpit")
 
> 如果你正在寻找一种管理运行容器的 Linux 服务器的简单方法，那么你应该看看 Cockpit。

如果你管理着一台 Linux 服务器，那么你可能正在寻找一个可靠的管理工具。为了这个你可能已经看了 [Webmin][14] 和 [cPanel][15] 这类软件。但是，如果你正在寻找一种简单的方法来管理还包括了 Docker 的 Linux 服务器，那么有一个工具可以用于这个需求：[Cockpit][16]。

为什么使用 Cockpit？因为它可以处理这些管理任务：

*   连接并管理多台机器
*   通过 Docker 管理容器
*   与 Kubernetes 或 Openshift 集群进行交互
*   修改网络设置
*   管理用户帐号
*   通过基于 Web 的 shell 访问
*   通过图表查看系统性能信息
*   查看系统服务和日志文件

Cockpit 可以安装在 [Debian][17]、[Red Hat][18]、[CentOS][19]、[Arch Linux][20] 和 [Ubuntu][21] 之上。在这里，我将使用一台已经安装了 Docker 的 Ubuntu 16.04 服务器来安装系统。

在上面的功能列表中，其中最突出的是容器管理。为什么？因为它使安装和管理容器变得非常简单。事实上，你可能很难找到更好的容器管理解决方案。

因此，让我们来安装这个方案并看看它的使用是多么简单。

### 安装

正如我前面提到的，我将在一台运行着 Docker 的 Ubuntu 16.04 实例上安装 Cockpit。安装步骤很简单。你要做的第一件事是登录你的 Ubuntu 服务器。接下来，你必须使用下面的命令添加必要的仓库：

```
sudo add-apt-repository ppa:cockpit-project/cockpit
```

出现提示时，按下键盘上的回车键，等待提示返回。一旦返回到 bash 提示符，使用下面的命令来更新 apt：

```
sudo apt-get get update
```

使用下面的命令安装 Cockpit：

```
sudo apt-get -y install cockpit cockpit-docker
```

安装完成后，需要启动 Cockpit 服务并使它开机自动启动。要做到这个，使用下面的两个命令：

```
sudo systemctl start cockpit
sudo systemctl enable cockpit
```

安装就到这里了。

### 登录到 Cockpit

要访问 Cockpit 的 web 界面，打开浏览器（与 Cockpit 服务器在同一个网络内），输入 `http://IP_OF_SERVER:9090`，你就会看到登录页面（图 1）。

 ![login](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/cockpit_a.jpg?itok=RViOst2V "login") 

*图 1：Cockpit 登录页面。*

在 Ubuntu 中使用 Cockpit 有个警告。Cockpit 中的很多任务需要管理员权限。如果你使用普通用户登录，则无法使用 Docker 等一些工具。 要解决这个问题，你可以在 Ubuntu 上启用 root 用户。但这并不总是一个好主意。通过启用 root 帐户，你将绕过已经建立多年的安全系统。但是，在本文的用途中，我将使用以下两个命令启用 root 用户：

```
sudo passwd root
sudo passwd -u root 
```

注意，请确保给 root 帐户一个强壮的密码。

你想恢复这个修改的话，你只需输入下面的命令：

```
sudo passwd -l root
```

在其他发行版（如 CentOS 和 Red Hat）中，你可以使用用户名 `root` 及其密码登录 Cockpit，而无需像上面那样需要额外的步骤。

如果你对启用 root 用户感到担心，则可以在服务器的终端窗口拉取镜像（使用命令 `docker pull IMAGE_NAME`， 这里的 `IMAGE_NAME` 是你要拉取的镜像）。这会将镜像添加到你的 docker 服务器中，然后可以通过普通用户进行管理。唯一需要注意的是，普通用户必须使用以下命令将自己添加到 Docker 组：

```
sudo usermod -aG docker USER
```

其中，`USER` 是实际添加到组的用户名。在你完成后，重新登出并登入，接着使用下面的命令重启 Docker：

```
sudo service docker restart
```

现在常规用户可以启动并停止 Docker 镜像/容器而无需启用 root 用户了。唯一一点是用户不能通过 Cockpit 界面添加新的镜像。

### 使用 Cockpit

一旦你登录后，你可以看到 Cockpit 的主界面（图 2）。

 ![main window](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/cockpit_b.jpg?itok=tZCHcq-Y "main window") 

*图 2：Cockpit 主界面。*

你可以通过每个栏目来检查服务器的状态等，但是我们想要直接进入容器。单击 “Containers” 那栏以显示当前运行的以及可用的镜像（图3）。

 ![Cockpit](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/cockpit_c.jpg?itok=OOYJt2yv "Cockpit") 

*图 3：使用 Cockpit 管理容器难以置信地简单。*

要启动一个镜像，只要找到镜像并点击关联的启动按钮。在弹出的窗口中（图 4），你可以在点击运行之前查看所有镜像的信息（并根据需要调整）。

 ![Running Docker image](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/cockpit_d.jpg?itok=8uldEq_r "Running Docker image") 

*图 4： 使用 Cockpit 运行 Docker 镜像。*

镜像运行后，你可以点击它查看状态，并可以停止、重启、删除实例。你也可以点击修改资源限制并接着调整内存限制还有（或者）CPU 优先级。

### 添加新的镜像

假设你以 root 用户身份登录。如果是这样，那么你可以在 Cockpit GUI 的帮助下添加新的镜像。在“ Container” 栏目下，点击获取新的镜像按钮，然后在新的窗口中搜索要添加的镜像。假设你要添加 CentOS 的最新官方版本。在搜索栏中输入 centos，在得到搜索结果后，选择官方列表，然后单击下载（图5）。

 ![Adding image](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/cockpit_f.jpg?itok=_S5g8Da2 "Adding image") 

*图 5：使用 Cockpit 添加最新的官方构建 CentOS 镜像到 Docker 中。*

镜像下载完后，那它就在 Docker 中可用了，并可以通过 Cockpit 运行。

### 如获取它那样简单

管理 Docker 并不容易。是的，在 Ubuntu 上运行 Cockpit 会有一个警告，但如果这是你唯一的选择，那么也有办法让它工作。在 Cockpit 的帮助下，你不仅可以轻松管理 Docker 镜像，也可以在任何可以访问 Linux 服务器的 web 浏览器上这样做。请享受这个新发现的让 Docker 易用的方法。

_在 Linux Foundation 以及 edX 中通过免费的 ["Introduction to Linux"][13] 课程学习 Linux。_

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/3/make-container-management-easy-cockpit

作者：[JACK WALLEN][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/used-permission
[3]:https://www.linux.com/licenses/category/used-permission
[4]:https://www.linux.com/licenses/category/used-permission
[5]:https://www.linux.com/licenses/category/used-permission
[6]:https://www.linux.com/licenses/category/creative-commons-zero
[7]:https://www.linux.com/files/images/cockpitajpg
[8]:https://www.linux.com/files/images/cockpitbjpg
[9]:https://www.linux.com/files/images/cockpitcjpg
[10]:https://www.linux.com/files/images/cockpitdjpg
[11]:https://www.linux.com/files/images/cockpitfjpg
[12]:https://www.linux.com/files/images/cockpit-containersjpg
[13]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[14]:http://www.webmin.com/
[15]:http://cpanel.com/
[16]:http://cockpit-project.org/
[17]:https://www.debian.org/
[18]:https://www.redhat.com/en
[19]:https://www.centos.org/
[20]:https://www.archlinux.org/
[21]:https://www.ubuntu.com/
