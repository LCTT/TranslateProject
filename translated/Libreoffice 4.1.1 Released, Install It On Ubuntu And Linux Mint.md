Libreoffice 4.1.1已发布，基于Ubuntu和Linux Mint平台安装
===============================================================

LibreOffice为您提供了六项功能丰富的应用程序以适合您的文档和数据处理需要，它们包括：Writer、Calc、Impress、Draw、Math和Base。LibreOffice是什么样的软件？我知道这个问题对于unixmen的大多读者是很容易回答的，但是随着我们的爱好者与日俱增，我猜想有很多人并不了解Linux以及开源，所以我觉得我有必要提供一些有关LibreOffice的信息。

LibreOffice是一个开源软件，对于Linux、Windows和Mac操作系统的用户是简单而有力的。有很多的志愿者帮助完成LibreOffice这个项目，他们担任着不同的角色，从工程任务到社区支持，还有创造性的工作。现在是新闻时间。

[LibreOffice 4.1.1][1] 已经发布，这个版本有了很多的改进功能和错误修正功能.LibreOffice 4.1.1兼容二进制StarOffice(sun的office)文件并且兼容Word和Excel. fdo#67388是一个有趣的bug解决:.deb包的文件不属于root:root.


**新特性和修复**

- 关闭 '首页相同内容' 不显示在界面.
- 不能在Writer中选择其它填充色 -> Drawing 功能.
- REPORTBUILDER（报告生成）：一些选项列表中的标签显示与功能不匹配.
- 当检查扩展更新时出现4.1段错误.
- FILESAVE: 保存为XLS文件格式遗漏保存cell表达式的公式的结果错误.
- 字体样式不储存ODG和ODP文件: 编辑一个样式之后,关闭再打开,样式改变.
- 不能保存新的自动更正词条.
- MAILMERGE: 在LO 4.1.0.4中预先定义的标签不包含格式信息.
- EDTING: BUG: calc 拼写检查崩溃.
- 在libvclplug_gtklo.so中被信号11(SIGSEGV)killed的soffice.bin发生段错误.
- GCJ Java Variant数据已知与LibreOffice有关，我们建议使用OpenJDK来代替.
- LibreOffice 4.x 丢掉了一些长期弃用的功能，其中包括遗留二进制StarOffice文件的支持、导出遗留Word和Excel（6.0/95版本）以及遗留ODMA文档管理.
- 已更改或添加了一些菜单项。如果你丢失了一些东西，可能是由于你使用了以前的LibreOffice安装中的定制菜单设置.

那LibreOffice 4.1.1怎样安装呢？打开终端并复制以下命令，这样就可以把LibreOffice安装到Ubuntu或Linux Mint。

	$ sudo add-apt-repository ppa:libreoffice/libreoffice-4-1

	$ sudo apt-get update

	$ sudo apt-get install libreoffice

via: http://www.unixmen.com/libreoffice-4-1-1-released-install-ubuntu-linux-mint/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[flsf01][] 校对：[Caroline][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[Caroline]:http://linux.cn/space/14763

[1]:http://www.libreoffice.org/download/release-notes/ 
