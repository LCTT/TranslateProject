[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11342-1.html)
[#]: subject: (Use Git as the backend for chat)
[#]: via: (https://opensource.com/article/19/4/git-based-chat)
[#]: author: (Seth Kenlon  https://opensource.com/users/seth)

用 Git 作为聊天应用的后端
======

> GIC 是一个聊天应用程序的原型，展示了一种使用 Git 的新方法。

![](https://img.linux.net.cn/data/attachment/album/201909/15/100905euzi3l5xgslsgx7i.png)

[Git][2] 是一个少有的能将如此多的现代计算封装到一个程序之中的应用程序，它可以用作许多其他应用程序的计算引擎。虽然它以跟踪软件开发中的源代码更改而闻名，但它还有许多其他用途，可以让你的生活更轻松、更有条理。在这个 Git 系列中，我们将分享七种鲜为人知的使用 Git 的方法。

今天我们来看看 GIC，它是一个基于 Git 的聊天应用。

### 初识 GIC

虽然 Git 的作者们可能期望会为 Git 创建前端，但毫无疑问他们从未预料到 Git 会成为某种后端，如聊天客户端的后端。然而，这正是开发人员 Ephi Gabay 用他的实验性的概念验证应用 [GIC][3] 所做的事情：用 [Node.js][4] 编写的聊天客户端，使用 Git 作为其后端数据库。

GIC 并没有打算用于生产用途。这纯粹是一种编程练习，但它证明了开源技术的灵活性。令人惊讶的是，除了 Node 库和 Git 本身，该客户端只包含 300 行代码。这是这个聊天客户端和开源所反映出来的最好的地方之一：建立在现有工作基础上的能力。眼见为实，你应该自己亲自来了解一下 GIC。

### 架设起来

GIC 使用 Git 作为引擎，因此你需要一个空的 Git 存储库为聊天室和记录器提供服务。存储库可以托管在任何地方，只要你和需要访问聊天服务的人可以访问该存储库就行。例如，你可以在 GitLab 等免费 Git 托管服务上设置 Git 存储库，并授予聊天用户对该 Git 存储库的贡献者访问权限。（他们必须能够提交到存储库，因为每个聊天消息都是一个文本的提交。）

如果你自己托管，请创建一个中心化的裸存储库。聊天中的每个用户必须在裸存储库所在的服务器上拥有一个帐户。你可以使用如 [Gitolite][5] 或 [Gitea][6] 这样的 Git 托管软件创建特定于 Git 的帐户，或者你可以在服务器上为他们提供个人用户帐户，可以使用 `git-shell` 来限制他们只能访问 Git。

自托管实例的性能最好。无论你是自己托管还是使用托管服务，你创建的 Git 存储库都必须具有一个活跃分支，否则 GIC 将无法在用户聊天时进行提交，因为没有 Git HEAD。确保分支初始化和活跃的最简单方法是在创建存储库时提交 `README` 或许可证文件。如果你没有这样做，你可以在事后创建并提交一个：

```
$ echo "chat logs" > README
$ git add README
$ git commit -m 'just creating a HEAD ref'
$ git push -u origin HEAD
```

### 安装 GIC

由于 GIC 基于 Git 并使用 Node.js 编写，因此必须首先安装 Git、Node.js 和 Node 包管理器npm（它应该与 Node 捆绑在一起）。安装它们的命令因 Linux 或 BSD 发行版而异，这是 Fedora 上的一个示例命令：

```
$ sudo dnf install git nodejs
```

如果你没有运行 Linux 或 BSD，请按照 [git-scm.com][7] 和 [nodejs.org][8] 上的安装说明进行操作。

因此，GIC 没有安装过程。每个用户（在此示例中为 Alice 和 Bob）必须将存储库克隆到其硬盘驱动器：

```
$ git clone https://github.com/ephigabay/GIC GIC
```

将目录更改为 GIC 目录并使用 `npm` 安装 Node.js 依赖项：

```
$ cd GIC
$ npm install
```

等待 Node 模块下载并安装。

### 配置 GIC

GIC 唯一需要的配置是 Git 聊天存储库的位置。编辑 `config.js` 文件：

```
module.exports = {
  gitRepo: 'seth@example.com:/home/gitchat/chatdemo.git',
  messageCheckInterval: 500,
  branchesCheckInterval: 5000
};
```

在尝试 GIC 之前测试你与 Git 存储库的连接，以确保你的配置是正确的：

```
$ git clone --quiet seth@example.com:/home/gitchat/chatdemo.git > /dev/null
```

假设你没有收到任何错误，就可以开始聊天了。

### 用 Git 聊天

在 GIC 目录中启动聊天客户端：

```
$ npm start
```

客户端首次启动时，必须克隆聊天存储库。由于它几乎是一个空的存储库，因此不会花费很长时间。输入你的消息，然后按回车键发送消息。

![GIC][10]

*基于 Git 的聊天客户端。 他们接下来会怎么想？*

正如问候消息所说，Git 中的分支在 GIC 中就是聊天室或频道。无法在 GIC 的 UI 中创建新分支，但如果你在另一个终端会话或 Web UI 中创建一个分支，它将立即显示在 GIC 中。将一些 IRC 式的命令加到 GIC 中并不需要太多工作。

聊了一会儿之后，可以看看你的 Git 存储库。由于聊天发生在 Git 中，因此存储库本身也是聊天日志：

```
$ git log --pretty=format:"%p %cn %s"
4387984 Seth Kenlon Hey Chani, did you submit a talk for All Things Open this year?
36369bb Chani No I didn't get a chance. Did you?
[...]
```

### 退出 GIC

Vim 以来，还没有一个应用程序像 GIC 那么难以退出。你看，没有办法停止 GIC。它会一直运行，直到它被杀死。当你准备停止 GIC 时，打开另一个终端选项卡或窗口并发出以下命令：

```
$ kill `pgrep npm`
```

GIC 是一个新奇的事物。这是一个很好的例子，说明开源生态系统如何鼓励和促进创造力和探索，并挑战我们从不同角度审视应用程序。尝试下 GIC，也许它会给你一些思路。至少，它可以让你与 Git 度过一个下午。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/git-based-chat

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/talk_chat_team_mobile_desktop.png?itok=d7sRtKfQ (Team communication, chat)
[2]: https://git-scm.com/
[3]: https://github.com/ephigabay/GIC
[4]: https://nodejs.org/en/
[5]: http://gitolite.com
[6]: http://gitea.io
[7]: http://git-scm.com
[8]: http://nodejs.org
[9]: mailto:seth@example.com
[10]: https://opensource.com/sites/default/files/uploads/gic.jpg (GIC)
