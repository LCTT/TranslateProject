共享的未来：Pydio 与 ownCloud 的联合 
=========================================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/BIZ_darwincloud_520x292_0311LL.png?itok=5yWIaEDe)

*图片来源 : opensource.com*

开源共享生态圈内容纳了许多各异的项目，它们每一个都给出了自己的解决方案，且每一个都不按套路来。有很多原因导致你选择开源的解决方案，而非 Dropbox、Google Drive、iCloud 或 OneDrive 这些商业的解决方案。这些商业的解决方案虽然能让你不必为如何管理数据担心，但也理所应当的带着种种限制，其中就包括对于原有基础结构的控制和整合不足。

对于用户而言仍有相当一部分可供选择的文件分享和同步的替代品，其中就包括了 Pydio 和 ownCloud。

### Pydio

Pydio （Put your data in orbit 把你的数据放上轨道） 项目由一位作曲家 Charles du Jeu 发起，起初他只是需要一种与乐队成员分享大型音频文件的方法。[Pydio][1] 是一种文件分享与同步的解决方案，综合了多存储后端，设计时还同时考虑了开发者和系统管理员两方面。在世界各地有逾百万的下载量，已被翻译成 27 种语言。

项目在刚开始的时候便开源了，先是在 [SourceForge][2] 上茁壮的成长，现在已在 [GitHub][3] 上安了家。

用户界面基于 Google 的 [Material 设计风格][4]。用户可以使用现有的传统文件基础结构或是根据预估的需求部署 Pydio，并通过 web、桌面和移动端应用随时随地地管理自己的东西。对于管理员来说，细粒度的访问权限绝对是配置访问时的利器。

在 [Pydio 社区][5]，你可以找到许多让你增速的资源。Pydio 网站 [对于如何为 Pydio GitHub 仓库贡献][6] 给出了明确的指导方案。[论坛][7]中也包含了开发者板块和社区。

### ownCloud

[ownCloud][8] 在世界各地拥有逾 8 百万的用户，它是一个开源、自行管理的文件同步共享技术。同步客户端支持所有主流平台并支持 WebDAV 通过 web 界面实现。ownCloud 拥有简单的使用界面，强大的管理工具，和大规模的共享及协作功能——以满足用户管理数据时的需求。

ownCloud 的开放式架构是通过 API 和为应用提供平台来实现可扩展性的。迄今已有逾 300 款应用，功能包括处理像日历、联系人、邮件、音乐、密码、笔记等诸多数据类型。ownCloud 由一个数百位贡献者的国际化的社区开发，安全，并且能做到为小到一个树莓派大到好几百万用户的 PB 级存储集群量身定制。

### 联合共享 （Federated sharing）

文件共享开始转向团队合作时代，而标准化为合作提供了坚实的土壤。

联合共享（Federated sharing）——一个由 [OpenCloudMesh][9] 项目提供的新的开放标准，就是在这个方向迈出的一步。先不说别的，在支持该标准的服务器之间分享文件和文件夹，比如说 Pydio 和 ownCloud。

ownCloud 7 率先引入该标准，这种服务器到服务器的分享方式可以让你挂载远程服务器上共享的文件，实际上就是创建你自己的云上之云。你可以直接为其它支持联合共享的服务器上的用户创建共享链接。

实现这个新的 API 允许存储解决方案之间更深层次的集成，同时保留了原有平台的安全，控制和特性。

“交换和共享文件是当下和未来不可或缺的东西。”ownCloud 的创始人 Frank Karlitschek 说道：“正因如此，采用联合和分布的方式而非集中的数据孤岛就显得至关重要。联合共享的设计初衷便是在保证安全和用户隐私的同时追求分享的无缝、至简之道。”

### 下一步是什么呢？

正如 OpenCloudMesh 做的那样，将会通过像 Pydio 和 ownCloud 这样的机构和公司，合作推广这一文件共享的新开放标准。ownCloud 9 已经引入联合的服务器之间交换用户列表的功能，让你的用户们在你的服务器上享有和你同样的无缝体验。将来，一个中央地址簿服务（联合的）集合，用以检索其他联合云 ID 的构想可能会把云间合作推向一个新的高度。

这一举措无疑有助于日益开放的技术社区中的那些成员方便地讨论，开发，并推动“OCM 分享 API”作为一个厂商中立协议。所有领导 OCM 项目的合作伙伴都全心致力于开放 API 的设计原则，并欢迎其他开源的文件分享和同步社区参与并加入其中。

--------------------------------------------------------------------------------

via: https://opensource.com/business/16/5/sharing-files-pydio-owncloud

作者：[ben van 't ende][a]
译者：[martin2011qi](https://github.com/martin2011qi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/benvantende
[1]: https://pydio.com/
[2]: https://sourceforge.net/projects/ajaxplorer/
[3]: https://github.com/pydio/
[4]: https://www.google.com/design/spec/material-design/introduction.html
[5]: https://pydio.com/en/community
[6]: https://pydio.com/en/community/contribute
[7]: https://pydio.com/forum/f
[8]: https://owncloud.org/
[9]: https://wiki.geant.org/display/OCM/Open+Cloud+Mesh
