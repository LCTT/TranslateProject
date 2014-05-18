disylee已经翻译，先占一篇。
Git 1.9.3控制版本系统已正式发布
**Git 1.9.3，是一种自由和开放源码的分布式控制版本系统，该设计用于快速有效地处理从小到非常大的项目，现在已经可以提供下载了。**
新的Git 1.9.x系列持续着大量发布的趋势，其中整合了大量的变动和修复。最新版本系列比我们预期稍微小了一点，但的确做了一些有趣的变化。如果你有在使用Git，你会考虑升级到最新版本的。
根据开发商所说，“git p4”在处理二进制文件时受损是由于1.9版本的一些改变，但是这已经被修复了。在shell提示符脚本（在contrib目录/），使用PROMPT_COMMAND界面时，显示分支名称$PS时不再使用不安全的构造，“git rebase”也不再使用POSIX shell中的结构。
此外，在Unicode6.3中定义的具有更多零宽度的代码点已经得到修复，在一些shell结构的测试中发现还未能在FreeBSD很好地运行，但是都已经得到修复了。
关于更改的完整列表，请查看[更新日志】。
下载Git 1.9.3地址

- [tar.gz][2][sources] [4.60 MB]
- [Debian/Ubuntu DEB ALL][3][ubuntu_deb] [0 KB]
- [Red Hat/Fedora/Mandriva/openSUSE RPM noarch][4][rh_rpm] [0 KB]

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Git-1-9-3-Version-Control-System-Officially-Released-441600.shtml

译者：disylee(https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://github.com/git/git/blob/master/Documentation/RelNotes/1.9.3.txt
[2]:https://github.com/git/git/archive/v1.9.3.tar.gz
[3]:http://git-scm.com/download/linux
[4]:http://git-scm.com/download/linux
