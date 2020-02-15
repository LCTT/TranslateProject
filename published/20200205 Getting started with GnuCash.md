[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11895-1.html)
[#]: subject: (Getting started with GnuCash)
[#]: via: (https://opensource.com/article/20/2/gnucash)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

开始使用 GnuCash
======

> 使用 GnuCash 管理你的个人或小型企业会计。

![](https://img.linux.net.cn/data/attachment/album/202002/15/124236wz5e0z5vq7571qby.jpg)

在过去的四年里，我一直在用 [GnuCash][2] 来管理我的个人财务，我对此非常满意。这个开源（GPL v3）项目自 1998 年首次发布以来一直成长和改进，2019 年 12 月发布的最新版本 3.8 增加了许多改进和 bug 修复。

GnuCash 可在 Windows、MacOS 和 Linux 中使用。它实现了一个复式记账系统，并可以导入各种流行的开放和专有文件格式，包括 QIF、QFX、OFX、CSV 等。这使得从其他财务应用转换（包括 Quicken）而来很容易，它是为取代这些而出现的。

借助 GnuCash，你可以跟踪个人财务状况以及小型企业会计和开票。它没有集成的工资系统。根据文档，你可以在 GnuCash 中跟踪工资支出，但你必须在该软件外计算税金和扣减。

### 安装

要在 Linux 上安装 GnuCash：

  * 在 Red Hat、CentOS 或 Fedora 中： `$ sudo dnf install gnucash`
  * 在 Debian、Ubuntu 或 Pop_OS 中： `$ sudo apt install gnucash`

你也可以从 [Flathub][3] 安装它，我在运行 Elementary OS 的笔记本上使用它。（本文中的所有截图都来自此次安装）。

### 设置

安装并启动程序后，你将看到一个欢迎屏幕，该页面提供了创建新账户集、导入 QIF 文件或打开新用户教程的选项。

![GnuCash Welcome screen][4]

#### 个人账户

如果你选择第一个选项（正如我所做的那样），GnuCash 会打开一个页面帮你起步。它收集初始数据并设置账户首选项，例如账户类型和名称、商业数据（例如，税号）和首选货币。

![GnuCash new account setup][5]

GnuCash 支持个人银行账户、商业账户、汽车贷款、CD 和货币市场账户、儿童保育账户等。

例如，首先创建一个简单的支票簿。你可以输入账户的初始余额或以多种格式导入现有账户数据。

![GnuCash import data][6]

#### 开票

GnuCash 还支持小型企业功能，包括客户、供应商和开票。要创建发票，请在 “Business -> Invoice” 中输入数据。

![GnuCash create invoice][7]

然后，你可以将发票打印在纸上，也可以将其导出到 PDF 并通过电子邮件发送给你的客户。

![GnuCash invoice][8]

### 获取帮助

如果你有任何疑问，它有一个优秀的帮助，你可在菜单栏的右侧获取指导。

![GnuCash help][9]

该项目的网站包含许多有用的信息的链接，例如 GnuCash [功能][10]的概述。GnuCash 还提供了[详细的文档][11]，可供下载和离线阅读，它还有一个 [wiki][12]，为用户和开发人员提供了有用的信息。

你可以在项目的 [GitHub][13] 仓库中找到其他文件和文档。GnuCash 项目由志愿者驱动。如果你想参与，请查看项目的 wiki 上的 [Getting involved][14] 部分。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/gnucash

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_whitehurst_money.png?itok=ls-SOzM0 (A dollar sign in a network)
[2]: https://www.gnucash.org/
[3]: https://flathub.org/apps/details/org.gnucash.GnuCash
[4]: https://opensource.com/sites/default/files/images/gnucash_welcome.png (GnuCash Welcome screen)
[5]: https://opensource.com/sites/default/files/uploads/gnucash_newaccountsetup.png (GnuCash new account setup)
[6]: https://opensource.com/sites/default/files/uploads/gnucash_importdata.png (GnuCash import data)
[7]: https://opensource.com/sites/default/files/uploads/gnucash_enter-invoice.png (GnuCash create invoice)
[8]: https://opensource.com/sites/default/files/uploads/gnucash_invoice.png (GnuCash invoice)
[9]: https://opensource.com/sites/default/files/uploads/gnucash_help.png (GnuCash help)
[10]: https://www.gnucash.org/features.phtml
[11]: https://www.gnucash.org/docs/v3/C/gnucash-help.pdf
[12]: https://wiki.gnucash.org/wiki/GnuCash
[13]: https://github.com/Gnucash
[14]: https://wiki.gnucash.org/wiki/GnuCash#Getting_involved_in_the_GnuCash_project
