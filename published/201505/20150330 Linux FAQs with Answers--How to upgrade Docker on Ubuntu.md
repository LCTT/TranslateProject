Linux有问必答：如何在Ubuntu中升级Docker
================================================================================
> **提问**: 我使用了Ubuntu的标准仓库安装了Docker。然而，默认安装的Docker不能满足我另外一个依赖Docker程序的版本需要。我该如何在Ubuntu中升级到Docker的最新版本？

Docker第一次在2013年发布，它快速地演变成了一个针对分布式程序的开发平台。为了满足工业期望，Docker正在紧密地开发并持续地带来新特性的升级。这样Ubuntu发行版中的Docker版本可能很快就会过时。比如， Ubuntu 14.10 Utopic 中的Docker版本是1.2.0， 然而最新的Docker版本是1.6.0。

![](https://farm9.staticflickr.com/8730/16351300024_9acb9086da_b.jpg)

对于那些想要跟随Docker的最新开发的人而言，Canonical为Docker维护了一个独立的PPA。使用这个PPA仓库，你可以很容易地在Ubuntu上升级到最新的Docker版本。

下面是如何设置Docker的PPA和升级Docker。

    $ sudo add-apt-repository ppa:docker-maint/testing
    $ sudo apt-get update
    $ sudo apt-get install docker.io

检查安装的Docker版本：

    $ docker --version

----------

    Docker version 1.5.0-dev, build a78ce5c

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/upgrade-docker-ubuntu.html

作者：[Dan Nanni][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
