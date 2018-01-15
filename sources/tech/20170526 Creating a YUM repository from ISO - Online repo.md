translating---geekpi

Creating a YUM repository from ISO & Online repo
======

YUM tool is one of the most important tool for Centos/RHEL/Fedora. Though in latest builds of fedora, it has been replaced with DNF but that not at all means that it has ran its course. It is still used widely for installing rpm packages, we have already discussed YUM with examples in our earlier tutorial ([ **READ HERE**][1]).

In this tutorial, we are going to learn to create a Local YUM repository, first by using ISO image of OS & then by creating a mirror image of an online yum repository.

###  Creating YUM with DVD ISO

We are using a Centos 7 dvd for this tutorial & same process should work on RHEL 7 as well.

Firstly create a directory named YUM in root folder

```
$ mkdir /YUM-
```

then mount Centos 7 ISO ,

```
$ mount -t iso9660 -o loop /home/dan/Centos-7-x86_x64-DVD.iso /mnt/iso/
```

Next, copy the packages from mounted ISO to /YUM folder. Once all the packages have been copied to the system, we will install the required packages  for creating YUM. Open /YUM & install the following RPM packages,

```
$ rpm -ivh deltarpm
$ rpm -ivh python-deltarpm
$ rpm -ivh createrepo
```

Once these packages have been installed, we will create a file named " **local.repo "** in  **/etc/yum.repos.d** folder with all the yum information

```
$ vi /etc/yum.repos.d/local.repo
```

```
LOCAL REPO]
Name=Local YUM
baseurl=file:///YUM
gpgcheck=0
enabled=1
```

Save & exit the file. Next we will create repo-data by running the following command

```
$ createrepo -v /YUM
```

It will take some time to create the repo data. Once the process finishes, run

```
$ yum clean all
```

to clean cache & then run

```
$ yum repolist
```

to check the list of all repositories. You should see repo "local.repo" in the list.


###  Creating mirror YUM repository with online repository

Process involved in creating a yum is similar to creating a yum with an ISO image with one exception that we will fetch our rpm packages from an online repository instead of an ISO.

Firstly, we need to find an online repository to get the latest packages . It is advised to find an online yum that is closest to your location , in order to optimize the download speeds. We will be using  below mentioned , you can select one nearest to yours location from [CENTOS MIRROR LIST][2]

After selecting a mirror, we will sync that mirror with our system using rsync but before you do that, make sure that you plenty of space on your server

```
$ rsync -avz rsync://mirror.fibergrid.in/centos/7.2/os/x86_64/Packages/s/ /YUM
```

Sync will take quite a while (maybe an hour) depending on your internet speed. After the syncing is completed, we will update our repo-data

```
$ createrepo - v /YUM
```

Our Yum is now ready to used . We can create a cron job for our repo to be updated automatically at a determined time daily or weekly as per you needs.

To create a cron job for syncing the repository, run

```
$ crontab -e
```

& add the following line

```
30 12 * * * rsync -avz http://mirror.centos.org/centos/7/os/x86_64/Packages/ /YUM
```

This will enable the syncing of yum every night at 12:30 AM. Also remember to create repository configuration file in /etc/yum.repos.d , as we did above.

That's it guys, you now have your own yum repository to use. Please share this article if you like it & leave your comments/queries in the comment box down below.


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/creating-yum-repository-iso-online-repo/

作者：[Shusain][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/using-yum-command-examples/
[2]:http://mirror.centos.org/centos/
