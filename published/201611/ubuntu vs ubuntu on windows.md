Ubuntu 14.04/16.04 与 Windows 10 周年版 Ubuntu Bash 性能对比
===========================

今年初，当 Microsoft 和 Canonical 发布 [Windows 10 Bash 和 Ubuntu 用户空间][1]，我尝试做了一些初步性能测试 [Ubuntu on Windows 10 对比 原生 Ubuntu][2]，这次我发布更多的，关于原生纯净的 Ubuntu 和基于 Windows 10 的基准对比。

![Windows 的 Linux 子系统](http://www.phoronix.net/image.php?id=windows10-anv-wsl&image=windows_wsl_1_med)

Windows 的 Linux 子系统测试完成了所有测试，并随着 Windows 10周年更新放出。 默认的 Ubuntu 用户空间还是 Ubuntu 14.04，但是已经可以升级到 16.04。所以测试首先在 14.04 测试，完成后将系统升级升级到 16.04 版本并重复所有测试。完成所有基于 Windows 的 Ubuntu 子系统测试后，我在同样的系统上干净地安装了 Ubuntu 14.04.5 和 Ubuntu 16.04 LTS 来做性能对比。

![Ubuntu](http://www.phoronix.net/image.php?id=windows10-anv-wsl&image=windows_wsl_2_med)

配置为 Intel i5 6600K Skylake，16G 内存和 256G 东芝 ssd，测试过程中每个操作系统都采用其原生默认配置和软件包。

![Phoronix 测试套件](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=09989b3&p=2)

这次 Ubuntu/Bash on Windows 和原生 Ubuntu 对比测试，采用开源软件 [Phoronix 测试套件](http://www.phoronix-test-suite.com/)，完全自动化并可重复测试。

![SQLite 嵌入式数据库基准测试](https//openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=186c4d0&c=a8c914bf9b64cf67abc65e319f8e71c7951fb1aa&p=0)

首先是 SQLite 嵌入式数据库基准测试。这方面开箱即用的 Ubuntu/Bash on Windows 性能是相当的慢，但是如果将环境从 14.04 升级到 16.04 LTS，性能会快很多。然而，对于繁重磁盘操作的任务，原生 Ubuntu Linux 几乎比 Windows 的子系统 Linux 快了近 2 倍。

![编译测试：编译](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=fa40825&c=0912dc3f6d6a9f36da09fdd4c0cf4e330fa40f90&p=0)

![编译测试：初始创建](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=8419652&c=9b9f6b0822ed5b9dc2977a7f2faf499fce4fba23&p=0)

编译测试作为额外的繁重磁盘操作测试显示，定制的 Windows 子系统真的成倍的限制了 Ubuntu 性能。

接下来，是一些使用 Stream 的基本的系统内存速度测试：

![Stream：复制](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=9560e6f&c=ebbc6937fa8daf0540e0df353432a29f938cf7ed&p=0)

![Stream：缩放](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=63fa8d6&c=88cd58f9eca6d3a09699d60d9f877529113fb1bc&p=0)

![Stream：添加](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=5a2e9d2&c=d37eee4c9394fa8104e7e49e26c964af70ec326b&p=0)

奇怪的是，这些 Stream 内存的基准测试显示 Ubuntu on Windows 的性能比原生的 Ubuntu 好！这个现象同时发生在基于同样的 Windows 却环境不同的 14.04 和 16.04 LTS 上。

接下来，是一些繁重 CPU 操作测试。

![Dolfyn 科学测试](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=ee1f01f&c=3e9a67230e0e081b99ee3237e702c0b40ee73d60&p=0)

通过 Dolfyn 科学测试，Ubuntu On Windows 和原生 Ubuntu 之间的性能其实是相当接近的。 对于 Ubuntu 16.04，由于较新的 GCC 编译器性能衰减，两个平台上的性能都较慢。

![Fhourstones 测试](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=dd69257&c=0e31babb8b96be1ae38ea739fbb1346bf9bc4b07&p=0)

![John The Ripper 测试](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=a02416b&c=c8abb70dee982dd494fb1891bd9dc154fa7a7f47&p=0)

透过 Fhourstones 测试和 John The Ripper 测试表明，通过在 Windows 的 Linux 子系统运行的 Ubuntu 的性能可以非常接近裸机 Ubuntu Linux 性能！

![x264 测试：H264视频编码](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=3140e3c&c=f4bf6330a7d58b5939c61cbd91fe5db379c1592a&p=0)

类似于 Stream 测试，x264 结果是另一个奇怪的情况，其中最好的性能实际上是使用 Linux 子系统的 Ubuntu On Windows！

![Linux 内核编译时间](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=ad12f0b&c=f50c829c97d731f6926c5a874cf83f8fc5440067&p=0)

![PHP 编译时间](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=8b7a7ca&c=3de3e8537d08665e8a41380b6b2298c09f408fa0&p=0)

计时编译基准测试非常利于裸机 Ubuntu Linux。这是应该是由于大型程序编译需要大量读写磁盘，在先前测试已经发现了，这是基于 Windows 的 Linux 子系统缓慢的一大领域。

![Crafty](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=25892d8&c=f6cd3fa4a3497e3d2663106e0bf3fcd227f9b9a3&p=0)

![FLAC 音频编码](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=2ea1062&c=fbbec58a6aa1f3fb8dbc55e3de612afc99c666f7&p=0)

![OpenSSL](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=4899bb2&c=80df0e1e749910ebd84b0d6c2688316e5cfb8cda&p=0)

许多其他的通用开源基准测试表明，严格的针对 CPU 的测试，Windows 子系统的 Ubuntu 的性能是很接近的，甚至是与原生安装在实际硬件中的 Ubuntu Linux 相等。

最新的 Windows 的 Linux 子系统，测试结果实际上相当令人印象深刻。让人沮丧的仅仅只是持续缓慢的磁盘/文件系统性能，但是对于受 CPU 限制的工作负载，结果是非常引人注目的。还有很罕见的情况， x264 和 Stream 测试，Ubuntu On Windows 上的性能看起来明显优于运行在实际硬件上 的Ubuntu Linux。

总的来说，体验是十分愉快的，并且在 Ubuntu/Bash on Windows 也没有遇到任何其他的 bug。如果你有还兴趣了解更多关于 Windows 和 Linux 的基准测试，欢迎留言讨论。

--------------------------------------------------------------------------------

via: https://www.phoronix.com/scan.php?page=article&item=windows10-anv-wsl&num=1

作者：[Michael Larabel][a]
译者：[VicYu/Vic020](http://vicyu.net)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.michaellarabel.com/
[1]: http://www.phoronix.com/scan.php?page=news_item&px=Ubuntu-User-Space-On-Win10
[2]: http://www.phoronix.com/scan.php?page=article&item=windows-10-lxcore&num=1

