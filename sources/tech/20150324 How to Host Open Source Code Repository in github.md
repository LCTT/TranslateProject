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

After we have successfully signed up a new account or logged in to Github, we'll now need to create a new Repository to get started.

Click on **(+)** button which is located at the top right near the account id. Then Click on New Repository .

![Add new repository](http://blog.linoxide.com/wp-content/uploads/2015/03/create-new-repository.png)

Now, after clicking on add a new repository, we'll now be directed to the page where we'll need to enter the required information.

![adding repository information](http://blog.linoxide.com/wp-content/uploads/2015/03/adding-information-repository.png)

Now, after entering the required information about the new repository, we'll need to click on green Create repository button.

After it is done, we'll get to see something similar like this image.

![repository github](http://blog.linoxide.com/wp-content/uploads/2015/03/repository-github.png)

### 3. 上传一个已有项目 ###

If we want to share our existing project on Github, we'll surely need to push the codes to the repository we created. To do so, we'll first need to install git in our Linux machine. As I am running Ubuntu 14.04 LTS in my machine, I'll need to run **apt** manger to install it.

    $ sudo apt-get install git

![installing git](http://blog.linoxide.com/wp-content/uploads/2015/03/install-git.png)

Now, as git is ready, we are now ready to upload the codes.

**Note**: To avoid errors, do not initialize the new repository with **README**, license, or gitignore files. You can add these files after your project has been pushed to GitHub.

In Terminal, we'll need to change the current working directory to your local project then initialize the local directory as a Git repository/

    $ git init

We'll then add the files in our new local repository. This stages them for the first commit.

    $ git add .

Now, we'll need to commit the files that we've staged in our local repository.

    $ git commit -m 'First commit'

![git commit](http://blog.linoxide.com/wp-content/uploads/2015/03/git-commit.png)

In Terminal, we'll add the URL for the remote repository where our local repostory will be pushed.

    $ git remote add origin remote Repository url
    $ git remote -v

![adding remote url](http://blog.linoxide.com/wp-content/uploads/2015/03/adding-remote-url.png)

Note: Please do replace remote Repository url to the url of the remote repo.

Now, to push the changes in our local repository to GitHub's repo we'll need to run as below and enter the required credential for the repository.

    $ git push origin master

![pushing repo](http://blog.linoxide.com/wp-content/uploads/2015/03/pushing-repo.png)

### 克隆一个库 ###

If we want to download a code repository from github straight to our local drives with a single command then, we can simply use git clone command which will clone the current directory to the remote repository.

    $ git clone https://github.com/aruntechgeek/linspeed.git

![cloning repo](http://blog.linoxide.com/wp-content/uploads/2015/03/cloning-repo.png)

Please change the above url to the repository you want to clone from.

### 更新改动 ###

If we made changes to our code and want to push them to our remote repository then after changing the changes, we should run the following commands inside that directory.

    $ git add .
    $ git commit -m "Updating"
    $ git push

### 结论 ###

Hurray! We have successfully hosted our Project Source Code in Github repository. Github is fast and more flexible web based hosting service which is easy to use and to manage distributed revision control. Millions of awesome Open Source projects are hosted in github. So, if you have any questions, suggestions, feedback please write them in the comment box below. Thank you ! Enjoy Github :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/usr-mgmt/host-open-source-code-repository-github/

作者：[Arun Pyasi][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://github.com/
