Linux有问必答——如何查找并移除Ubuntu上陈旧的PPA仓库
================================================================================
> **问题**：我试着通过运行apt-get update命令来再次同步包索引文件，但是却出现了“404 无法找到”的错误，看起来似乎是我不能从先前添加的第三方PPA仓库中获取最新的索引。我怎样才能清除这些破损而且陈旧的PPA仓库呢？

    Err http://ppa.launchpad.net trusty/main amd64 Packages
      404  Not Found
    Err http://ppa.launchpad.net trusty/main i386 Packages
      404  Not Found
    W: Failed to fetch http://ppa.launchpad.net/finalterm/daily/ubuntu/dists/trusty/main/binary-amd64/Packages  404  Not Found
    
    W: Failed to fetch http://ppa.launchpad.net/finalterm/daily/ubuntu/dists/trusty/main/binary-i386/Packages  404  Not Found
    
    E: Some index files failed to download. They have been ignored, or old ones used instead.

当你试着更新APT包索引时，“404 无法找到”错误总是会在版本更新之后发生。就是说，在你升级你的Ubuntu发行版后，你在旧的版本上添加的一些第三方PPA仓库就不再受新版本的支持。在此种情况下，你可以像下面这样来**鉴别并清除那些破损的PPA仓库**。

首先，找出那些引起“404 无法找到”错误的PPA。

    $ sudo apt-get update | grep "Failed" 

![](https://farm6.staticflickr.com/5580/14972354938_0e1e1f3db6_z.jpg)

在本例中，Ubuntu Trusty不再支持的PPA仓库是“ppa:finalterm/daily”。

去[移除PPA仓库][1]吧。

     $ sudo add-apt-repository --remove ppa:finalterm/daily 

你得去重复重复再重复，把上面找到的所有过时的PPA仓库一个一个地移除。

![](https://farm4.staticflickr.com/3844/15158541642_1fc8f92c77_z.jpg)

在移除所有过时的PPA仓库后，重新运行“apt-get update”命令来检查它们是否都被成功移除。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/find-remove-obsolete-ppa-repositories-ubuntu.html

译者：[GOLinux](https://github.com/GOLinux)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://ask.xmodulo.com/how-to-remove-ppa-repository-from-command-line-on-ubuntu.html
