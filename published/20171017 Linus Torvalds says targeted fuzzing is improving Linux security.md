Linus Torvalds 说针对性的模糊测试正提升 Linux 安全性
============================================================

Linux 4.14 发布候选第五版已经出来。Linus Torvalds 说：“可以去测试了。”

![linus-toravlds-linuxcon-toronto.jpg](http://zdnet4.cbsistatic.com/hub/i/r/2016/09/13/02537e55-6620-4c3b-aa09-c9c068f3823b/resize/770xauto/b866caa8695edbec68f67da0e9a411e9/linus-toravlds-linuxcon-toronto.jpg) 

随着宣布推出 Linux 内核 4.14 的第五个候选版本，Linus Torvalds 表示<ruby>模糊测试<rt>fuzzing</rt></ruby>正产生一系列稳定的安全更新。

模糊测试通过产生随机代码来引发错误来对系统进行压力测试，从而有助于识别潜在的安全漏洞。模糊测试可以帮助软件开发人员在向用户发布软件之前捕获错误。

Google 使用各种模糊测试工具来查找它及其它供应商软件中的错误。微软推出了 [Project Springfield][1] 模糊测试服务，它能让企业客户测试自己的软件。

正如 Torvalds 指出的那样，Linux 内核开发人员从一开始就一直在使用模糊测试流程，例如 1991 年发布的工具 “crashme”，它在近 20 年后被 [Google 安全研究员 Tavis Ormandy ][2] 用来测试在虚拟机中处理不受信任的数据时，宿主机是否受到良好保护。

Torvalds [说][3]：“另外值得一提的是人们做了多少随机化模糊测试，而且这正在发现东西。”

“我们一直在做模糊测试（谁还记得只是生成随机代码，并跳转过去的老 “crashme” 程序？我们过去很早就这样做），人们在驱动子系统等方面做了一些很好的针对性模糊测试，而且已经有了各种各样的修复（不仅仅是上周的这些）。很高兴可以看到。”

Torvalds 提到，到目前为止，4.14 的发展“比预想的要麻烦一些”，但现在已经好了，并且在这个版本已经跑通了一些针对 x86 系统以及 AMD 芯片系统的修复。还有几个驱动程序、核心内核组件和工具的更新。

如前[所述][4]，Linux 4.14 是 2017 年的长期稳定版本，迄今为止，它引入了核心内存管理功能、设备驱动程序更新以及文档、架构、文件系统、网络和工具的修改。

--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/linus-torvalds-says-targeted-fuzzing-is-improving-linux-security/

作者：[Liam Tung][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.zdnet.com/meet-the-team/eu/liam-tung/
[1]:http://www.zdnet.com/article/microsoft-seeks-testers-for-project-springfield-bug-detection-service/
[2]:http://taviso.decsystem.org/virtsec.pdf
[3]:http://lkml.iu.edu/hypermail/linux/kernel/1710.1/06454.html
[4]:http://www.zdnet.com/article/first-linux-4-14-release-adds-very-core-features-arrives-in-time-for-kernels-26th-birthday/
[5]:http://www.zdnet.com/meet-the-team/eu/liam-tung/
[6]:http://www.zdnet.com/meet-the-team/eu/liam-tung/
[7]:http://www.zdnet.com/topic/security/
