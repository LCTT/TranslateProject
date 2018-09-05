Git 使用简介
======
![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/developer-3461405_1920.png?itok=6H3sYe80)

如果你是一个开发者，那你应该熟悉许多开发工具。你已经花了多年时间来学习一种或者多种编程语言并完善你的技巧。你可以熟练运用图形工具或者命令行工具开发。在你看来，没有任何事可以阻挡你。你的代码, 好像你的思想和你的手指一样，将会创建一个优雅的，完美评价的应用程序，并会风靡世界。

然而，如果你和其他人共同开发一个项目会发生什么呢？或者，你开发的应用程序变地越来越大，下一步你将如何去做？如果你想成功地和其他开发者合作，你定会想用一个分布式版本控制系统。使用这样一个系统，合作开发一个项目变得非常高效和可靠。这样的一个系统便是 [Git][1]。还有一个叫 [GitHub][2] 的方便的存储仓库，来存储你的项目代码，这样你的团队可以检查和修改代码。

我将向你介绍让 Git 的启动、运行，并和 GitHub 一起使用的基础知识，可以让你的应用程序的开发可以提升到一个新的水平。 我将在 Ubuntu 18.04 上进行演示，因此如果您选择的发行版本不同，您只需要修改 Git 安装命令以适合你的发行版的软件包管理器。
### Git 和 GitHub

第一件事就是创建一个免费的 GitHub 账号，打开 [GitHub 注册页面][3]，然后填上需要的信息。完成这个之后，你就注备好开始安装 Git 了（这两件事谁先谁后都可以）。

安装 Git 非常简单，打开一个命令行终端，并输入命令：
```
sudo apt install git-all

```
这将会安装大量依赖包，但是你将了解使用 Git 和 GitHub 所需的一切。

注意：我使用 Git 来下载程序的安装源码。有许多时候，内置的软件管理器不提供某个软件，除了去第三方库中下载源码，我经常去这个软件项目的 Git 主页，像这样克隆：
```
git clone ADDRESS

```
ADDRESS就是那个软件项目的 Git 主页。这样我就可以确保自己安装那个软件的最新发行版了。

创建一个本地仓库并添加一个文件。
下一步就是在你的电脑里创建一个本地仓库（本文称之为newproject，位于~/目录下），打开一个命令行终端，并输入下面的命令：
```
cd ~/

mkdir newproject

cd newproject

```

现在你需要初始化这个仓库。在 ~/newproject 目录下，输入命令 git init，当命令运行完，你就可以看到一个刚刚创建的空的 Git 仓库了（图1）。

![new repository][5]

图 1:初始化完成的新仓库

[使用许可][6]

下一步就是往项目里添加文件。我们在项目根目录（~/newproject）输入下面的命令：

```
touch readme.txt

```

现在项目里多了个空文件。输入 git status 来验证 Git 已经检测到多了个新文件（图2）。

![readme][8]

图 2: Git 检测到新文件readme.txt

[使用许可][6]

即使 Git 检测到新的文件，但它并没有被真正的加入这个项目仓库。为此，你要输入下面的命令：

```
git add readme.txt

```

一旦完成这个命令，再输入 git status 命令，可以看到，readme.txt 已经是这个项目里的新文件了（图3）。
![file added][10]

图 3: 我们的文件已经被添加进临时环境

[使用许可][6]
### 第一次提交
当新文件添加进临时环境之后，我们现在就准备好第一次提交了。什么是提交呢？它是很简单的，一次提交就是记录你更改的项目的文件。创建一次提交也是非常简单的。但是，为提交创建一个描述信息非常重要。通过这样做，你将添加有关提交包含的内容的注释，比如你对文件做出的修改。然而，在这样做之前，我们需要确认我们的 Git 账户，输入以下命令：
```
git config --global user.email EMAIL

git config --global user.name “FULL NAME”

```
EMAIL 即你的 email 地址，FULL NAME 则是你的姓名。现在你可以通过以下命令创建一个提交：
```
git commit -m “Descriptive Message”

```
Descriptive Message 即为你的提交的描述性信息。比如，当你第一次提交是提交一个 readme.txt 文件，你可以这样提交：
```
git commit -m “First draft of readme.txt file”

```

你可以看到输出显示一个文件已经修改，并且，为 readnme.txt 创建了一个新模式（图4）

![success][12]

图4：提交成功

[使用许可][6]
### 创建分支并推送至GitHub
分支是很重要的，它允许你从项目状态间中移动。假如，你想给你的应用创建一个新的特性。为了这样做，你创建了个新分支。一旦你完成你的新特性，你可以把这个新分支合并到你的主分支中去，使用以下命令创建一个新分支：
```
git checkout -b BRANCH

```
BRANCH 即为你新分支的名字，一旦执行完命令，输入 git branch 命令来查看是否创建了新分支（图5）

![featureX][14]

图5:名为 featureX 的新分支

[使用许可][6]

接下来，我们需要在GitHub上创建一个仓库。 登录GitHub帐户，请单击帐户主页上的“新建仓库”按钮。 填写必要的信息，然后单击Create repository（图6）。

![new repository][16]

图6:在 GitHub 上新建一个仓库

[使用许可][6]

在创建完一个仓库之后，你可以看到一个用于推送本地仓库的地址。若要推送，返回命令行窗口（ ~/newproject 目录中），输入以下命令：
```
git remote add origin URL

git push -u origin master

```
URL 即为我们 GitHub 上新建的仓库地址。

系统会提示您，输入 GitHub 的用户名和密码，一旦授权成功，你的项目将会被推送到 GitHub 仓库中。

### 拉取项目

如果你的同事改变了你们 GitHub 上项目的代码，并且已经合并那些更改，你可以拉取那些项目文件到你的本地机器，这样，你系统中的文件就可以和远程用户的文件保持匹配。你可以输入以下命令来做这件事（ ~/newproject 在目录中），
```
git pull origin master

```

以上的命令可以拉取任何新文件或修改过的文件到你的本地仓库。
### 基础

这就是从命令行使用 Git 来处理存储在 GitHub 上的项目的基础知识。 还有很多东西需要学习，所以我强烈建议你使用 man git，man git-push 和 man git-pull 命令来更深入地了解 git 命令可以做什么。

开发快乐！

了解更多关于 Linux的 内容，请访问来自 Linux 基金会和 edX 的免费的 ["Introduction to Linux" ][17]课程。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/7/introduction-using-git

作者：[Jack Wallen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[distant1219](https://github.com/distant1219)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://git-scm.com/
[2]:https://github.com/
[3]:https://github.com/join?source=header-home
[5]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/git_1.jpg?itok=FKkr5Mrk (new repository)
[6]:https://www.linux.com/licenses/category/used-permission
[8]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/git_2.jpg?itok=54G9KBHS (readme)
[10]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/git_3.jpg?itok=KAJwRJIB (file added)
[12]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/git_4.jpg?itok=qR0ighDz (success)
[14]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/git_5.jpg?itok=6m9RTWg6 (featureX)
[16]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/git_6.jpg?itok=d2toRrUq (new repository)
[17]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
