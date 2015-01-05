让下载更方便
================================================================================
下载管理器是一个电脑程序，专门处理下载文件，优化带宽占用，以及让下载更有条理等任务。有些网页浏览器，例如Firefox，也集成了一个下载管理器作为功能，但是它们的使用方式还是没有专门的下载管理器（或者浏览器插件）那么专业，没有最佳地使用带宽，也没有好用的文件管理功能。

对于那些经常下载的人，使用一个好的下载管理器会更有帮助。它能够最大化下载速度（加速下载），断点续传以及制定下载计划，让下载更安全也更有价值。下载管理器已经没有之前流行了，但是最好的下载管理器还是很实用，包括和浏览器的紧密结合，支持类似YouTube的主流网站，以及更多。

有好几个能在Linux下工作都非常优秀的开源下载管理器，以至于让人无从选择。我整理了一个摘要，是我喜欢的下载管理器，以及Firefox里的一个非常好用的下载插件。这里列出的每一个程序都是开源许可发布的。


###uGet

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-uGet.png)

uGet是一个轻量级，容易使用，功能完备的开源下载管理器。uGet允许用户从不同的源并行下载来加快速度，添加文件到下载序列，暂停或继续下载，提供高级分类管理，和浏览器集成，监控剪贴板，批量下载，支持26种语言，以及其他许多功能。

uGet是一个成熟的软件；持续开发超过了11年。在这段时间里，它发展成一个非常多功能的下载管理器，拥有一套很高价值的功能集，还保持了易用性。

uGet是用C语言开发的，使用了cURL作为底层支持，以及应用库libcurl。uGet有非常好的平台兼容性。它一开始是Linux系统下的项目，但是被移植到在Mac OS X，FreeBSD，Android和Windows平台运行。

#### 功能点： ####

- 容易使用
- 下载队列可以让下载任务按任意数量或你希望的数量同时进行。
- 断点续传
- 默认分类
- 完美实现的剪贴板监控功能
- 批量下载
- 支持从HTML文件导入下载任务
- 支持通过HTTP，HTTPS，FTP，BitTorrent和Metalink下载
- 多线程下载（也被称为分块下载）：每个下载任务支持最多20个线程同时连接，支持自适应的分块管理，意味着如果某个下载块中断了，那么会其他连接会把它捡起来，以时刻保证最佳的下载速度。
- 多镜像下载
- FTP登录和匿名FTP
- 强大的计划任务
- 通过FlashGot和FireFox集成
- Aria2插件
- 多变的主题
- 安静模式
- 键盘快捷键
- 支持命令行/终端控制
- 自动创建目录
- 下载历史管理
- 支持GnuTLS
- 支持26种语言，包括：阿拉伯语，白俄罗斯语，简体中文，繁体中文，捷克语，丹麦语，英语（默认），法语，格鲁吉亚语，德语，匈牙利语，印尼语，意大利语，波兰语，葡萄牙语（巴西），俄语，西班牙语，土耳其语，乌克兰语，以及越南语。

--- 

- 网站：[ugetdm.com][1]
- 开发人员：C.H. Huang and contributors
- 许可：GNU LGPL 2.1
- 版本：1.10.5


###DownThemAll!

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-DownThemAll%21.png)

DownThemAll!是一个小巧可靠的、易用的开源下载管理器／加速器，是Firefox的一个组件。它可以让用户下载一个页面上所有链接和图片，还有更多功能。它可以让用户完全控制下载任务，随时分配下载速度以及同时下载的任务数量。通过使用Metalinks或者手动添加镜像的方式，可以同时从不同的服务器下载同一个文件。

DownThemAll会根据你要下载的文件大小，切割成不同的部分，然后并行下载。

#### 功能点： ####

- 和Firefox的完全集成
- 分块下载，允许用户下载不同的文件块，完成之后再拼接成完整的文件；这样的话当连接到一个缓慢的服务器的时候可以加快下载速度。
- 支持Metalink，允许发送下载文件的多个URL以及它的校验值和其他信息到DTA
- 支持爬虫方式通过一个单独的链接遍历整个网页
- 下载过滤
- 高级重命名选项
- 暂停和继续下载任务

---

- 网站：[addons.mozilla.org/en-US/firefox/addon/downthemall][2]
- 开发人员：Federico Parodi, Stefano Verna, Nils Maier
- 许可：GNU GPL v2
- 版本：2.0.17

----------

###JDownloader

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-JDownloader.png)

JDownloader是一个免费，开源的下载管理工具，拥有一个大型社区的开发者支持，让下载更简单和快捷。用户可以开始，停止或暂停下载，设置带宽限制，自动解压缩包，以及更多功能。它提供了一个容易扩展的框架。

JDownloader简化了从一键下载网站下载文件。它还支持从不同并行资源下载、手势识别、自动文件解压缩以及更多功能。另外，还支持许多“加密链接”网站－所以你只需要复制粘贴“加密的”链接，然后JDownloader会处理剩下的事情。JDownloader还能导入CCF，RSDF和DLC文件。

#### 功能点： ####

- 一次下载多个文件
- 从多个连接同时下载
- JD有一个自己实现的强大的OCR模块
- 自动解压（包括密码搜索）（RAR压缩包）
- 支持主题
- 支持多国语言
- 大约110个站点以及超过300个解密插件
- 通过JDLiveHeaderScripts重连：（支持1400路由）
- 网页更新
- 集成包管理器支持额外模块（例如，Webinterface，Shutdown）

---

- 网站：[jdownloader.org][3]
- 开发人员：AppWork UG
- 许可：GNU GPL v3
- 版本：0.9.581

----------

###FreeRapid Downloader

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-FreeRapidDownloader.png)

FreeRapid Downloader是一个易用的开源下载程序，支持从Rapidshare，Youtube，Facebook，Picasa和其他文件分享网站下载。他的下载引擎基于一些插件，所以可以从那些特别的站点下载。

对于需要针对特定文件分享网站的下载管理器用户来说，FreeRapid Downloader是理想的选择。

FreeRapid Downloader使用Java语言编写。需要至少Sun Java 7.0版本才可以运行。

#### 功能点： ####

- 容易使用
- 支持从不同服务站点并行下载
- 支持断点续传
- 支持通过代理列表下载
- 支持流视频或图片
- 下载历史
- 聪明的剪贴板监控
- 自动检查服务器文件后缀
- 自动关机选项
- 插件自动更新
- 简单验证码识别
- 支持跨平台
- 支持多国语言：英语，保加利亚语，捷克语，芬兰语，葡萄牙语，斯洛伐克语，匈牙利语，简体中文，以及其他
- 支持超过700个站点

---

- 网站：[wordrider.net/freerapid/][4]
- 开发人员：Vity and contributors
- 许可：GNU GPL v2
- 版本：0.9u4

----------

###FlashGot

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-FlashGot.png)

FlashGot是一个Firefox和Thunderbird的免费组件，旨在通过外置下载管理器来处理单个和大规模（“所有”和“已选”）下载。

FlashGot把所支持的所有下载管理器统一成Firefox中的一个下载管理器。

#### 功能点： ####

- Linux下支持：Aria, Axel Download Accelerator, cURL, Downloader 4 X, FatRat, GNOME Gwget, FatRat, JDownloader, KDE KGet, pyLoad, SteadyFlow, uGet, wxDFast 和 wxDownload Fast
- 支持图库功能，可以帮助把原来分散在不同页面的系列资源，整合到一个所有媒体库页面中，然后可以轻松迅速地“下载所有”
- FlashGot Link会使用默认下载管理器下载当前鼠标选中的链接
- FlashGot Selection
- FlashGot All
- FlashGot Tabs
- FlashGot Media
- 抓取页面里所有链接
- 抓取所有标签栏的所有链接
- 链接过滤（例如只下载指定类型文件）
- 在网页上抓取点击所产生的所有链接
- 支持从大多数链接保护和文件托管服务器直接和批量下载
- 隐私选项
- 支持国际化

---

- 网站：[flashgot.net][5]
- 开发人员：Giorgio Maone
- 许可：GNU GPL v2
- 版本：1.5.6.5

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/20140913062041384/DownloadManagers.html

作者：Frazer Kline
译者：[zpl1025](https://github.com/zpl1025)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://ugetdm.com/
[2]:https://addons.mozilla.org/en-US/firefox/addon/downthemall/
[3]:http://jdownloader.org/
[4]:http://wordrider.net/freerapid/
[5]:http://flashgot.net/
