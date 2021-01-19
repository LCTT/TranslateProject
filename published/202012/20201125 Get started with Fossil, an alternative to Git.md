[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-12875-1.html"
[#]: subject: "Get started with Fossil, an alternative to Git"
[#]: via: "https://opensource.com/article/20/11/fossil"
[#]: author: "Klaatu https://opensource.com/users/klaatu"

了解一下 Fossil，一个 Git 的替代品
======

> Fossil 是一个集版本控制系统、bug 追踪、维基、论坛以及文档解决方案于一体的系统。

![](https://img.linux.net.cn/data/attachment/album/202012/01/173057hfhyzyw921zll219.jpg)

每个开发者都知道，追踪代码的修改是至关重要的。有时候你会处于好奇或者教育的目的需要展示你的项目开始和进化的历史。有时候你想让其他的开发者参与到你的项目中，因此你需要一种值得信赖的能合并不同代码分支的方法。更极端一点，有时候你为了解决一个问题而修改的代码导致已有的功能不能正常使用。

[Fossil][2] 源码管理系统是由著名的 [SQLite][3] 数据库的作者开发的一个集版本控制系统、bug 追踪、维基、论坛以及文档解决方案于一体的系统。

### 安装 Fossil

Fossil 是一个独立的 C 程序，因此你可以从它的网站上[下载][4]后放在环境变量 [PATH][5] 中的任意位置。例如，假定 `/usr/local/bin` 已经在你的环境变量中（默认情况下是在的）：

```
$ wget https://fossil-scm.org/home/uv/fossil-linux-x64-X.Y.tar.gz
$ sudo tar xvf fossil-linux-x64-X.Y.tar.gz --directory /usr/local/bin
```

你也可以通过包管理器从软件仓库中找到 Fossil，或者直接从源码编译。

### 创建一个 Fossil 仓库

如果你已经有一个代码项目，想用 Fossil 来追踪，那么第一步就是创建一个 Fossil 仓库：

```
$ fossil init myproject.fossil
project-id: 010836ac6112fefb0b015702152d447c8c1d8604
server-id:  54d837e9dc938ba1caa56d31b99c35a4c9627f44
admin-user: klaatu (initial password is "14b605")
```

创建 Fossil 仓库的过程中会返回三行信息：一个唯一的项目 ID、一个唯一的服务器 ID 以及管理员 ID 和密码。项目 ID 和服务器 ID 是版本数字。管理员凭证表明你对这个仓库的所有权，当你把 Fossil 作为服务器让其他用户来访问时可以使用管理员权限。

### Fossil 仓库工作流

在你使用 Fossil 仓库之前，你需要先为它的数据创建一个工作路径。你可以把这个过程类比为使用 Python 时创建一个虚拟环境或者解压一个只用来备份的 ZIP 文件。

创建一个工作目录并进入：

```
$ mkdir myprojectdir
$ cd myprojectdir
```

把你的 Fossil 打开到刚刚创建的目录：

```
$ fossil open ../myproject
project-name: <unnamed>
repository:   /home/klaatu/myprojectdir/../myproject
local-root:   /home/klaatu/myprojectdir/
config-db:    /home/klaatu/.fossil
project-code: 010836ac6112fefb0b015702152d447c8c1d8604
checkout:     9e6cd96dd675544c58a246520ad58cdd460d1559 2020-11-09 04:09:35 UTC
tags:         trunk
comment:      initial empty check-in (user: klaatu)
check-ins:    1
```

你可能注意到了，Fossil 在你的家目录下创建了一个名为 `.fossil` 的隐藏文件，用来追踪你的全局 Fossil 配置。这个配置不是只适用于你的一个项目的；这个文件只会在你第一次使用 Fossil 时生成。

#### 添加文件

使用 `add` 和 `commit` 子命令来向你的仓库添加文件。例如，创建一个简单的 `README` 文件，把它添加到仓库：

```
$ echo "My first Fossil project" > README
$ fossil add README
ADDED  README
$ fossil commit -m 'My first commit'
New_Version: 2472a43acd11c93d08314e852dedfc6a476403695e44f47061607e4e90ad01aa
```

#### 使用分支

Fossil 仓库开始时默认使用的主分支名为 `trunk`。当你想修改代码而又不影响主干代码时，你可以从 trunk 分支切走。创建新分支需要使用 `branch` 子命令，这个命令需要两个参数：一个新分支的名字，一个新分支的基分支名字。在本例中，只有一个分支 `trunk`，因此尝试创建一个名为 `dev` 的新分支：

```
$ fossil branch --help
Usage: fossil branch new BRANCH-NAME BASIS ?OPTIONS?
$ fossil branch new dev trunk
New branch: cb90e9c6f23a9c98e0c3656d7e18d320fa52e666700b12b5ebbc4674a0703695
```

你已经创建了一个新分支，但是你当前所在的分支仍然是 `trunk`：

```
$ fossil branch current
trunk
```

使用 `checkout` 命令切换到你的新分支 `dev`：

```
$ fossil checkout dev
dev
```

#### 合并修改

假设你在 `dev` 分支中添加了一个新文件，完成了测试，现在想把它合并到 `trunk`。这个过程叫做*合并*。

首先，切回目标分支（本例中目标分支为 `trunk`）：


```
$ fossil checkout trunk
trunk
$ ls
README
```

这个分支中没有你的新文件（或者你对其他文件的修改），而那些内容是合并的过程需要的信息：

```
$ fossil merge dev
 "fossil undo" is available to undo changes to the working checkout.
$ ls
myfile.lua  README
```

### 查看 Fossil 时间线

使用 `timeline` 选项来查看仓库的历史。这个命令列出了你的仓库的所有活动的详细信息，包括用来表示每次修改的哈希值、每次提交时填写的信息以及提交者：

```
$ fossil timeline
=== 2020-11-09 ===
06:24:16 [5ef06e668b] added exciting new file (user: klaatu tags: dev)
06:11:19 [cb90e9c6f2] Create new branch named "dev" (user: klaatu tags: dev)
06:08:09 [a2bb73e4a3] *CURRENT* some additions were made (user: klaatu tags: trunk)
06:00:47 [2472a43acd] This is my first commit. (user: klaatu tags: trunk)
04:09:35 [9e6cd96dd6] initial empty check-in (user: klaatu tags: trunk)
+++ no more data (5) +++
```

![Fossil UI][6]

### 公开你的 Fossil 仓库

因为 Fossil 有个内置的 web 界面，所以 Fossil 不像 GitLab 和 Gitea 那样需要主机服务。Fossil 就是它自己的主机服务，只要你把它放在一台机器上就行了。在你公开你的 Fossil 仓库之前，你还需要通过 web 用户界面（UI）来配置一些信息：

使用 `ui` 子命令启动一个本地的实例：

```
$ pwd
/home/klaatu/myprojectdir/
$ fossil ui
```

“Users” 和 “Settings” 是安全相关的，“Configuration” 是项目属性相关的（包括一个合适的标题）。web 界面不仅仅是一个方便的功能。 它是能在生产环境中使用并作为 Fossil 项目的宿主机来使用的。它还有一些其他的高级选项，比如用户管理（或者叫自我管理）、在同一个服务器上与其他的 Fossil 仓库进行单点登录（SSO）。

当配置完成后，关掉 web 界面并按下 `Ctrl+C` 来停止 UI 引擎。像提交代码一样提交你的 web 修改。

```
$ fossil commit -m 'web ui updates'
New_Version: 11fe7f2855a3246c303df00ec725d0fca526fa0b83fa67c95db92283e8273c60
```

现在你可以配置你的 Fossil 服务器了。

  1. 把你的 Fossil 仓库（本例中是 `myproject.fossil`）复制到服务器，你只需要这一个文件。
  2. 如果你的服务器没有安装 Fossil，就在你的服务器上安装 Fossil。在服务器上安装的过程跟在本地一样。
  3. 在你的 `cgi-bin` 目录下（或它对应的目录，这取决于你的 HTTP 守护进程）创建一个名为 `repo_myproject.cgi` 的文件：

```
#!/usr/local/bin/fossil
repository: /home/klaatu/public_html/myproject.fossil
```

添加可执行权限：

```
$ chmod +x repo_myproject.cgi
```

你需要做的都已经做完了。现在可以通过互联网访问你的项目了。

你可以通过 CGI 脚本来访问 web UI，例如 `https://example.com/cgi-bin/repo_myproject.cgi`。

你也可以通过命令行来进行交互：

```
$ fossil clone https://klaatu@example.com/cgi-bin/repo_myproject.cgi
```

在本地的克隆仓库中工作时，你需要使用 `push` 子命令把本地的修改推送到远程的仓库，使用 `pull` 子命令把远程的修改拉取到本地仓库：

```
$ fossil push https://klaatu@example.com/cgi-bin/repo_myproject.cgi
```

### 使用 Fossil 作为独立的托管

Fossil 将大量的权力交到了你的手中（以及你的合作者的手中），让你不再依赖托管服务。本文只是简单的介绍了基本概念。你的代码项目还会用到很多有用的 Fossil 功能。尝试一下 Fossil。它不仅会改变你对版本控制的理解；它会让你不再考虑其他的版本控制系统。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/fossil

作者：[Klaatu][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/klaatu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_dinosaur_sunset.png?itok=lbzpbW5p "Dinosaurs on land at sunset"
[2]: https://fossil-scm.org/home/doc/trunk/www/index.wiki
[3]: https://www.sqlite.org/index.html
[4]: https://fossil-scm.org/home/uv/download.html
[5]: https://opensource.com/article/17/6/set-path-linux
[6]: https://opensource.com/sites/default/files/uploads/fossil-ui.jpg "Fossil UI"
[7]: https://creativecommons.org/licenses/by-sa/4.0/
