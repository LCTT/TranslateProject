How to Install GitLab on Ubuntu / Fedora / Debian
================================================================================
Distributed version control was never easy before git. Git is a free and open source software that is designed to handle everything from small to very large projects with ease and speed. Git was first developed by Linus Torvalds who was also the founder of well-known Linux Kernel. [GitLab][1] is an awesome development in the field of git and distributed version control system. It is a web based Git repository managing application which includes features like code reviews,wikis, issue tracking and much more. Creating, reviewing and deploying codes is very easy, managed and fast with GitLab. It can be hosted in our own server though it also provides free repository hosting in its official server which is similar to Github. GitLab has two different editions, Community Edition and Enterprise Edition. Community Edition is a complete free and open source software licensed under MIT License whereas Enterprise Edition is under a proprietary license, and contains features that are not present in the CE version. Here are some easy steps on how we can install GitLab Community Edition on our machine running Ubuntu, Fedora and Debian as operating system.

### 1. Installing Pre-requisties ###

First of all, we'll install the required dependencies by GitLab Community Edition. We'll install curl in order to download our required files, openssh-server in order to ssh into our machine, ca-certificates to add CA Certifications and postfix as an MTA (Mail Transfer Agent).

Note: To install GitLab CE, we need to have a linux machine with at least 2 GB RAM and 2 Cores CPU.

#### On Ubuntu 14 .04/Debian 8.x ####

As these packages are available on the official repository of box Ubuntu 14.04 and Debian 8.x, we'll simply install it using apt-get package manager. To do so, we'll need to execute the following command in a terminal or console.

    # apt-get install curl openssh-server ca-certificates postfix

![install dependencies gitlab ubuntu debian](http://blog.linoxide.com/wp-content/uploads/2015/10/install-dependencies-gitlab-ubuntu-debian.png)

#### On Fedora 22 ####

In Fedora 22, the default package manager is dnf as yum has been depreciated. So, we'll simply run the following dnf command in order to install those required packages.

    # dnf install curl openssh-server postfix

![install dependencies gitlab fedora](http://blog.linoxide.com/wp-content/uploads/2015/10/install-dependencies-gitlab-fedora.png)

### 2. Starting and Enabling Services ###

Now, we'll start the services of sshd and postfix using our default init system. And we'll also enable them to start automatically in every system boot.

#### On Ubuntu 14.04 ####

As SysVinit is installed as init system in Ubuntu 14.04, we'll use services command to start sshd and postfix daemon.

    # service sshd start
    # service postfix start

Now, in order to make them start automatically in every boot, we'll need to run the following update-rc.d command.

    # update-rc.d sshd enable
    # update-rc.d postfix enable

#### On Fedora 22/Debian 8.x ####

As Fedora 22 and Debian 8.x is shipped with Systemd instead of SysVinit as default init system, we'll simply run the following command to start the sshd and postfix services.

    # systemctl start sshd postfix

Now, in order to make them start automatically in every boot, we'll need to run the following systemctl command.

    # systemctl enable sshd postfix

    Created symlink from /etc/systemd/system/multi-user.target.wants/sshd.service to /usr/lib/systemd/system/sshd.service.
    Created symlink from /etc/systemd/system/multi-user.target.wants/postfix.service to /usr/lib/systemd/system/postfix.service.

### 3. Downloading GitLab ###

We'll now download the binary installation files from the official GitLab CE Repository using curl. First, we'll need to navigate to the repository in order to get the download link of the required file.  To do so, we'll need to run the following command in our linux machine running the respective operating system.

#### On Ubuntu 14.04 ####

As Ubuntu and Debian uses the same debian format file, we'll gonna search the required version of GitLab under [https://packages.gitlab.com/gitlab/gitlab-ce?filter=debs][2] and click on the link of the required release with ubuntu/trusty tag as we are running Ubuntu 14.04. A new page will appear in which we can see the Download button, we'll gonna right click it, get the link of the file and then download it using curl as shown bellow.

    # curl https://packages.gitlab.com/gitlab/gitlab-ce/packages/ubuntu/trusty/gitlab-ce_8.1.2-ce.0_amd64.deb

![Downloading Gitlab Ubuntu](http://blog.linoxide.com/wp-content/uploads/2015/10/downloading-gitlab-ubuntu.png)

#### On Debian 8.x ####

Like Ubuntu, we'll gonna search the required version of it under [https://packages.gitlab.com/gitlab/gitlab-ce?filter=debs][3] and click on the link of the requried release with debian/jessie tag as we are running Debian 8.x. Then, a new page will appear in which we'll right click on the Download button and get the file's download link. We'll next download it using curl as shown below.

    # curl https://packages.gitlab.com/gitlab/gitlab-ce/packages/debian/jessie/gitlab-ce_8.1.2-ce.0_amd64.deb/download

![Downloading Gitlab Debian](http://blog.linoxide.com/wp-content/uploads/2015/10/downloading-gitlab-debian.png)

#### On Fedora 22 ####

As Fedora uses the rpm file for packages, we'll gonna search the required version of GitLab under [https://packages.gitlab.com/gitlab/gitlab-ce?filter=rpms][4] and click on the link of the required release, here as we are running Fedora 22, we'll select the release with el/7 tag. A new page will appear in which we can see the Download button, we'll gonna right click it, get the link of the file and then download it using curl as shown bellow.

    # curl https://packages.gitlab.com/gitlab/gitlab-ce/packages/el/7/gitlab-ce-8.1.2-ce.0.el7.x86_64.rpm/download

![Downloading Gitlab Fedora](http://blog.linoxide.com/wp-content/uploads/2015/10/downloading-gitlab-fedora.png)

### 4. Installing GitLab ###

After our repository source is added in our linux machine, we'll now go for the installation of GitLab Community Edition using the default package manger of the respective distribution of linux.

#### On Ubuntu 14.04/Debian 8.x ####

To install GitLab CE in machine running Ubuntu 14.04 or Debian 8.x linux distribution which has apt-get package manager, we'll simply run the following command.

    # dpkg -i gitlab-ce_8.1.2-ce.0_amd64.deb

![Installing Gitlab Ubuntu Debian](http://blog.linoxide.com/wp-content/uploads/2015/10/installing-gitlab-ubuntu-debian.png)

#### On Fedora 22 ####

We can execute the following dnf command to install it in our Fedora 22 box.

    # dnf install gitlab-ce-8.1.2-ce.0.el7.x86_64.rpm

![Installing Gitlab Fedora](http://blog.linoxide.com/wp-content/uploads/2015/10/installing-gitlab-fedora.png)

### 5. Configuring and Starting GitLab ###

Next, as GitLab CE has been successfully installed in our linux system. We'll now go ahead for configuring and starting it. To do so, we'll need to run the following command which is same in Ubuntu, Debian and Fedora distributions.

    # gitlab-ctl reconfigure

![Reconfiguring Gitlab](http://blog.linoxide.com/wp-content/uploads/2015/10/reconfiguring-gitlab.png)

### 6. Allowing Firewall ###

If we have firewall program enabled for security in our linux box, we'll need to allow port 80 which is the default port of GitLab CE in order to make the web interface accessible across the network. Firewalld and iptables are most widely used firewall programs in linux distributions. In order to do so, we'll need to run the following commands.
On Iptables

Iptables are installed and used in Ubuntu 14.04 by default. So, we'll need to run the following iptables commands to open port 80 in it.

    # iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT

    # /etc/init.d/iptables save

#### On Firewalld ####

As Fedora 22 and Debian 8.x has systemd installed by default, it contains firewalld running as firewall program. In order to open the port 80 (http service) on firewalld, we'll need to execute the below commands.

    # firewall-cmd --permanent --add-service=http

    success

    # firewall-cmd --reload

    success

### 7. Accessing GitLab Web Interface ###

Finally, we'll now go for accessing the web interface of GitLab CE. To do so, we'll need to point our web browser to the GitLab server with http://ip-address/ or http://domain.com/ according to our configuration. After we have pointed successfully, we'll see the following screen.

![Gitlab Login Screen](http://blog.linoxide.com/wp-content/uploads/2015/10/gitlab-login-screen.png)

Now, in order to login to the panel, we'll need to click on Login button which will ask us an username and a password. We'll now enter the default username and password ie **root** and **5iveL!fe** respectively. After logging into the dashboard, we'll be asked to compulsorily enter the new password for our GitLab root user.

![Setting New Password Gitlab](http://blog.linoxide.com/wp-content/uploads/2015/10/setting-new-password-gitlab.png)

### 8. Creating Repository ###

After we have successfully changed the password and logged in to our dashboard, we'll now create a new repository for our new project. To do so, we'll need to go under Projects and click on **NEW PROJECT** green button.

![Creating New Projects](http://blog.linoxide.com/wp-content/uploads/2015/10/creating-new-projects.png)

Then, we'll be asked to enter the required information and settings for our repository as shown below. We can even import our project from many git repository providers and repositories.

![Creating New Project](http://blog.linoxide.com/wp-content/uploads/2015/10/configuring-git-project.png)

After thats done, we'll be able to access our Git repository using any Git client including the basic git command line. We can see every activities done in the repository with other functions like creating a milestone, managing issues, merge requests, managing members, labels and Wiki for our projects.

![Gitlab Menu](http://blog.linoxide.com/wp-content/uploads/2015/10/gitlab-menu.png)

### Conclusion ###

GitLab is an awesome open source web application for managing our git repository. It has a beautiful, responsive interface with plenty of cool features. It is packed with many cool features like managing groups, deploying keys, Continuous Integration, viewing logs, broadcast messages, hooks, system OAuth applications, templates and more. It has the ability to integrate tons of tools such as Slack, Hipchat, LDAP, JIRA, Jenkins, many types of hooks and a complete API. It has the minimum requirement of 2 GB RAM and 2 Cores CPU to run smoothly up to 500 users but also can be scaled to multiple active servers. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you !

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-gitlab-on-ubuntu-fedora-debian/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://about.gitlab.com/
[2]:https://packages.gitlab.com/gitlab/gitlab-ce?filter=debs
[3]:https://packages.gitlab.com/gitlab/gitlab-ce?filter=debs
[4]:https://packages.gitlab.com/gitlab/gitlab-ce?filter=rpms