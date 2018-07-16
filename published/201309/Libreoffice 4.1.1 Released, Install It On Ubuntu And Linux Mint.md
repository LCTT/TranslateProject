Libreoffice 4.1.1已发布，及在Ubuntu和Linux Mint平台安装方法
======================================================

LibreOffice为您提供了六项功能丰富的应用程序以适合您的文档和数据处理需要，它们包括：Writer、Calc、Impress、Draw、Math和Base。LibreOffice是什么样的软件？我知道这个问题对于大多读者是很容易回答的，但是随着我们的爱好者与日俱增，我猜想有很多人并不了解Linux以及开源，所以我觉得我有必要提供一些有关LibreOffice的信息。

LibreOffice是一个运行在Linux、Windows和Mac操作系统的简单而强大的开源软件。有很多的志愿者帮助完成LibreOffice这个项目，他们担任着不同的角色，从工程任务到社区支持，还有创造性的工作。

下面是新闻播报：

[LibreOffice 4.1.1][1] 已经发布，这个版本有了很多的改进功能和错误修正。LibreOffice 4.1.1不再兼容老式的StarOffice(sun的office)的二进制文件，及不再输出老式的Word和Excel文件。并解决了一个有趣的BUG —— fdo#67388 —— .deb包的文件属主不再是 root:root 了。


**新特性和修复**

- 关闭'首页相同内容'的选项不再显示在界面上
- 不能在Writer中选择其它填充色 -> Drawing 功能
- REPORTBUILDER（报告生成器）：一些选项列表中的标签显示与功能不匹配
- 当检查扩展更新时出现4.1段错误
- FILESAVE: 保存为XLS文件格式遗漏保存cell表达式的公式的结果错误
- 字体样式没有储存在ODG和ODP文件: 编辑一个样式之后，关闭再打开，样式会改变
- 不能保存新的自动更正词条
- MAILMERGE: 在LO 4.1.0.4中预先定义的标签不包含格式信息
- EDTING: BUG: calc 拼写检查崩溃.
- 在libvclplug_gtklo.so中被信号11(SIGSEGV)killed的soffice.bin发生段错误
- GCJ Java Variant数据已知与LibreOffice有影响，我们建议使用OpenJDK来代替
- LibreOffice 4.x 丢掉了一些长期弃用的功能，其中包括对老式的StarOffice二进制文件的支持、导出老式的Word和Excel（6.0/95版本）以及老式的ODMA文档管理
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
[flsf01]:http://linux.cn/space/flsf01
[Caroline]:http://linux.cn/space/14763

[1]:http://www.libreoffice.org/download/release-notes/ 
