[Translating] --213edu

How to enable testing and unstable repository on Debian
================================================================================
Testing/Unstable sources

The testing and unstable repositories of Debian provide with a higher version of software applications than what is present in the stable repository. Note that these names are actually aliases such that the stable repository points to the current Debian stable release and the Testing repository is what is going to be part of the next Debian stable release. So at the time of this post, Wheezy 7.x is the Stable release and Jessie is the Testing source which is going to be the next stable release.

At times, when you need to get a more recent version of a particular application, then the testing/unstable repository is a good option. I had the task of installing Apache 2.4.x onto a Debian wheezy system. But the repo had only 2.2.x and the testing repo had the required 2.4.x version. So the solution is to grab it from the testing repo.

Most of the time, when looking for newer versions of software applications, we would fiddle with the "Testing" repository only.

This post is going to show you how to setup the Testing and Unstable sources on a Debian system and how to install software from them, without breaking your existing system.

>     Stable < Testing < Unstable
>     Wheezy < Jessie < Sid

### 1. Setup the apt sources for testing/unstable repo ###

The first step is to add the testing/unstable sources to your sources.list file. The /etc/apt/sources.list file on a Debian wheezy system looks something like this by default.

    $ cat /etc/apt/sources.list

----------

    ...
    deb http://security.debian.org/ wheezy/updates main
    deb http://http.us.debian.org/debian/ wheezy main
    deb-src http://security.debian.org/ wheezy/updates main
    ...

Note down the url of the repository server - http://http.us.debian.org/debian/
This repository server is a mirror that is located nearest to you. It shall be different in your sources.list file. The same shall be used in the next steps

To add the testing and unstable sources you need to add something like this to your sources.list file

    # Testing repository - main, contrib and non-free branches
    deb http://http.us.debian.org/debian testing main non-free contrib
    deb-src http://http.us.debian.org/debian testing main non-free contrib
    
    
    # Testing security updates repository
    deb http://security.debian.org/ testing/updates main contrib non-free
    deb-src http://security.debian.org/ testing/updates main contrib non-free
    
    
            # Unstable repo main, contrib and non-free branches, no security updates here
    deb http://http.us.debian.org/debian unstable main non-free contrib
    deb-src http://http.us.debian.org/debian unstable main non-free contrib

The format is
    
    deb <respository server/mirror> <repository name> <sub branches of the repo>

Instead of testing/unstable the corresponding codenames jessie and sid can also be used
    
    deb http://http.us.debian.org/debian jessie main non-free contrib
    deb http://security.debian.org/ jessie/updates main contrib non-free
    deb http://http.us.debian.org/debian sid main non-free contrib

### 2. Do some apt pinning - Important ! ###

> After adding the testing and unstable repos, if you update the system then all available updates for all installed applications would be installed right away, leading the system to an unpredictable state.

Therefore some rules have to be setup in order to restrict the package selection during regular updates/upgrades.

This is done through "apt pinning" where we tell the apt system to use only the stable system as always, but we may select to install a particular package from the testing or unstable repository if we wish to.

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
