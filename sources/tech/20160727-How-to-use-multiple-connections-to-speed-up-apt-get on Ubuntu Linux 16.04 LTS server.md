translating---geekpi

How to use multiple connections to speed up apt-get/apt on Ubuntu Linux 16.04 LTS server
=========================================================================================

ow do I speed up my apt-get or apt command to download packages from multiple repos on a Ubuntu Linux 16.04 or 14.04 LTS server?

You need to use apt-fast shell script wrapper. It should speed up apt-get command/apt command and aptitude command by downloading packages with multiple connections per package. All packages are downloaded simultaneously in parallel. It uses aria2c as default download accelerator.

### Install apt-fast tool

Type the following command on Ubuntu Linux 14.04 and later versions:

```
$ sudo add-apt-repository ppa:saiarcot895/myppa
```

Sample outputs:

![](http://s0.cyberciti.org/uploads/faq/2016/07/install-apt-fast-repo.jpg)

Update your repo:

```
$ sudo apt-get update
```

OR

```
$ sudo apt update
```

![](http://s0.cyberciti.org/uploads/faq/2016/07/install-apt-fast-command.jpg)

Install apt-fast shell wrapper:

```
$ sudo apt-get -y install apt-fast
```

OR

```
$ sudo apt -y install apt-fast
```

Sample outputs:


```
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following additional packages will be installed:
  aria2 libc-ares2 libssh2-1
Suggested packages:
  aptitude
The following NEW packages will be installed:
  apt-fast aria2 libc-ares2 libssh2-1
0 upgraded, 4 newly installed, 0 to remove and 0 not upgraded.
Need to get 1,282 kB of archives.
After this operation, 4,786 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://01.archive.ubuntu.com/ubuntu xenial/universe amd64 libssh2-1 amd64 1.5.0-2 [70.3 kB]
Get:2 http://ppa.launchpad.net/saiarcot895/myppa/ubuntu xenial/main amd64 apt-fast all 1.8.3~137+git7b72bb7-0ubuntu1~ppa3~xenial1 [34.4 kB]
Get:3 http://01.archive.ubuntu.com/ubuntu xenial/main amd64 libc-ares2 amd64 1.10.0-3 [33.9 kB]
Get:4 http://01.archive.ubuntu.com/ubuntu xenial/universe amd64 aria2 amd64 1.19.0-1build1 [1,143 kB]
54% [4 aria2 486 kB/1,143 kB 42%]                                    20.4 kB/s 32s
```

### Configure apt-fast

You will be prompted as follows (a value between 5 and 16 must be entered):

![](http://s0.cyberciti.org/uploads/faq/2016/07/max-connection-10.jpg)

And:

![](http://s0.cyberciti.org/uploads/faq/2016/07/apt-fast-confirmation-box.jpg)

You can edit settings directly too:

```
$ sudo vi /etc/apt-fast.conf
```

>**Please note that this tool is not for slow network connections; it is for fast network connections. If you have a slow connection to the Internet, you are not going to benefit by this tool.**

### How do I use apt-fast command?

The syntax is:

```
apt-fast command
apt-fast [options] command
```

#### To retrieve new lists of packages using apt-fast

```
sudo apt-fast update
```

#### To perform an upgrade using apt-fast

```
sudo apt-fast upgrade
```


#### To perform distribution upgrade (release or force kernel upgrade), enter:

```
$ sudo apt-fast dist-upgrade
```

#### To install new packages

The syntax is:

```
sudo apt-fast install pkg
```

For example, install nginx package, enter:

```
$ sudo apt-fast install nginx
```

Sample outputs:

![](http://s0.cyberciti.org/uploads/faq/2016/07/sudo-apt-fast-install.jpg)

#### To remove packages

```
$ sudo apt-fast remove pkg
$ sudo apt-fast remove nginx
```

#### To remove packages and its config files too

```
$ sudo apt-fast purge pkg
$ sudo apt-fast purge nginx
```

#### To remove automatically all unused packages, enter:

```
$ sudo apt-fast autoremove
```

#### To Download source archives

```
$ sudo apt-fast source pkgNameHere
```

#### To erase downloaded archive files

```
$ sudo apt-fast clean
```

#### To erase old downloaded archive files

```
$ sudo apt-fast autoclean
```

#### To verify that there are no broken dependencies

```
$ sudo apt-fast check
```

#### To download the binary package into the current directory

```
$ sudo apt-fast download pkgNameHere
$ sudo apt-fast download nginx
```

Sample outputs:

```
[#7bee0c 0B/0B CN:1 DL:0B]
07/26 15:35:42 [NOTICE] Verification finished successfully. file=/home/vivek/nginx_1.10.0-0ubuntu0.16.04.2_all.deb
07/26 15:35:42 [NOTICE] Download complete: /home/vivek/nginx_1.10.0-0ubuntu0.16.04.2_all.deb
Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
7bee0c|OK  |        n/a|/home/vivek/nginx_1.10.0-0ubuntu0.16.04.2_all.deb
Status Legend:
(OK):download completed.
```

#### To download and display the changelog for the given package

```
$ sudo apt-fast changelog pkgNameHere
$ sudo apt-fast changelog nginx
```



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/introducing-flatpak/

作者：[VIVEK GITE][a]
译者：[zky001](https://github.com/zky001)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.cyberciti.biz/tips/about-us
