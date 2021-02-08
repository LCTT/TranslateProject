[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11303-1.html)
[#]: subject: (Build and host a website with Git)
[#]: via: (https://opensource.com/article/19/4/building-hosting-website-git)
[#]: author: (Seth Kenlon  https://opensource.com/users/seth)

用 Git 建立和托管网站
======

> 你可以让 Git 帮助你轻松发布你的网站。在我们《鲜为人知的 Git 用法》系列的第一篇文章中学习如何做到。

![](https://img.linux.net.cn/data/attachment/album/201909/04/134312l912496eegpoqaqe.png)

[Git][2] 是一个少有的能将如此多的现代计算封装到一个程序之中的应用程序，它可以用作许多其他应用程序的计算引擎。虽然它以跟踪软件开发中的源代码更改而闻名，但它还有许多其他用途，可以让你的生活更轻松、更有条理。在这个 Git 系列中，我们将分享七种鲜为人知的使用 Git 的方法。

创建一个网站曾经是极其简单的，而同时它又是一种黑魔法。回到 Web 1.0 的旧时代（不是每个人都会这样称呼它），你可以打开任何网站，查看其源代码，并对 HTML 及其内联样式和基于表格的布局进行反向工程，在这样的一两个下午之后，你就会感觉自己像一个程序员一样。不过要让你创建的页面放到互联网上，仍然有一些问题，因为这意味着你需要处理服务器、FTP 以及 webroot 目录和文件权限。虽然从那时起，现代网站变得愈加复杂，但如果你让 Git 帮助你，自出版可以同样容易（或更容易！）。

### 用 Hugo 创建一个网站

[Hugo][3] 是一个开源的静态站点生成器。静态网站是过去的 Web 的基础（如果你回溯到很久以前，那就是 Web 的*全部*了）。静态站点有几个优点：它们相对容易编写，因为你不必编写代码；它们相对安全，因为页面上没有执行代码；并且它们可以非常快，因为除了在页面上传输的任何内容之外没有任何处理。

Hugo 并不是唯一一个静态站点生成器。[Grav][4]、[Pico][5]、[Jekyll][6]、[Podwrite][7] 以及许多其他的同类软件都提供了一种创建一个功能最少的、只需要很少维护的网站的简单方法。Hugo 恰好是内置集成了 GitLab 集成的一个静态站点生成器，这意味着你可以使用免费的 GitLab 帐户生成和托管你的网站。

Hugo 也有一些非常大的用户。例如，如果你曾经去过 [Let's Encrypt](https://letsencrypt.org/) 网站，那么你已经用过了一个用 Hugo 构建的网站。

![Let's Encrypt website][8]

#### 安装 Hugo

Hugo 是跨平台的，你可以在 [Hugo 的入门资源][9]中找到适用于 MacOS、Windows、Linux、OpenBSD 和 FreeBSD 的安装说明。

如果你使用的是 Linux 或 BSD，最简单的方法是从软件存储库或 ports 树安装 Hugo。确切的命令取决于你的发行版，但在 Fedora 上，你应该输入：

```
$ sudo dnf install hugo
```

通过打开终端并键入以下内容确认你已正确安装：

```
$ hugo help
```

这将打印 `hugo` 命令的所有可用选项。如果你没有看到，你可能没有正确安装 Hugo 或需要[将该命令添加到你的路径][10]。

#### 创建你的站点

要构建 Hugo 站点，你必须有个特定的目录结构，通过输入以下命令 Hugo 将为你生成它：

```
$ hugo new site mysite
```

你现在有了一个名为 `mysite` 的目录，它包含构建 Hugo 网站所需的默认目录。

Git 是你将网站放到互联网上的接口，因此切换到你新的 `mysite` 文件夹，并将其初始化为 Git 存储库：

```
$ cd mysite
$ git init .
```

Hugo 与 Git 配合的很好，所以你甚至可以使用 Git 为你的网站安装主题。除非你计划开发你正在安装的主题，否则可以使用 `--depth` 选项克隆该主题的源的最新状态：

```
$ git clone --depth 1 https://github.com/darshanbaral/mero.git themes/mero
```

现在为你的网站创建一些内容：

```
$ hugo new posts/hello.md
```

使用你喜欢的文本编辑器编辑 `content/posts` 目录中的 `hello.md` 文件。Hugo 接受 Markdown 文件，并会在发布时将它们转换为经过主题化的 HTML 文件，因此你的内容必须采用 [Markdown 格式][11]。

如果要在帖子中包含图像，请在 `static` 目录中创建一个名为 `images` 的文件夹。将图像放入此文件夹，并使用以 `/images` 开头的绝对路径在标记中引用它们。例如：

```
![A picture of a thing](/images/thing.jpeg)
```

#### 选择主题

你可以在 [themes.gohugo.io][12] 找到更多主题，但最好在测试时保持一个基本主题。标准的 Hugo 测试主题是 [Ananke][13]。某些主题具有复杂的依赖关系，而另外一些主题如果没有复杂的配置的话，也许不会以你预期的方式呈现页面。本例中使用的 Mero 主题捆绑了一个详细的 `config.toml` 配置文件，但是（为了简单起见）我将在这里只提供基本的配置。在文本编辑器中打开名为 `config.toml` 的文件，并添加三个配置参数：

```
languageCode = "en-us"
title = "My website on the web"
theme = "mero"

[params]
  author = "Seth Kenlon"
  description = "My hugo demo"
```

#### 预览

在你准备发布之前不必（预先）在互联网上放置任何内容。在你开发网站时，你可以通过启动 Hugo 附带的仅限本地访问的 Web 服务器来预览你的站点。

```
$ hugo server --buildDrafts --disableFastRender
```

打开 Web 浏览器并导航到 <http://localhost:1313> 以查看正在进行的工作。

### 用 Git 发布到 GitLab

要在 GitLab 上发布和托管你的站点，请为你的站点内容创建一个存储库。

要在 GitLab 中创建存储库，请单击 GitLab 的 “Projects” 页面中的 “New Project” 按钮。创建一个名为 `yourGitLabUsername.gitlab.io` 的空存储库，用你的 GitLab 用户名或组名替换 `yourGitLabUsername`。你必须使用此命名方式作为该项目的名称。你也可以稍后为其添加自定义域。

不要在 GitLab 上包含许可证或 README 文件（因为你已经在本地启动了一个项目，现在添加这些文件会使将你的数据推向 GitLab 时更加复杂，以后你可以随时添加它们）。

在 GitLab 上创建空存储库后，将其添加为 Hugo 站点的本地副本的远程位置，该站点已经是一个 Git 存储库：

```
$ git remote add origin git@gitlab.com:skenlon/mysite.git
```

创建名为 `.gitlab-ci.yml` 的 GitLab 站点配置文件并输入以下选项：

```
image: monachus/hugo

variables:
  GIT_SUBMODULE_STRATEGY: recursive

pages:
  script:
  - hugo
  artifacts:
    paths:
    - public
  only:
  - master
```

`image` 参数定义了一个为你的站点提供服务的容器化图像。其他参数是告诉 GitLab 服务器在将新代码推送到远程存储库时要执行的操作的说明。有关 GitLab 的 CI/CD（持续集成和交付）选项的更多信息，请参阅 [GitLab 文档的 CI/CD 部分][14]。

#### 设置排除的内容

你的 Git 存储库已配置好，在 GitLab 服务器上构建站点的命令也已设置，你的站点已准备好发布了。对于你的第一个 Git 提交，你必须采取一些额外的预防措施，以便你不会对你不打算进行版本控制的文件进行版本控制。

首先，将构建你的站点时 Hugo 创建的 `/public` 目录添加到 `.gitignore` 文件。你无需在 Git 中管理已完成发布的站点；你需要跟踪的是你的 Hugo 源文件。
 
```
$ echo "/public" >> .gitignore
```

如果不创建 Git 子模块，则无法在 Git 存储库中维护另一个 Git 存储库。为了简单起见，请移除嵌入的存储库的 `.git` 目录，以使主题（存储库）只是一个主题（目录）。

请注意，你**必须**将你的主题文件添加到你的 Git 存储库，以便 GitLab 可以访问该主题。如果不提交主题文件，你的网站将无法成功构建。

```
$ mv themes/mero/.git ~/.local/share/Trash/files/
```

你也可以像使用[回收站][15]一样使用 `trash`：

```
$ trash themes/mero/.git
```

现在，你可以将本地项目目录的所有内容添加到 Git 并将其推送到 GitLab：

```
$ git add .
$ git commit -m 'hugo init'
$ git push -u origin HEAD
```

### 用 GitLab 上线

将代码推送到 GitLab 后，请查看你的项目页面。有个图标表示 GitLab 正在处理你的构建。第一次推送代码可能需要几分钟，所以请耐心等待。但是，请不要**一直**等待，因为该图标并不总是可靠地更新。

![GitLab processing your build][16]

当你在等待 GitLab 组装你的站点时，请转到你的项目设置并找到 “Pages” 面板。你的网站准备就绪后，它的 URL 就可以用了。该 URL 是 `yourGitLabUsername.gitlab.io/yourProjectName`。导航到该地址以查看你的劳动成果。

![Previewing Hugo site][17]

如果你的站点无法正确组装，GitLab 提供了可以深入了解 CI/CD 管道的日志。查看错误消息以找出发生了什么问题。

### Git 和 Web

Hugo（或 Jekyll 等类似工具）只是利用 Git 作为 Web 发布工具的一种方式。使用服务器端 Git 挂钩，你可以使用最少的脚本设计你自己的 Git-to-web 工作流。使用 GitLab 的社区版，你可以自行托管你自己的 GitLab 实例；或者你可以使用 [Gitolite][18] 或 [Gitea][19] 等替代方案，并使用本文作为自定义解决方案的灵感来源。祝你玩得开心！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/building-hosting-website-git

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web_browser_desktop_devlopment_design_system_computer.jpg?itok=pfqRrJgh (web development and design, desktop and browser)
[2]: https://git-scm.com/
[3]: http://gohugo.io
[4]: http://getgrav.org
[5]: http://picocms.org/
[6]: https://jekyllrb.com
[7]: http://slackermedia.info/podwrite/
[8]: https://opensource.com/sites/default/files/uploads/letsencrypt-site.jpg (Let's Encrypt website)
[9]: https://gohugo.io/getting-started/installing
[10]: https://opensource.com/article/17/6/set-path-linux
[11]: https://commonmark.org/help/
[12]: https://themes.gohugo.io/
[13]: https://themes.gohugo.io/gohugo-theme-ananke/
[14]: https://docs.gitlab.com/ee/ci/#overview
[15]: http://slackermedia.info/trashy
[16]: https://opensource.com/sites/default/files/uploads/hugo-gitlab-cicd.jpg (GitLab processing your build)
[17]: https://opensource.com/sites/default/files/uploads/hugo-demo-site.jpg (Previewing Hugo site)
[18]: http://gitolite.com
[19]: http://gitea.io
