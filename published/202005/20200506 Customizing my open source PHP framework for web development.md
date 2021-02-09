[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12235-1.html)
[#]: subject: (Customizing my open source PHP framework for web development)
[#]: via: (https://opensource.com/article/20/5/codeigniter)
[#]: author: (Wee Ben Sen https://opensource.com/users/bswee14)

自定义用于 Web 开发的开源 PHP 框架 Codeigniter
======

> Codeigniter 是一个 PHP 框架，可以使公司进行开发具有灵活性和便捷性的高性能网站。

![](https://img.linux.net.cn/data/attachment/album/202005/21/102637vslj5zqk52x98a52.jpg)

PHP Codeigniter 是一个开源框架，为商业应用提供易于使用的 PHP 编程语言和强大的编码工具。它还提供商务智能、服务器监视、开发和应用集成功能。这是一个相对冷清的项目，你很少听到它，但它功能强大，许多刚接触的开发人员都对此感到惊讶和耳目一新。

我在新加坡的一家在线学习服务提供商处使用 [Codeigniter][2]。我们提供的服务并不算常见，没有可以作为模板的默认功能集或现有后台管理系统，所以我需要一个能提供良好的、可靠的、可以建立在此基础上的原始材料。最初，我考虑用其他平台（如 Wordpress）用于我们的网站。但是，我决定使用 Codeigniter，因为它的灵活性，以及集成了在我们的补课匹配过程中需要的功能。

以下是打动我使用 Codeigniter 的原因：

* 与 MySQL 数据库的集成 —— 主要功能是允许客户端浏览导师的数据库并添加导师，例如类似于电子商务平台的“购物车”。
* 客户端界面系统 —— 用户可以登录来管理偏好并编辑详细信息，修改所教的科目、旅游的地区、手机号码、地址等。
* 定制的管理员面板 —— 管理员可以使用定制的管理面板访问客户提交的资料，它与客户服务功能集成在一起，因此管理员可以单独跟进。
* 付款系统 —— 管理面板带有与 Paypal 集成的发票和付款网关。
* CMS 编辑器界面 —— 管理员能够编辑博客和文章中的文本和图像，以及添加新页面。

该项目花费了大约六个月的时间来完成，另外花了两个月的调试时间。如果我需要从头开始构建所有，或者尝试重新设计现有的框架以满足我们的需求，那将花费更长的时间，而且可能最终无法满足客户需求。

### 功能和优点

PHP Codeigniter还有很多吸引开发者的功能，包括错误处理和代码格式化，这些功能在各种编码情景下都非常有用。它支持模板，可用于向现有网站添加功能或生成新网站。有许多基于 web 系统商业需要的功能，包括使用自定义标签。即使没有编程经验的普通开发人员也可以使用大多数工具。

Codeigniter 的主要功能是：

* XML 核心服务，
* HTTP/FTP 核心服务
* AppData 和 PHP 沙箱功能
* XSLT 和 HTML 模板
* 加密的信息传输
* PCM Codeigniter 服务器监控
* 应用集成
* 文件传输协议（FTP）
* 服务台支持
* Apache POI（用于托管网站的内容管理基础架构）

#### 兼容性

Codeigniter 与许多领先的软件程序兼容，例如 PHP、MySQL、[MariaDB][3]、[phpMyAdmin][4]、[Apache][5]、OpenBSD、XSLT、[SQLite][6] 等。许多公司更喜欢使用 Codeigniter 产品来满足网站要求，因为它们易于使用和集成。如果你不想创建自己的网站，你可以找到许多提供自定义 Web 开发服务的开发人员和设计机构。

#### 安全

Codeigniter 还通过 SSL 加密提供数据安全性。加密可以保护数据免受入侵者和防火墙外部威胁的侵害。数据存储功能还允许对公司网站进行安全审核。

#### 其它功能

一家优秀的 PHP Web 开发公司会使用几种高级技术和第三方技术，例如 XML 和 PHP。它为企业提供了一个完整的平台，可以开发出具有看起来专业的、好用的商业网站。Codeigniter 使得第三方技术的使用变得容易，并可以与常见的 Web 开发软件一起使用。这使得 Web 公司可以轻松地使用所选模块创建网站。大多数 PHP 开发者也为个人提供支持和培训服务。

### 使用 PHP 框架 Codeigniter

Codeigniter 给企业提供了完整的 PHP 开发包，它将提供强大的功能、灵活性和性能完美结合在一起。到目前为止，我很满意我们的网站，并不断地升级和添加新的功能。并不断升级和增加新的功能。我期待着发现我们的网站还能用 Codeigniter 做些什么。你也是这样么？

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/codeigniter

作者：[Wee Ben Sen][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bswee14
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://codeigniter.com/
[3]: http://mariadb.org/
[4]: https://www.phpmyadmin.net/
[5]: http://apache.org/
[6]: http://sqlite.org/
