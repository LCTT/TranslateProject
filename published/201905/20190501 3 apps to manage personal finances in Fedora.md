[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10903-1.html)
[#]: subject: (3 apps to manage personal finances in Fedora)
[#]: via: (https://fedoramagazine.org/3-apps-to-manage-personal-finances-in-fedora/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

3 款在 Fedora 中管理个人财务的应用
======

![][1]

网上有很多可以用来管理你个人财务的服务。虽然它们可能很方便，但这通常也意味着将你最宝贵的个人数据放在你无法监控的公司。也有些人对这些不太在意。

无论你是否在意，你可能会对你自己系统上的应用感兴趣。这意味着如果你不想，你的数据永远不会离开自己的计算机。这三款之一可能就是你想找的。

### HomeBank

HomeBank 是一款可以管理多个账户的全功能软件。它很容易设置并保持更新。它有多种方式画出你的分类和负债，以便你可以看到资金流向何处。它可以通过官方 Fedora 仓库下载。

![A simple account set up in HomeBank with a few transactions.][2]

要安装 HomeBank，请打开“软件中心”，搜索 “HomeBank”，然后选择该应用。单击“安装”将其添加到你的系统中。HomeBank 也可以通过 Flatpak 安装。

### KMyMoney

KMyMoney 是一个成熟的应用，它已经存在了很长一段时间。它有一系列稳定的功能，可帮助你管理多个帐户，包括资产、负债、税收等。KMyMoney 包含一整套用于管理投资和进行预测的工具。它还提供大量报告，以了解你的资金运作方式。

![A subset of the many reports available in KMyMoney.][3]

要安装它，请使用软件中心，或使用命令行：

```
$ sudo dnf install kmymoney
```

### GnuCash

用于个人财务的最受欢迎的免费 GUI 应用之一是 GnuCash。GnuCash 不仅可以用于个人财务。它还有管理企业收入、资产和负债的功能。这并不意味着你不能用它来管理自己的账户。从查看[在线教程和指南][4]开始了解。

![Checking account records shown in GnuCash.][5]

打开“软件中心”，搜索 “GnuCash”，然后选择应用。单击“安装”将其添加到你的系统中。或者如上所述使用 `dnf install` 来安装 “gnucash” 包。

它现在可以通过 Flathub 安装，这使得安装变得简单。如果你没有安装 Flathub，请查看 [Fedora Magazine 上的这篇文章][6]了解如何使用它。这样你也可以在终端使用 `flatpak install gnucash` 命令。

* * *

照片由 [Fabian Blank][7] 拍摄，发布在 [Unsplash][8] 上。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/3-apps-to-manage-personal-finances-in-fedora/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/04/personal-finance-3-apps-816x345.jpg
[2]: https://fedoramagazine.org/wp-content/uploads/2019/04/Screenshot-from-2019-04-28-16-16-16-1024x637.png
[3]: https://fedoramagazine.org/wp-content/uploads/2019/04/Screenshot-from-2019-04-28-16-27-10-1-1024x649.png
[4]: https://www.gnucash.org/viewdoc.phtml?rev=3&lang=C&doc=guide
[5]: https://fedoramagazine.org/wp-content/uploads/2019/04/Screenshot-from-2019-04-28-16-41-27-1024x631.png
[6]: https://fedoramagazine.org/install-flathub-apps-fedora/
[7]: https://unsplash.com/photos/pElSkGRA2NU?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[8]: https://unsplash.com/search/photos/money?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
