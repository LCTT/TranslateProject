Linux FAQs with Answers--How to check weather forecasts from the command line on Linux
================================================================================
> **Question**: I often check local weather forecasts on the Linux desktop. However, is there an easy way to access weather forecast information in the terminal environment, where I don't have access to desktop widgets or web browser?

For Linux desktop users, there are many ways to access weather forecasts, e.g., using standalone weather apps, desktop widgets, or panel applets. If your work environment is terminal-based, there are also several ways to access weather forecasts from the command line.

Among them is [wego][1], **a cute little weather app for the terminal**. Using an ncurses-based fancy interface, this command-line app allows you to see current weather conditions and forecasts at a glance. It retrieves the weather forecasts for the next 5 days via a weather forecast API.

### Install Wego on Linux ###

Installation of wego is pretty simple. wego is written in Go language, thus the first step is to [install Go language][2]. After installing Go, proceed to install wego as follows.

    $ go get github.com/schachmat/wego

The wego tool will be installed under $GOPATH/bin. So add $GOPATH/bin to your $PATH variable.

    $ echo 'export PATH="$PATH:$GOPATH/bin"' >> ~/.bashrc
    $ source ~/.bashrc

Now go ahead and invoke wego from the command line.

    $ wego

The first time you run wego, it will generate a config file (~/.wegorc), where you need to specify a weather API key.

You can obtain a free API key from [worldweatheronline.com][3]. Free sign-up is quick and easy. You only need a valid email address.

![](https://farm6.staticflickr.com/5781/21317466341_5a368b0d26_c.jpg)

Your .wegorc will look like the following.

![](https://farm6.staticflickr.com/5620/21121418558_df0d27cd0a_b.jpg)

Other than API key, you can specify in ~/.wegorc your preferred location, use of metric/imperial units, and language.

Note that the weather API is rate-limited; 5 queries per second, and 250 queries per day.

When you invoke wego command again, you will see the latest weather forecast (of your preferred location), shown as follows.

![](https://farm6.staticflickr.com/5776/21121218110_dd51e03ff4_c.jpg)

The displayed weather information includes: (1) temperature, (2) wind direction and speed, (3) viewing distance, and (4) precipitation amount and probability.

By default, it will show 3-day weather forecast. To change this behavior, you can supply the number of days (upto five) as an argument. For example, to see 5-day forecast:

    $ wego 5

If you want to check the weather of any other location, you can specify the city name.

    $ wego Seattle

### Troubleshooting ###

1. You encounter the following error while running wego.

    user: Current not implemented on linux/amd64

This error can happen when you run wego on a platform which is not supported by the native Go compiler gc (e.g., Fedora). In that case, you can compile the program using gccgo, a compiler-frontend for Go language. This can be done as follows.

    $ sudo yum install gcc-go
    $ go get -compiler=gccgo github.com/schachmat/wego

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/weather-forecasts-command-line-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:https://github.com/schachmat/wego
[2]:http://ask.xmodulo.com/install-go-language-linux.html
[3]:https://developer.worldweatheronline.com/auth/register