在Ubuntu和LINUX Mint上安装Libreoffice 4.1.1
===============================================================

Wireter, Calc, Impress, Draw, Math 和 Base. 这些是Libreoffice的offers组件,处理数据和文档所需要的六个功能丰富的应用. 什么是LibreOffice? 我知道这个问题对于unixmen读者来说很容易回答,但是自从我们的fans每天持续增长,我猜有许多人不了解linux和开源,因此我觉得有必要给出一些关于Libreoffice的信息.

Libreoffice是一个开源软件,简单且强大的Linux,Windows,Mac office套件,Libreoffice项目有许多的志愿者和帮助者.志愿者们扮演不同的角色,从工程师到社区支持还有创意工作,现在是时间来一点新闻了.

[LibreOffice 4.1.1][1] 是一个发行版. 这个Libreoffice 4.11 版本等待来了大量的功能改改善bug修复.LibreOffice 4.1.1兼容二进制StarOffice(sun的office)文件并且兼容Word和Excel.fdo#67388是一个有趣的bug解决:.deb包的文件不属于root:root.


**新特性和修复**

- 关闭 '相同内容在首页' 不显示在界面
- 不能在Writer中选择其它填充色 -> Drawing 功能
- REPORTBUILDER - 一些选项列表中显示的标签不匹配
- 4.1 检查扩展根新时出现segfaults(段错误)
- FILESAVE: 保存为XLS文件格式遗漏保存cell表达式的公式的结果错误
- 字体风格不储存ODG和ODP文件: 编辑一个风格之后,关闭再打开,风格改变
- 不能保存新的自动更正词条
- MAILMERGE: 在LO 4.1.0.4中预先定义的标签不包含格式信息
- EDTING: BUG: calc 拼写检查崩溃
- 在libvclplug_gtklo.so中被信号11(SIGSEGV)killed的soffice.bin发生段错误
- Libreoffice对GCJ java variant类型有已知的问题,我们建议 e.g试用OpenJDK来代替JDK.
- Libreoffice 4.x 放弃一些一直不建议使用的特性,包括对StarOffice 二进制文件的兼容,兼容Word和Excel(version 6.0/95), 还有兼容ODMA文档管理.
- 一些菜单入口改变和增加了.如果你少了些什么,那可能是由于Libreoffice安装时你选择了使用之前的菜单定制设置

现在来说说安装Libreoffice 4.1.1?好的,在Ubuntu/Linux Mint上来安装Libreoffice,首先打开终端,在终端中复制下面的命令:

	$ sudo add-apt-repository ppa:libreoffice/libreoffice-4-1

	$ sudo apt-get update

	$ sudo apt-get install libreoffice

via: http://www.unixmen.com/libreoffice-4-1-1-released-install-ubuntu-linux-mint/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[flsf01][] 校对：[校对者ID][]


[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://www.libreoffice.org/download/release-notes/
