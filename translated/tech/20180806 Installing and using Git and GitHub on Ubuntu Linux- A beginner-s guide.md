在Ubuntu Linux上安装和使用Git和GitHub：初学者指南
======

Github是一个存放着世界上最棒的一些软件项目的宝藏，这些软件项目由全世界的开发者无私贡献。这个看似简单，实则非常强大的平台因为大大帮助了那些对开发大规模软件感兴趣的开发者而被开源社区所称道。

这篇向导是对于安装和使用GitHub的的一个快速说明，本文还将涉及诸如创建本地仓库，如何链接这个本地仓库到包含你的项目的远程仓库(这样每个人都能看到你的项目了), 以及如何提交改变并最终推送所有的本地内容到Github。

请注意这篇向导假设你对Git术语有基本的了解，如推送，拉取请求，提交，仓库等等。并且希望你在GitHub上已注册成功并记下了你的GitHub用户名，那么我们这就进入正题吧：

### 1 在Linux上安装Git

下载并安装Git：

```
sudo apt-get install git
```

上面的命令适用于Ubuntu并且应该在所有最新版的Ubuntu上都能工作，它们在Ubuntu 16.04和Ubuntu 18.04 LTS (Bionic Beaver)上都测试过，在将来的版本上应该也能工作。


### 2 配置GitHub

一旦安装完成，接下去就是配置GitHub用户的详细配置信息。请使用下面的两条命令并确保用你自己的GitHub用户名替换"user_name",用你创建GitHub账户的电子邮件替换“email_id”。

```
git config --global user.name "user_name"

git config --global user.email "email_id"

```

下面的图片显示的例子是如何用我的 GitHub “用户名”：“akshaypai”和我的"邮件地址"[[email protected]][2]来配置上面的命令。

[![Git config][3]][4]

### 3 创建本地仓库
在你的系统上创建一个目录。它将会被作为本地仓库使用，稍后它会被推送到 GitHub 的远程仓库。请使用如下命令：

```
git init Mytest
```
如果目录被成功创建，你会看到如下信息：

Initialized empty Git repository in /home/akshay/Mytest/.git/

这行信息可能随你的系统不同而变化。
这里，Mytest 是创建的目录而“init” 将其转化为一个 GitHub 仓库。将当前目录改为这个新创建的目录。

```
cd Mytest
```

### 4 新建一个 REAME 文件来描述仓库
现在创建一个 README 文件并输入一些文本,如“this is git setup on linux”。REAME 文件一般用于描述这个仓库用来放置什么内容或这个项目是关于什么的。例如：

```
gedit README
```
你可以使用任何文本编辑器。我喜欢使用gedit。README文件的内容可以为：

This is a git repo

### 5 将仓库里的文件加入一个索引
这是很重要的一步。这里我们会将所有需要推送到 GitHub 的内容都加入一个索引。这些内容可能包括你第一次加入仓库的文本文件或者应用程序,也有可能是对已存在文件的一些编辑(文件的一个更新版本)。
既然我们已经有了 README 文件，那么让我们创建一个别的文件吧，如一个简单的 C 程序，我们叫它sample.c。文件内容是:

```

#include<stdio.h>
int main()
{
printf("hello world");
return 0;
}

```

现在我们有两个文件了。
README 和 sample.c
用下面的命令将他们加入索引：

```
git add README

git add smaple.c
```

请注意“git add” 命令能将任意数量的文件和目录加入到索引。这里，当我说“ 索引” 的时候，我是指一个有一定空间的缓冲区，这个缓冲区存储了所有已经被加入到 Git 仓库的文件或目录。

### 6 将所作的改动加入索引
所有的文件都加好以后，你就可以提交了。这意味着你已经确定了最终的文件改动（ 或增加）,现在他们已经准备好被上传到我们自己的仓库了。请使用命令：

```
git commit -m "some_message"
```
“some_message”在上面的命令里可以是一些简单的信息如“我的第一次提交”或者“ 编辑了readme 文件”,等等。

### 7 在GitHub上创建一个仓库
在 GitHub 上创建一个仓库。请注意仓库的名字必须和你本地创建的仓库的名字严格一致。在这个例子里是'Mytest'。请首先登陆你的 GitHub 账户<https://github.com>。点击页面右上角 的"plus(+)"符号，并选择"create nw repository"。如下图所示填入详细信息，点击“create repository”。

[![Creating a repository on GitHub][5]][6]
一旦创建完成，我们就能将本地的仓库推送到 GitHub 你名下的仓库，用下列命令连接 GitHub 上的仓库：
请注意：请确保在运行下列命令前替换了路径中的“user_name” 和“Mytest”为你的 GitHub 用户名和目录名！

```
git remote add origin https://github.com/user\_name/Mytest.git>
```

### 8 将本地仓库里的文件推送的GitHub仓库
最后一步是用下列的命令将本地仓库的内容推送到远程仓库(GitHub)


```
git push origin master
```
当提示登陆名和密码时键入登陆名和密码。
下面的图片显示了步骤5到步骤8的流程

[![Pushing files in local repository to GitHub repository][7]][8]

上述将 Mytest 目录里的所有内容(文件) 推送到了GitHub。对于以后的项目或者创建新的仓库，你可以直接从步骤3开始。最后，如果你登陆你的 GitHub 账户并点击你的Mytest 仓库，你会看到这两个文件:README 和sample.c 已经被上传并像如下 图片显示:

[![Content uploaded to Github][9]][10]


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/install-git-and-github-on-ubuntu/

作者：[Akshay Pai][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[DavidChenLiang](https://github.com/DavidChenLiang)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/installing-tensorflow-neural-network-software-for-cpu-and-gpu-on-ubuntu-16-04/
[1]:https://github.com/
[2]:https://www.howtoforge.com/cdn-cgi/l/email-protection
[3]:https://www.howtoforge.com/images/ubuntu_github_getting_started/config.png
[4]:https://www.howtoforge.com/images/ubuntu_github_getting_started/big/config.png
[5]:https://www.howtoforge.com/images/ubuntu_github_getting_started/details.png
[6]:https://www.howtoforge.com/images/ubuntu_github_getting_started/big/details.png
[7]:https://www.howtoforge.com/images/ubuntu_github_getting_started/steps.png
[8]:https://www.howtoforge.com/images/ubuntu_github_getting_started/big/steps.png
[9]:https://www.howtoforge.com/images/ubuntu_github_getting_started/final.png
[10]:https://www.howtoforge.com/images/ubuntu_github_getting_started/big/final.png
