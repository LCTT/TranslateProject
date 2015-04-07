怎样在Github上做开源代码库的主人
================================================================================
大家好，今天我们要学习一下怎样管理github.com库中的开源软件源代码。GitHub是一个基于web的Git库托管服务，提供分布式修改控制和Git的源代码管理(SCM)功能并加入了自身的特点。它给开源和私有项目提供了一个互相协作的工作区、代码预览和代码管理功能。不像Git，一个完完全全的命令行工具，GitHub提供了一个基于web的图形化界面和桌面，也整合了手机。GitHub同时提供了私有库付费计划和免费账号，都是用来管理开源软件项目的。

![github universe logo](http://blog.linoxide.com/wp-content/uploads/2015/03/github-universe.jpg)

这是一种快速灵活，基于web的托管服务，它使用方便，管理分布式修改控制系统也是相当容易，任何人都能为了将它们使用、贡献、共享、问题跟踪和更多的全球各地数以百万计的人在github的库里管理他们的软件源代码。这里有一些简单快速地管理软件源代码的方法。

### 1. 创建一个新的Github账号 ###

首先，打开你最喜欢的浏览器并访问[github][1]，首页页面如下所示。

![Github Homepage](http://blog.linoxide.com/wp-content/uploads/2015/03/github-homepage.png)

现在，首页打开之后，请填写一个新的github账号用于注册。

输入注册所需的有效信息之后，你会被转到计划选择的步骤。在这个页面上有5种计划，我们可以根据需要来选择，这里我们要选择免费计划。所以，我们点击选择Free计划并完成注册。如果我们接下去还打算创建一个组织，那我们需要勾选“Help me setup an organization next”。

![choosing plan](http://blog.linoxide.com/wp-content/uploads/2015/03/choosing-plan.png)

### 2. 创建一个新的库 ###

成功注册新账号或登录上Github之后，我们需要创建一个新的库来开始我们的正题。

点击位于顶部靠右账号id旁边的**(+)**按钮，然后点击“New Repository”。

![Add new repository](http://blog.linoxide.com/wp-content/uploads/2015/03/create-new-repository.png)

点击创建一个新的库之后，我们进入了填写所需信息的页面。

![adding repository information](http://blog.linoxide.com/wp-content/uploads/2015/03/adding-information-repository.png)

填写好信息之后，我们点击绿色的“Create repository”按钮。

这些步骤都做完之后，我们将看到类似于下面这张图的页面。

![repository github](http://blog.linoxide.com/wp-content/uploads/2015/03/repository-github.png)

### 3. 上传一个已有项目 ###

如果我们想在Github上分享我们的项目，我们自然要把代码推上我们创建的库中。想要这样的话，我们首先要在我们的Linux机器上安装git。如果我在机器上运行的是Ubuntu 14.04 LTS，我需要运行**apt**工具来安装它。

    $ sudo apt-get install git

![installing git](http://blog.linoxide.com/wp-content/uploads/2015/03/install-git.png)

现在git已经准备就绪，我们要上传代码了。

**注意**：为了避免错误，不要用**README**文件、许可证或gitignore文件来初始化新库，你可以在项目推送到Github上之后再添加它们。

在终端上，我们需要把当前工作目录更改为你的本地项目，然后将本地目录初始化为Git库。

    $ git init

接着我们在我们的新的本地库里添加的文件来作为我们的首次提交内容。

    $ git add .

现在我们就提交我们在本地库所添加的文件。

    $ git commit -m 'First commit'

![git commit](http://blog.linoxide.com/wp-content/uploads/2015/03/git-commit.png)

在终端上，我们要给远程库添加URL地址，用于以后我们能提交我们本地的库。

    $ git remote add origin remote Repository url
    $ git remote -v

![adding remote url](http://blog.linoxide.com/wp-content/uploads/2015/03/adding-remote-url.png)

注意：请确保将远程库的URL替换成了自己的远程库的URL。

现在，要将我们的本地库提交至GitHub版本库中，我们需要运行一下命令并且输入所需的用户名和密码。

    $ git push origin master

![pushing repo](http://blog.linoxide.com/wp-content/uploads/2015/03/pushing-repo.png)

### 克隆一个库 ###

如果我们想用一条简单地命令从github上下载代码库至本机上，我们可以用git clone命令，该命令将会从远程库中克隆最新的目录。

    $ git clone https://github.com/aruntechgeek/linspeed.git

![cloning repo](http://blog.linoxide.com/wp-content/uploads/2015/03/cloning-repo.png)

请把以上这条URL地址更改成你想要克隆的地址。

### 更新改动 ###

如果我们对我们的代码做了更改并想把它们提交至我们的远程库中，我们应该在该目录下运行以下命令。

    $ git add .
    $ git commit -m "Updating"
    $ git push

### 结论 ###

啊哈！我们已经成功地管理我们在Github库中的项目源代码了。快速灵活的Github基于web的托管服务，分布式修改控制系统使用起来方便容易。数百万个非常棒的开源项目驻扎在github上。所以，如果你有任何问题、建议或反馈，请在评论中告诉我们。谢谢大家！好好享受吧 :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/usr-mgmt/host-open-source-code-repository-github/

作者：[Arun Pyasi][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://github.com/
