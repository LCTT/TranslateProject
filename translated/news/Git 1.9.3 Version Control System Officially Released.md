官方发布Git 1.9.3版本控制系统
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/Git-1-9-3-Version-Control-System-Officially-Released-441600-2.jpg)

**Git 1.9.3，一个免费而开源的分布式版本控制系统，设计用于快速并高效地处理一切不管是小的，还是十分庞大的项目，现已提供下载。**

新的Git 1.9.x分支维持了大版本趋势，整合了大量的改进和修补。该分支的这一最新构建版比我们期待的略小，但它提供了一些有趣的改进的特性。如果你正在使用Git，可以考虑升级到新版本。

根据开发者的描述，在1.9版本中，处理对二进制文件修改的"git p4"会因为某个改变而被破坏，这个已经被修复。shell提示符脚本（在contrib/中）在使用PROMPT_COMMAND接口时，不再在显示$PS中显示分支名称时使用不安全的构造函数，而 "git rebase    " 也不再使用POSIX shell的构造函数。 

同时，更多的在Unicode 6.3中定义的具有零宽度的Unicode码点也被修复。一些使用shell构建函数进行的测试原先在FreeBSD上工作得不好，也已经被修复了。
要查看完整的改进列表，请查阅[changelog][1]。

### 下载Git 1.9.3 ###
- [tar.gz][2][sources] [4.60 MB]
- [Debian/Ubuntu DEB ALL][3][ubuntu_deb] [0 KB]
- [Red Hat/Fedora/Mandriva/openSUSE RPM noarch][4][rh_rpm] [0 KB]

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Git-1-9-3-Version-Control-System-Officially-Released-441600.shtml

译者：[GOLinux](https://github.com/GOLinux) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://github.com/git/git/blob/master/Documentation/RelNotes/1.9.3.txt
[2]:https://github.com/git/git/archive/v1.9.3.tar.gz
[3]:http://git-scm.com/download/linux
[4]:http://git-scm.com/download/linux
