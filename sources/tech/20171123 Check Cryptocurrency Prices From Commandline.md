translating---geekpi

Check Cryptocurrency Prices From Commandline
======
![配图](https://www.ostechnix.com/wp-content/uploads/2017/11/bitcoin-1-720x340.jpg)
A while ago, we published a guide about **[Cli-Fyi][1] ** - a potentially useful command line query tool. Using Cli-Fyi, we can easily find out the latest price of a cryptocurrency and lots of other useful details. Today, we are going to see yet another cryptcurrency price checker tool called **" Coinmon"**. Unlike Cli.Fyi, Coinmon is only for checking the price of various cryptocurrencies. Nothing more! Coinmon will check cryptocurrencies' prices, changes right from your Terminal. It will fetch all details from from [coinmarketcap.com][2] APIs. It is quite useful for those who are both **Crypto investors** and **Engineers**.

### Installing Coinmon

Make sure you have Node.js and Npm installed on your system. If you don't have Node.js and/or npm installed on your machine, refer the following link to install them.

Once Node.js and Npm installed, run the following command from your Terminal to install Coinmon.
```
sudo npm install -g coinmon
```

### Check Cryptocurrency Prices From Commandline

Run the following command to check the top 10 cryptocurrencies ranked by their market cap:
```
coinmon
```

Sample output would be:

[![][3]][4]

Like I said, if you run the coinmon without any parameters, it will display the top 10 cryptocurrencies. You can also find top top n cryptocurrencies, for example 20, by using "-t" flag.
```
coinmon -t 20
```

All prices will be displayed in USD by default. You can also convert price from USD to another currency by using "-c" flag.

For instance, to convert the prices to INR (Indian Rupee), run:
```
coinmon -c inr
```

[![][3]][5]

Currently, Coinmon supports AUD, BRL, CAD, CHF, CLP, CNY, CZK, DKK, EUR, GBP, HKD, HUF, IDR, ILS, INR, JPY, KRW, MXN, MYR, NOK, NZD, PHP, PKR, PLN, RUB, SEK, SGD, THB, TRY, TWD, ZAR currencies.

It is also possible to search the prices using the symbol of a cryptocurrency.
```
coinmon -f btc
```

Here, **btc** is the symbol of Bitcoin cryptocurrency. You can view the symbols of all available cryptocurrencies [**here**][6].

For more details, refer coinmon's help section:
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

Hope this helps. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/coinmon-check-cryptocurrency-prices-commandline/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/cli-fyi-quick-easy-way-fetch-information-ips-emails-domains-lots/
[2]:https://coinmarketcap.com/
[3]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]:http://www.ostechnix.com/wp-content/uploads/2017/11/coinmon-1.png ()
[5]:http://www.ostechnix.com/wp-content/uploads/2017/11/coinmon-2.png ()
[6]:https://en.wikipedia.org/wiki/List_of_cryptocurrencies
