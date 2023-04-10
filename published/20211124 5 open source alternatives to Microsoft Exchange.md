[#]: subject: "5 open source alternatives to 微软 Exchange"
[#]: via: "https://opensource.com/article/21/11/open-source-alternatives-微软-exchange"
[#]: author: "Heike Jurzik https://opensource.com/users/hej"
[#]: collector: "lujun9972"
[#]: translator: "XiaotingHuang22"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15705-1.html"

可以替代微软 Exchange 的 5 个开源软件
======

> 不再将就于微软 Exchange 这一专有软件，试一试这些基于 Linux 系统的电子邮件和群件服务吧。

![][0]

几十年来，微软 Exchange 一直统治着电子邮件和群件服务市场。作为领头羊，它主宰着企业界，无处不在的 Outlook 邮件客户端已成为群件的事实标准。由于 Exchange 与微软的 Office 产品紧密联系，无论是桌面客户端还是移动客户端，微软用户都可以轻松使用各种生产力软件和功能。

然而，许多公司对于将数据存储在微软的云中也心存疑虑。在本文中，我将介绍一些开源替代产品及其优势。这不仅与如何不再受供应商控制和降低成本有关，更关乎使用具有开放标准和不同安全级别的软件 —— 用于组件服务器本身及其背后的操作系统。

本文中介绍的这五个替代产品都是基于 Linux 的。 虽然 grommunio、Kopano、Nextcloud、ownCloud 和 OX App Suite 在功能上差异很大，吸引到的企业类型各不相同，但它们都提供免费版本，并可选择购买付费支持服务和附加组件。所有产品都可以在本地或云端运行。最重要的是，所有供应商都为其软件提供 SaaS（<ruby>软件即服务<rt>Software as a Service</rt></ruby>）解决方案。

### grommunio

[grommunio][2]，以前被称为 grammm，在 AGPLv3 许可下发布的。它由奥地利同名公司开发和支持。与 Exchange 不同，grommunio 提供符合标准的邮件服务器，以及功能齐全的群件解决方案，具有电子邮件、联系人、日历、任务、文件共享等功能。grommunio 适用于各种开源和专有邮件客户端，如 Windows Mail、Outlook、Android、Apple Mail/iOS、Thunderbird 等，并支持旧的 RPC over HTTP 协议和 Outlook 标准协议 MAPI over HTTP。除此之外还包含：用于移动设备的 Exchange ActiveSync 和各种标准协议，如 CalDAV（日历）、CardDAV（地址簿）、IMAP、POP3、SMTP 和 LDAP，以及活动目录（用于同步用户帐户）。

外部对接的开源应用程序还提供了一些微软的 API 或协议不支持的功能。例如，开发人员合并了 [Jitsi][3]（视频和音频电话软件）、[Mattermost][4]（聊天软件）以及文件共享和同步（[ownCloud][5]）。除此之外，grommunio 还配备了基本的移动设备管理软件（MDM）。

grommunio 的设计面向各种不同的用户，并且与 Exchange 一样，它支持数据库分片（数据库在多个主机之间的水平分布）。灵活的存储后端允许管理员通过添加其他服务器或云帐户来扩展他们的设置。grommunio 仅将 MySQL 数据库用于元数据，而所有“内容”（例如邮件和群件对象）都存储在每个用户的 SQLite 数据库中。有关底层架构的更多信息，请查看 [该制造商的网站][6]。

其社区版是免费的，其中包括所有的 grommunio 功能并支持多达五个用户帐户。

### Kopano

来自德国和荷兰的软件制造商 Kopano 出品的 [Kopano][7]，也采用 AGPLv3 许可，基于 Zarafa 软件堆栈。与其前身不同，Kopano 的目标不只是成为 Exchange 的替代品。相反，它提供一个完整的群件解决方案，除了电子邮件、联系人、日历、任务、笔记和文档编辑这些标准功能外，它还包括实时通信。Kopano 可以与 [许多其他平台][8]、应用程序和服务交互，其中一些通过插件就能轻松实现。对于视频会议，Kopano 团队基于 WebRTC 开发了自己的开源解决方案：Kopano Meet 提供端到端加密，在 Windows、macOS、Linux、Android 和 iOS 客户端都适用。

Outlook 客户端通过 ActiveSync（Z-Push 库）或 [Kopano OL Extension][9]（KOE）来同步移动数据，KOE 是已经包含了 ActiveSync 的加强版。Kopano 提供本机 Web 客户端（WebApp）、移动设备客户端（Mobility）以及支持 Windows、Linux 和 macOS 的桌面版本（DeskApp）。它可以通过 IMAP、CalDAV 和 CardDAV 连接其他客户端。所有直接连接到 Kopano 服务器的应用程序都使用 SOAP（<ruby>简单对象访问协议<rt>Simple Object Access Protocol</rt></ruby>）中的 MAPI。

Kopano Groupware 和 Kopano ONE（Kopano Groupware 的特别版）都提供免费的社区版本。 Kopano Meet 还可以作为应用程序或容器下载。

### Nextcloud

[Nextcloud][10] 在斯图加特和柏林（德国）都有办事处，采用 AGPLv3 许可。与 ownCloud 或 Dropbox 一样，用户可以通过桌面（Windows、Linux 和 macOS）、网络浏览器或本地应用程序（Android 和 iOS）访问该软件套件。从 18 版本开始，Nextcloud 除了拥有 Nextcloud Files（文件同步和共享）还包括了 Nextcloud Talk（通话、聊天和网络会议）和 Nextcloud Groupware（日历、联系人和邮件），并更名为 Nextcloud Hub。

用户和群组管理通过 OpenID 或 LDAP 进行。Nextcloud 支持各种存储后端，例如 FTP、S3 和 Dropbox。Nextcloud 可与多种数据库管理系统配合使用，包括 PostgreSQL、MariaDB、SQLite 和 Oracle 数据库。管理员可以通过 [Nextcloud 应用程序商店][11] 中的 200 多个应用程序扩展功能，其中包括实时通信、音频和视频聊天、任务管理、邮件等等。

Nextcloud 是完全免费的。最重要的是，该公司提供了 Nextcloud Enterprise 版本（针对企业部署进行了预配置、优化和强化）

### ownCloud

[ownCloud][12] 是由位于德国纽伦堡的 ownCloud GmbH 公司开发和维护的具有文件同步、共享和内容协作功能的软件。它的客户端-服务器软件的核心和许多社区应用程序都是在 AGPLv3 下发布的。一些扩展功能的企业应用程序以 ownCloud 商业许可证（OCL）的形式授权。

ownCloud 主要是一款内容协作软件，包括在线办公文档编辑、日历、联系人同步等功能。移动客户端支持 Android 和 iOS，桌面应用可以和 Windows、macOS 和 Linux 的原生文件管理器结合使用。它允许访问 Web 界面，无需安装专用客户端软件。ownCloud 支持 WebDAV、CalDAV 和 CardDAV 协议。LDAP 协议也包含其中，但 ownCloud 也可以连接到支持 OpenID Connect 身份验证标准的其他身份提供者。

ownCloud 可以整合微软 Office Online Server、Office 365 和微软 Teams，同时为微软 Outlook 和 eM 客户端提供可用插件。如有必要，外部存储功能可连接到不同的存储提供商，例如 Amazon S3、Dropbox、微软 SharePoint、Google Drive、Windows 网络驱动器（SMB）和 FTP。该供应商还为企业客户提供额外的功能，如端到端加密、勒索软件和防病毒保护等（请参阅 [完整功能列表][13]）。

社区版免费且 100% 开源。

### OX App Suite

[Open-Xchange][14] 成立于 2005 年，总部位于德国奥尔佩和纽伦堡。今天，OX 在多个欧洲国家、美国和日本设有办事处。[OX App Suite][15] 是一个模块化的电子邮件、通信和协作平台，主要为电信公司、托管公司和其他提供基于云的服务的提供商而设计。

OX 后端在 GPLv2 协议下发布，前端（UI）在 AGPLv3 下发布。用户可以通过他们喜欢的浏览器（完全个性化的门户）或移动应用程序（Android 和 iOS）访问应用程序套件。或者，原生客户端（移动设备和台式机）也可用于 OX Mail 和 OX Drive。得益于 CardDAV 和 CalDAV 扩展、Exchange Active Sync 和适用于 Android 的 OX Sync App，联系人、日历和任务得以同步。

OX App Suite 包含用于电子邮件、联系人、日历和任务的应用程序。 还有其他工具和扩展可用，其中一些是开源的，一些功能则要付费，包括 OX Documents（文本文档、电子表格、演示文稿）、OX Drive（管理、共享和同步文件）、OX Guard（电子邮件和文件加密）等等。如需完整列表，请访问 OX 网站的 [一般条款和条件][16]。

该应用免费提供有限功能的社区版。 

### 开源电子邮件和群件

电子邮件和群件服务并不是必须花（很多）钱才可获得，当然也没有必要满足于在别人的服务器上托管的专有解决方案。如果你不太热衷于管理职责，那么上述的这五个 Exchange 开源替代品都可以作为 SaaS 解决方案使用。另外，所有供应商都提供专业技术支持，你可以在本地运行软件，一切尽在你的掌握中，但你却不会感觉自己孤军无援。

（题图由 MJ 生成：Mail Cooperation Groupware Office Open Source hyper realistic, hyper detailed, intricate detail, beautiful lighting, very detailed,Illustration）

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/open-source-alternatives-微软-exchange

作者：[Heike Jurzik][a]
选题：[lujun9972][b]
译者：[XiaotingHuang22](https://github.com/XiaotingHuang22)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hej
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/team_dev_email_chat_video_work_wfm_desk_520.png?itok=6YtME4Hj (Working on a team, busy worklife)
[2]: https://grommunio.com/
[3]: https://opensource.com/article/20/5/open-source-video-conferencing
[4]: https://opensource.com/article/20/7/mattermost
[5]: https://opensource.com/article/21/7/owncloud-windows-files
[6]: https://grommunio.com/features/architecture/
[7]: https://kopano.com/
[8]: https://kopano.com/products/interoperability/
[9]: https://kb.kopano.io/display/WIKI/Setting+up+the+Kopano+OL+Extension
[10]: https://nextcloud.com/
[11]: https://apps.nextcloud.com/
[12]: https://owncloud.com/
[13]: https://owncloud.com/features/
[14]: https://www.open-xchange.com/
[15]: https://www.open-xchange.com/products/ox-app-suite/
[16]: https://www.open-xchange.com/terms-and-conditions/
[0]: https://img.linux.net.cn/data/attachment/album/202304/09/114919i7cu0zwk4e663x0c.jpg