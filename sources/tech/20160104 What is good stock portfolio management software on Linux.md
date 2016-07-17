Translating by ivo-wang
What is good stock portfolio management software on Linux
linux上那些不错的管理股票组合投资软件
================================================================================
如果你在股票市场做投资，那么你可能非常清楚管理组合投资的计划有多重要。管理组合投资的目标是依据你能承受的风险，时间层面的长短和资金盈利的目标去为你量身打造的一种投资计划。鉴于这类软件的重要性，难怪从不缺乏商业性质的app和股票行情检测软件，每一个都可以兜售复杂的组合投资以及跟踪报告功能。

For those of you Linux aficionados who are looking for a **good open-source portfolio management tool** to manage and track your stock portfolio on Linux, I would highly recommend a Java-based portfolio manager called [JStock][1]. If you are not a big Java fan, you might be turned off by the fact that JStock runs on a heavyweight JVM. At the same time I am sure many people will appreciate the fact that JStock is instantly accessible on every Linux platform with JRE installed. No hoops to jump through to make it work on your Linux environment.
对于这些linux爱好者们，我们找一个 **好用的开源组合投资管理工具** 用来在linux上管理和跟踪股票的组合投资，这里高度推荐一个基于java编写的管理软件[JStock][1]。如果你不是一个java粉，你不得不面对这样一个事实JStock需要运行在重型的JVM上。同时我相信许多人非常欣赏JStock安装JRE以后它可以非常迅速的安装在各个linux平台上。没有障碍能阻止你将它安装在你的linux环境中。

The day is gone when "open-source" means "cheap" or "subpar". Considering that JStock is just a one-man job, JStock is impressively packed with many useful features as a portfolio management tool, and all that credit goes to Yan Cheng Cheok! For example, JStock supports price monitoring via watchlists, multiple portfolios, custom/built-in stock indicators and scanners, support for 27 different stock markets and cross-platform cloud backup/restore. JStock is available on multiple platforms (Linux, OS X, Android and Windows), and you can save and restore your JStock portfolios seamlessly across different platforms via cloud backup/restore.
开源就意味着免费或标准低下的时代已经过去录。鉴于JStock只是一个个人完成的产物，作为一个组合投资管理软件它最令人印象深刻的是包含了非常多实用的功能，以上所有的荣誉属于它的作者Yan Cheng Cheok!例如，JStock 支持通过监视列表去监控价格，多种组合投资，按习惯/按固定 做股票指示与相关扫描，支持27个不同的股票市场和交易平台云端备份/还原。JStock支持多平台部署(Linux, OS X, Android 和 Windows)，你可以通过云端保存你的JStock记录，它可以无缝的还原到其他的不同平台上面。

Sounds pretty neat, huh? Now I am going to show you how to install and use JStock in more detail.

哈，现在我将向你展示如何安装以及使用过程的一些具体细节。

### 在Linux上安装JStock ###

因为JStock使用Java编写，所以必须[安装 JRE][2]才能让它运行起来.小提示JStock 需要JRE1.7或更高版本。如你的JRE版本不能满足这个需求，JStock将会安装失败然后出现下面的报错。

    Exception in thread "main" java.lang.UnsupportedClassVersionError: org/yccheok/jstock/gui/JStock : Unsupported major.minor version 51.0

Once you install JRE on your Linux, download the latest JStock release from the official website, and launch it as follows.
一旦你安装了JRE在你的linux上，从官网下载最新的发布的JStock，然后启动它。

    $ wget https://github.com/yccheok/jstock/releases/download/release_1-0-7-13/jstock-1.0.7.13-bin.zip
    $ unzip jstock-1.0.7.13-bin.zip
    $ cd jstock
    $ chmod +x jstock.sh
    $ ./jstock.sh


教程的其他部分，让我来给大家展示一些JStock的实用功能

### 监视监控列表股票价格的波动 ###

On JStock you can monitor stock price movement and automatically get notified by creating one or more watchlists. In each watchlist, you can add multiple stocks you are interested in. Then add your alert thresholds under "Fall Below" and "Rise Above" columns, which correspond to minimum and maximum stock prices you want to set, respectively.

使用JStock你可以创建一个或多个监视列表，它可以自动的监视股票价格的波动并给你提供相应的通知。在每一个监视列表里面你可以添加多个感兴趣的股票进去。之后添加你的警戒值在"Fall Below"和"Rise Above"的表格里，分别是在相同股票设定最低价格和最高价格。

![](https://c2.staticflickr.com/2/1588/23795349969_37f4b0f23c_c.jpg)

例如你设置了AAPL股票的最低/最高价格分别是$102 和 $115.50，你将在价格低于$102或高于$115.50的任意时间在桌面得到通知。

You can also enable email alert option, so that you will instead receive email notifications for such price events. To enable email alerts, go to "Options" menu. Under "Alert" tab, turn on "Send message to email(s)" box, and enter your Gmail account. Once you go through Gmail authorization steps, JStock will start sending email alerts to that Gmail account (and optionally CC to any third-party email address).
你也可以设置邮件通知，因此你将收到一些价格信息的邮件通知。设置邮件通知在栏的"Options"选项。在"Alert"标签，打开"Send message to email(s)"，填入你的Gmail账户。一旦完成Gmail认证步骤，JStock将开始发送邮件通知到你的Gmail账户（也可以设置其他的第三方邮件地址）
![](https://c2.staticflickr.com/2/1644/24080560491_3aef056e8d_b.jpg)

### 管理多个组合投资 ###

JStock allows you to manage multiple portfolios. This feature is useful if you are using multiple stock brokers. You can create a separate portfolio for each broker and manage your buy/sell/dividend transactions on a per-broker basis. You can switch different portfolios by choosing a particular portfolio under "Portfolio" menu. The following screenshot shows a hypothetical portfolio.
JStock能够允许你管理多个组合投资。这个功能对于股票经纪人是非常实用的。你可以为经纪人创建一个投资项去管理你的 买入/卖出/红利 用来处理每一个经纪人的基本业务。你也可以切换不同的组合项目通过选择一个特别项目在"Portfolio"菜单里面。下面是一张截图用来展示一个意向投资
![](https://c2.staticflickr.com/2/1646/23536385433_df6c036c9a_c.jpg)

Optionally you can enable broker fee option, so that you can enter any broker fees, stamp duty and clearing fees for each buy/sell transaction. If you are lazy, you can enable fee auto-calculation and enter fee schedules for each brokering firm from the option menu beforehand. Then JStock will automatically calculate and enter fees when you add transactions toyour portfolio.
你可以随意的设置付给经纪人的消费，因此你能付给经纪人任意的小费，印花税以及清空每一比交易买卖的小费。如果你非常懒，你也能够在菜单里面设置自动计算小费和给每一个经纪人固定的小费。在完成交易之后JStock将自动的计算并发送小费。

![](https://c2.staticflickr.com/2/1653/24055085262_0e315c3691_b.jpg)

### 显示固定/自选股票提示 ###

If you are doing any technical analysis on stocks, you may want to screen stocks based on various criteria (so-called "stock indicators"). For stock screening, JStock offers several [pre-built technical indicators][3] that capture upward/downward/reversal trends of individual stocks. The following is a list of available indicators.

- Moving Average Convergence Divergence (MACD)
- Relative Strength Index (RSI)
- Money Flow Index (MFI)
- Commodity Channel Index (CCI)
- Doji
- Golden Cross, Death Cross
- Top Gainers/Losers 

To install any pre-built indicator, go to "Stock Indicator Editor" tab on JStock. Then click on "Install" button in the right-side panel. Choose "Install from JStock server" option, and then install any indicator(s) you want.

![](https://c2.staticflickr.com/2/1476/23867534660_b6a9c95a06_c.jpg)

Once one or more indicators are installed, you can scan stocks using them. Go to "Stock Indicator Scanner" tab, click on "Scan" button at the bottom, and choose any indicator.

![](https://c2.staticflickr.com/2/1653/24137054996_e8fcd10393_c.jpg)

Once you select the stocks to scan (e.g., NYSE, NASDAQ), JStock will perform scan, and show a list of stocks captured by the indicator.

![](https://c2.staticflickr.com/2/1446/23795349889_0f1aeef608_c.jpg)

Besides pre-built indicators, you can also define custom indicator(s) on your own with a GUI-based indicator editor. The following example screens for stocks whose current price is less than or equal to its 60-day average price.

![](https://c2.staticflickr.com/2/1605/24080560431_3d26eac6b5_c.jpg)

### Cloud Backup and Restore between Linux and Android JStock ###

Another nice feature of JStock is cloud backup and restore. JStock allows you to save and restore your portfolios/watchlists via Google Drive, and this features works seamlessly across different platforms (e.g., Linux and Android). For example, if you saved your JStock portfolios to Google Drive on Android, you can restore them on Linux version of JStock.

![](https://c2.staticflickr.com/2/1537/24163165565_bb47e04d6c_c.jpg)

![](https://c2.staticflickr.com/2/1556/23536385333_9ed1a75d72_c.jpg)

If you don't see your portfolios/watchlists after restoring from Google Drive, make sure that your country is correctly set under "Country" menu.

JStock Android free version is available from [Google Play store][4]. You will need to upgrade to premium version for one-time payment if you want to use its full features (e.g., cloud backup, alerts, charts). I think the premium version is definitely worth it.

![](https://c2.staticflickr.com/2/1687/23867534720_18b917028c_c.jpg)

As a final note, I should mention that its creator, Yan Cheng Cheok, is pretty active in JStock development, and quite responsive in addressing any bugs. Kudos to him!

What do you think of JStock as portfolio tracking software?

--------------------------------------------------------------------------------

via: http://xmodulo.com/stock-portfolio-management-software-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://jstock.org/
[2]:http://ask.xmodulo.com/install-java-runtime-linux.html
[3]:http://jstock.org/ma_indicator.html
[4]:https://play.google.com/store/apps/details?id=org.yccheok.jstock.gui
