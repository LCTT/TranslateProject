translating by fw8899
What is good stock portfolio management software on Linux
================================================================================
If you are investing in the stock market, you probably understand the importance of a sound portfolio management plan. The goal of portfolio management is to come up with the best investment plan tailored for you, considering your risk tolerance, time horizon and financial goals. Given its importance, no wonder there are no shortage of commercial portfolio management apps and stock market monitoring software, each touting various sophisticated portfolio performance tracking and reporting capabilities.

For those of you Linux aficionados who are looking for a **good open-source portfolio management tool** to manage and track your stock portfolio on Linux, I would highly recommend a Java-based portfolio manager called [JStock][1]. If you are not a big Java fan, you might be turned off by the fact that JStock runs on a heavyweight JVM. At the same time I am sure many people will appreciate the fact that JStock is instantly accessible on every Linux platform with JRE installed. No hoops to jump through to make it work on your Linux environment.

The day is gone when "open-source" means "cheap" or "subpar". Considering that JStock is just a one-man job, JStock is impressively packed with many useful features as a portfolio management tool, and all that credit goes to Yan Cheng Cheok! For example, JStock supports price monitoring via watchlists, multiple portfolios, custom/built-in stock indicators and scanners, support for 27 different stock markets and cross-platform cloud backup/restore. JStock is available on multiple platforms (Linux, OS X, Android and Windows), and you can save and restore your JStock portfolios seamlessly across different platforms via cloud backup/restore.

Sounds pretty neat, huh? Now I am going to show you how to install and use JStock in more detail.

### Install JStock on Linux ###

Since JStock is written in Java, you must [install JRE][2] to run it. Note that JStock requires JRE 1.7 or higher. If your JRE version does not meet this requirement, JStock will fail with the following error.

    Exception in thread "main" java.lang.UnsupportedClassVersionError: org/yccheok/jstock/gui/JStock : Unsupported major.minor version 51.0

Once you install JRE on your Linux, download the latest JStock release from the official website, and launch it as follows.

    $ wget https://github.com/yccheok/jstock/releases/download/release_1-0-7-13/jstock-1.0.7.13-bin.zip
    $ unzip jstock-1.0.7.13-bin.zip
    $ cd jstock
    $ chmod +x jstock.sh
    $ ./jstock.sh

In the rest of the tutorial, let me demonstrate several useful features of JStock.

### Monitor Stock Price Movements via Watchlist ###

On JStock you can monitor stock price movement and automatically get notified by creating one or more watchlists. In each watchlist, you can add multiple stocks you are interested in. Then add your alert thresholds under "Fall Below" and "Rise Above" columns, which correspond to minimum and maximum stock prices you want to set, respectively.

![](https://c2.staticflickr.com/2/1588/23795349969_37f4b0f23c_c.jpg)

For example, if you set minimum/maximum prices of AAPL stock to $102 and $115.50, you will be alerted via desktop notifications if the stock price goes below $102 or moves higher than $115.50 at any time.

You can also enable email alert option, so that you will instead receive email notifications for such price events. To enable email alerts, go to "Options" menu. Under "Alert" tab, turn on "Send message to email(s)" box, and enter your Gmail account. Once you go through Gmail authorization steps, JStock will start sending email alerts to that Gmail account (and optionally CC to any third-party email address).

![](https://c2.staticflickr.com/2/1644/24080560491_3aef056e8d_b.jpg)

### Manage Multiple Portfolios ###

JStock allows you to manage multiple portfolios. This feature is useful if you are using multiple stock brokers. You can create a separate portfolio for each broker and manage your buy/sell/dividend transactions on a per-broker basis. You can switch different portfolios by choosing a particular portfolio under "Portfolio" menu. The following screenshot shows a hypothetical portfolio.

![](https://c2.staticflickr.com/2/1646/23536385433_df6c036c9a_c.jpg)

Optionally you can enable broker fee option, so that you can enter any broker fees, stamp duty and clearing fees for each buy/sell transaction. If you are lazy, you can enable fee auto-calculation and enter fee schedules for each brokering firm from the option menu beforehand. Then JStock will automatically calculate and enter fees when you add transactions to your portfolio.

![](https://c2.staticflickr.com/2/1653/24055085262_0e315c3691_b.jpg)

### Screen Stocks with Built-in/Custom Indicators ###

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
