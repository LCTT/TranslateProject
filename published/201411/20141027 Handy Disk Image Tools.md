Linux 下易用的光盘镜像管理工具
================================================================================
磁盘镜像包括了整个磁盘卷的文件或者是全部的存储设备的数据，比如说硬盘，光盘（DVD,CD,蓝光光碟），磁带机，USB闪存，软盘。一个完整的磁盘镜像应该包含与原来的存储设备上一样完整、准确，包括数据和结构信息。

磁盘镜像文件格式可以是采用开放的标准，像ISO格式的光盘镜像，或者是专有的软件应用程序的特定格式。"ISO"这个名字来源于用CD存储的ISO 9660文件系统。但是，当用户转向Linux的时候，经常遇到这样的问题，需要把专有的的镜像格式转换为开放的格式。

磁盘镜像有很多不同的用处，像烧录光盘，系统备份，数据恢复，硬盘克隆，电子取证和提供操作系统（即LiveCD/DVDs）。

有很多不同的方法可以把ISO镜像挂载到Linux系统下。强大的mount 命令给我们提供了一个简单的解决方案。但是如果你需要很多工具来操作磁盘镜像，你可以试一试下面的这些强大的开源工具。

很多工具还没有看到最新的版本，所以如果你正在寻找一个很好用的开源工具，你也可以加入，一起来为开源做出一点贡献。

### Furius ISO Mount


![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-FuriusISOMountTool.png)

Furius ISO Mount是一个简单易用的开源应用程序，可以用来挂载镜像文件，它支持直接打开ISO,IMG,BIN,MDF和NRG格式的镜像而不用把他们烧录到磁盘。

特性：

- 支持自动挂载ISO, IMG, BIN, MDF and NRG镜像文件
- 支持通过 loop 方式挂载 UDF 镜像
- 自动在根目录创建挂载点
- 自动解挂镜像文件
- 自动删除挂载目录，并返回到主目录之前的状态
- 自动记录最近10次挂载历史
- 支持挂载多个镜像文件
- 支持烧录ISO文件及IMG文件到光盘
- 支持MD5校验和SHA1校验
- 自动检索之前解挂的镜像
- 自动创建手动挂载和解挂的日志文件
- 语言支持（目前支持保加利亚语，中文（简体），捷克语，荷兰语，法语，德语，匈牙利语，意大利语，希腊语，日语，波兰语，葡萄牙语，俄语，斯洛文尼亚语，西班牙语，瑞典语和土耳其语）

---
- 项目网址： [launchpad.net/furiusisomount/][1]
- 开发者: Dean Harris (Marcus Furius)
- 许可： GNU GPL v3
- 版本号： 0.11.3.1


###fuseiso

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-fuseiso.png)

fuseiso 是用来挂载ISO文件系统的一个开源的安全模块。

使用FUSE，我们完全可以在用户空间里运行一个完整的文件系统。

特性：

- 支持读ISO,BIN和NRG镜像，包括ISO 9660文件系统
- 支持普通的ISO 9660级别1和级别2
- 支持一些常用的扩展，想Joliet，RockRidge和zisofs
- 支持非标准的镜像，包括CloneCD's IMGs 、Alcohol 120%'s MDFs 因为他们的格式看起来恰好像BIN镜像一样

---

- 项目网址： [sourceforge.net/projects/fuseiso][2]
- 开发者： Dmitry Morozhnikov
- 许可： GNU GPL v2
- 版本号： 20070708


###iat

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-iat.png)

iat（Iso 9660分析工具）是一个通用的开源工具，能够检测很多不同镜像格式文件的结构，包括BIN,MDF,PDI,CDI,NRG和B5I,并转化成ISO 9660格式.

特性：

- 支持读取（输入）NRG,MDF,PDI,CDI,BIN,CUE 和B5I镜像
- 支持用 cd 刻录机直接烧录光盘镜像
- 输出信息包括：进度条，块大小，ECC扇形分区（大小），头分区（大小），镜像偏移地址等等

--- 

- 项目网址： [sourceforge.net/projects/iat.berlios][3]
- 开发者： Salvatore Santagati
- 许可： GNU GPL v2
- 版本号： 0.1.3


###AcetoneISO

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-AcetoneISO.png)

AcetoneISO 是一个功能丰富的开源图形化应用程序，用来挂载和管理CD/DVD镜像。

当你打开这个程序，你就会看到一个图形化的文件管理器用来挂载镜像文件，包括专有的镜像格式，也包括像ISO, BIN, NRG, MDF, IMG 等等，并且允许您执行一系列的操作。

AcetoneISO是用QT 4写的，也就是说，对于基于QT的桌面环境能很好的兼容，像KDE，LXQT或是Razor-qt。

这个软件适用于所有正在寻找Linux版本的Daemon Tools的人。

特性：

- 支持挂载大多数windows 镜像，界面简洁易用
- 可以将其所有支持镜像格式转换到ISO,或者是从中提取内容
- 加密，压缩，解压任何类型的镜像
- 转换DVD成xvid avi，支持将各种常规视频格式转换成xvid avi
- 从视频里提取声音
- 从不同格式中提取镜像中的文件，包括bin mdf nrg img daa dmg cdi b5i bwi pdi
- 用Kaffeine / VLC / SMplayer播放DVD镜像，可以从Amazon 自动下载封面。
- 从文件夹或者是CD/DVD生成ISO镜像
- 可以做镜像的MD5校验，或者是生成镜像的MD5校验码
- 计算镜像的ShaSums（128,256和384位）
- 支持加密，解密一个镜像文件
- 按兆数分拆和合并镜像
- 以高压缩比将镜像压缩成7z 格式
- 翻录PSX CD成BIN格式，以便在ePSXe/pSX模拟器里运行
- 为BIN和IMG格式恢复丢失的 CUE 文件
- 把MAC OS的DMG镜像转换成可挂载的镜像
- 从指定的文件夹中挂载镜像
- 创建数据库来管理一个大的镜像集合
- 从CD/DVD 或者是ISO镜像中提取启动文件
- 备份CD成BIN镜像
- 简单快速的把DVD翻录成Xvid AVI
- 简单快速的把常见的视频（avi, mpeg, mov, wmv, asf）转换成Xvid AVI
- 简单快速的把FLV 换换成AVI 格式
- 从YouTube和一些视频网站下载视频
- 提取一个有密码的RAR存档
- 支持转换任何的视频到PSP上
- 国际化的语言支持支持（英语，意大利语，波兰语，西班牙语，罗马尼亚语，匈牙利语，德语，捷克语和俄语）

---

- 项目网址: [sourceforge.net/projects/acetoneiso][4]
- 开发者: Marco Di Antonio
- 许可: GNU GPL v3
- 版本号: 2.3


###ISO Master

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-ISOMaster.png)

ISO Master是一个开源、易用的、图形化CD 镜像编辑器，适用于Linux 和BSD 。可以从ISO 里提取文件，给ISO 里面添加文件，创建一个可引导的ISO，这些都是在一个可视化的用户界面完成的。可以打开ISO，NRG 和一些MDF文件，但是只能保存成ISO 格式。

ISO Master 是基于bkisofs 创建的，这是一个简单、稳定的阅读，修改和编写ISO 镜像的软件库，支持Joliet, RockRidge 和EL Torito扩展，

特性：

- 支持读ISO 格式文件（ISO9660, Joliet, RockRidge 和 El Torito），大多数的NRG 格式文件和一些单轨道的MDF文件，但是，只能保存成ISO 格式
- 创建和修改一个CD/DVD 格式文件
- 支持CD 格式文件的添加或删除文件和目录
- 支持创建可引导的CD/DVD
- 国际化的支持

--- 

- 项目网址: [www.littlesvr.ca/isomaster/][5]
- 开发者: Andrew Smith
- 许可: GNU GPL v2
- 版本号: 1.3.11

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/20141025082352476/DiskImageTools.html

作者：Frazer Kline
译者：[barney-ro](https://github.com/barney-ro)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://launchpad.net/furiusisomount/
[2]:http://sourceforge.net/projects/fuseiso/
[3]:http://sourceforge.net/projects/iat.berlios/
[4]:http://sourceforge.net/projects/acetoneiso/
[5]:http://www.littlesvr.ca/isomaster/