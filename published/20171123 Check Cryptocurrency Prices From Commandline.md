用命令行查看比特币等加密货币的价格
======

![配图](https://www.ostechnix.com/wp-content/uploads/2017/11/bitcoin-1-720x340.jpg)

前段时间，我们发布了一个关于 [Cli-Fyi][1] 的指南 - 一个可能有用的命令行查询工具。使用 Cli-Fyi，我们可以很容易地了解加密货币的最新价格和许多其他有用的细节。今天，我们将看到另一个名为 “Coinmon” 的加密货币价格查看工具。不像 Cli.Fyi，Coinmon 只能用来查看不同加密货币的价格。没有其他功能！Coinmon 会在终端上检查加密货币的价格。它将从 [coinmarketcap.com][2] API 获取所有详细信息。对于那些 **加密货币投资者**和**工程师**来说是非常有用的。

### 安装 Coinmon

确保你的系统上安装了 Node.js 和 Npm。如果你的机器上没有安装 Node.js 和/或 npm，请参考以下链接进行安装。

安装完 Node.js 和 Npm 后，从终端运行以下命令安装 Coinmon。

```
sudo npm install -g coinmon
```

### 从命令行查看加密货币价格

运行以下命令查看市值排名的前 10 位的加密货币：

```
coinmon
```

示例输出：

![][4]

如我所说，如果你不带任何参数运行 Coinmon，它将显示前 10 位加密货币。你还可以使用 `-t` 标志查看最高的 n 位加密货币，例如 20。

```
coinmon -t 20
```

所有价格默认以美元显示。你还可以使用 `-c` 标志将价格从美元转换为另一种货币。

例如，要将价格转换为 INR（印度卢比），运行：

```
coinmon -c inr
```

![][5]

目前，Coinmon 支持 AUD、BRL、CAD、CHF、CLP、CNY、CZK、DKK、EUR、GBP、HKD、HUF、IDR、ILS、INR、JPY、KRW、MXN、MYR、NOK、NZD、PHP、PKR、PLN、RUB、SEK、SGD、THB、TRY、TWD、ZAR 这些货币。

也可以使用加密货币的符号来搜索价格。

```
coinmon -f btc
```

这里，`btc` 是比特币的符号。你可以在[**这里**][6]查看所有可用的加密货币的符号。

有关更多详情，请参阅 coinmon 的帮助部分：

```
$ coinmon -h

Usage: coinmon [options]

Options:

 -V, --version output the version number
 -c, --convert [currency] Convert to your fiat currency (default: usd)
 -f, --find [symbol] Find specific coin data with coin symbol (can be a comma seperated list) (default: )
 -t, --top [index] Show the top coins ranked from 1 - [index] according to the market cap (default: null)
 -H, --humanize [enable] Show market cap as a humanized number, default true (default: true)
 -h, --help output usage information
```

希望这个有帮助。会有更好的东西。敬请关注！

干杯!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/coinmon-check-cryptocurrency-prices-commandline/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/cli-fyi-quick-easy-way-fetch-information-ips-emails-domains-lots/
[2]:https://coinmarketcap.com/
[3]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]:http://www.ostechnix.com/wp-content/uploads/2017/11/coinmon-1.png 
[5]:http://www.ostechnix.com/wp-content/uploads/2017/11/coinmon-2.png 
[6]:https://en.wikipedia.org/wiki/List_of_cryptocurrencies
