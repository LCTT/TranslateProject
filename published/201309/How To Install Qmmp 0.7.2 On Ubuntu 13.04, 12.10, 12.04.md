怎样在Ubuntu 13.04,12.10,12.04安装Qmmp 0.7.2
==========================================

大家好，Ubuntu迷们！

你们好吗? 这篇文章的目标是介绍怎么在Ubuntu系统上安装Qmmp0.7.2app应用程序。在Ubuntu上有许多的多媒体娱乐软件，Qmmp是其中一个,它是基于Qt库的。Qmmp播放器依赖于Qt库，其用户界面类似于Winamp或者是Xmms。你喜欢Winamp的用户界面吗？或者是Xmms的界面？不是？好的，不要担心，还有可替换的用户界面。你可以看看[这里][1]。

Qmmp 的实际稳定版本为0.7.2，已于8月26日发布。该程序非常强大并且很容易使用。它采用了MPEG V1/2的 1/2/3层解码器，支持多种输出格式，例如 MPEG1 2/3层,Ogg Vorbis,Ogg Opus,Native FLAC/Ogg FLAC,Musepack,WavePack，下面列出所有支持的输出格式。

- MPEG1 2/3层
- Ogg Vorbis
- Ogg Opus
- Native FLAC/Ogg FLAC
- Musepack
- WavePack
- Tracker 模块 (mod, s3m, it, xm, etc)
- ADTS AAC
- CD Audio
- WMA, Monkey’s Audio (以及ffmpeg库提供的其他格式)
- PCM WAVE (以及 libsndfile 库提供的其他格式)
- Midi
- Chiptune formats (AY, GBS, GYM, HES, KSS, NSF, NSFE, SAP, SPC, VGM, VGZ, VTX)

和以前的版本相比，Qmmp0.7.2应用程序有许多修正和变化。API文件已修复，未实现的功能已经被删除，那你想知道从0.7.1版本所以的变化吗？

从0.7.1开始的变化有：

- 修复队列更新的bug；
- 修复轨道长度格式；
- 修复API文档；
- 修复了gcc编译器的警告；
- 修复了内存泄露；
- 修复wildmidi的配置路径;
- 修复了播放列表自动保存的功能；
- 修复了可能出现的段错误；
- 修复了标题格式更新错误；
- 去除未实现的功能；

现在开始安装Qmmp 0.7.2；打开新的终端，输入下列命令：

	$sudo add-apt-repository ppa:forktov02/ppa

![img](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Selection_033.png)

![img](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Selection_034.png)

然后更新源列表，输入：

	$sudo apt-get update

![img](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Selection_035.png)

更新完后，我们下载qmpp,qmmp-plugin-pack,然后安装它们。

	$sudo apt-get install qmmp qmmp-plugin-pack;

![img](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Selection_036.png)

via：http://www.unixmen.com/install-qmmp-0-7-2-ubuntu-13-04-12-10-12-04/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[神之一手][] 校对：[jasminepeng][jasminepeng]


[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[神之一手]:http://linux.cn/space/14789
[jasminepeng]:http://linux.cn/space/jasminepeng

[1]:http://qmmp.ylsoftware.com/links.php

