[#]: subject: (Use VS Code to develop in containers)
[#]: via: (https://opensource.com/article/21/7/vs-code-remote-containers-podman)
[#]: author: (Brant Evans https://opensource.com/users/branic)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13708-1.html)

使用 VS Code 在容器中开发
======

> 一致性可以避免当你有多个开发人员开发同一个项目时出现问题。

![](https://img.linux.net.cn/data/attachment/album/202108/22/090306jlkzyrw8cytcatw8.jpg)

当你有多个不同开发环境的开发人员在一个项目上工作时，编码和测试的不一致性是一种风险。[Visual Studio Code][2]（VS Code）是一个集成开发环境（IDE），可以帮助减少这些问题。它可以和容器结合起来，为每个应用程序提供独立的开发环境，同时提供一个一致的开发环境。

VS Code 的 [“Remote - Containers” 扩展][3] 使你能够创建一个容器定义，使用该定义来构建一个容器，并在容器内进行开发。这个容器定义可以和应用程序代码一起被签入到源代码库中，这使得所有的开发人员可以使用相同的定义在容器中进行构建和开发。

默认情况下，“Remote - Containers” 扩展使用 Docker 来构建和运行容器，但使用 [Podman][4] 的容器运行环境环境也很容易，它可以让你使用 [免 root 容器][5]。

本文将带领你完成设置，通过 Podman 在免 root 容器内使用 VS Code 和 “Remote - Containers” 扩展进行开发。

### 初始配置

在继续之前，请确保你的红帽企业 Linux（RHEL）或 Fedora 工作站已经更新了最新的补丁，并且安装了 VS Code 和 “Remote - Containers” 扩展。（参见 [VS Code 网站][2]了解更多安装信息）

接下来，用一个简单的 `dnf install` 命令来安装 Podman 和它的支持包：

```
$ sudo dnf install -y podman
```

安装完 Podman 后，配置 VS Code 以使用 Podman 的可执行文件（而不是 Docker）与容器进行交互。在 VS Code 中，导航到 “文件 > 首选项 > 设置”，点击 “扩展” 旁边的 “>” 图标。在出现的下拉菜单中，选择 “Remote - Containers”，并向下滚动找到 “Remote - Containers: Docker Path” 选项。在文本框中，用 “podman” 替换 “docker”。

![在文本框中输入 “podman”][6]

现在配置已经完成，在 VS Code 中为该项目创建一个新的文件夹或打开现有的文件夹。

### 定义容器

本教程以创建 Python 3 开发的容器为例。

“Remote - Containers” 扩展可以在项目文件夹中添加必要的基本配置文件。要添加这些文件，通过在键盘上输入 `Ctrl+Shift+P` 打开命令面板，搜索 “Remote-Containers: Add Development Container Configuration Files”，并选择它。

![Remote-Containers: Add Development Container Configuration Files][8]

在接下来的弹出窗口中，定义你想设置的开发环境的类型。对于这个例子的配置，搜索 “Python 3” 定义并选择它。

![选择 Python 3 定义][9]

接下来，选择将在容器中使用的 Python 的版本。选择 “3 (default)” 选项以使用最新的版本。

![选择 “3 (default)” 选项][10]

Python 配置也可以安装 Node.js，但在这个例子中，取消勾选 “Install Node.js”，然后点击 “OK”。

![取消勾选 “Install Node.js"][11]

它将创建一个 `.devcontainer` 文件夹，包含文件`devcontainer.json`和`Dockerfile`。VS Code 会自动打开`devcontainer.json` 文件，这样你就可以对它进行自定义。

### 启用免 root 容器

除了明显的安全优势外，以免 root 方式运行容器的另一个原因是，在项目文件夹中创建的所有文件将由容器外的正确用户 ID（UID）拥有。要将开发容器作为免 root 容器运行，请修改 `devcontainer.json` 文件，在它的末尾添加以下几行：

```
"workspaceMount": "source=${localWorkspaceFolder},target=/workspace,type=bind,Z",
"workspaceFolder": "/workspace",

"runArgs": ["--userns=keep-id"],
"containerUser": "vscode"
```

这些选项告诉 VS Code 用适当的 SELinux 上下文挂载工作区，创建一个用户命名空间，将你的 UID 和 GID 原样映射到容器内，并在容器内使用 `vscode` 作为你的用户名。`devcontainer.json` 文件应该是这样的（别忘了行末的逗号，如图所示）：

![更新后的 devcontainer.json 文件][12]

现在你已经设置好了容器的配置，你可以构建容器并打开里面的工作空间。重新打开命令调板（用 `Ctrl+Shift+P`），并搜索 “Remote-Containers: Rebuild and Reopen in Container”。点击它，VS Code 将开始构建容器。现在是休息一下的好时机（拿上你最喜欢的饮料），因为构建容器可能需要几分钟时间：

![构建容器][13]

一旦容器构建完成，项目将在容器内打开。在容器内创建或编辑的文件将反映在容器外的文件系统中，并对这些文件应用适当的用户权限。现在，你可以在容器内进行开发了。VS Code 甚至可以把你的 SSH 密钥和 Git 配置带入容器中，这样提交代码就会像在容器外编辑时那样工作。

### 接下来的步骤

现在你已经完成了基本的设置和配置，你可以进一步加强配置的实用性。比如说：

  * 修改 Dockerfile 以安装额外的软件（例如，所需的 Python 模块）。
  * 使用一个定制的容器镜像。例如，如果你正在进行 Ansible 开发，你可以使用 Quay.io 的 [Ansible Toolset][14]。（确保通过 Dockerfile 将 `vscode` 用户添加到容器镜像中）
  * 将 `.devcontainer` 目录下的文件提交到源代码库，以便其他开发者可以利用容器的定义进行开发工作。

在容器内开发有助于防止不同项目之间的冲突，因为隔离了不同项目的依赖关系及代码。你可以使用 Podman 在免 root 环境下运行容器，从而提高安全性。通过结合 VS Code、“Remote - Containers” 扩展和 Podman，你可以轻松地为多个开发人员建立一个一致的环境，减少设置时间，并以安全的方式减少开发环境的差异带来的错误。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/vs-code-remote-containers-podman

作者：[Brant Evans][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/branic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/collab-team-pair-programming-code-keyboard2.png?itok=WnKfsl-G (Women programming)
[2]: https://code.visualstudio.com/
[3]: https://code.visualstudio.com/docs/remote/containers
[4]: https://podman.io/
[5]: https://www.redhat.com/sysadmin/rootless-podman-makes-sense
[6]: https://opensource.com/sites/default/files/uploads/vscode-remote_podman.png (Enter "podman" in the text box)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/adddevelopmentcontainerconfigurationfiles.png (Remote-Containers: Add Development Container Configuration Files)
[9]: https://opensource.com/sites/default/files/uploads/python3.png (Select Python 3 definition)
[10]: https://opensource.com/sites/default/files/uploads/python3default.png (Select the 3 \(default\) option)
[11]: https://opensource.com/sites/default/files/uploads/unchecknodejs.png (Uncheck "Install Node.js")
[12]: https://opensource.com/sites/default/files/uploads/newdevcontainerjson.png (Updated devcontainer.json file)
[13]: https://opensource.com/sites/default/files/uploads/buildingcontainer.png (Building the container)
[14]: https://quay.io/repository/ansible/toolset
