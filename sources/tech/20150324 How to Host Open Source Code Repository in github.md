Translating by ZTinoZ
How to Host Open Source Code Repository in github
================================================================================
Hi all, today we will be learning how to host Source Code of Open Source Software in the repository hosted by github.com . GitHub is a web-based Git repository hosting service, which offers all of the distributed revision control and source code management (SCM) functionality of Git as well as adding its own features. It provides a workplace to host powerful collaboration, code review, and code management for open source and private projects. Unlike Git, which is strictly a command-line tool, GitHub provides a web-based graphical interface and desktop as well as mobile integration. GitHub offers both paid plans for private repositories and free accounts, which are usually used to host open-source software projects.

![github universe logo](http://blog.linoxide.com/wp-content/uploads/2015/03/github-universe.jpg)

It is fast and more flexible web based hosting service which is easy to use and to manage distributed revision control. Anyone can host their software's source code in github's repository for the use, contribution, sharing, issue tracking and many more by millions of people across the globe. Here are some easy and quick steps to easily host software's source code.

### 1. Creating a new Github Account ###

First of all, open your favorite browser and go to Github's homepage url ie [github][1]. Then, the homepage will be opened as shown below.

![Github Homepage](http://blog.linoxide.com/wp-content/uploads/2015/03/github-homepage.png)

Now, after the homepage has been opened, please fill form shown to sign up for a new github account.

After the you entered the valid information required for sign up, you'll be redirected to the plan choosing step. We have 5 plans listed in this page. One can choose the plan according to their requirement. Here, we'll go for a free plan. So, click on Choose to the Free plan and click on Finish Sign up. If we are planning to create an organization then, we need to tick on Help me setup an organization next.

![choosing plan](http://blog.linoxide.com/wp-content/uploads/2015/03/choosing-plan.png)

### 2. Creating a New Repository ###

After we have successfully signed up a new account or logged in to Github, we'll now need to create a new Repository to get started.

Click on **(+)** button which is located at the top right near the account id. Then Click on New Repository .

![Add new repository](http://blog.linoxide.com/wp-content/uploads/2015/03/create-new-repository.png)

Now, after clicking on add a new repository, we'll now be directed to the page where we'll need to enter the required information.

![adding repository information](http://blog.linoxide.com/wp-content/uploads/2015/03/adding-information-repository.png)

Now, after entering the required information about the new repository, we'll need to click on green Create repository button.

After it is done, we'll get to see something similar like this image.

![repository github](http://blog.linoxide.com/wp-content/uploads/2015/03/repository-github.png)

### 3. Uploading an existing Project ###

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

### Cloning a Repo ###

If we want to download a code repository from github straight to our local drives with a single command then, we can simply use git clone command which will clone the current directory to the remote repository.

    $ git clone https://github.com/aruntechgeek/linspeed.git

![cloning repo](http://blog.linoxide.com/wp-content/uploads/2015/03/cloning-repo.png)

Please change the above url to the repository you want to clone from.

### Updating a Change ###

If we made changes to our code and want to push them to our remote repository then after changing the changes, we should run the following commands inside that directory.

    $ git add .
    $ git commit -m "Updating"
    $ git push

### Conclusion ###

Hurray! We have successfully hosted our Project Source Code in Github repository. Github is fast and more flexible web based hosting service which is easy to use and to manage distributed revision control. Millions of awesome Open Source projects are hosted in github. So, if you have any questions, suggestions, feedback please write them in the comment box below. Thank you ! Enjoy Github :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/usr-mgmt/host-open-source-code-repository-github/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://github.com/
