Translating by ivo-wang
What is good stock portfolio management software on Linux
linux上那些不错的管理股票组合投资软件
================================================================================
如果你在股票市场做投资，那么你可能非常清楚管理组合投资的计划有多重要。管理组合投资的目标是依据你能承受的风险，时间层面的长短和资金盈利的目标去为你量身打造的一种投资计划。鉴于这类软件的重要性，难怪从不缺乏商业性质的app和股票行情检测软件，每一个都可以兜售复杂的组合投资以及跟踪报告功能。

对于这些linux爱好者们，我们找到了一些 **好用的开源组合投资管理工具** 用来在linux上管理和跟踪股票的组合投资，这里高度推荐一个基于java编写的管理软件[JStock][1]。如果你不是一个java粉，你不得不面对这样一个事实JStock需要运行在重型的JVM环境上。同时我相信许多人非常欣赏JStock，安装JRE以后它可以非常迅速的安装在各个linux平台上。没有障碍能阻止你将它安装在你的linux环境中。

开源就意味着免费或标准低下的时代已经过去了。鉴于JStock只是一个个人完成的产物，作为一个组合投资管理软件它最令人印象深刻的是包含了非常多实用的功能，以上所有的荣誉属于它的作者Yan Cheng Cheok!例如，JStock 支持通过监视列表去监控价格，多种组合投资，按习惯/按固定 做股票指示与相关扫描，支持27个不同的股票市场和交易平台云端备份/还原。JStock支持多平台部署(Linux, OS X, Android 和 Windows)，你可以通过云端保存你的JStock记录，它可以无缝的备份还原到其他的不同平台上面。

现在我将向你展示如何安装以及使用过程的一些具体细节。

### 在Linux上安装JStock ###

因为JStock使用Java编写，所以必须[安装 JRE][2]才能让它运行起来.小提示JStock 需要JRE1.7或更高版本。如你的JRE版本不能满足这个需求，JStock将会安装失败然后出现下面的报错。

    Exception in thread "main" java.lang.UnsupportedClassVersionError: org/yccheok/jstock/gui/JStock : Unsupported major.minor version 51.0


一旦你安装了JRE在你的linux上，从官网下载最新的发布的JStock，然后加载启动它。

    $ wget https://github.com/yccheok/jstock/releases/download/release_1-0-7-13/jstock-1.0.7.13-bin.zip
    $ unzip jstock-1.0.7.13-bin.zip
    $ cd jstock
    $ chmod +x jstock.sh
    $ ./jstock.sh

教程的其他部分，让我来给大家展示一些JStock的实用功能

### 监视监控列表股票价格的波动 ###

使用JStock你可以创建一个或多个监视列表，它可以自动的监视股票价格的波动并给你提供相应的通知。在每一个监视列表里面你可以添加多个感兴趣的股票进去。之后添加你的警戒值在"Fall Below"和"Rise Above"的表格里，分别是在设定最低价格和最高价格。

![](https://c2.staticflickr.com/2/1588/23795349969_37f4b0f23c_c.jpg)

例如你设置了AAPL股票的最低/最高价格分别是$102 和 $115.50，你将在价格低于$102或高于$115.50的任意时间在桌面得到通知。

你也可以设置邮件通知，之后你将收到一些价格信息的邮件通知。设置邮件通知在栏的"Options"选项。在"Alert"标签，打开"Send message to email(s)"，填入你的Gmail账户。一旦完成Gmail认证步骤，JStock将开始发送邮件通知到你的Gmail账户（也可以设置其他的第三方邮件地址）
![](https://c2.staticflickr.com/2/1644/24080560491_3aef056e8d_b.jpg)

### 管理多个组合投资 ###

JStock能够允许你管理多个组合投资。这个功能对于股票经纪人是非常实用的。你可以为经纪人创建一个投资项去管理你的 买入/卖出/红利 用来了解每一个经纪人的业务情况。你也可以切换不同的组合项目通过选择一个特殊项目在"Portfolio"菜单里面。下面是一张截图用来展示一个意向投资
![](https://c2.staticflickr.com/2/1646/23536385433_df6c036c9a_c.jpg)

因为能够设置付给经纪人小费的选项，所以你能付给经纪人任意的小费，印花税以及清空每一比交易的小费。如果你非常懒，你也可以在菜单里面设置自动计算小费和给每一个经纪人固定的小费。在完成交易之后JStock将自动的计算并发送小费。

![](https://c2.staticflickr.com/2/1653/24055085262_0e315c3691_b.jpg)

### 显示固定/自选股票提示 ###

如果你要做一些股票的技术分析，你可能需要不同股票的指数（这里叫做“平均股指”），对于股票的跟踪，JStock提供多个[预设技术指示器][3] 去获得股票上涨/下跌/逆转指数的趋势。下面的列表里面是一些可用的指示。
- 异同平均线（MACD）
- 相对强弱指数 (RSI)
- 货币流通指数 (MFI)
- 顺势指标 (CCI)
- 十字线
- 黄金交叉线, 死亡交叉线
- 涨幅/跌幅 

开启预设指示器能需要在JStock中点击"Stock Indicator Editor"标签。之后点击右侧面板中的安装按钮。选择"Install from JStock server"选项，之后安装你想要的指示器。

![](https://c2.staticflickr.com/2/1476/23867534660_b6a9c95a06_c.jpg)

一旦安装了一个或多个指示器，你可以用他们来扫描股票。选择"Stock Indicator Scanner"标签，点击底部的"Scan"按钮，选择需要的指示器。

![](https://c2.staticflickr.com/2/1653/24137054996_e8fcd10393_c.jpg)

当你选择完需要扫描的股票(例如e.g., NYSE, NASDAQ)以后，JStock将执行扫描，并将捕获的结果通过列表的形式展现在指示器上面。

![](https://c2.staticflickr.com/2/1446/23795349889_0f1aeef608_c.jpg)

除了预设指示器以外，你也可以使用一个图形化的工具来定义自己的指示器。下面这张图例中展示的是当前价格小于或等于60天平均价格

![](https://c2.staticflickr.com/2/1605/24080560431_3d26eac6b5_c.jpg)

### 云备份还原Linux 和 Android JStock ###

另一个非常棒的功能是JStock可以支持云备份还原。Jstock也可以把你的组合投资/监视列表备份还原在 Google Drive，这个功能可以实现在不同平台（例如Linux和Android）上无缝穿梭。举个例子，如果你把Android Jstock组合投资的信息保存在Google Drive上，你可以在Linux班级本上还原他们。

![](https://c2.staticflickr.com/2/1537/24163165565_bb47e04d6c_c.jpg)

![](https://c2.staticflickr.com/2/1556/23536385333_9ed1a75d72_c.jpg)

如果你在从Google Drive还原之后不能看到你的投资信息以及监视列表，请确认你的国家信息与“Country”菜单里面设置的保持一致。

JStock的安卓免费版可以从[Google Play Store][4]获取到。如果你需要完整的功能（比如云备份，通知，图表等），你需要一次性支付费用升级到高级版。我想高级版肯定有它的价值所在。

![](https://c2.staticflickr.com/2/1687/23867534720_18b917028c_c.jpg)

写在最后，我应该说一下它的作者，Yan Cheng Cheok，他是一个十分活跃的开发者，有bug及时反馈给他。最后多有的荣耀都属于他一个人！！！

关于JStock这个组合投资跟踪软件你有什么想法呢？

--------------------------------------------------------------------------------

via: http://xmodulo.com/stock-portfolio-management-software-linux.html

作者：[Dan Nanni][a]
译者：[ivo-wang](https://github.com/ivo-wang)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://jstock.org/
[2]:http://ask.xmodulo.com/install-java-runtime-linux.html
[3]:http://jstock.org/ma_indicator.html
[4]:https://play.google.com/store/apps/details?id=org.yccheok.jstock.gui
