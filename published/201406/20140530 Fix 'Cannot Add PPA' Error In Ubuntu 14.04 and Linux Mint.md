如何修复Ubuntu/Mint中无法添加PPA源的错误
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/05/PPA_Error_Ubuntu.jpeg)

一名It’s FOSS的普通读者Chetan Jain今天联系了我，并询问道：我要怎样修复Ubuntu 14.04中无法添加PPA源的错误。Chetan在尝试安装[TLP (一个用于减少过热发生的电源管理工具)][1]的时候遇到了这个错误：

    chetan@Inspiron-3521:~$ sudo add-apt-repository ppa:linrunner/tlp
    Cannot add PPA: ‘ppa:linrunner/tlp’.
    Please check that the PPA name or format is correct.

如果你在Ubuntu或Mint上添加PPA源时遇到了类似的情况，别担心。这是PPA源的一个常见情况（一般很少发生）之一，很容易就能够得到解决。

### 修复Ubuntu 14.04和Linux Mint中无法添加PPA源的错误 ###

发生这种错误主要有两种原因。一种是您电脑中的CA证书已经损坏，或者是您的网络设置了一个代理。

首先让我们重新安装一下CA证书：

    sudo apt-get install --reinstall ca-certificates

如果上面的命令不起作用，可能是网络使用了一个代理设置。要略过代理设置，使用sudo命令并加上参数E，就像下面这样：

     sudo -E add-apt-repository ppa:linrunner/tlp

这样PPA源应该就能正常工作了。Chetan的情况通过第二种方法解决了。我希望这个快速指南同样能够帮助您摆脱PPA源错误。欢迎您提出任何问题或是建议来帮助我们改进。

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-add-ppa-error-ubuntu-1404-linux-mint/

译者：[alim0x](https://github.com/alim0x) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/solve-overheating-issue-battery-life-ubuntu-1304/
