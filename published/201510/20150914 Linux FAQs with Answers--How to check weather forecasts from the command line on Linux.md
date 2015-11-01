Linux 有问必答：如何在 Linux 命令行下浏览天气预报
================================================================================
> **Q**: 我经常在 Linux 桌面查看天气预报。然而，是否有一种在终端环境下，不通过桌面小插件或者浏览器查询天气预报的方法？

对于 Linux 桌面用户来说，有很多办法获取天气预报，比如使用专门的天气应用、桌面小插件，或者面板小程序。但是如果你的工作环境是基于终端的，这里也有一些在命令行下获取天气的手段。

其中有一个就是 [wego][1]，**一个终端下的小巧程序**。使用基于 ncurses 的接口，这个命令行程序允许你查看当前的天气情况和之后的预报。它也会通过一个天气预报的 API 收集接下来 5 天的天气预报。

### 在 Linux 下安装 wego ###

安装 wego 相当简单。wego 是用 Go 编写的，引起第一个步骤就是安装 [Go 语言][2]。然后再安装 wego。

    $ go get github.com/schachmat/wego

wego 会被安装到 $GOPATH/bin，所以要将 $GOPATH/bin 添加到 $PATH 环境变量。

    $ echo 'export PATH="$PATH:$GOPATH/bin"' >> ~/.bashrc
    $ source ~/.bashrc

现在就可与直接从命令行启动 wego 了。

    $ wego

第一次运行 weg 会生成一个配置文件(`~/.wegorc`)，你需要指定一个天气 API key。
你可以从 [worldweatheronline.com][3] 获取一个免费的 API key。免费注册和使用。你只需要提供一个有效的邮箱地址。

![](https://farm6.staticflickr.com/5781/21317466341_5a368b0d26_c.jpg)

你的 .wegorc 配置文件看起来会这样：

![](https://farm6.staticflickr.com/5620/21121418558_df0d27cd0a_b.jpg)

除了 API key，你还可以把你想要查询天气的地方、使用的城市/国家名称、语言配置在 `~/.wegorc` 中。
注意，这个天气 API 的使用有限制：每秒最多 5 次查询，每天最多 250 次查询。
当你重新执行 wego 命令，你将会看到最新的天气预报（当然是你的指定地方），如下显示。

![](https://farm6.staticflickr.com/5776/21121218110_dd51e03ff4_c.jpg)

显示出来的天气信息包括：(1)温度，(2)风速和风向，(3)可视距离，(4)降水量和降水概率
默认情况下会显示3 天的天气预报。如果要进行修改，可以通过参数改变天气范围（最多5天），比如要查看 5 天的天气预报：

    $ wego 5

如果你想检查另一个地方的天气，只需要提供城市名即可：

    $ wego Seattle

### 问题解决 ###

1. 可能会遇到下面的错误：

    	user: Current not implemented on linux/amd64

    当你在一个不支持原生 Go 编译器的环境下运行 wego 时就会出现这个错误。在这种情况下你只需要使用 gccgo ——一个 Go 的编译器前端来编译程序即可。这一步可以通过下面的命令完成。
    
    	$ sudo yum install gcc-go
    	$ go get -compiler=gccgo github.com/schachmat/wego

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/weather-forecasts-command-line-linux.html

作者：[Dan Nanni][a]
译者：[oska874](https://github.com/oska874)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:https://github.com/schachmat/wego
[2]:http://ask.xmodulo.com/install-go-language-linux.html
[3]:https://developer.worldweatheronline.com/auth/register
