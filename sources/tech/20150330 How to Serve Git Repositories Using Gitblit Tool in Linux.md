translating by wwy-hust

How to Serve Git Repositories Using Gitblit Tool in Linux
================================================================================
Hi friends, today we'll be learning how to install Gitblit in your Linux Server or PC. So, lets check out what is a Git, its features and steps to install Gitblit. [Git is a distributed revision control system][1] with an emphasis on speed, data integrity, and support for distributed, non-linear workflows. It was initially designed and developed by Linus Torvalds for Linux kernel under the terms of the GNU General Public License version 2 development in 2005, and has since become the most widely adopted version control system for software development.

[Gitblit is a free and open source][2] built on a pure Java stack designed to handle everything from small to very large projects with speed and efficiency for serving Git repositories. It is easy to learn and has a tiny footprint with lightning fast performance. It outclasses SCM tools like Subversion, CVS, Perforce, and ClearCase with features like cheap local branching, convenient staging areas, and multiple workflows.

#### Features of Gitblit ####

- It can be used as a dumb repository viewer with no administrative controls or user accounts.
- It can be used as a complete Git stack for cloning, pushing, and repository access control.
- It can be used without any other Git tooling (including actual Git) or it can cooperate with your established tools.

### 1. Creating Gitblit install directory ###

First of all we'll gonna to create a directory in our server in which we'll be installing our latest gitblit in.

    $ sudo mkdir -p /opt/gitblit

    $ cd /opt/gitblit

![creating directory gitblit](http://blog.linoxide.com/wp-content/uploads/2015/01/creating-directory-gitblit.png)

### 2. Downloading and Extracting ###

Now, we will want to download the latest gitblit from the official site. Here, the current version of gitblit we are gonna install is 1.6.2 . So, please change it as the version you are gonna install in your system.

    $ sudo wget http://dl.bintray.com/gitblit/releases/gitblit-1.6.2.tar.gz

![downloading gitblit package](http://blog.linoxide.com/wp-content/uploads/2015/01/downloading-gitblit.png)

Now, we'll be extracting our downloaded tarball package to our current folder ie /opt/gitblit/

    $ sudo tar -zxvf gitblit-1.6.2.tar.gz

![extracting gitblit tar](http://blog.linoxide.com/wp-content/uploads/2015/01/extracting-gitblit-tar.png)

### 3. Configuring and Running ###

Now, we'll configure our Gitblit configuration. If you want to customize the behavior of Gitblit server, you can do it by modifying `gitblit/data/gitblit.properties` . Now, after you are done configuring the configuration. We finally wanna run our gitblit. We have two options on running gitblit, first is that we run it manually by the command below:

    $ sudo java -jar gitblit.jar --baseFolder data

And next is to add and use gitblit as service. Here are the steps that we'll need to follow to use gitblit as service in linux.

So, As I am running Ubuntu, the command below will be  sudo cp service-ubuntu.sh /etc/init.d/gitblit so please change the file name service-ubuntu.sh to the distribution you are currently running.

    $ sudo ./install-service-ubuntu.sh

    $ sudo service gitblit  start

![starting gitblit service](http://blog.linoxide.com/wp-content/uploads/2015/01/starting-gitblit-service.png)

Open your browser to http://localhost:8080 or https://localhost:8443 or replace "localhost" with the ip-address of the machine depending on your system configuration. Enter the default administrator credentials: admin / admin and click the Login button.

![gitblit welcome](http://blog.linoxide.com/wp-content/uploads/2015/01/gitblit-welcome.png)

Now, we'll wanna add a new user. First you'll need to login to the admin with default administrator credentials: username = **admin** and password = **admin** .

Then, Goto user icon > users > (+) new user. And  create a new user like as shown in the figure below.

![add new user](http://blog.linoxide.com/wp-content/uploads/2015/01/add-user.png)

Now, we'll create a new repo out of the box. Go to repositories > (+) new repository . Then, add new repository as shown below.

![add new repository](http://blog.linoxide.com/wp-content/uploads/2015/01/add-new-repository.png)

#### Create a new repository on the command-line ####

        touch README.md
        git init
        git add README.md
        git commit -m "first commit"
        git remote add origin ssh://arunlinoxide@localhost:29418/linoxide.com.git
        git push -u origin master

Please replace the username arunlinoxide with the user you add.

#### Push an existing repository from the command-line ####

        git remote add origin ssh://arunlinoxide@localhost:29418/linoxide.com.git
        git push -u origin master

**Note**: It is highly recommended to everyone to change the password of username "admin" as it comes by default.

### Conclusion ###

Hurray, we finally installed our latest Gitblit in our Linux Computer. We can now enjoy such a beautiful version controlling system for our projects whether its small or large, no matter. With Gitblit, version controlling has been too easy.  It is easy to learn and has a tiny footprint with lightning fast performance. So, if you have any questions, suggestions, feedback please write them in the comment box below.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/serve-git-repositories-gitblit/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://git-scm.com/
[2]:http://gitblit.com/
