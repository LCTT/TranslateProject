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

![](https//openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=186c4d0&c=a8c914bf9b64cf67abc65e319f8e71c7951fb1aa&p=0)

首先是SQLite嵌入式数据库基准测试.这个盒子外的Ubuntu/Bash on Windows性能是相当的慢,但是如果切换环境从14.04到16.04LTS, 性能会块很多.然而, 对于重磁盘的工作负载,原生Ubuntu Linux比Windows的子系统Linux快了近2倍.

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=fa40825&c=0912dc3f6d6a9f36da09fdd4c0cf4e330fa40f90&p=0)

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=8419652&c=9b9f6b0822ed5b9dc2977a7f2faf499fce4fba23&p=0)

编译测试作为额外的重磁盘测试显示, 定制的Windows子系统真的成倍的限制了Ubuntu性能.

接下来,是一些使用Stream的基本的系统内存速度测试

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=9560e6f&c=ebbc6937fa8daf0540e0df353432a29f938cf7ed&p=0)

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=63fa8d6&c=88cd58f9eca6d3a09699d60d9f877529113fb1bc&p=0)

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=5a2e9d2&c=d37eee4c9394fa8104e7e49e26c964af70ec326b&p=0)

奇怪的是, 这些内存的基准测试显示Ubuntu on Windows的性能比原生的Ubuntu好!这个现象同时发生在基于同样的Windows却环境不同的14.04和16.04上.

接下来, 是一些重CPU测试.

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=ee1f01f&c=3e9a67230e0e081b99ee3237e702c0b40ee73d60&p=0)

通过Dolfyn科学测试，Ubuntu On Windows和原生Ubuntu之间的性能其实是相当接近的。 对于Ubuntu 16.04，由于较新的GCC编译器回退性能，两个平台上的性能都较慢。

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=dd69257&c=0e31babb8b96be1ae38ea739fbb1346bf9bc4b07&p=0)

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=a02416b&c=c8abb70dee982dd494fb1891bd9dc154fa7a7f47&p=0)

透过Fhourstones和John The Ripper表明，通过在Windows上运行Linux子系统的Ubuntu的性能可以非常接近裸机Ubuntu Linux性能！

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=3140e3c&c=f4bf6330a7d58b5939c61cbd91fe5db379c1592a&p=0)

类似于Stream, x264结果是另一个奇怪的情况，其中最好的性能实际上是使用WSL Ubuntu On Windows！

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=ad12f0b&c=f50c829c97d731f6926c5a874cf83f8fc5440067&p=0)

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=8b7a7ca&c=3de3e8537d08665e8a41380b6b2298c09f408fa0&p=0)

定时编译基准测试非常利于裸机Ubuntu Linux. 这是由于大型程序编译需要大量读写磁盘, 先前测试已经发现了, 基于Windows的子系统缓慢的大灾区.

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=25892d8&c=f6cd3fa4a3497e3d2663106e0bf3fcd227f9b9a3&p=0)

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=2ea1062&c=fbbec58a6aa1f3fb8dbc55e3de612afc99c666f7&p=0)

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=4899bb2&c=80df0e1e749910ebd84b0d6c2688316e5cfb8cda&p=0)

许多其他的通用开源基准测试表明, 严格的重CPU测试, Windows子系统的Ubuntu的性能是很接近的, 甚至是相等与原生安装在实际硬盘中的Ubuntu Linux.

最新的Window的Linux子系统,测试结果实际上相当令人印象深刻。让人沮丧仅仅只是持续缓慢的磁盘/文件系统性能，但是对于受CPU限制的工作负载，结果是非常引人注目的。还有很罕见的x264和Stream测试，Ubuntu On Windows上的性能似乎明显优于运行在硬件上的Ubuntu Linux。

总的来说, 测试实验是十分愉快的并且在Ubuntu/Bash on Windows也没有遇到任何其他的bug.如果你有还兴趣了解更多关于Windows和Linux的基准测试, 欢迎留言讨论.
--------------------------------------------------------------------------------

via: https://www.phoronix.com/scan.php?page=article&item=windows10-anv-wsl&num=1

作者：[Michael Larabel][a]
译者：[VicYu/Vic020](http://vicyu.net)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.michaellarabel.com/
[1]: http://www.phoronix.com/scan.php?page=news_item&px=Ubuntu-User-Space-On-Win10
[2]: http://www.phoronix.com/scan.php?page=article&item=windows-10-lxcore&num=1

