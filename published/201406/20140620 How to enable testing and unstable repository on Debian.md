如何在Debian中启用测试版/不稳定版的软件库
================================================================================
为何要启用测试版/不稳定版？

测试版/不稳定版的Debian给开发者提供了一个比当前稳定版更新的环境以及软件。你们注意到了么？其实这些稳定版啊不稳定版啊神马的都是别名，比方说稳定版其实就是Debian的稳定发行版，而测试版将会是下一个Debian的稳定发行版（当然那是测试后的事了）。截至发稿为止，当前Debian的稳定发行版是Wheezy 7.x，将会成为下一个稳定版的测试版则是Jessie。

当你需要一款应用的最新版本的时候，启用测试版/不稳定版将会是不二的选择。当初我因为工作需要，要安装个Apache的 2.4.x到我的Debian Wheezy。测试版需要的是2.4.x的，可是我的软件库里面只有2.2.x的。所以最好的解决方案当时是将测试版下下来啦。

通常来说当我们想尝试最新版本的应用时，都应该只在测试版软件库中搜索。

在这篇文章里我将教大家如何在不弄坏你系统的前提下设置好测试、不稳定版的Debain系统并在上面安装软件。

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
    (deb <上一步弄的服务器或镜像url> <repo的名字> <repo底下的分支>)

当然啦，除了用testing或者unstable这么烂的词，也能使用他们的发行版代号，比如Jessie或者Sid
    
    deb http://http.us.debian.org/debian jessie main non-free contrib
    deb http://security.debian.org/ jessie/updates main contrib non-free
    deb http://http.us.debian.org/debian sid main non-free contrib

### 2. 钉住 apt！这非常重要 ###

> 在加了测试/不稳定的repo之后，当你更新系统的时候所有安装过并且可用的软件就会立马更新，而后你的系统就被你玩火自焚了。

所以需要设置一些规则，以便选定的软件包在正常的更新时不会被更新到一个不稳定的测试版本。

我们需要使用“钉住APT”的方式来告诉apt系统，除了我们希望使用测试版或不稳定版的特定软件包之外，其它的总是使用稳定版的软件包来更新。

可以通过如下两个文件之一来设置如何设置APT的优先级来“钉住”。

    /etc/apt/preferences
    或
    /etc/apt/preferences.d/my_preferences

打开这两个文件之一（如果没有的话就创建一个），然后输入如下内容：

    Package: *
    Pin: release a=stable
    Pin-Priority: 700
    
    Package: *
    Pin: release a=testing
    Pin-Priority: 650
    
    Package: *
    Pin: release a=unstable
    Pin-Priority: 600

前面我们提到过，稳定版指的是你当前的debian版本，测试版是下一个，而不稳定版则是更远的将来发行版。上面的设置中最主要的是优先级（Pin-Priority）。当前的稳定版应该有最高的优先级，这就是说，正常的apt-get操作只会从当前的稳定版的软件库（现在是wheezy）里面安装软件。

#### 更新包缓存 ####

在增加了新的软件库和指定了优先规则后，需要更新一下包缓存。

    $ sudo apt-get update

#### 确认APT规则 ####

我们必须确认“钉住”的设置正确，优先级也没问题。使用 apt-cache 的  policy  参数来检查：

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

如上的输出，确认在wheezy 稳定版中， 2.2.22 版本的Apache是选定的版本，它有最高的优先级。

### 3. 从测试版/不稳定版软件库中安装软件 ###

现在可以从测试版或不稳定版中选择一个特定的软件来安装它了。假如说我们要从测试版软件源中安装 apache2。

有两个不同的方法，并且其结果也有所不同。

#### 方式一 ####

    # apt-get install apache2/testing

上述命令会从测试版软件库中安装 apache2，并从稳定版软件库中安装其依赖包（稳定版通过apt规则确定）。这个命令在某些情况下会失败，比如安装的软件包（apache2）所需的依赖包在稳定版软件库中没有更新到可以支持该软件时。

#### 方式二 ####

    # apt-get -t testing install apache2

上述命令会从测试版软件库中安装apache2，并从测试版软件库中安装其依赖包。这要比上面的命令工作的更好。

所以，要安装较新的软件包，直接从测试版/不稳定版的软件库中安装就行了。注意，优先级号码不只是一个数字而已，还有其特定意义。可以查看 apt_preferences的man页面了解更多：

    $ man 5 apt_preferences

### 总结 ###

使用“钉住”方式的测试版/不稳定版的软件库是一个获取较新版本软件包的一个好办法，不过其实并不推荐使用它们。如果弄错了，可能会从也许不兼容的分支上下载软件包，这会把你的系统搞乱。

一个更好的方式是，使用向后移植的软件库来安装更新的包。它从测试版和不稳定版的软件库中获取较新版本的软件包，但是为当前的稳定版软件库而编译。所以，对于 debian wheezy来说，你可以使用wheezy-backports 软件库。访问http://backports.debian.org/ 了解更多。

### 资源 ###

- [https://wiki.debian.org/AptPreferences][1]
- [https://wiki.debian.org/DebianTesting][2]
- [https://www.debian.org/security/][3]

--------------------------------------------------------------------------------

via: http://www.binarytides.com/enable-testing-repo-debian/

译者：[213edu](https://github.com/213edu) [wxy](https://github.com/wxy) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://wiki.debian.org/AptPreferences
[2]:http://wiki.debian.org/DebianTesting
[3]:http://www.debian.org/security/
