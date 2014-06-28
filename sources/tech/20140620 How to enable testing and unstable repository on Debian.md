How to enable testing and unstable repository on Debian
如何在Debian启用测试版/不稳定版的库（testing and unstable repository）
================================================================================
为何要启用测试版/不稳定版？

测试版/不稳定版的Debian给开发者提供了一个比当前稳定版更新的环境以及软件。你们注意到了么？其实这些稳定版啊不稳定版啊神马的都是别名，比方说稳定版其实就是Debian的稳定发行版，而测试版将会是下一个Debian的稳定发行版（当然那是测试后的事了）。截至发稿为止，当前Debian的稳定发行版是Wheezy 7.x，将会成为下一个稳定版的测试版则是Jessie。

当你需要一款应用的最新版本的时候，启用测试版/不稳定版将会是不二的选择。当初我工作需要安装个Apache的 2.4.x到我的Debian Wheezy。测试版需要的是2.4.x的，可是我的repo只有2.2.x的。所以最好的解决方案当时是在测试版下下来啦。

通常来说当我们想尝试最新版本的应用时都应只会使用测试版的系统。

在这篇文章里我将教大家如何在不弄坏你系统的前提下设置好测试、不稳定版的Debain系统病在上面安装软件。

>     Stable < Testing < Unstable （稳定 < 测试版 < 不稳定版）
>     Wheezy < Jessie < Sid

### 1. 设置测试版/不稳定版的apt源 ###

第一步是把测试版/不稳定版的源加到你的sources.list文件里。在Debian Wheezy系统上，/etc/apt/sources.list理应长得像这样：

    $ cat /etc/apt/sources.list

----------

    ...
    deb http://security.debian.org/ wheezy/updates main
    deb http://http.us.debian.org/debian/ wheezy main
    deb-src http://security.debian.org/ wheezy/updates main
    ...

把你repo服务器的链接记下来，比如：http://http.us.debian.org/debian/

这个repo服务器将会是离你最近的一个服务器； 在不同的地理位置会有不同的url，这个将会用于下一步。

如果想加测试/不稳定源，则需要在sources.list文件加上这些东西：

    # Testing repository - main, contrib and non-free branches
    deb http://http.us.debian.org/debian testing main non-free contrib
    deb-src http://http.us.debian.org/debian testing main non-free contrib
    
    
    # Testing security updates repository
    deb http://security.debian.org/ testing/updates main contrib non-free
    deb-src http://security.debian.org/ testing/updates main contrib non-free
    
    
            # Unstable repo main, contrib and non-free branches, no security updates here
    deb http://http.us.debian.org/debian unstable main non-free contrib
    deb-src http://http.us.debian.org/debian unstable main non-free contrib

格式将会是
    
    deb <respository server/mirror> <repository name> <sub branches of the repo>
    (deb <上一步弄的服务器/镜像url> <repo的名字> <repo底下的分支>)

当然啦，除了用testing或者unstable这么烂的词，他们的名称也是能使用的，比如Jessie或者Sid
    
    deb http://http.us.debian.org/debian jessie main non-free contrib
    deb http://security.debian.org/ jessie/updates main contrib non-free
    deb http://http.us.debian.org/debian sid main non-free contrib

### 2. Do some apt pinning - Important ! ### <-怎么翻译

> 在加了测试/不稳定的repo之后，当你更新系统的时候所有安装过并且可用的软件就会立马更新，而后你的系统就被你玩火自焚了。

所以在在升级的时候我们必须要加一些限制，才能让我们在升级的时候选择特定的包。 《-这句被我翻译坏了帮帮忙修一下

This is done through "apt pinning" where we tell the apt system to use only the stable system as always, but we may select to install a particular package from the testing or unstable repository if we wish to.
在这里，我们可以使用apt pinning来告诉apt系统哪些包需要保持不动，哪些包需要

The apt pinning preferences can be configured into either of the following 2 files.

    /etc/apt/preferences
    OR
    /etc/apt/preferences.d/my_preferences

Open either of the 2 locations (create one if it does not exist) and fill the following into the file

    Package: *
    Pin: release a=stable
    Pin-Priority: 700
    
    Package: *
    Pin: release a=testing
    Pin-Priority: 650
    
    Package: *
    Pin: release a=unstable
    Pin-Priority: 600

Mentioned earlier, stable will point to your current debian version, testing to the next, and unstable would be further away in future. Main thing to note is the priority. The stable/current version has been given the highest priority which means that for regular tasks apt-get will install packages only from the current stable repository (wheezy in this case).

#### Update the package cache ####

After adding the new repository and specify the pinning rules, update the package cache.

    $ sudo apt-get update

#### Confirm the apt policy ####

We must ensure that the pinning configuration is correct and that the priorities are met correctly. Check the effective apt policy with the apt-cache command

    $ apt-cache policy apache2
    apache2:
      Installed: (none)
      Candidate: 2.2.22-13
      Version table:
         2.4.7-1 0
            600 http://http.us.debian.org/debian/ unstable/main amd64 Packages
         2.4.6-3 0
            650 http://http.us.debian.org/debian/ testing/main amd64 Packages
         2.2.22-13 0
            700 http://http.us.debian.org/debian/ wheezy/main amd64 Packages

The above output confirms that version 2.2.22 ( the wheezy main/stable ) repository is selected, its on highest priority.

### 3. Install apps from testing/unstable source ###

Now its time to pick a particular package out from the testing or unstable repo and install it. So lets say we want to install apache2 from testing source.

There are 2 ways to do it and each has a different effect.

#### Method 1 ####

    # apt-get install apache2/testing

The above command will install the apache2 package from the testing source and install dependencies from stable source (or whatever the apt policy holds). This command fail in situations where the dependencies are outdated compared to what the installation package (apache2) needs.

#### Method 2 ####

    # apt-get -t testing install apache2

The above command will install apache2 from testing source and install all dependencies from testing source as well. This should work better than the above command.

So to install newer version of any package, simply head towards the testing/unstable sources and enjoy. Note that the priority numbers are not just plain numbers, but have special meanings. Check the man page on apt preferences to learn more about them

    $ man 5 apt_preferences

### Summary ###

Using the testing/unstable repository with pinning is an easy way to get newer versions of packages, but it is not recommended. If done wrong, it can mess up the system by pulling packages from different branches that may not be compatible.

A more recommended method to install updated packages is using the backports repository. It provides newer versions of selected packages from testing/unstable repo, but compiled for the current stable version. So on debian wheezy you can use wheezy-backports repository. Check out http://backports.debian.org/ for more information.

### Resources ###

- [https://wiki.debian.org/AptPreferences][1]
- [https://wiki.debian.org/DebianTesting][2]
- [https://www.debian.org/security/][3]

--------------------------------------------------------------------------------

via: http://www.binarytides.com/enable-testing-repo-debian/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://wiki.debian.org/AptPreferences
[2]:http://wiki.debian.org/DebianTesting
[3]:http://www.debian.org/security/
