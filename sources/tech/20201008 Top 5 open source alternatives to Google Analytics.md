[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Top 5 open source alternatives to Google Analytics)
[#]: via: (https://opensource.com/article/18/1/top-5-open-source-analytics-tools)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

Top 5 open source alternatives to Google Analytics
======
These four versatile web analytics tools provide valuable insights on
your customers and site visitors while keeping you in control.
![Analytics: Charts and Graphs][1]

If you have a website or run an online business, collecting data on where your visitors or customers come from, where they land on your site, and where they leave _is vital._ Why? That information can help you better target your products and services, and beef up the pages that are turning people away.

To gather that kind of information, you need a web analytics tool.

Many businesses of all sizes use Google Analytics. But if you want to keep control of your data, you need a tool that _you_ can control. You won’t get that from Google Analytics. Luckily, Google Analytics isn’t the only game on the web.

Here are four open source alternatives to Google Analytics.

### Matomo

Let’s start with the open source application that rivals Google Analytics for functions: [Matomo][2] (formerly known as Piwik). Matomo does most of what Google Analytics does, and chances are it offers the features that you need.

Those features include metrics on the number of visitors hitting your site, data on where they come from (both on the web and geographically), the pages from which they leave, and the ability to track search engine referrals. Matomo also offers many reports, and you can customize the dashboard to view the metrics that you want to see.

To make your life easier, Matomo integrates with more than 65 content management, e-commerce, and online forum systems, including WordPress, Magneto, Joomla, and vBulletin, using plugins. For any others, you can simply add a tracking code to a page on your site.

You can [test-drive][3] Matomo or use a [hosted version][4].

### Open Web Analytics

If there’s a close second to Matomo in the open source web analytics stakes, it’s [Open Web Analytics][5]. In fact, it includes key features that either rival Google Analytics or leave it in the dust.

In addition to the usual raft of analytics and reporting functions, Open Web Analytics tracks where on a page, and on what elements, visitors click; provides [heat maps][6] that show where on a page visitors interact the most; and even does e-commerce tracking.

Open Web Analytics has a [WordPress plugin][7] and can [integrate with MediaWiki][8] using a plugin. Or you can add a snippet of [JavaScript][9] or [PHP][10] code to your web pages to enable tracking.

Before you [download][11] the Open Web Analytics package, you can [give the demo a try][12] to see it it’s right for you.

### AWStats

Web server log files provide a rich vein of information about visitors to your site, but tapping into that vein isn't always easy. That's where [AWStats][13] comes to the rescue. While it lacks the most modern look and feel, AWStats more than makes up for that with breadth of data it can present.

That information includes the number of unique visitors, how long those visitors stay on the site, the operating system and web browsers they use, the size of a visitor's screen, and the search engines and search terms people use to find your site. AWStats can also tell you the number of times your site is bookmarked, track the pages where visitors enter and exit your sites, and keep a tally of the most popular pages on your site.

These features only scratch the surface of AWStats's capabilities. It also works with FTP and email logs, as well as [syslog][14] files. AWStats can gives you a deep insight into what's happening on your website using data that stays under your control.

### Countly

[Countly][15] bills itself as a "secure web analytics" platform. While I can't vouch for its security, Countly does a solid job of collecting and presenting data about your site and its visitors.

Heavily targeting marketing organizations, Countly tracks data that is important to marketers. That information includes site visitors' transactions, as well as which campaigns and sources led visitors to your site. You can also create metrics that are specific to your business. Countly doesn't forgo basic web analytics; it also keeps track of the number of visitors on your site, where they're from, which pages they visited, and more.

You can use the hosted version of Countly or [grab the source code][16] from GitHub and self-host the application. And yes, there are [differences between the hosted and self-hosted versions][17] of Countly.

### Plausible

[Plausible][18] is a newer kid on the open source analytics tools block. It’s lean, it’s fast, and only collects a small amount of information — that includes numbers of unique visitors and the top pages they visited, the number of page views, the bounce rate, and referrers. Plausible is simple and very focused.

What sets Plausible apart from its competitors is its heavy focus on privacy. The project creators state that the tool doesn’t collect or store any information about visitors to your website, which is particularly attractive if privacy is important to you. You can read more about that [here][19].

There’s a [demo instance][20] that you check out. After that, you can either [self-host][21] Plausible or sign up for a [paid, hosted account][22].

**Share your favorite open source web analytics tool with us in the comments.**

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/top-5-open-source-analytics-tools

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/analytics-graphs-charts.png?itok=sersoqbV (Analytics: Charts and Graphs)
[2]: https://matomo.org/
[3]: https://demo.matomo.org/index.php?module=CoreHome&action=index&idSite=3&period=day&date=yesterday
[4]: https://www.innocraft.cloud/
[5]: http://www.openwebanalytics.com/
[6]: http://en.wikipedia.org/wiki/Heat_map
[7]: https://github.com/padams/Open-Web-Analytics/wiki/WordPress-Integration
[8]: https://github.com/padams/Open-Web-Analytics/wiki/MediaWiki-Integration
[9]: https://github.com/padams/Open-Web-Analytics/wiki/Tracker
[10]: https://github.com/padams/Open-Web-Analytics/wiki/PHP-Invocation
[11]: https://github.com/padams/Open-Web-Analytics
[12]: http://demo.openwebanalytics.com/
[13]: http://www.awstats.org
[14]: https://en.wikipedia.org/wiki/Syslog
[15]: https://count.ly/web-analytics
[16]: https://github.com/Countly
[17]: https://count.ly/pricing#compare-editions
[18]: https://plausible.io
[19]: https://plausible.io/data-policy
[20]: https://plausible.io/plausible.io
[21]: https://plausible.io/self-hosted-web-analytics
[22]: https://plausible.io/register
