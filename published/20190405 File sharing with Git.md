[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11768-1.html)
[#]: subject: (File sharing with Git)
[#]: via: (https://opensource.com/article/19/4/file-sharing-git)
[#]: author: (Seth Kenlon)

用 Git 来共享文件
======

> SparkleShare 是一个开源的基于 Git 的 Dropbox 风格的文件共享应用程序。在我们的系列文章中了解有关 Git 鲜为人知的用法。

![](https://img.linux.net.cn/data/attachment/album/202001/10/113645qb2ufvuu2ttimugv.png)

[Git][2] 是一个少有的能将如此多的现代计算封装到一个程序之中的应用程序，它可以用作许多其他应用程序的计算引擎。虽然它以跟踪软件开发中的源代码更改而闻名，但它还有许多其他用途，可以让你的生活更轻松、更有条理。在这个 Git 系列中，我们将分享七种鲜为人知的使用 Git 的方法。

今天，我们将看看 SparkleShare，它使用 Git 作为文件共享的基础。

### 用于文件共享的 Git

Git 的优点之一是它具有固有的分发能力。它可用来建立共享。即使你只是与自己网络上的其他计算机共享资源库，Git 也会为从共享位置获取文件的行为带来透明性。

随着其界面的发展，Git 变得非常简单。虽然因用户而异，他们坐下来完成一些工作时的共同点仅仅是 `git pull` 或稍微复杂一点的 `git pull && git checkout -b my-branch`。但是，对于某些人来说，将*命令输入*到他们的计算机中的做法完全是令人困惑或烦恼的。计算机旨在使生活变得轻松，它擅长于重复性工作，因此有更简便的方法可以与 Git 共享文件。

### SparkleShare

[SparkleShare][3] 项目是一个基于 Git 的跨平台的、开源的 Dropbox 式的文件共享应用程序。它通过将文件拖放到专门指定的 SparkleShare 目录中的简单操作，自动执行所有 Git 命令，触发添加、提交、推送和拉取过程。因为它基于 Git，所以你可以获得基于差异（diff）的快速推送和拉取，并且继承了 Git 版本控制和后端基础设施（如 Git 挂钩）的所有优点。它可以完全自托管，也可以将其与 [GitLab][4]、GitHub、Bitbucket 等 Git 托管服务一起使用。此外，由于它基本上只是一个 Git 的前端，因此你可以在可能没有 SparkleShare 客户端但有 Git 客户端的设备上访问 SparkleShare 中的文件。

正如你获得 Git 的所有好处一样，你也会受到所有常见的 Git 限制：使用 SparkleShare 存储数百张照片、音乐和视频是不切实际的，因为 Git 是为文本而设计和优化的。Git 当然可以存储二进制文件的大文件，但是因为它可以跟踪历史记录，因此一旦将文件添加到其中，几乎就不可能完全删除它。这在某种程度上限制了 SparkleShare 对某些人的实用性，但使其非常适合许多工作流程，包括[日程安排][5]。

#### 安装 SparkleShare

SparkleShare 是跨平台的，可从[网站][6]获得适用于 Windows 和 Mac 的安装程序。对于 Linux，有一个 [Flatpak][7] 安装包，或者你可以在终端中运行以下命令：

```
$ sudo flatpak remote-add flathub https://flathub.org/repo/flathub.flatpakrepo
$ sudo flatpak install flathub org.sparkleshare.SparkleShare
```

### 创建一个 Git 存储库

SparkleShare 并不是软件即服务（SaaS）。你在计算机上运行 SparkleShare 与 Git 存储库进行通信，而 SparkleShare 并不存储你的数据。如果你还没有与文件夹同步的 Git 存储库，则必须在启动 SparkleShare 之前创建一个文件夹。你有三个选择：托管的 Git、自托管 Git 或自托管 SparkleShare。

#### 托管的 Git

SparkleShare 可以使用你能访问的任何 Git 存储库进行存储，因此，如果你拥有 GitLab 或任何其他托管服务的帐户（或创建一个），则它可以成为 SparkleShare 的后端。例如，开源 [Notabug.org][8] 服务是一个类似于 GitHub 和 GitLab 的 Git 托管服务，但其独特性足以证明 SparkleShare 的灵活性。根据用户界面的不同，不同的托管服务创建新存储库的方法也有所不同，但是所有主要存储库都遵循相同的通用模型。

首先，在托管服务中找到创建新项目或存储库的按钮，单击它以开始。然后逐步完成存储库的创建过程，为存储库提供名称、隐私级别（存储库通常默认为公共），以及是否使用 `README` 文件初始化存储库。无论你是否需要个 `README` 文件，请初始化建立一个。使用一个文件来创建存储库不是绝对必要的，但是它会强制 Git 主机实例化存储库中的 `master` 分支，这有助于确保前端应用程序（例如 SparkleShare）具有要提交并推送的分支。即使文件是几乎空的 `README` 文件，也可以用来查看该文件以确认你已连接成功。

![Creating a Git repository][9]

创建存储库后，获取其用于 SSH 克隆的 URL。就像从 Git 项目获得其 URL 一样，你也可以获取此 URL：导航至存储库页面并查找 “Clone” 按钮或字段。

![Cloning a URL on GitHub][10]

*GitHub 的克隆 URL。*

![Cloning a URL on GitLab][11]

*GitLab 的克隆 URL。*

这是 SparkleShare 用于获取数据的地址，因此请记下它。你的 Git 存储库现已配置好。

#### 自托管的 Git

你可以使用 SparkleShare 访问你有权访问的任何计算机上的 Git 存储库。除了一个 Git 裸存储库外，无需任何特殊设置。但是，如果你想将对 Git 存储库的访问权授予其他任何人，则应运行 [Gitolite][12] 之类的 Git 管理器或 SparkleShare 自己的 Dazzle 服务器来帮助你管理 SSH 密钥和帐户。至少，创建一个特定于 Git 的用户，以便有权访问你的 Git 存储库的用户不会自动获得对服务器其余部分的访问权限。

以 Git 用户身份登录服务器（如果你非常擅长管理用户和组权限，则可以以自己的用户登录）并创建存储库：

```
$ mkdir ~/sparkly.git
$ cd ~/sparkly.git
$ git init --bare .
```

你的 Git 存储库现已配置好。

#### Dazzle

SparkleShare 的开发人员提供了一个名为 [Dazzle][13] 的 Git 管理系统，以帮助你自托管 Git 存储库。

在你的服务器上，将 Dazzle 应用程序下载到你的路径中的某个位置：

```
$ curl https://raw.githubusercontent.com/hbons/Dazzle/master/dazzle.sh --output ~/bin/dazzle
$ chmod +x ~/bin/dazzle
```

Dazzle 设置了一个特定于 Git 和 SparkleShare 的用户，并且还基于 SparkleShare 应用程序生成的密钥实现了访问权限。现在，只需设置一个项目：

```
$ dazzle create sparkly
```

你的服务器现在已经配置好，可以用作 SparkleShare 托管了。

### 配置 SparkleShare

首次启动 SparkleShare 时，系统会提示你配置 SparkleShare 用于存储的服务器。这个过程可能看起来像一个首次运行的安装向导，但实际上是在 SparkleShare 中设置新共享位置的通常过程。与许多共享驱动器应用程序不同，使用 SparkleShare 可以一次配置多个位置。你配置的第一个共享位置并不比你以后可以配置的任何共享位置更重要，并且你也不用注册 SparkleShare 或任何其他服务。你只是将 SparkleShare 指向 Git 存储库，以便它知道如何使第一个 SparkleShare 文件夹保持同步。

在第一个屏幕上，给出一个身份信息，SparkleShare 将在代表你进行的 Git 提交记录中使用这些信息。你可以使用任何内容，甚至可以使用不代表任何意义的伪造信息。它仅用于提交消息，如果你对审查 Git 后端进程没有兴趣，你可能甚至看不到它们。

下一个屏幕提示你选择主机类型。如果你使用的是 GitLab、GitHub、Planio 或 Bitbucket，则可以选择一个适当的。否则，请选择“自己的服务器”。

![Choosing a Sparkleshare host][14]

在此屏幕底部，你必须输入 SSH 的克隆 URL。如果你是自托管的 Git，则地址类似于 `<ssh://username@example.com>`，而远程路径是为此目的而创建的 Git 存储库的绝对路径。

根据上面的自托管示例，我虚构的服务器的地址为 `ssh://git@example.com:22122`（`:22122` 表示一个非标准的 SSH 端口），远程路径为 `/home/git/sparkly.git`。

如果我改用 Notabug.org 帐户，则上例中的地址为 `ssh://git@notabug.org`，路径为 `seth/sparkly.git`。

SparkleShare 首次尝试连接到主机时会失败，因为你尚未将 SparkleShare 客户端 ID（特定于 SparkleShare 应用程序的 SSH 密钥）复制到 Git 主机。这是预料之中的，所以不要取消该过程。将 SparkleShare 设置窗口保持打开状态，并从系统任务栏中的 SparkleShare 图标处获取客户端 ID。然后将客户端 ID 复制到剪贴板，以便可以将其添加到 Git 主机。

![Getting the client ID from Sparkleshare][16]

#### 将你的客户端 ID 添加到托管的 Git 帐户

除了较小的 UI 差异外，在任何托管服务上添加 SSH 密钥（所有客户端 ID 都是这样）的过程基本上是相同的。在你的 Git 主机的 Web 仪表板中，导航到你的用户设置，然后找到 “SSH 密钥”类别。单击“添加新密钥”按钮（或类似按钮），然后粘贴你的 SparkleShare 客户端 ID 的内容。

![Adding an SSH key][17]

保存密钥。如果你希望其他人（例如协作者或家庭成员）能够访问同一存储库，则他们必须向你提供其 SparkleShare 客户端 ID，以便你可以将其添加到帐户中。

#### 将你的客户端 ID 添加到自托管的 Git 帐户

SparkleShare 客户端 ID 只是一个 SSH 密钥，因此将其复制并粘贴到 Git 用户的 `~/.ssh/authorized_keys` 文件中。

#### 使用 Dazzle 添加你的客户 ID

如果你使用 Dazzle 管理 SparkleShare 项目，请使用以下命令添加客户端 ID：

```
$ dazzle link
```

当 Dazzle 提示你输入该 ID 时，请粘贴在 SparkleShare 菜单中找到的客户端 ID。

### 使用 SparkleShare

将客户端 ID 添加到 Git 主机后，在 SparkleShare 窗口中单击“重试”按钮以完成设置。克隆存储库完成后，你可以关闭 SparkleShare 设置窗口，并在你的家目录中找到一个新的 `SparkleShare` 文件夹。如果你设置了带有托管服务的 Git 存储库，并选择包括 `README` 文件或许可证文件，则可以在 SparkleShare 目录中看到它们。

![Sparkleshare file manager][18]

此外，有一些隐藏目录，你可以通过在文件管理器中显示隐藏目录来查看。

![Showing hidden files in GNOME][19]

使用 SparkleShare 的方式与使用计算机上任何目录的方式相同：将文件放入其中。每当将文件或目录放入 SparkleShare 文件夹时，它都会在后台复制到你的 Git 存储库。

#### 排除某些文件

由于 Git 从设计上就是要记住*一切*，因此你可能希望从记录中排除特定的文件类型。排除一些文件是有原因的。通过定义摆脱 SparkleShare 管理的文件，可以避免意外复制大文件。你还可以为自己设计一种方案，使你可以将存储在一个目录中的逻辑上属于同一个文件（例如，MIDI 文件及其 .flac 导出文件），但是可以自己手动备份大文件，而同时让 SparkleShare 备份基于文本的文件。

如果在系统的文件管理器中看不到隐藏的文件，请显示它们。导航到你的 SparkleShare 文件夹，然后到代表你的存储库的目录，找到一个名为 `.gitignore` 的文件，然后在文本编辑器中将其打开。你可以在 `.gitignore` 中输入文件扩展名或文件名（每行一个），任何与你列出的文件匹配的文件都会被忽略（如文件名所示）。

```
Thumbs.db
$RECYCLE.BIN/
.DS_Store
._*
.fseventsd
.Spotlight-V100
.Trashes
.directory
.Trash-*
*.wav
*.ogg
*.flac
*.mp3
*.m4a
*.opus
*.jpg
*.png
*.mp4
*.mov
*.mkv
*.avi
*.pdf
*.djvu
*.epub
*.od{s,t}
*.cbz
```

你知道最经常遇到哪些文件类型，因此请集中精力处理最有可能潜入你的 SparkleShare 目录的文件。如果你想稍微矫枉过正一些，可以在 Notabug.org 以及整个网上找到 `.gitignore` 文件的好集合。

通过将这些条目保存在 `.gitignore` 文件中，你可以将不需要发送到 Git 主机的大文件放在 SparkleShare 目录中，SparkleShare 将完全忽略它们。当然，这意味着你需要确保它们可以备份或通过其他方式分发给你的 SparkleShare 协作者。

### 自动化

[自动化][20] 是我们与计算机达成的默契之一：计算机执行重复的、无聊的工作，而我们人类要么不擅长做这些，要么不擅长记忆这些。SparkleShare 是一种很好的、简单的自动执行例行数据分发的方法。但不管怎么说，这并不适合每个 Git 存储库。它没有用于高级 Git 功能的接口，它没有暂停按钮或手动管理的操作。没关系，因为它的使用范围是有意限制的。SparkleShare 可以完成它计划要做的事情，它做得很好，而且它是你无需关心的一个 Git 存储库。

如果你想使用这种稳定的、看不见的自动化，请尝试一下 SparkleShare。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/file-sharing-git

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_cloud21x_cc.png?itok=5UwC92dO
[2]: https://git-scm.com/
[3]: http://www.sparkleshare.org/
[4]: http://gitlab.com
[5]: https://opensource.com/article/19/4/calendar-git
[6]: http://sparkleshare.org
[7]: /business/16/8/flatpak
[8]: http://notabug.org
[9]: https://opensource.com/sites/default/files/uploads/git-new-repo.jpg (Creating a Git repository)
[10]: https://opensource.com/sites/default/files/uploads/github-clone-url.jpg (Cloning a URL on GitHub)
[11]: https://opensource.com/sites/default/files/uploads/gitlab-clone-url.jpg (Cloning a URL on GitLab)
[12]: http://gitolite.org
[13]: https://github.com/hbons/Dazzle
[14]: https://opensource.com/sites/default/files/uploads/sparkleshare-host.jpg (Choosing a Sparkleshare host)
[15]: mailto:git@notabug.org
[16]: https://opensource.com/sites/default/files/uploads/sparkleshare-clientid.jpg (Getting the client ID from Sparkleshare)
[17]: https://opensource.com/sites/default/files/uploads/git-ssh-key.jpg (Adding an SSH key)
[18]: https://opensource.com/sites/default/files/uploads/sparkleshare-file-manager.jpg (Sparkleshare file manager)
[19]: https://opensource.com/sites/default/files/uploads/gnome-show-hidden-files.jpg (Showing hidden files in GNOME)
[20]: /downloads/ansible-quickstart
