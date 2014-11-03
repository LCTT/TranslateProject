Linux有问必答：Ubuntu如何使用命令行移除PPA仓库
================================================================================
> **问题**: 前段时间，我的Ubuntu增加了一个第三方的PPA仓库，如何才能移除这个PPA仓库呢？

个人软件包档案（PPA）是Ubuntu独有的解决方案，允许独立开发者和贡献者构建、贡献任何定制的软件包来作为通过启动面板的第三方APT仓库。如果你是Ubuntu用户，有可能你已经增加一些流行的第三方PPA仓库到你的Ubuntu系统。如果你需要删除掉已经预先配置好的PPA仓库，下面将教你怎么做。

假如你想增加一个叫“ppa:webapps/preview”第三方PPA仓库到你的系统中，如下：

    $ sudo add-apt-repository ppa:webapps/preview

如果你想要 **单独地删除某个PPA仓库**，运行下面的命令：

     $ sudo add-apt-repository --remove ppa:someppa/ppa 

注意，上述命令不会同时删除任何已经安装或更新的软件包。

如果你想要 **完整的删除一个PPA仓库并包括来自这个PPA安装或更新过的软件包**，你需要ppa-purge命令。

首先要安装ppa-purge软件包：

    $ sudo apt-get install ppa-purge 

然后使用如下命令删除PPA仓库和与之相关的软件包：

    $ sudo ppa-purge ppa:webapps/preview 

特别滴，在发行版更新后，当你[分辨和清除已损坏的PPA仓库][1]时这个方法特别有用！

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/how-to-remove-ppa-repository-from-command-line-on-ubuntu.html

译者：[Vic___](http://www.vicyu.net)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://ask.xmodulo.com/find-remove-obsolete-ppa-repositories-ubuntu.html
