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

First up was the SQLite embedded database benchmark. The out-of-the-box Ubuntu/Bash on Windows performance was quite slow, but when switching that 14.04 environment to 16.04 LTS, the performance was much faster. However, for this disk-heavy workload the native Ubuntu Linux installations were almost twice as fast as relying upon the Windows Subsystem for Linux.

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=fa40825&c=0912dc3f6d6a9f36da09fdd4c0cf4e330fa40f90&p=0)

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=8419652&c=9b9f6b0822ed5b9dc2977a7f2faf499fce4fba23&p=0)

The CompileBench test profile as additional disk-focused workloads show that this is the particular subsystem really straining the Ubuntu performance atop Windows 10 with it being up to multiple times slower.

Next up were some basic system memory speed tests with Stream.

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=9560e6f&c=ebbc6937fa8daf0540e0df353432a29f938cf7ed&p=0)

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=63fa8d6&c=88cd58f9eca6d3a09699d60d9f877529113fb1bc&p=0)

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=5a2e9d2&c=d37eee4c9394fa8104e7e49e26c964af70ec326b&p=0)

Strangely, the Stream memory benchmarks show better performance with Ubuntu on Windows than Ubuntu itself! This happened on both the 14.04 and 16.04 based environments that the Windows results came out faster.

Next are more of the CPU-heavy tests,

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=ee1f01f&c=3e9a67230e0e081b99ee3237e702c0b40ee73d60&p=0)

With the Dolfyn scientific test, the performance between Ubuntu on Windows and Ubuntu installed bare metal was actually quite close. With Ubuntu 16.04 the performance is slower on both platforms due to the newer GCC compiler regressing the performance.

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=dd69257&c=0e31babb8b96be1ae38ea739fbb1346bf9bc4b07&p=0)

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=a02416b&c=c8abb70dee982dd494fb1891bd9dc154fa7a7f47&p=0)

Fhourstones and John The Ripper show that the performance of Ubuntu running on Windows via the Windows Subsystem for Linux can be incredibly close to the bare metal Ubuntu Linux performance!

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=3140e3c&c=f4bf6330a7d58b5939c61cbd91fe5db379c1592a&p=0)

The x264 results were another strange case similar to Stream where the best performance was actually with Ubuntu on Windows 10 via WSL!

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=ad12f0b&c=f50c829c97d731f6926c5a874cf83f8fc5440067&p=0)

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=8b7a7ca&c=3de3e8537d08665e8a41380b6b2298c09f408fa0&p=0)

The timed compilation benchmarks were heavily in favor of the bare metal Ubuntu Linux installations outside of Windows. This is likely due to these large program compilations requiring plenty of disk reads and from the earlier disk-focused benchmarks showing that is the big area where the Windows Subsystem for Linux is slow.

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=25892d8&c=f6cd3fa4a3497e3d2663106e0bf3fcd227f9b9a3&p=0)

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=2ea1062&c=fbbec58a6aa1f3fb8dbc55e3de612afc99c666f7&p=0)

![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=4899bb2&c=80df0e1e749910ebd84b0d6c2688316e5cfb8cda&p=0)

Many of our other common open-source benchmarks show that for the strictly CPU-focused tests, the Windows Subsystem for Linux is close -- or even matches -- the native Ubuntu Linux performance running on the actual hardware.

These latest Windows Subsystem for Linux results are actually rather impressive. The big letdown is just the continued slow disk/file-system performance, but for CPU-bound workloads the results are very compelling. There's also the rare cases with x264 and Stream where the performance of the Ubuntu user-space on Windows appears to clearly outperform that of Ubuntu Linux running on the hardware by itself.

Overall the experience was actually quite pleasant and haven't run into any other bugs or annoyances while running with Ubuntu/Bash on Windows. If you're interested in more Windows vs. Linux benchmarks, please consider voicing yourself as a Phoronix Premium subscriber.
--------------------------------------------------------------------------------

via: https://www.phoronix.com/scan.php?page=article&item=windows10-anv-wsl&num=1

作者：[Michael Larabel][a]
译者：[VicYu/Vic020](http://vicyu.net)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.michaellarabel.com/
[1]: http://www.phoronix.com/scan.php?page=news_item&px=Ubuntu-User-Space-On-Win10
[2]: http://www.phoronix.com/scan.php?page=article&item=windows-10-lxcore&num=1

