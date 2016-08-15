Ubuntu 14.04/16.04 与Windows 10周年版ubuntu Bash性能对比
===========================

今年初，当Microsoft和Canonical发布[Windows 10 Bash 和Ubuntu用户空间][1]，我尝试做了一些初步性能测试 [Ubuntu on Windows 10 对比 原生Ubuntu][2]，这次我发布更多的，关于原生纯净Ubuntu和Base on Windows 10的基准对比。

![](http://www.phoronix.net/image.php?id=windows10-anv-wsl&image=windows_wsl_1_med)

Windows的Linux子系统测试在上周刚刚完成所有测试，并放出升级。 默认的Ubuntu用户空间还是Ubuntu 14.04,但是已经可以升级到16.04。所以测试首先在14.04测试，完成后将系统升级升级到16.04版本并重复所有测试。完成所有基于Windows的测试后，我删除了Ubuntu14.04.5和Ubuntu 16.04 LTS来对比查看性能


![](http://www.phoronix.net/image.php?id=windows10-anv-wsl&image=windows_wsl_2_med)

配置为Intel i5 6600K Skylake框架， 16G内存和256东芝ssd， 所有测试都采用原生默认配置。


![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=09989b3&p=2)
>点击放大查看


这次Ubuntu/Bash on Windows和原生Ubuntu对比测试，采用开源软件Phoronix测试套件，完全自动化并可重复测试。

--------------------------------------------------------------------------------

via: https://www.phoronix.com/scan.php?page=article&item=windows10-anv-wsl&num=1

作者：[Michael Larabel][a]
译者：[VicYu/Vic020](http://vicyu.net)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.michaellarabel.com/
[1]: http://www.phoronix.com/scan.php?page=news_item&px=Ubuntu-User-Space-On-Win10
[2]: http://www.phoronix.com/scan.php?page=article&item=windows-10-lxcore&num=1

