手把手指导您使用 Git
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lightbulb-idea-think-yearbook-lead.png?itok=5ZpCm0Jh)

如果您从未使用过 [Git][1]，甚至可能从未听说过它。莫慌张，只需要一步步地跟着这篇入门教程，很快您就会在 [GitHub][2] 上拥有一个全新的 Git 仓库。

在开始之前，让我们先理清一个常见的误解：Git 并不是 GitHub。Git 是一套版本控制系统（或者说是一款软件），能够协助您跟踪计算机程序和文件在任何时间的更改。它同样允许您在程序、代码和文件操作上与同事协作。GitHub 以及类似服务（包括 GitLab 和 BitBucket）都属于部署了 Git 程序的网站，能够托管您的代码。

### 步骤 1：申请一个 GitHub 账户

在 [GitHub.com][3] 网站上（免费）创建一个账户是最简单的方式。

![](https://opensource.com/sites/default/files/u128651/git_guide1.png)

选择一个用户名（比如说，octocat123），输入您的邮箱地址和密码，然后点击 **Sign up for GitHub**。进入之后，您将看到下方插图的界面：

![](https://opensource.com/sites/default/files/u128651/git_guide2.png)

### 步骤 2：创建一个新的仓库

一个仓库（ repository），类似于能储存物品的场所或是容器；在这里，我们创建仓库存储代码。在 `+` 符号（在插图的右上角，我已经选中它了） 的下拉菜单中选择 **New Repository**。

![](https://opensource.com/sites/default/files/u128651/git_guide3.png)

给您的仓库命名（比如说，Demo）然后点击 **Create Repository**。无需考虑本页面的其他选项。

恭喜！您已经在 GitHub.com 中建立了您的第一个仓库。

### 步骤 3: 创建文件

当仓库创建完毕后，界面将和下方一致：

![](https://opensource.com/sites/default/files/u128651/git_guide4.png)

不必惊慌，它比看上去简单。跟紧步骤。忽略其他内容，注意截图上的 “...or create a new repository on the command line,”。

在您的计算机中打开终端。

![](https://opensource.com/sites/default/files/u128651/git_guide5.png)

键入 `git` 然后回车。如果命令行显示 `bash: git: command not found`，在您的操作系统或发行版 [安装 Git][4] 命令。键入 `git` 并回车检查是否成功安装；如果安装成功，您将看见大量关于使用该命令的说明信息。

在终端内输入：

```
mkdir Demo
```

这个命令将会创建一个名为 Demo 的目录（文件夹）。

如下命令将会切换终端目录，跳转到 Demo 目录：

```
cd Demo
```

然后输入：

```
echo "#Demo" >> README.md
```

创建一个名为 `README.md` 的文件，并写入 `#Demo`。检查文件是否创建成功，请输入：

```
cat README.md
```

这将会为您显示 `README.md` 文件的内容，如果文件创建成功，您的终端会有如下显示： 

![](https://opensource.com/sites/default/files/u128651/git_guide7.png)

使用 Git 程序告诉您的电脑，Demo 是一个被 Git 管理的目录，请输入：

```
git init
```

然后，告诉 Git 程序您关心的文件并且想在此刻起跟踪它的任何改变，请输入：

```
git add README.md
```

### 步骤 4：创建一次提交

目前为止，您已经创建了一个文件，并且已经通知了 Git，现在，是时候创建一次<ruby>提交<rt>commit</rt></ruby>了。提交可以看作是一个里程碑。每当完成一些工作之时，您都可以创建一次提交，保存文件当前版本，这样一来，您可以返回之前的版本，并且查看那时候的文件内容。无论何时您修改了文件，都可以对文件创建一个上一次的不一样的新版本。

创建一次提交，请输入：

```
git commit -m "first commit"
```

就是这样！刚才您创建了包含一条注释为 “first commit” 的 Git 提交。每次提交，您都必须编辑注释信息；它不仅能协助您识别提交，而且能让您理解此时您对文件做了什么修改。这样到了明天，如果您在文件中添加新的代码，您可以写一句提交信息：“添加了新的代码”，然后当您一个月后回来查看提交记录或者 Git 日志（即提交列表），您还能知道当时的您在文件夹里做了什么。

### 步骤 5: 将您的计算机与 GitHub 仓库相连接

现在，是时候用如下命令将您的计算机连接到 GitHub 仓库了：

```
git remote add origin https://github.com/<your_username>/Demo.git
```

让我们一步步的分析这行命令。我们通知 Git 去添加一个叫做 `origin` （起源）的，拥有地址为 `https://github.com/<your_username>/Demo.git`（它也是您的仓库的 GitHub 地址） 的 `remote` （远程仓库）。当您提交代码时，这允许您在 GitHub.com 和 Git 仓库交互时使用 `origin` 这个名称而不是完整的 Git 地址。为什么叫做 `origin`？当然，您可以叫点别的，只要您喜欢（惯例而已）。

现在，我们已经将本地 Demo 仓库副本连接到了其在 GitHub.com 远程副本上。您的终端看起来如下：

![](https://opensource.com/sites/default/files/u128651/git_guide8.png)

此刻我们已经连接到远程仓库，可以推送我们的代码 到 GitHub.com（例如上传 `README.md` 文件）。

执行完毕后，您的终端会显示如下信息：

![](https://opensource.com/sites/default/files/u128651/git_guide9.png)

然后，如果您访问 `https://github.com/<your_username>/Demo`，您会看到截图内显示的情况：

![](https://opensource.com/sites/default/files/u128651/git_guide10.png)

就是这么回事！您已经创建了您的第一个 GitHub 仓库，连接到了您的电脑，并且从你的计算机推送（或者称：上传）一个文件到 GitHub.com 名叫 Demo 的远程仓库上了。下一次，我将编写关于 Git 复制（从 GitHub 上下载文件到你的计算机上）、添加新文件、修改现存文件、推送（上传）文件到 GitHub。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/step-step-guide-git

作者：[Kedar Vijay Kulkarni][a]
译者：[CYLeft](https://github.com/CYLeft)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/kkulkarn
[1]:https://opensource.com/resources/what-is-git
[2]:https://opensource.com/life/15/11/short-introduction-github
[3]:https://github.com/
[4]:https://www.linuxbabe.com/linux-server/install-git-verion-control-on-linux-debianubuntufedoraarchlinux#crt-2
