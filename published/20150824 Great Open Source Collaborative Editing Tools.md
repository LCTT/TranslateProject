六款优秀的开源协作编辑工具
================================================================================

简而言之，协作编辑（Collaborative Edit）就是多个人进行编辑。协作有好处也有风险。好处之一是更加全面/协调的方式，更好的利用现有资源和一个更加有力一致的声音。对于我来说，最大的好处是极大的透明度。那是当我需要采纳同事的观点。同事之间来来回回地传文件效率非常低，导致不必要的延误还让人（比如，我）对整个协作这件事都感到不满意。有个好的协作软件，我就能实时地或异步地分享笔记，数据和文件，并用评论来分享自己的想法。这样在文档、图片、视频、演示文稿上协作就不会那么的琐碎而无聊。

有很多种方式能在线进行协作，简直不能更简便了。这篇文章展示了我最喜欢的开源的实时文档协作编辑工具。

Google Docs 是个非常好的高效应用，有着大部分我所需要的功能。它可以作为一个实时地协作编辑文档的工具提供服务。文档可以被分享、打开并被多位用户同时编辑，用户还能看见其他协作者一个字母一个字母的编辑过程。虽然 Google Docs 对个人是免费的，但并不开源。

下面是我带来的最棒的开源协作编辑器，它们能帮你不被打扰的集中精力进行写作，而且是和其他人协同完成。

----------

### Hackpad ###

![Hackpad in action](http://www.linuxlinks.com/portal/content/reviews/Editors/Screenshot-Hackpad.png)

Hackpad 是个开源的基于网页的实时 wiki，基于开源 EtherPad 协作文档编辑器。

Hackpad 允许用户实时分享你的文档，它还用彩色编码显示各个作者分别贡献了哪部分。它还允许插入图片、清单，由于提供了语法高亮功能，它还能用来写代码。

当2014年4月 Dropbox 收购了 Hackpad 后，就在这个月这款软件以开源的形式发布。让我们经历的等待非常值得。

特性：

- 有类似 wiki 所提供的，一套非常完善的功能
- 实时或者异步地记录协作笔记，共享数据和文件，或用评论分享你们的想法
- 细致的隐私许可让你可以邀请单个朋友、一个十几人的团队或者上千的 Twitter 粉丝
- 智能执行
- 直接从流行的视频分享网站上插入视频
- 表格
- 可对使用广泛的包括 C, C#, CSS, CoffeeScript, Java, 以及 HTML 在内的编程语言进行语法高亮

- 网站：[hackpad.com][1]
- 源代码：[github.com/dropbox/hackpad][2]
- 开发者：[Contributors][3]
- 许可：Apache License, Version 2.0
- 版本号： -

----------

### Etherpad ###

![Etherpad in action](http://www.linuxlinks.com/portal/content/reviews/Editors/Screenshot-Etherpad.png)

Etherpad 是个基于网页的开源实时协作编辑器，允许多个作者同时编辑一个文本文档，写评论，并与其他作者用群聊方式进行交流。

Etherpad 是用 JavaScript 编写的，运行在 AppJet 平台之上，通过 Comet 流实现实时的功能。

特性：

- 尽心设计的斯巴达界面
- 简单的格式化文本功能
- “滑动时间轴”——浏览一个工程历史版本
- 可以下载纯文本、 PDF、微软的 Word 文档、Open Document 和 HTML 格式的文档
- 每隔一段很短的时间就会自动保存
- 可个性化程度高
- 有客户端插件可以扩展编辑的功能
- 几百个支持 Etherpad 的扩展，包括支持 email 提醒，pad 管理，授权
- 可访问性开启
- 可从 Node 里或通过 CLI（命令行界面）和 EtherPad 的内容交互

- 网站： [etherpad.org][4]
- 源代码：[github.com/ether/etherpad-lite][5]
- 开发者：David Greenspan, Aaron Iba, J.D. Zamfiresc, Daniel Clemens, David Cole
- 许可：Apache License, Version 2.0
- 版本号： 1.5.7

----------

### Firepad ###

![Firepad in action](http://www.linuxlinks.com/portal/content/reviews/Editors/Screenshot-Firepad.png)

Firepad 是个开源的协作文本编辑器。它的设计目的是被嵌入到更大的网页应用中对几天内新加入的代码进行批注。

Firepad 是个全功能的文本编辑器，有解决冲突，光标同步，用户属性，用户在线状态检测功能。它使用 Firebase 作为后台，而且不需要任何服务器端的代码。他可以被加入到任何网页应用中。Firepad 可以使用 CodeMirror 编辑器或者 Ace 编辑器提交文本，它的操作转换代码是从 ot.js 上借鉴的。

如果你想要通过添加简单的文档和代码编辑器来扩展你的网页应用能力，Firepad 最适合不过了。

Firepad 已被多个编辑器使用，包括Atlassian Stash Realtime Editor、Nitrous.IO、LiveMinutes 和 Koding。

特性：

- 纯正的协作编辑
- 基于 OT 的智能合并及解决冲突
- 支持多种格式的文本和代码的编辑
- 光标位置同步
- 撤销/重做
- 文本高亮
- 用户属性
- 在线检测
- 版本检查点
- 图片
- 通过它的 API 拓展 Firepad
- 支持所有现代浏览器：Chrome、Safari、Opera 11+、IE8+、Firefox 3.6+

- 网站：  [www.firepad.io][6]
- 源代码：[github.com/firebase/firepad][7]
- 开发者：Michael Lehenbauer and the team at Firebase
- 许可：MIT
- 版本号：1.1.1

----------

### OwnCloud Documents ###

![ownCloud Documents in action](http://www.linuxlinks.com/portal/content/reviews/Editors/Screenshot-ownCloud.png)

ownCloud Documents 是个可以单独并/或协作进行办公室文档编辑 ownCloud 应用。它允许最多5个人同时在网页浏览器上协作进行编辑 .odt 和 .doc 文件。

ownCloud 是个自托管文件同步和分享服务器。他通过网页界面，同步客户端或 WebDAV 提供你数据的使用权，同时提供一个容易在设备间进行浏览、同步和分享的平台。

特性：

- 协作编辑，多个用户同时进行文件编辑
- 在 ownCloud 里创建文档
- 上传文档
- 在浏览器里分享和编辑文件，然后在 ownCloud 内部或通过公共链接进行分享这些文件
- 有类似 ownCloud 的功能，如版本管理、本地同步、加密、恢复被删文件
- 通过透明转换文件格式的方式无缝支持微软 Word 文档

- 网站：[owncloud.org][8]
- 源代码： [github.com/owncloud/documents][9]
- 开发者：OwnCloud Inc.
- 许可：AGPLv3
- 版本号：8.1.1

----------

### Gobby ###

![Gobby in action](http://www.linuxlinks.com/portal/content/reviews/Editors/Screenshot-Gobby.png)

Gobby 是个支持在一个会话内进行多个用户聊天并打开多个文档的协作编辑器。所有的用户都能同时在文件上进行工作，无需锁定。不同用户编写的部分用不同颜色高亮显示，它还支持多个编程和标记语言的语法高亮。

Gobby 允许多个用户在互联网上实时共同编辑同一个文档。它很好的整合了 GNOME 环境。它拥有一个客户端-服务端结构，这让它能支持一个会话开多个文档，文档同步请求，密码保护和 IRC 式的聊天方式可以在多个频道进行交流。用户可以选择一个颜色对他们在文档中编写的文本进行高亮。

还供有一个叫做 infinoted 的专用服务器。

特性：

- 成熟的文本编辑能力包括使用 GtkSourceView 的语法高亮功能
- 实时、无需锁定、通过加密（包括PFS）连接的协作文本编辑
- 整合了群聊
- 本地组撤销：撤销不会影响远程用户的修改
- 显示远程用户的光标和选择区域
- 用不同颜色高亮不同用户编写的文本
- 适用于大多数编程语言的语法高亮，自动缩进，可配置 tab 宽度
- 零冲突
- 加密数据传输包括完美的正向加密（PFS）
- 会话可被密码保护
- 通过 Access Control Lists (ACLs) 进行精密的权限保护
- 高度个性化的专用服务器
- 自动保存文档
- 先进的查找和替换功能
- 国际化
- 完整的 Unicode 支持

- 网站：[gobby.github.io][10]
- 源代码： [github.com/gobby][11]
- 开发者： Armin Burgmeier, Philipp Kern and contributors
- 许可： GNU GPLv2+ and ISC
- 版本号：0.5.0

----------

### OnlyOffice ###

![OnlyOffice in action](http://www.linuxlinks.com/portal/content/reviews/Editors/Screenshot-OnlyOffice.png)

ONLYOFFICE（从前叫 Teamlab Office）是个多功能云端在线办公套件，整合了 CRM（客户关系管理）系统、文档和项目管理工具箱、甘特图以及邮件整合器

它能让你整理商业任务和时间表，保存并分享你的协作或个人文档，使用网络社交工具如博客和论坛，还可以和你的队员通过团队的即时聊天工具进行交流。

能在同一个地方管理文档、项目、团队和顾客关系。OnlyOffice 结合了文本，电子表格和电子幻灯片编辑器，他们的功能跟微软桌面应用（Word、Excel 和 PowerPoint）的功能相同。但是他允许实时进行协作编辑、评论和聊天。

OnlyOffice 是用 ASP.NET 编写的，基于 HTML5 Canvas 元素，并且被翻译成21种语言。

特性：

- 当在大文档里工作、翻页和缩放时，它能与桌面应用一样强大
- 文档可以在浏览/编辑模式下分享
- 文档嵌入
- 电子表格和电子幻灯片编辑器
- 协作编辑
- 评论
- 群聊
- 移动应用
- 甘特图
- 时间管理
- 权限管理
- Invoicing 系统
- 日历
- 整合了文件保存系统：Google Drive、Box、OneDrive、Dropbox、OwnCloud
- 整合了 CRM、电子邮件整合器和工程管理模块
- 邮件服务器
- 邮件整合器
- 可以编辑流行格式的文档、电子表格和电子幻灯片：DOC、DOCX、ODT、RTF、TXT、XLS、XLSX、ODS、CSV、PPTX、PPT、ODP

- 网站：[www.onlyoffice.com][12]
- 源代码：[github.com/ONLYOFFICE/DocumentServer][13]
- 开发者：Ascensio System SIA
- 许可：GNU GPL v3
- 版本号：7.7

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/20150823085112605/CollaborativeEditing.html

作者：Frazer Kline
译者：[H-mudcup](https://github.com/H-mudcup)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://hackpad.com/
[2]:https://github.com/dropbox/hackpad
[3]:https://github.com/dropbox/hackpad/blob/master/CONTRIBUTORS
[4]:http://etherpad.org/
[5]:https://github.com/ether/etherpad-lite
[6]:http://www.firepad.io/
[7]:https://github.com/firebase/firepad
[8]:https://owncloud.org/
[9]:http://github.com/owncloud/documents/
[10]:https://gobby.github.io/
[11]:https://github.com/gobby
[12]:https://www.onlyoffice.com/free-edition.aspx
[13]:https://github.com/ONLYOFFICE/DocumentServer
