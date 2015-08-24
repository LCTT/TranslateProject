Translating by GOLinux!
How to monitor stock quotes from the command line on Linux
================================================================================
If you are one of those stock investors or traders, monitoring the stock market will be one of your daily routines. Most likely you will be using an online trading platform which comes with some fancy real-time charts and all sort of advanced stock analysis and tracking tools. While such sophisticated market research tools are a must for any serious stock investors to read the market, monitoring the latest stock quotes still goes a long way to build a profitable portfolio.

If you are a full-time system admin constantly sitting in front of terminals while trading stocks as a hobby during the day, a simple command-line tool that shows real-time stock quotes will be a blessing for you.

In this tutorial, let me introduce a neat command-line tool that allows you to monitor stock quotes from the command line on Linux.

This tool is called [Mop][1]. Written in Go, this lightweight command-line tool is extremely handy for tracking the latest stock quotes from the U.S. markets. You can easily customize the list of stocks to monitor, and it shows the latest stock quotes in ncurses-based, easy-to-read interface.

**Note**: Mop obtains the latest stock quotes via Yahoo! Finance API. Be aware that their stock quotes are known to be delayed by 15 minutes. So if you are looking for "real-time" stock quotes with zero delay, Mop is not a tool for you. Such "live" stock quote feeds are usually available for a fee via some proprietary closed-door interface. With that being said, let's see how you can use Mop under Linux environment.

### Install Mop on Linux ###

Since Mop is implemented in Go, you will need to install Go language first. If you don't have Go installed, follow [this guide][2] to install Go on your Linux platform. Make sure to set GOPATH environment variable as described in the guide.

Once Go is installed, proceed to install Mop as follows.

**Debian, Ubuntu or Linux Mint**

    $ sudo apt-get install git
    $ go get github.com/michaeldv/mop
    $ cd $GOPATH/src/github.com/michaeldv/mop
    $ make install

Fedora, CentOS, RHEL

    $ sudo yum install git
    $ go get github.com/michaeldv/mop
    $ cd $GOPATH/src/github.com/michaeldv/mop
    $ make install

The above commands will install Mop under $GOPATH/bin.

Now edit your .bashrc to include $GOPATH/bin in your PATH variable.

    export PATH="$PATH:$GOPATH/bin"

----------

    $ source ~/.bashrc 

### Monitor Stock Quotes from the Command Line with Mop ###

To launch Mod, simply run the command called cmd.

    $ cmd 

At the first launch, you will see a few stock tickers which Mop comes pre-configured with.

![](https://farm6.staticflickr.com/5749/20018949104_c8c64e0e06_c.jpg)

The quotes show information like the latest price, %change, daily low/high, 52-week low/high, dividend, and annual yield. Mop obtains market overview information from [CNN][3], and individual stock quotes from [Yahoo Finance][4]. The stock quote information updates itself within the terminal periodically.

### Customize Stock Quotes in Mop ###

Let's try customizing the stock list. Mop provides easy-to-remember shortcuts for this: '+' to add a new stock, and '-' to remove a stock.

To add a new stock, press '+', and type a stock ticker symbol to add (e.g., MSFT). You can add more than one stock at once by typing a comma-separated list of tickers (e.g., "MSFT, AMZN, TSLA").

![](https://farm1.staticflickr.com/636/20648164441_642ae33a22_c.jpg)

Removing stocks from the list can be done similarly by pressing '-'.

### Sort Stock Quotes in Mop ###

You can sort the stock quote list based on any column. To sort, press 'o', and use left/right key to choose the column to sort by. When a particular column is chosen, you can sort the list either in increasing order or in decreasing order by pressing ENTER.

![](https://farm1.staticflickr.com/724/20648164481_15631eefcf_c.jpg)

By pressing 'g', you can group your stocks based on whether they are advancing or declining for the day. Advancing issues are represented in green color, while declining issues are colored in white.

![](https://c2.staticflickr.com/6/5633/20615252696_a5bd44d3aa_b.jpg)

If you want to access help page, simply press '?'.

![](https://farm1.staticflickr.com/573/20632365342_da196b657f_c.jpg)

### Conclusion ###

As you can see, Mop is a lightweight, yet extremely handy stock monitoring tool. Of course you can easily access stock quotes information elsewhere, from online websites, your smartphone, etc. However, if you spend a great deal of your time in a terminal environment, Mop can easily fit in to your workspace, hopefully without distracting must of your workflow. Just let it run and continuously update market date in one of your terminals, and be done with it.

Happy trading!

--------------------------------------------------------------------------------

via: http://xmodulo.com/monitor-stock-quotes-command-line-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:https://github.com/michaeldv/mop
[2]:http://ask.xmodulo.com/install-go-language-linux.html
[3]:http://money.cnn.com/data/markets/
[4]:http://finance.yahoo.com/
