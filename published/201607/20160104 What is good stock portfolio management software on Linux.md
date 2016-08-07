JStock：Linux 上不错的股票投资组合管理软件
================================================================================

如果你在股票市场做投资，那么你可能非常清楚投资组合管理计划有多重要。管理投资组合的目标是依据你能承受的风险，时间层面的长短和资金盈利的目标去为你量身打造的一种投资计划。鉴于这类软件的重要性，因此从来不会缺乏商业性的 app 和股票行情检测软件，每一个都可以兜售复杂的投资组合以及跟踪报告功能。

对于我们这些 Linux 爱好者们，我也找到了一些**好用的开源投资组合管理工具**，用来在 Linux 上管理和跟踪股票的投资组合，这里高度推荐一个基于 java 编写的管理软件 [JStock][1]。如果你不是一个 java 粉，也许你会放弃它，JStock 需要运行在沉重的 JVM 环境上。但同时，在每一个安装了 JRE 的环境中它都可以马上运行起来，在你的 Linux 环境中它会运行的很顺畅。

“开源”就意味着免费或标准低下的时代已经过去了。鉴于 JStock 只是一个个人完成的产物，作为一个投资组合管理软件它最令人印象深刻的是包含了非常多实用的功能，以上所有的荣誉属于它的作者 Yan Cheng Cheok！例如，JStock 支持通过监视列表去监控价格，多种投资组合，自选/内置的股票指标与相关监测，支持27个不同的股票市场和跨平台的云端备份/还原。JStock 支持多平台部署（Linux, OS X, Android 和 Windows），你可以通过云端保存你的 JStock 投资组合，并通过云平台无缝的备份/还原到其他的不同平台上面。

现在我将向你展示如何安装以及使用过程的一些具体细节。

### 在 Linux 上安装 JStock ###

因为 JStock 使用Java编写，所以必须[安装 JRE][2]才能让它运行起来。小提示，JStock 需要 JRE1.7 或更高版本。如你的 JRE 版本不能满足这个需求，JStock 将会运行失败然后出现下面的报错。

    Exception in thread "main" java.lang.UnsupportedClassVersionError: org/yccheok/jstock/gui/JStock : Unsupported major.minor version 51.0


在你的 Linux 上安装好了 JRE 之后，从其官网下载最新的发布的 JStock，然后加载启动它。

    $ wget https://github.com/yccheok/jstock/releases/download/release_1-0-7-13/jstock-1.0.7.13-bin.zip
    $ unzip jstock-1.0.7.13-bin.zip
    $ cd jstock
    $ chmod +x jstock.sh
    $ ./jstock.sh

教程的其他部分，让我来给大家展示一些 JStock 的实用功能

### 监视监控列表中股票价格的波动 ###

使用 JStock 你可以创建一个或多个监视列表，它可以自动的监视股票价格的波动并给你提供相应的通知。在每一个监视列表里面你可以添加多个感兴趣的股票进去。之后在“Fall Below”和“Rise Above”的表格里添加你的警戒值，分别设定该股票的最低价格和最高价格。

![](https://c2.staticflickr.com/2/1588/23795349969_37f4b0f23c_c.jpg)

例如你设置了 AAPL 股票的最低/最高价格分别是 $102 和 $115.50，只要在价格低于 $102 或高于 $115.50 时你就得到桌面通知。

你也可以设置邮件通知，这样你将收到一些价格信息的邮件通知。设置邮件通知在“Options”菜单里，在“Alert”标签中国，打开“Send message to email(s)”，填入你的 Gmail 账户。一旦完成 Gmail 认证步骤，JStock 就会开始发送邮件通知到你的 Gmail 账户（也可以设置其他的第三方邮件地址）。

![](https://c2.staticflickr.com/2/1644/24080560491_3aef056e8d_b.jpg)

### 管理多个投资组合 ###

JStock 允许你管理多个投资组合。这个功能对于你使用多个股票经纪人时是非常实用的。你可以为每个经纪人创建一个投资组合去管理你的“买入/卖出/红利”用来了解每一个经纪人的业务情况。你也可以在“Portfolio”菜单里面选择特定的投资组合来切换不同的组合项目。下面是一张截图用来展示一个假设的投资组合。

![](https://c2.staticflickr.com/2/1646/23536385433_df6c036c9a_c.jpg)

你也可以设置付给中介费，你可以为每个买卖交易设置中介费、印花税以及结算费。如果你比较懒，你也可以在选项菜单里面启用自动费用计算，并提前为每一家经济事务所设置费用方案。当你为你的投资组合增加交易之后，JStock 将自动的计算并计入费用。

![](https://c2.staticflickr.com/2/1653/24055085262_0e315c3691_b.jpg)

### 使用内置/自选股票指标来监控 ###

如果你要做一些股票的技术分析，你可能需要基于各种不同的标准来监控股票（这里叫做“股票指标”）。对于股票的跟踪，JStock提供多个[预设的技术指示器][3] 去获得股票上涨/下跌/逆转指数的趋势。下面的列表里面是一些可用的指标。

- 平滑异同移动平均线（MACD）
- 相对强弱指标 (RSI)
- 资金流向指标 (MFI)
- 顺势指标 (CCI)
- 十字线
- 黄金交叉线，死亡交叉线
- 涨幅/跌幅 

开启预设指示器能需要在 JStock 中点击“Stock Indicator Editor”标签。之后点击右侧面板中的安装按钮。选择“Install from JStock server”选项，之后安装你想要的指示器。

![](https://c2.staticflickr.com/2/1476/23867534660_b6a9c95a06_c.jpg)

一旦安装了一个或多个指示器，你可以用他们来扫描股票。选择“Stock Indicator Scanner”标签，点击底部的“Scan”按钮，选择需要的指示器。

![](https://c2.staticflickr.com/2/1653/24137054996_e8fcd10393_c.jpg)

当你选择完需要扫描的股票（例如， NYSE, NASDAQ）以后，JStock 将执行该扫描，并将该指示器捕获的结果通过列表展现。

![](https://c2.staticflickr.com/2/1446/23795349889_0f1aeef608_c.jpg)

除了预设指示器以外，你也可以使用一个图形化的工具来定义自己的指示器。下面这张图例用于监控当前价格小于或等于60天平均价格的股票。

![](https://c2.staticflickr.com/2/1605/24080560431_3d26eac6b5_c.jpg)

### 通过云在 Linux 和 Android JStock 之间备份/恢复###

另一个非常棒的功能是 JStock 支持云备份恢复。Jstock 可以通过 Google Drive 把你的投资组合/监视列表在云上备份和恢复，这个功能可以实现在不同平台上无缝穿梭。如果你在两个不同的平台之间来回切换使用 Jstock，这种跨平台备份和还原非常有用。我在 Linux 桌面和 Android 手机上测试过我的 Jstock 投资组合，工作的非常漂亮。我在 Android 上将 Jstock 投资组合信息保存到 Google Drive 上，然后我可以在我的 Linux 版的 Jstock 上恢复它。如果能够自动同步到云上，而不用我手动地触发云备份/恢复就更好了，十分期望这个功能出现。

![](https://c2.staticflickr.com/2/1537/24163165565_bb47e04d6c_c.jpg)

![](https://c2.staticflickr.com/2/1556/23536385333_9ed1a75d72_c.jpg)

如果你在从 Google Drive 还原之后不能看到你的投资信息以及监视列表，请确认你的国家信息与“Country”菜单里面设置的保持一致。

JStock 的安卓免费版可以从 [Google Play Store][4] 获取到。如果你需要完整的功能（比如云备份，通知，图表等），你需要一次性支付费用升级到高级版。我认为高级版物有所值。

![](https://c2.staticflickr.com/2/1687/23867534720_18b917028c_c.jpg)

写在最后，我应该说一下它的作者，Yan Cheng Cheok，他是一个十分活跃的开发者，有bug及时反馈给他。这一切都要感谢他！！！

关于 JStock 这个投资组合跟踪软件你有什么想法呢？

--------------------------------------------------------------------------------

via: http://xmodulo.com/stock-portfolio-management-software-Linux.html

作者：[Dan Nanni][a]
译者：[ivo-wang](https://github.com/ivo-wang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://Linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://jstock.org/
[2]:http://ask.xmodulo.com/install-java-runtime-Linux.html
[3]:http://jstock.org/ma_indicator.html
[4]:https://play.google.com/store/apps/details?id=org.yccheok.jstock.gui
