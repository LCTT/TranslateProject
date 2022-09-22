[#]: subject: "How I switched from Docker Desktop to Colima"
[#]: via: "https://opensource.com/article/22/9/docker-desktop-colima"
[#]: author: "Michael Anello https://opensource.com/users/ultimike"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

我如何从 Docker Desktop 切换到 Colima
======
Colima 是 macOS 和 Linux 的 Docker 桌面替代品，它现在由 DDEV 支持。

![Getting started with Perlbrew][1]

图片来源：freephotocc 在 Pixabay CC0 下发布

[DDEV][2] 是一个开源工具，可以在几分钟内轻松启动和运行本地 PHP 开发环境。由于其每个项目的环境配置可以扩展、版本控制和共享，所以它很强大和灵活。简而言之，DDEV 旨在允许开发团队在其工作流程中使用容器，而无需复杂的定制配置。

DDEV 用灵活、现代、基于容器的解决方案取代了更传统的 AMP 栈解决方案（WAMP、MAMP、XAMPP 等）。因为它使用容器，DDEV 允许每个项目使用任何一组应用、Web 服务器版本、数据库服务器、搜索索引服务器和其他类型的软件。

2022 年 3 月，DDEV 团队[宣布支持 Colima][3]，这是 macOS 和 Linux 的开源 Docker 桌面替代品。 [Colima][5] 是开源的，据所有报告显示，它比其替代方案获得了[性能提升][6]，所以使用 Colima 似乎是一个没有问题的选择。。

### 迁移到 Colima

首先，Colima *几乎*是 Docker Desktop 的替代品。我说*几乎*是因为在将它用于现有的 DDEV 项目时需要重新配置。具体来说，必须重新导入数据库。解决方法是先导出数据库，然后启动 Colima，然后再导入。很简单。

Colima 要求安装 Docker 或 [Podman][7] 命令。在 Linux 上，它还需要 Lima。

Docker 默认随 Docker Desktop for macOS 一起安装，但它也可以作为独立命令使用。如果你想要 100% 纯 Colima，你可以卸载 Docker Desktop for macOS，并独立安装和配置 Docker 客户端。[完整的安装说明可以在 DDEV 文档站点上找到][8]。

![容器技术栈图片。][9]

图片来源：（Mike Anello，CC BY-SA 4.0）

如果你选择继续使用 Colima 和 Docker Desktop，那么在命令行执行 docker 命令时，你必须首先指定要使用的容器。下一节将对此进行更多介绍。

### 在 macOS 上安装 Colima

我目前有一些使用 Docker 的本地项目，还有一些使用 Colima。当我了解了基础知识，在它们之间切换就不难了。

1. 开始使用 Homebrew `brew install colima` 安装 Colima
2. ddev poweroff（为了安全起见）
3. 接下来，使用 `colima start --cpu 4 --memory 4` 启动 Colima， --cpu 和 --memory 选项只需执行一次。第一次之后，只需要 `colima start`。
4. 如果你像我一样是 DDEV 用户，那么你可以使用常用的 `ddev` 命令（ddev config、ddev start 等）启动一个全新的 Drupal 9 站点。建议启用 DDEV 的 mutagen 功能以最大化性能。

### 在 Colima 和 Docker Desktop 之间切换

如果你还没有准备好使用 Colima，你可以同时安装 Colima 和 Docker Desktop。

1. 首先关闭 ddev：ddev poweroff
2. 然后停止Colima：`colima stop`
3. 现在运行 `docker context use default` 告诉 Docker 客户端你要使用哪个容器。默认名称是 Docker Desktop for Mac。当 `colima start` 运行时，它会自动将 Docker 切换到 `colima` 上下文。
4. 要继续使用默认（Docker Desktop）上下文，请使用 `ddev start` 命令。

从技术上讲，启动和停止 Colima 不是必需的，但是在两个上下文之间切换时的 `ddev poweroff` 命令是必要的。

Colima 停止时，最新版本的 Colima 会将 Docker 上下文恢复为 `default`，因此不再需要 `docker context use default` 命令。无论如何，我仍然使用 `docker context show` 来验证 `default`（Docker Desktop for Mac）或 `colima` 上下文是否正在使用。基本上，术语 `context` 指的是 Docker 客户端将命令发送到哪个容器提供者。


### 尝试 Colima

总的来说，我喜欢我目前所看到的。我没有遇到任何问题，而且基于 Colima 的网站看起来更快些（尤其是在启用 DDEV 的 Mutagen 功能时）。我肯定会预见自己在未来几周内将项目网站迁移到 Colima。

*本文最初出现发布在 [DrupalEasy 博客][10]并经许可重新发布。*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/docker-desktop-colima

作者：[Michael Anello][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ultimike
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/coffee_cafe_brew_laptop_desktop.jpg
[2]: https://github.com/drud/ddev
[3]: https://ddev.com/ddev-local/docker-desktop-alternatives-arrive-for-ddev-colima/
[5]: https://github.com/abiosoft/colima
[6]: https://ddev.com/ddev-local/docker-desktop-and-colima-benchmarking-on-macos/
[7]: https://opensource.com/article/22/2/start-running-containers
[8]: https://ddev.readthedocs.io/en/stable/users/docker_installation/#macos-installation-colima
[9]: https://opensource.com/sites/default/files/2022-09/docker-desktop-colima.png
[10]: https://www.drupaleasy.com/news
