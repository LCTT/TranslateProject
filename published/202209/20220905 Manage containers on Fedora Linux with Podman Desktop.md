[#]: subject: "Manage containers on Fedora Linux with Podman Desktop"
[#]: via: "https://fedoramagazine.org/manage-containers-on-fedora-linux-with-podman-desktop/"
[#]: author: "Mehdi Haghgoo https://fedoramagazine.org/author/powergame/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15058-1.html"

使用 Podman Desktop 在 Fedora Linux 上管理容器
======

![][1]

> Podman Desktop 是一个开源 GUI 应用，用于在 Linux、macOS 和 Windows 上管理容器。

从历史上看，开发人员一直使用 Docker Desktop 对容器进行图形化管理。这适用于那些安装了 Docker Daemon 和 Docker CLI 的人。然而，对于那些使用无守护进程的 Podman 工具的人来说，虽然有一些 Podman 前端，如 [Pods][2]、[Podman desktop companion][3] 和 [Cockpit][4]，但没有官方应用。现在不是这种情况了。有了 Podman Desktop！

本文将讨论由红帽和其他开源贡献者开发的 Podman Desktop 的特性、安装和使用。

### 安装

要在 Fedora Linux 上安装 Podman Desktop，请访问 [podman-desktop.io][5]，然后单击 “Download for Linux” 按钮。你将看到两个选项：Flatpak 和 zip。在这个例子中，我们使用的是 Flatpak。单击 “Flatpak” 链接后，通过双击文件在 GNOME 软件中打开它（如果你使用的是 GNOME）。你也可以通过终端安装它：

```
flatpak install podman-desktop-X.X.X.flatpak
```

在上面的命令中，将 X.X.X 替换为你下载的特定版本。如果你下载了 zip 文件，那么解压缩存档，然后启动 Podman Desktop 应用的二进制文件。你还可以通过进入 GitHub 上项目的 [发布][6] 页找到预发布版本。

### 特性

Podman Desktop 仍处于早期阶段。然而，它支持许多常见的容器操作，如创建容器镜像、运行容器等。此外，你可以在 “<ruby>首选项<rt>Preferences</rt></ruby>” 的 “<ruby>扩展<rt>Extensions</rt></ruby>” 部分下找到 Podman 扩展，你可以使用它来管理 macOS 和 Windows 上的 Podman 虚拟机。

此外，Podman Desktop 支持 Docker Desktop 扩展。你可以在 “<ruby>首选项<rt>Preferences</rt></ruby>” 下的 “Docker Desktop Extensions” 安装此类扩展。应用窗口有两个窗格。左侧窄窗格显示应用的不同功能，右侧窗格是内容区域，它将根据左侧选择的内容显示相关信息。

![Podman Desktop 0.0.6 在 Fedora 36 上运行][7]

### 演示

为了全面了解 Podman Desktop 的功能，我们将从 Dockerfile 创建一个镜像并将其推送到注册中心，然后拉取并运行它，这一切都在 Podman Desktop 中完成。

#### 构建镜像

第一步是通过在命令行中输入以下行来创建一个简单的 Dockerfile：

```
cat <<EOF>>Dockerfile
FROM docker.io/library/httpd:2.4
COPY . /var/www/html 
WORKDIR /var/www/html 

CMD ["httpd", "-D", "FOREGROUND"]
EOF
```

现在，点击 “<ruby>镜像<rt>Images</rt></ruby>” 并按下 “<ruby>构建镜像<rt>Build Image</rt></ruby>” 按钮。你将被带到一个新页面以指定 Dockerfile、构建上下文和镜像名称。在 Containerfile 路径下，单击并浏览以选择你的 Dockerfile。在镜像名称下，输入镜像的名称。如果要将镜像推送到容器注册中心，那么可以以 `example.com/username/repo:tag` 形式指定完全限定的镜像名称（FQIN）。在此示例中，我输入 `quay.io/codezombie/demo-httpd:latest`，因为我在 `quay.io` 上有一个名为 `demo-httpd` 的公共仓库。你可以按照类似的格式来指定容器注册中心（Quay、Docker Hub、GitHub Container Registry 等）的 FQIN。现在，按下 “<ruby>构建<rt>Build</rt></ruby>” 按钮并等待构建完成。

#### 推送镜像

构建完成后，就该推送镜像了。所以，我们需要在 Podman Desktop 中配置一个注册中心。进入  “<ruby>首选项<rt>Preferences</rt></ruby>” -> “<ruby>注册中心<rt>Registries</rt></ruby>” 并按下 “<ruby>添加注册中心<rt>Add registry</rt></ruby>” 按钮。

![添加注册中心对话框][8]

在 “<ruby>添加注册中心<rt>Add registry</rt></ruby>” 对话框中，输入你的注册中心服务器地址和用户凭据，然后单击 “<ruby>添加注册中心<rt>Add registry</rt></ruby>”。

现在，回到镜像列表中我的镜像，并按下上传图标将其推送到仓库。当你将鼠标悬停在设置中添加的注册中心名称开头的镜像名称上时（此演示中的 `quay.io`），镜像名称旁边会出现一个推送按钮。

![将鼠标悬停在镜像名称上时出现的按钮][9]

![镜像通过 Podman Desktop 推送到仓库][10]

镜像被推送后，任何有权访问镜像仓库的人都可以拉取它。由于我的镜像仓库是公开的，因此你可以轻松地将其拉入 Podman Desktop。

#### 拉取镜像

因此，为确保一切正常，请在本地删除此镜像并将其拉入 Podman Desktop。在列表中找到镜像并按删除图标将其删除。删除镜像后，单击 “<ruby>拉取镜像<rt>Pull Image</rt></ruby>” 按钮。在 “<ruby>要拉取的镜像<rt>Image to Pull</rt></ruby>” 输入完全限定名称，然后按 “<ruby>拉取镜像<rt>Pull Image</rt></ruby>”。

![Our container image is successfully pulled][11]

#### 创建一个容器

作为 Podman Desktop 演示的最后一部分，让我们从镜像中启动一个容器并检查结果。转到 “<ruby>容器<rt>Containers</rt></ruby>” 并按 “<ruby>创建容器<rt>Create Container</rt></ruby>”。这将打开一个包含两个选项的对话框：“<ruby>从 Containerfile/Dockerfile<rt>From Containerfile/Dockerfile</rt></ruby>” 和 “<ruby>从已有镜像<rt>From existing image</rt></ruby>”。按下 “<ruby>从已有镜像<rt>From existing image</rt></ruby>”。这将进入镜像列表。在那里，选择我们要拉取的镜像。

![在 Podman Desktop 中创建容器][12]

现在，我们从列表中选择我们最近拉取的镜像，然后按它前面的 “<ruby>运行<rt>Play</rt></ruby>” 按钮。在出现的对话框中，我输入 `demo-web` 作为容器名，输入 `8000` 作为端口映射，然后按下 “<ruby>启动容器<rt>Start Container</rt></ruby>”。

![Container configuration][13]

容器开始运行，我们可以通过运行以下命令检查 Apache 服务器的默认页面：

```
curl http://localhost:8000
```

![可以工作！][14]

你还应该能够在容器列表中看到正在运行的容器，其状态已更改为 “<ruby>运行中<rt>Running</rt></ruby>”。在那里，你会在容器前面找到可用的操作。例如，你可以单击终端图标打开 TTY 进入到容器中！

![][15]

### 接下来是什么

Podman Desktop 还很年轻，处于 [积极开发][16] 中。 GitHub 上有一个项目 [路线图][17]，其中列出了令人兴奋的按需功能，包括：

* Kubernetes 集成
* 支持 Pod
* 任务管理器
* 卷支持
* 支持 Docker Compose
* Kind 支持

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/manage-containers-on-fedora-linux-with-podman-desktop/

作者：[Mehdi Haghgoo][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/powergame/
[b]: https://github.com/lkxed
[1]: https://fedoramagazine.org/wp-content/uploads/2022/09/podman-desktop-on-fedora-816x345.jpg
[2]: https://github.com/marhkb/pods
[3]: https://github.com/iongion/podman-desktop-companion
[4]: https://github.com/cockpit-project/cockpit/
[5]: https://podman-desktop.io/
[6]: https://github.com/containers/podman-desktop/releases/
[7]: https://fedoramagazine.org/wp-content/uploads/2022/08/pd.png
[8]: https://fedoramagazine.org/wp-content/uploads/2022/08/registry.png
[9]: https://fedoramagazine.org/wp-content/uploads/2022/08/image.png
[10]: https://fedoramagazine.org/wp-content/uploads/2022/08/Screenshot-from-2022-08-27-23-51-38.png
[11]: https://fedoramagazine.org/wp-content/uploads/2022/08/image-2.png
[12]: https://fedoramagazine.org/wp-content/uploads/2022/08/image-3.png
[13]: https://fedoramagazine.org/wp-content/uploads/2022/08/image-5.png
[14]: https://fedoramagazine.org/wp-content/uploads/2022/08/image-6.png
[15]: https://fedoramagazine.org/wp-content/uploads/2022/09/image-2-1024x393.png
[16]: https://github.com/containers/podman-desktop
[17]: https://github.com/orgs/containers/projects/2
