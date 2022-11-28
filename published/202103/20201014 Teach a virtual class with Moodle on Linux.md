[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13190-1.htmlhttps://linux.cn/article-13190-1.html)
[#]: subject: (Teach a virtual class with Moodle on Linux)
[#]: via: (https://opensource.com/article/20/10/moodle)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

基于 Linux 的 Moodle 虚拟课堂教学
======

> 基于 Linux 的 Moodle 学习管理系统进行远程教学。

![](https://img.linux.net.cn/data/attachment/album/202103/10/094113q0ggsbz0a0wb9eg4.jpg)

这次大流行对远程教育的需求比以往任何时候都更大。使得像 [Moodle][2] 这样的<ruby>学习管理系统<rt>learning management system</rt></ruby>（LMS）比以往任何时候都重要，因为越来越多的学校教育是借助虚拟现实技术的提供。

Moodle 是用 PHP 编写的免费 LMS，并以开源 [GNU 公共许可证][3]（GPL）分发。它是由 [Martin Dougiamas][4] 开发的，自 2002 年发布以来一直在不断发展。Moodle 可用于混合学习、远程学习、<ruby>翻转课堂<rt>flipped classroom</rt></ruby>和其他形式的在线学习。目前，全球有超过 [1.9 亿用户][5] 和 145,000 个注册的 Moodle 网站。

我曾作为 Moodle 管理员、教师和学生等角色使用过 Moodle，在本文中，我将向你展示如何设置并开始使用它。

### 在 Linux 系统上安装 Moodle

Moodle 对 [系统要求][6] 适中，并且有大量文档可为你提供帮助。我最喜欢的安装方法是从 [Turnkey Linux][7] 下载并制作 ISO，然后在 VirtualBox 中安装 Moodle 网站。

首先，下载 [Moodle ISO][8] 保存到电脑中。

下一步，安装 VirtualBox 的 Linux 命令行如下：

```
$ sudo apt install virtualbox
```

或，

```
$ sudo dnf install virtualbox
```

当下载完成后，启动 VirtualBox 并在控制台中选择“<ruby>新建<rt>New</rt></ruby>”按钮。

![创建一个新的 VirtualBox 虚拟机][9]

选择使用的虚拟机的名称、操作系统（Linux）和 Linux 类型（例如 Debian 64 位）。

![命名 VirtualBox 虚拟机][11]

下一步，配置虚拟机内存大小，使用默认值 1024 MB。接下来选择 “<ruby>动态分配<rt>dynamically allocated</rt></ruby>”虚拟磁盘并在虚拟机中添加 `Moodle.iso` 镜像。

![添加 Moodle.iso 到虚拟机][12]

将你的网络设置从 NAT 更改为 “<ruby>桥接模式<rt>Bridged adapter</rt></ruby>”。然后启动虚拟机并安装 ISO 以创建 Moodle 虚拟机。在安装过程中，系统将提示为 root 帐户、MySQL 和Moodle 创建密码。Moodle 密码必须至少包含八个字符，至少一个大写字母和至少一个特殊字符。

重启虚拟机。安装完成后，请确保将 Moodle 应用配置内容记录在安全的地方。（安装后，可以根据需要删除 ISO 文件。）

![Moodle 应用配置][13]

重要提示，在互联网上的任何人还看不到你的 Moodle 实例。它仅存在于你的本地网络中：现在只有建筑物中与你连接到相同的路由器或 wifi 接入点的人可以访问你的站点。全世界的互联网无法连接到它，因为你位于防火墙（可能嵌入在路由器中，还可能嵌入在计算机中）的后面。有关网络配置的更多信息，请阅读 Seth Kenlon 关于 [打开端口和通过防火墙进行流量路由][14] 的文章。

### 开始使用 Moodle

现在你可以登录到 Moodle 机器并熟悉该软件了。使用默认的用户名 `admin` 和创建 Moodle VM 时设置的密码登录 Moodle。

![Moodle 登录界面][15]

首次登录后，你将看到初始的 Moodle 网站的主仪表盘。

![Moodle 管理员仪表盘][16]

默认的应用名称是 “Turnkey Moodle”，但是可以很容易地对其进行更改以适合你的学校、课堂或其他需要和选择。要使你的 Moodle 网站个性化，请在用户界面左侧的菜单中，选择“站点首页<rt>Site home</rt></ruby>”。然后，点击屏幕右侧的 “<ruby>设置<rt>Settings</rt></ruby>” 图标，然后选择 “<ruby>编辑设置<rt>Edit settings</rt></ruby>”。

![Moodle 设置][17]

你可以根据需要更改站点名称，并添加简短名称和站点描述。

![Moodle 网站名][18]

确保滚动到底部并保存更改。现在，你的网站已定制好。

![Moodle 保存更改][19]

默认类别为其他，这不会帮助人们识别你网站的目的。要添加类别，请返回主仪表盘，然后从左侧菜单中选择 “<ruby>站点管理<rt>Site administration</rt></ruby>”。 在 “<ruby>课程<rt>Courses</rt></ruby>”下，选择 “<ruby>添加类别<rt>Add a category</rt></ruby>”并输入有关你的网站的详细信息。

![在 Moodle 中添加类别选项][20]

要添加课程，请返回 “<ruby>站点管理<rt>Site administration</rt></ruby>”，然后单击 “<ruby>添加新课程<rt>Add a new course</rt></ruby>”。你将看到一系列选项，例如为课程命名、提供简短名称、设定类别以及设置课程的开始和结束日期。你还可以为课程形式设置选项，例如社交、每周式课程、主题，以及其外观、文件上传大小、完成情况跟踪等等。

![在 Moodle 中添加课程选项][21]

### 添加和管理用户

现在，你已经设置了课程，你可以添加用户。有多种方法可以做到这一点。如果你是家庭教师，则手动输入是一个不错的开始。Moodle 支持基于电子邮件的注册、[LDAP][22]、[Shibboleth（口令或暗语）][23] 和许多其他方式等。校区和其他较大的机构可以用逗号分隔的文件上传用户。也可以批量添加密码，并在首次登录时强制更改密码。有关更多信息，一定要查阅 Moodle [文档][24]。

Moodle 是一个非常细化的、面向许可的环境。使用 Moodle 的菜单将策略和角色分配给用户并执行这些分配很容易。

Moodle 中有许多角色，每个角色都有特定的特权和许可。默认角色有管理员、课程创建者、教师、非编辑教师、学生、来宾和经过身份验证的用户，但你可以添加其他角色。

### 为课程添加内容

一旦搭建了 Moodle 网站并设置了课程，就可以向课程中添加内容。Moodle 拥有创建出色内容所需要的所有工具，并且它建立在强调 [社会建构主义][25] 观点的坚实教学法之上。

我创建了一个名为 “Code with [Mu][26]” 的示例课程。它在 “<ruby>编程<rt>Programming</rt></ruby>” 类别和 “Python” 子类别中。

![Moodle 课程列表][27]

我为课程选择了每周式课程，默认为四个星期。使用编辑工具，我隐藏了除课程第一周以外的所有内容。这样可以确保我的学生始终专注于材料。

作为教师或 Moodle 管理员，我可以通过单击 “<ruby>添加活动或资源<rt>Add an activity or resource</rt></ruby>” 来将活动添加到每周的教学中。

![在 Moodle 中添加活动][28]

我会看到一个弹出窗口，其中包含可以分配给我的学生的各种活动。

![Moodle 活动菜单][29]

Moodle 的工具和活动使我可以轻松地创建学习材料，并以一个简短的测验来结束一周的学习。

![Moodle 活动清单][30]

你可以使用 1600 多个插件来扩展 Moodle，包括新的活动、问题类型，与其他系统的集成等等。例如，[BigBlueButton][31] 插件支持幻灯片共享、白板、音频和视频聊天以及分组讨论。其他值得考虑的包括用于视频会议的 [Jitsi][32] 插件、[抄袭检查器][33] 和用于颁发徽章的 [开放徽章工厂][34]。

### 继续探索 Moodle

Moodle 是一个功能强大的 LMS，我希望此介绍能引起你的兴趣，以了解更多信息。有很多出色的 [指南][35] 可以帮助你提高技能，如果想要查看 Moodle 的内容，可以在其 [演示站点][36] 上查看运行中的 Moodle；如果你想了解 Moodle 的底层结构或为开发做出 [贡献][38]，也可以访问 [Moodle 的源代码][37]。如果你喜欢在旅途中工作，Moodle 也有一款出色的 [移动应用][39]，适用于 iOS 和 Android。在 [Twitter][40]、[Facebook][41] 和 [LinkedIn][42] 上关注 Moodle，以了解最新消息。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/moodle

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://moodle.org/
[3]: https://docs.moodle.org/19/en/GNU_General_Public_License
[4]: https://dougiamas.com/about/
[5]: https://docs.moodle.org/39/en/History
[6]: https://docs.moodle.org/39/en/Installation_quick_guide#Basic_Requirements
[7]: https://www.turnkeylinux.org/
[8]: https://www.turnkeylinux.org/download?file=turnkey-moodle-16.0-buster-amd64.iso
[9]: https://opensource.com/sites/default/files/uploads/virtualbox_new.png (Create a new VirtualBox)
[10]: https://creativecommons.org/licenses/by-sa/4.0/
[11]: https://opensource.com/sites/default/files/uploads/virtualbox_namevm.png (Naming the VirtualBox VM)
[12]: https://opensource.com/sites/default/files/uploads/virtualbox_attach-iso.png (Attaching Moodle.iso to VM)
[13]: https://opensource.com/sites/default/files/uploads/moodle_appliance.png (Moodle appliance settings)
[14]: https://opensource.com/article/20/9/firewall
[15]: https://opensource.com/sites/default/files/uploads/moodle_login.png (Moodle login screen)
[16]: https://opensource.com/sites/default/files/uploads/moodle_dashboard.png (Moodle admin dashboard)
[17]: https://opensource.com/sites/default/files/uploads/moodle_settings.png (Moodle settings)
[18]: https://opensource.com/sites/default/files/uploads/moodle_name-site.png (Name Moodle site)
[19]: https://opensource.com/sites/default/files/uploads/moodle_saved.png (Moodle changes saved)
[20]: https://opensource.com/sites/default/files/uploads/moodle_addcategory.png (Add category option in Moodle)
[21]: https://opensource.com/sites/default/files/uploads/moodle_addcourse.png (Add course option in Moodle)
[22]: https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol
[23]: https://www.shibboleth.net/
[24]: https://docs.moodle.org/39/en/Main_page
[25]: https://docs.moodle.org/39/en/Pedagogy#How_Moodle_tries_to_support_a_Social_Constructionist_view
[26]: https://opensource.com/article/20/9/teach-python-mu
[27]: https://opensource.com/sites/default/files/uploads/moodle_choosecourse.png (Moodle course list)
[28]: https://opensource.com/sites/default/files/uploads/moodle_addactivity_0.png (Add activity in Moodle)
[29]: https://opensource.com/sites/default/files/uploads/moodle_activitiesmenu.png (Moodle activities menu)
[30]: https://opensource.com/sites/default/files/uploads/moodle_activitieschecklist.png (Moodle activities checklist)
[31]: https://moodle.org/plugins/mod_bigbluebuttonbn
[32]: https://moodle.org/plugins/mod_jitsi
[33]: https://moodle.org/plugins/plagiarism_unicheck
[34]: https://moodle.org/plugins/local_obf
[35]: https://learn.moodle.org/
[36]: https://school.moodledemo.net/
[37]: https://git.in.moodle.com/moodle/moodle
[38]: https://git.in.moodle.com/moodle/moodle/-/blob/master/CONTRIBUTING.txt
[39]: https://download.moodle.org/mobile/
[40]: https://twitter.com/moodle
[41]: https://www.facebook.com/moodle
[42]: https://www.linkedin.com/company/moodle/
