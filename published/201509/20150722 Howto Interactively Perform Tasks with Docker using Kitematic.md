如何在 Windows 上通过 Kitematic 使用 Docker
================================================================================

在本篇文章中，我们会学习如何在 Windows 操作系统上安装 Kitematic 以及部署一个测试性的 Nginx Web 服务器。Kitematic 是一个具有现代化的界面设计的自由开源软件，它可以让我们在 Docker 中交互式执行任务。Kitematic 设计的非常漂亮、界面美观。使用它，我们可以简单快速地开箱搭建我们的容器而不需要输入命令，可以在图形用户界面中通过简单的点击从而在容器上部署我们的应用。Kitematic 集成了 Docker Hub，允许我们搜索、拉取任何需要的镜像，并在上面部署应用。它同时也能很好地切换到命令行用户接口模式。目前，它包括了自动映射端口、可视化更改环境变量、配置卷、流式日志以及其它功能。

下面是在 Windows 上安装 Kitematic 并部署测试性 Nginx Web 服务器的 3 个简单步骤。

### 1. 下载 Kitematic ###

首先，我们需要从 github 仓库 [https://github.com/kitematic/kitematic/releases][1] 中下载 Windows 操作系统可用的最新的 Kitematic 发行版。我们用下载器或者 web 浏览器下载了它的可执行 EXE 文件。下载完成后，我们需要双击可执行应用文件。

![运行 Kitematic](http://blog.linoxide.com/wp-content/uploads/2015/06/running-kitematic.png)

双击应用文件之后，会问我们一个安全问题，我们只需要点击 OK 按钮，如下图所示。

![安全警告](http://blog.linoxide.com/wp-content/uploads/2015/06/security-warning.png)

### 2. 安装 Kitematic ###

下载好可执行安装程序之后，我们现在就可以在我们的 Windows 操作系统上安装 Kitematic了。安装程序现在会开始下载并安装运行 Kitematic 需要的依赖软件，包括 Virtual Box 和 Docker。如果已经在系统上安装了 Virtual Box，它会把它升级到最新版本。安装程序会在几分钟内完成，但取决于你网络和系统的速度。如果你还没有安装 Virtual Box，它会问你是否安装 Virtual Box 网络驱动。建议安装它，因为它用于 Virtual Box 的网络功能。

![安装 Kitematic](http://blog.linoxide.com/wp-content/uploads/2015/06/installing-kitematic.png)

所需的依赖 Docker 和 Virtual Box 安装完成并运行后，会让我们登录到 Docker Hub。如果我们还没有账户或者还不想登录，可以点击 **SKIP FOR NOW** 继续后面的步骤。

![登录 Docker Hub](http://blog.linoxide.com/wp-content/uploads/2015/06/login-docker-hub.jpg)

如果你还没有账户，你可以在应用程序上点击注册（Sign Up）链接并在 Docker Hub 上创建账户。

完成之后，就会出现 Kitematic 应用程序的第一个界面。正如下面看到的这样。我们可以搜索可用的 docker 镜像。

![启动 Kitematic](http://blog.linoxide.com/wp-content/uploads/2015/07/kitematic-app-launched.jpg)

### 3. 部署 Nginx Hello World 容器 ###

现在，成功安装完 Kitematic 之后，我们打算部署容器。要运行一个容器，我们只需要在搜索区域中搜索镜像。然后点击 Create 按钮部署容器。在这篇教程中，我们会部署一个小的包含了 Hello World 主页的 Nginx Web 服务器。为此，我们在搜索区域中搜索 Hello World Nginx。看到了容器信息之后，我们点击 Create 来部署容器。

![运行 Hello World Nginx](http://blog.linoxide.com/wp-content/uploads/2015/06/hello-world-nginx-run.jpg)

镜像下载完成之后，它会自动部署。我们可以查看 Kitematic 部署容器的命令日志。我们也可以在 Kitematic 界面上预览 web 页面。现在，我们通过点击预览在 web 浏览器中查看我们的 Hello World 页面。

![浏览 Nginx Hello World](http://blog.linoxide.com/wp-content/uploads/2015/07/nginx-hello-world-browser.jpg)

如果我们想切换到命令行接口并用它管理 docker，这里有个称为 Docker CLI 的按钮，它会打开一个 PowerShell，在里面我们可以执行 docker 命令。

![Docker CLI PowerShell](http://blog.linoxide.com/wp-content/uploads/2015/07/docker-cli-powershell.png)

现在，如果我们想配置我们的容器并执行类似更改容器名称、设置环境变量、指定端口、配置容器存储以及其它高级功能的任务，我们可以在容器设置页面做到这些。

![设置 Kitematic Container](http://blog.linoxide.com/wp-content/uploads/2015/07/kitematic-container-settings.png)

### 总结 ###

我们终于成功在 Windows 操作系统上安装了 Kitematic 并部署了一个 Hello World Ngnix 服务器。推荐下载安装 Kitematic 最新的发行版，因为会增加很多新的高级功能。由于 Docker 运行在 64 位平台，当前 Kitematic 也是为 64 位操作系统构建。它只能在 Windows 7 以及更高版本上运行。

在这篇教程中，我们部署了一个 Nginx Web 服务器，类似地我们可以在 Kitematic 中简单的点击就能通过镜像部署任何 docker 容器。Kitematic 已经有可用的 Mac OS X 和 Windows 版本，Linux 版本也在开发中很快就会发布。

如果你有任何疑问、建议或者反馈，请在下面的评论框中写下来以便我们更改地改进或更新我们的内容。非常感谢！Enjoy :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/interactively-docker-kitematic/

作者：[Arun Pyasi][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://github.com/kitematic/kitematic/releases