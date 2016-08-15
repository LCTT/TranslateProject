  Vic020

Ubuntu 14.04/16.04 vs. Ubuntu Bash On Windows 10 Anniversary Performance
===========================

When Microsoft and Canonical brought [Bash and Ubuntu's user-space to Windows 10][1] earlier this year I ran some preliminary [benchmarks of Ubuntu on Windows 10 versus a native Ubuntu installation][2] on the same hardware. Now that this "Windows Subsystem for Linux" is part of the recent Windows 10 Anniversary Update, I've carried out some fresh benchmarks of Ubuntu running atop Windows 10 compared to Ubuntu running bare metal.

![](http://www.phoronix.net/image.php?id=windows10-anv-wsl&image=windows_wsl_1_med)

The Windows Subsystem for Linux testing was done with the Windows 10 Anniversary Update plus all available system updates as of last week. The default Ubuntu user-space on Windows 10 continues to be Ubuntu 14.04 LTS, but it worked out to upgrade to Ubuntu 16.04 LTS. So at first I carried out the benchmarks in the 14.04-based stock environment on Windows followed by upgrading the user-space to Ubuntu 16.04 LTS and then repeating the tests. After all of the Windows-based testing was completed, I did clean installs of Ubuntu 14.04.5 and Ubuntu 16.04 LTS on the same system to see how the performance compares.

![](http://www.phoronix.net/image.php?id=windows10-anv-wsl&image=windows_wsl_2_med)

An Intel Core i5 6600K Skylake system with 16GB of RAM and 256GB Toshiba SSD were used during the testing process. Each OS was left at its default settings/packages during the testing process.


![](https://openbenchmarking.org/embed.php?i=1608096-LO-BASHWINDO87&sha=09989b3&p=2)
>点击放大查看


The testing of Ubuntu/Bash on Windows and the native Ubuntu Linux installations were carried out in a fully-automated and reproducible manner using the open-source Phoronix Test Suite benchmarking software.

--------------------------------------------------------------------------------

via: https://www.phoronix.com/scan.php?page=article&item=windows10-anv-wsl&num=1

作者：[Michael Larabel][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.michaellarabel.com/
[1]: http://www.phoronix.com/scan.php?page=news_item&px=Ubuntu-User-Space-On-Win10
[2]: http://www.phoronix.com/scan.php?page=article&item=windows-10-lxcore&num=1

