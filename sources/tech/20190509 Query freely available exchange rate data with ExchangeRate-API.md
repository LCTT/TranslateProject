[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Query freely available exchange rate data with ExchangeRate-API)
[#]: via: (https://opensource.com/article/19/5/exchange-rate-data)
[#]: author: (Chris Hermansen  https://opensource.com/users/clhermansen)

Query freely available exchange rate data with ExchangeRate-API
======
In this interview, ExchangeRate-API's founder explains why exchange rate
data should be freely accessible to developers who want to build useful
stuff.
![scientific calculator][1]

Last year, [I wrote about][2] using the Groovy programming language to access foreign exchange rate data from an API to simplify my expense records. I showed how two exchange rate sites, [fixer.io][3] and apilayer.net (now [apilayer.com][4]), could provide the data I needed, allowing me to convert between Indian rupees (INR) and Canadian dollars (CAD) using the former, and Chilean pesos (CLP) and Canadian dollars using the latter.

Recently, David over at [ExchangeRate-API.com][5] reached out to me to say, "the free API you mentioned (Fixer) has been bought by CurrencyLayer and had its no-signup/unlimited access deprecated." He also told me, "I run a free API called ExchangeRate-API.com that has the same JSON format as the original Fixer, doesn't require any signup, and allows unlimited requests."

After exchanging a few emails, we decided to turn our conversation into an interview. Below the interview, you can find scripts and usage instructions. (The interview has been edited slightly for clarity.)

### About ExchangeRate-API

_**Chris:** How is ExchangeRate-API different from other online exchange-rate services? What motivates you to provide this service?_

**David:** When I started ExchangeRate-API with a friend in 2010, we built and released it for free because we really needed this service for another project and couldn't find one despite extensive googling. There are now around 20 such APIs offering quite a few different approaches. Over the years, I've tried a number of different approaches, but offering quality data for free has always proven the most popular. I'm also motivated by the thought that this data should be freely accessible to developers who want to build useful stuff even if they don't have a budget.

Thus, the main difference with our currency conversion API is that it's unlimited and requires no signup. This also makes starting to use it really fast—you literally just copy the endpoint URL and you're good to go.

There are one or two other free and unlimited APIs, but these typically just serve the daily reference rates provided by the European Central Bank. ExchangeRate-API collects the public reference rates from a number of central banks and then blends them to reduce the risk of outlying values. It also does acceptance checking to ensure the rates aren't wildly wrong (for instance an inverted data capture recording US dollars to CLP instead of CLP to USD) and weights different sources based on their historical accuracy. This makes the service quite reliable. I'm currently working on a transparency project to compare and show the accuracy of this public reference rate blend against a proprietary data source so potential users can make more informed decisions on what type of currency data service is right for them.

_**Chris:** I'm delighted that you've included Canadian dollars and Indian rupees, as that is one problem I need to solve. I'm sad to see that you don't have Chilean pesos (another problem I need to solve). Can you tell us how you select the list of currencies? Do you anticipate adding other currencies to your list?_

**David:** Since my main aim for this service is to offer stable and reliable exchange rate data, I only include currencies when there is more than one data source for that currency code. For instance, after you mentioned that you're looking for CLP data, I added the daily reference rates published by the Central Bank of Chile to our system. If I can find another source that includes CLP, it would be included in our list of supported currencies, but until then, unfortunately not. The goal is to support as many currencies as possible.

One thing to note is that, for some currencies, the service has the minimum two sources, but a few currency pairs (for instance USD/EUR) are included in almost every set of public reference rates. The transparent accuracy project I mentioned will hopefully make this difference clear so that users can understand why our USD/EUR rate might be more accurate than less common pairs like CLP/INR and also the degree of variance in accuracy between the pairs. It will take some work to make showing this information quick and easy to understand.

### The API's architecture

_**Chris:** Can you tell us a bit about your API's architecture? Do you use open source components to deliver your service?_

**David:** I exclusively use open source software to run ExchangeRate-API. I'm definitely an open source enthusiast and am always getting friends to switch to open source, explaining licenses, and donating when I can to the projects I use most. I also try to email maintainers of projects I use to say thanks, but I don't do this enough.

The stack is currently Ubuntu LTS, MariaDB, Nginx, PHP 7, and Memcached. I also use Bootstrap and Picnic open source CSS frameworks. I use Let's Encrypt for HTTPS certificates via the Electronic Frontier Foundation's open source ACME client, [Certbot][6]. The service makes extensive use of classic tools like UFW/iptables, cURL, OpenSSH, and Git.

My approach is typically to keep everything as simple as possible while using the tried-and-tested open source building blocks. For a project that aims to _always_ be available for users to convert currencies, this feels like the best route to reliability. I love reading about innovative new projects that could be useful for a project like this (for example, CockroachDB), but I wouldn't use them until they are considered really bulletproof. Obviously, things like [Heartbleed][7] show that there are risks with "boring" projects too—but I think these are easier to manage than the potential for unknown risks with newer, cutting-edge projects.

In terms of the infrastructure setup, I've steadily built and improved the system over the last nine years, and it now comprises roughly three tiers. The main cluster runs on Amazon Web Services (AWS) and consists of Ubuntu EC2 servers and a high-availability MariaDB relational database service (RDS) instance. The EC2 instances are spread across multiple AWS Availability Zones and fronted by the managed AWS Elastic Load Balancing (ELB) service. Between the RDS database instance with automated cross-zone failover and the ELB-fronted EC2 instances spread across availability zones, this setup is exceptionally available. It is, however, only in one locale. So I've set up a second tier of virtual private server (VPS) instances in different geographic locations to reduce latency and distribute the load away from the more expensive AWS infrastructure. These are currently with Linode, but I have also used DigitalOcean and Vultr recently.

Finally, this is all protected behind Cloudflare. With a free service, it's inevitable that some users will choose to abuse the system, and Cloudflare is an amazing product that's vital to ExchangeRate-API. Our servers can be protected and our users get low-latency, in-region caches. Cloudflare is set up with both the load balancing and traffic steering products to reduce latency and instantly shift traffic from unhealthy parts of the infrastructure to available origins.

With this very redundant approach, there hasn't been downtime as a result of infrastructure problems or user load for around three years. The few periods of degraded service experienced in this time are all due to issues with code, deployment strategy, or config mistakes. The setup currently handles hundreds of millions of requests per month with low load levels and manageable costs, so there's plenty of room for growth.

The actual application code is PHP with heavy use of Memcached. Memcached is an amazing open source project started by Brad Fitzpatrick in 2003. It's not particularly glamorous, but it is an incredibly reliable and performant distributed in-memory key value store.

### Engaging with the open source community

_**Chris:** There is an impressive amount of open source in your configuration. How do you engage with the broader community of users in these projects?_

**David:** I really struggle with the best way to be a good open source citizen while running a side project SaaS. I've considered building an open source library of some sort and releasing it, but I haven't thought of something that hasn't already been done and that I would be able to make the time commitment to reliably maintain. I'd only start a project like this if I could be confident I'd have the time to ensure users who choose the project wouldn't suddenly find themselves depending on abandonware. I've also looked into contributing to the projects that ExchangeRate-API depends on, but since I only use the biggest, most established options, I lack the expertise to make a meaningful contribution to such serious projects.

I'm currently working on a new "Pro" plan for the service and I'm going to set a percentage of this income to donate to my open source dependencies. This still feels like a bandage though—answering this question makes me realize I need to put more time into starting an open source project that calls ExchangeRate-API home!

### Looking ahead

_**Chris:** We can only query the latest exchange rate, but it appears that you may be offering historical rates sometime later this year. Can you tell us more about the technical challenges with serving up historical data?_

**David:** There is a dataset of historical rates blended using our same algorithm from multiple central bank reference sets. However, I stopped new signups for it due to some issues with the data quality. The dataset reaches back to 1990, and there were a few earlier periods that need better data validation. As such, I'm building a better system for checking and comparing the data as it's ingested as well as adding an additional data source. The plan is to have a clean and more comprehensively verified-as-accurate dataset available later this year.

In terms of the technical side of things, historical data is slightly more complex than live data. Compared to the live dataset (which is just a few bytes) the historical data is millions of database rows. This data was originally served from the database infrastructure with a long time-to-live (TTL) intermediary-caching layer. This was largely performant but struggled in situations where users wanted to dump the entire dataset as fast as the network could handle it. If the cache was sufficiently warm, this was fine, but if reboots, new server deployments, etc. had taken place recently, these big request sets would "miss" enough on the cache that the database would have problematic load spikes.

Obviously, the goal is an infrastructure that can handle even aggressive use cases with normal performance, so the new historical rates dataset will be accompanied by a preemptive in-memory cache rather than a request-driven one. Thankfully, RAM is cheap these days, and putting a couple hundred megabytes of data entirely into RAM is a plausible approach even for a small project like ExchangeRate-API.com.

_**Chris:** It sounds like you've been through quite a few iterations of this service to get to where it is today! Where do you see it going in the next few years?_

**David:** I'd aim for it to have reached coverage of every world currency so that anyone looking for this sort of software can easily and programmatically get the exchange rates they need for free.

I'd also definitely like to have an affordable Pro plan that really resonates with users. Getting this right would mean better infrastructure and lower latency for free users as well.

Finally, I'd like to have some sort of useful open source library under the ExchangeRate-API banner. Starting a small project that finds an enthusiastic community would be really rewarding. It's great to run something that's free-as-in-beer, but it would be even better if part of it was free-as-in-speech, as well.

### How to use the service

It's easy enough to test out the service using **wget** , as follows:


```
clh@marseille:~$ wget -O - <https://api.exchangerate-api.com/v4/latest/INR>
\--2019-04-26 13:48:23-- <https://api.exchangerate-api.com/v4/latest/INR>
Resolving api.exchangerate-api.com (api.exchangerate-api.com)... 2606:4700:20::681a:c80, 2606:4700:20::681a:d80, 104.26.13.128, ...
Connecting to api.exchangerate-api.com (api.exchangerate-api.com)|2606:4700:20::681a:c80|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/json]
Saving to: ‘STDOUT’

\- [<=>
] 0 --.-KB/s {"base":"INR","date":"2019-04-26","time_last_updated":1556236800,"rates":{"INR":1,"AUD":0.020343,"BRL":0.056786,"CAD":0.019248,"CHF":0.014554,"CNY":0.096099,"CZK":0.329222,"DKK":0.095497,"EUR":0.012789,"GBP":0.011052,"HKD":0.111898,"HUF":4.118615,"IDR":199.61769,"ILS":0.051749,"ISK":1.741659,"JPY":1.595527,"KRW":16.553091,"MXN":0.272383,"MYR":0.058964,"NOK":0.123365,"NZD":0.02161,"PEN":0.047497,"PHP":0.744974,"PLN":0.054927,"RON":0.060923,"RUB":0.921808,"SAR":0.053562,"SEK":0.135226,"SGD":0.019442,"THB":0.457501,"TRY":0- [ <=> ] 579 --.-KB/s in 0s

2019-04-26 13:48:23 (15.5 MB/s) - written to stdout [579]

clh@marseille:~$
```

The result is returned as a JSON payload, giving conversion rates from Indian rupees (the currency I requested in the URL) to all the currencies handled by ExchangeRate-API.

The Groovy shell can access the API:


```
clh@marseille:~$ groovysh
Groovy Shell (2.5.3, JVM: 1.8.0_212)
Type ':help' or ':h' for help.
\----------------------------------------------------------------------------------------------------------------------------------
groovy:000> import groovy.json.JsonSlurper
===> groovy.json.JsonSlurper
groovy:000> result = (new JsonSlurper()).parse(
groovy:001> new InputStreamReader((new URL('<https://api.exchangerate-api.com/v4/latest/INR')).newInputStream(>))
groovy:002> )
===> [base:INR, date:2019-04-26, time_last_updated:1556236800, rates:[INR:1, AUD:0.020343, BRL:0.056786, CAD:0.019248, CHF:0.014554, CNY:0.096099, CZK:0.329222, DKK:0.095497, EUR:0.012789, GBP:0.011052, HKD:0.111898, HUF:4.118615, IDR:199.61769, ILS:0.051749, ISK:1.741659, JPY:1.595527, KRW:16.553091, MXN:0.272383, MYR:0.058964, NOK:0.123365, NZD:0.02161, PEN:0.047497, PHP:0.744974, PLN:0.054927, RON:0.060923, RUB:0.921808, SAR:0.053562, SEK:0.135226, SGD:0.019442, THB:0.457501, TRY:0.084362, TWD:0.441385, USD:0.014255, ZAR:0.206271]]
groovy:000>
```

The same JSON payload is returned as a result of the Groovy JSON slurper operating on the URL. Of course, since this is Groovy, the JSON is converted into a Map, so you can do stuff like this:


```
groovy:000> println result.base
INR
===> null
groovy:000> println result.date
2019-04-26
===> null
groovy:000> println result.rates.CAD
0.019248
===> null
```

And that's it!

Do you use ExchangeRate-API or a similar service? Share how you use exchange rate data in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/exchange-rate-data

作者：[Chris Hermansen ][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/calculator_money_currency_financial_tool.jpg?itok=2QMa1y8c (scientific calculator)
[2]: https://opensource.com/article/18/3/groovy-calculate-foreign-exchange
[3]: https://fixer.io/
[4]: https://apilayer.com/
[5]: https://www.exchangerate-api.com/
[6]: https://certbot.eff.org/
[7]: https://en.wikipedia.org/wiki/Heartbleed
