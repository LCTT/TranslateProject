Shilpa Nair Shares Her Interview Experience on RedHat Linux Package Management
================================================================================
**Shilpa Nair has just graduated in the year 2015. She went to apply for Trainee position in a National News Television located in Noida, Delhi. When she was in the last year of graduation and searching for help on her assignments she came across Tecmint. Since then she has been visiting Tecmint regularly.**

![Linux Interview Questions on RPM](http://www.tecmint.com/wp-content/uploads/2015/06/Linux-Interview-Questions-on-RPM.jpeg)

Linux Interview Questions on RPM

All the questions and answers are rewritten based upon the memory of Shilpa Nair.

> “Hi friends! I am Shilpa Nair from Delhi. I have completed my graduation very recently and was hunting for a Trainee role soon after my degree. I have developed a passion for UNIX since my early days in the collage and I was looking for a role that suits me and satisfies my soul. I was asked a lots of questions and most of them were basic questions related to RedHat Package Management.”

Here are the questions, that I was asked and their corresponding answers. I am posting only those questions that are related to RedHat GNU/Linux Package Management, as they were mainly asked.

### 1. How will you find if a package is installed or not? Say you have to find if ‘nano’ is installed or not, what will you do? ###

> **Answer** : To find the package nano, weather installed or not, we can use rpm command with the option -q is for query and -a stands for all the installed packages.
> 
>     # rpm -qa nano
>     OR
>     # rpm -qa | grep -i nano
>     
>     nano-2.3.1-10.el7.x86_64
> 
> Also the package name must be complete, an incomplete package name will return the prompt without printing anything which means that package (incomplete package name) is not installed. It can be understood easily by the example below:
> 
> We generally substitute vim command with vi. But if we find package vi/vim we will get no result on the standard output.
> 
>     # vi
>     # vim
> 
> However we can clearly see that the package is installed by firing vi/vim command. Here is culprit is incomplete file name. If we are not sure of the exact file-name we can use wildcard as:
> 
>     # rpm -qa vim*
>     
>     vim-minimal-7.4.160-1.el7.x86_64
> 
> This way we can find information about any package, if installed or not.

### 2. How will you install a package XYZ using rpm? ###

> **Answer** : We can install any package (*.rpm) using rpm command a shown below, here options -i (install), -v (verbose or display additional information) and -h (print hash mark during package installation).
> 
>     # rpm -ivh peazip-1.11-1.el6.rf.x86_64.rpm
>     
>     Preparing...                          ################################# [100%]
>     Updating / installing...
>        1:peazip-1.11-1.el6.rf             ################################# [100%]
> 
> If upgrading a package from earlier version -U switch should be used, option -v and -h follows to make sure we get a verbose output along with hash Mark, that makes it readable.

### 3. You have installed a package (say httpd) and now you want to see all the files and directories installed and created by the above package. What will you do? ###

> **Answer** : We can list all the files (Linux treat everything as file including directories) installed by the package httpd using options -l (List all the files) and -q (is for query).
> 
>     # rpm -ql httpd
>     
>     /etc/httpd
>     /etc/httpd/conf
>     /etc/httpd/conf.d
>     ...

### 4. You are supposed to remove a package say postfix. What will you do? ###

> **Answer** : First we need to know postfix was installed by what package. Find the package name that installed postfix using options -e erase/uninstall a package) and –v (verbose output).
> 
>     # rpm -qa postfix*
>     
>     postfix-2.10.1-6.el7.x86_64
> 
> and then remove postfix as:
> 
>     # rpm -ev postfix-2.10.1-6.el7.x86_64
>     
>     Preparing packages...
>     postfix-2:3.0.1-2.fc22.x86_64

### 5. Get detailed information about an installed package, means information like Version, Release, Install Date, Size, Summary and a brief description. ###

> **Answer** : We can get detailed information about an installed package by using option -qa with rpm followed by package name.
> 
> For example to find details of package openssh, all I need to do is:
> 
>     # rpm -qi openssh
>     
>     [root@tecmint tecmint]# rpm -qi openssh
>     Name        : openssh
>     Version     : 6.8p1
>     Release     : 5.fc22
>     Architecture: x86_64
>     Install Date: Thursday 28 May 2015 12:34:50 PM IST
>     Group       : Applications/Internet
>     Size        : 1542057
>     License     : BSD
>     ....

### 6. You are not sure about what are the configuration files provided by a specific package say httpd. How will you find list of all the configuration files provided by httpd and their location. ###

> **Answer** : We need to run option -c followed by package name with rpm command and it will list the name of all the configuration file and their location.
> 
>     # rpm -qc httpd
>     
>     /etc/httpd/conf.d/autoindex.conf
>     /etc/httpd/conf.d/userdir.conf
>     /etc/httpd/conf.d/welcome.conf
>     /etc/httpd/conf.modules.d/00-base.conf
>     /etc/httpd/conf/httpd.conf
>     /etc/sysconfig/httpd
> 
> Similarly we can list all the associated document files as:
> 
>     # rpm -qd httpd
>     
>     /usr/share/doc/httpd/ABOUT_APACHE
>     /usr/share/doc/httpd/CHANGES
>     /usr/share/doc/httpd/LICENSE
>     ...
> 
> also, we can list the associated License file as:
> 
>     # rpm -qL openssh
>     
>     /usr/share/licenses/openssh/LICENCE
> 
> Not to mention that the option -d and option -L in the above command stands for ‘documents‘ and ‘License‘, respectively.

### 7. You came across a configuration file located at ‘/usr/share/alsa/cards/AACI.conf’ and you are not sure this configuration file is associated with what package. How will you find out the parent package name? ###

> **Answer** : When a package is installed, the relevant information gets stored in the database. So it is easy to trace what provides the above package using option -qf (-f query packages owning files).
> 
>     # rpm -qf /usr/share/alsa/cards/AACI.conf
>     alsa-lib-1.0.28-2.el7.x86_64
> 
> Similarly we can find (what provides) information about any sub-packge, document files and License files.

### 8. How will you find list of recently installed software’s using rpm? ###

> **Answer** : As said earlier, everything being installed is logged in database. So it is not difficult to query the rpm database and find the list of recently installed software’s.
> 
> We can do this by running the below commands using option –last (prints the most recent installed software’s).
> 
>     # rpm -qa --last
> 
> The above command will print all the packages installed in a order such that, the last installed software appears at the top.
> 
> If our concern is to find out specific package, we can grep that package (say sqlite) from the list, simply as:
> 
>     # rpm -qa --last | grep -i sqlite
>     
>     sqlite-3.8.10.2-1.fc22.x86_64                 Thursday 18 June 2015 05:05:43 PM IST
> 
> We can also get a list of 10 most recently installed software simply as:
> 
>     # rpm -qa --last | head
> 
> We can refine the result to output a more custom result simply as:
> 
>     # rpm -qa --last | head -n 2
> 
> In the above command -n represents number followed by a numeric value. The above command prints a list of 2 most recent installed software.

### 9. Before installing a package, you are supposed to check its dependencies. What will you do? ###

> **Answer** : To check the dependencies of a rpm package (XYZ.rpm), we can use switches -q (query package), -p (query a package file) and -R (Requires / List packages on which this package depends i.e., dependencies).
> 
>     # rpm -qpR gedit-3.16.1-1.fc22.i686.rpm 
>     
>     /bin/sh
>     /usr/bin/env
>     glib2(x86-32) >= 2.40.0
>     gsettings-desktop-schemas
>     gtk3(x86-32) >= 3.16
>     gtksourceview3(x86-32) >= 3.16
>     gvfs
>     libX11.so.6
>     ...

### 10. Is rpm a front-end Package Management Tool? ###

> **Answer** : No! rpm is a back-end package management for RPM based Linux Distribution.
> 
> [YUM][1] which stands for Yellowdog Updater Modified is the front-end for rpm. YUM automates the overall process of resolving dependencies and everything else.
> 
> Very recently [DNF][2] (Dandified YUM) replaced YUM in Fedora 22. Though YUM is still available to be used in RHEL and CentOS, we can install dnf and use it alongside of YUM. DNF is said to have a lots of improvement over YUM.
> 
> Good to know, you keep yourself updated. Lets move to the front-end part.

### 11. How will you list all the enabled repolist on a system. ###

> **Answer** : We can list all the enabled repos on a system simply using following commands.
> 
>     # yum repolist
>     or
>     # dnf repolist
>     
>     Last metadata expiration check performed 0:30:03 ago on Mon Jun 22 16:50:00 2015.
>     repo id                                                                           repo name                                                                                             status
>     *fedora                                                                           Fedora 22 - x86_64                                                                                    44,762
>     ozonos                                                                            Repository for Ozon OS                                                                                    61
>     *updates                                                                          Fedora 22 - x86_64 - Updates   
> 
> The above command will only list those repos that are enabled. If we need to list all the repos, enabled or not, we can do.
> 
>     # yum repolist all
>     or
>     # dnf repolist all
>     
>     Last metadata expiration check performed 0:29:45 ago on Mon Jun 22 16:50:00 2015.
>     repo id                                                                         repo name                                                                                      status
>     *fedora                                                                         Fedora 22 - x86_64                                                                             enabled: 44,762
>     fedora-debuginfo                                                                Fedora 22 - x86_64 - Debug                                                                     disabled
>     fedora-source                                                                   Fedora 22 - Source                                                                             disabled
>     ozonos                                                                          Repository for Ozon OS                                                                         enabled:     61
>     *updates                                                                        Fedora 22 - x86_64 - Updates                                                                   enabled:  5,018
>     updates-debuginfo                                                               Fedora 22 - x86_64 - Updates - Debug

### 12. How will you list all the available and installed packages on a system? ###

> **Answer** : To list all the available packages on a system, we can do:
> 
>     # yum list available
>     or
>     # dnf list available
>     
>     ast metadata expiration check performed 0:34:09 ago on Mon Jun 22 16:50:00 2015.
>     Available Packages
>     0ad.x86_64                               0.0.18-1.fc22                   fedora 
>     0ad-data.noarch                          0.0.18-1.fc22                   fedora 
>     0install.x86_64                          2.6.1-2.fc21                    fedora 
>     0xFFFF.x86_64                            0.3.9-11.fc22                   fedora 
>     2048-cli.x86_64                          0.9-4.git20141214.723738c.fc22  fedora 
>     2048-cli-nocurses.x86_64                 0.9-4.git20141214.723738c.fc22  fedora 
>     ....
> 
> To list all the installed Packages on a system, we can do.
> 
>     # yum list installed
>     or
>     # dnf list installed
>     
>     Last metadata expiration check performed 0:34:30 ago on Mon Jun 22 16:50:00 2015.
>     Installed Packages
>     GeoIP.x86_64                            1.6.5-1.fc22                     @System
>     GeoIP-GeoLite-data.noarch               2015.05-1.fc22                   @System
>     NetworkManager.x86_64                   1:1.0.2-1.fc22                   @System
>     NetworkManager-libnm.x86_64             1:1.0.2-1.fc22                   @System
>     aajohan-comfortaa-fonts.noarch          2.004-4.fc22                     @System
>     ....
> 
> To list all the available and installed packages on a system, we can do.
> 
>     # yum list
>     or
>     # dnf list
> 
>     Last metadata expiration check performed 0:32:56 ago on Mon Jun 22 16:50:00 2015.
>     Installed Packages
>     GeoIP.x86_64                             1.6.5-1.fc22                    @System
>     GeoIP-GeoLite-data.noarch                2015.05-1.fc22                  @System
>     NetworkManager.x86_64                    1:1.0.2-1.fc22                  @System
>     NetworkManager-libnm.x86_64              1:1.0.2-1.fc22                  @System
>     aajohan-comfortaa-fonts.noarch           2.004-4.fc22                    @System
>     acl.x86_64                               2.2.52-7.fc22                   @System
>     ....

### 13. How will you install and update a package and a group of packages separately on a system using YUM/DNF? ###

> Answer : To Install a package (say nano), we can do,
> 
>     # yum install nano
> 
> To Install a Group of Package (say Haskell), we can do.
> 
>     # yum groupinstall 'haskell'
> 
> To update a package (say nano), we can do.
> 
>     # yum update nano
> 
> To update a Group of Package (say Haskell), we can do.
> 
>     # yum groupupdate 'haskell'

### 14. How will you SYNC all the installed packages on a system to stable release? ###

> **Answer** : We can sync all the packages on a system (say CentOS or Fedora) to stable release as,
> 
>     # yum distro-sync      [On CentOS/RHEL]
>     or
>     # dnf distro-sync      [On Fedora 20 Onwards]

Seems you have done a good homework before coming for the interview,Good!. Before proceeding further I just want to ask one more question.

### 15. Are you familiar with YUM local repository? Have you tried making a Local YUM repository? Let me know in brief what you will do to create a local YUM repo. ###

> **Answer** : First I would like to Thank you Sir for appreciation. Coming to question, I must admit that I am quiet familiar with Local YUM repositories and I have already implemented it for testing purpose in my local machine.
> 
> 1. To set up Local YUM repository, we need to install the below three packages as:
> 
>     # yum install deltarpm  python-deltarpm  createrepo
> 
> 2. Create a directory (say /home/$USER/rpm) and copy all the RPMs from RedHat/CentOS DVD to that folder.
> 
>     # mkdir /home/$USER/rpm
>     # cp /path/to/rpm/on/DVD/*.rpm /home/$USER/rpm
> 
> 3. Create base repository headers as.
> 
>     # createrepo -v /home/$USER/rpm
> 
> 4. Create the .repo file (say abc.repo) at the location /etc/yum.repos.d simply as:
> 
>     cd /etc/yum.repos.d && cat << EOF > abc.repo
>     [local-installation]name=yum-local
>     baseurl=file:///home/$USER/rpm
>     enabled=1
>     gpgcheck=0
>     EOF

**Important**: Make sure to remove $USER with user_name.

That’s all we need to do to create a Local YUM repository. We can now install applications from here, that is relatively fast, secure and most important don’t need an Internet connection.

Okay! It was nice interviewing you. I am done. I am going to suggest your name to HR. You are a young and brilliant candidate we would like to have in our organization. If you have any question you may ask me.

**Me**: Sir, it was really a very nice interview and I feel very lucky today, to have cracked the interview..

Obviously it didn’t end here. I asked a lots of questions like the project they are handling. What would be my role and responsibility and blah..blah..blah

Friends, by the time all these were documented I have been called for HR round which is 3 days from now. Hope I do my best there as well. All your blessings will count.

Thankyou friends and Tecmint for taking time and documenting my experience. Mates I believe Tecmint is doing some really extra-ordinary which must be praised. When we share ours experience with other, other get to know many things from us and we get to know our mistakes.

It enhances our confidence level. If you have given any such interview recently, don’t keep it to yourself. Spread it! Let all of us know that. You may use the below form to share your experience with us.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-rpm-package-management-interview-questions/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[2]:http://www.tecmint.com/dnf-commands-for-fedora-rpm-package-management/