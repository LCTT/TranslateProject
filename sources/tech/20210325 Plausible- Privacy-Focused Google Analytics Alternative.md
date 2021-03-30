[#]: subject: (Plausible: Privacy-Focused Google Analytics Alternative)
[#]: via: (https://itsfoss.com/plausible/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Plausible: Privacy-Focused Google Analytics Alternative
======

[Plausible][1] is a simple, privacy-friendly analytics tool. It helps you analyze the number of unique visitors, pageviews, bounce rate and visit duration.

If you have a website you would probably understand those terms. As a website owner, it helps you know if your site is getting more visitors over the time, from where the traffic is coming and if you have some knowledge on these things, you can work on improving your website for more visits.

When it comes to website analytics, the one service that rules this domain is the Google’s free tool Google Analytics. Just like Google is the de-facto search engine, Google Analytics is the de-facto analytics tool. But you don’t have to live with it specially if you cannot trust Big tech with your and your site visitor’s data.

Plausible gives you the freedom from Google Analytics and I am going to discuss this open source project in this article.

Please mind that some technical terms in the article could be unknown to you if you have never managed a website or bothered about analytics.

### Plausible for privacy friendly website analytics

The script used by Plausible for analytics is extremely lightweight with less than 1 KB in size.

The focus is on preserving the privacy so you get valuable and actionable stats without compromising on the privacy of your visitors. Plausible is one of the rare few analytics tool that doesn’t require cookie banner or GDP consent because it is already [GDPR-compliant][2] on privacy front. That’s super cool.

In terms of features, it doesn’t have the same level of granularity and details of Google Analytics. Plausible banks on simplicity. It shows a graph of your traffic stats for past 30 days. You may also switch to real time view.

![][3]

You can also see where your traffic is coming from and which pages on your website gets the most visits. The sources can also show UTM campaigns.

![][4]

You also have the option to enable GeoIP to get some insights about the geographical location of your website visitors. You can also check how many visitors use desktop or mobile device to visit your website. There is also an option for operating system and as you can see, [Linux Handbook][5] gets 48% of its visitors from Windows devices. Pretty strange, right?

![][6]

Clearly, the data provided is nowhere close to what Google Analytics can do, but that’s intentional. Plausible intends to provide you simple matrix.

### Using Plausible: Opt for paid managed hosting or self-host it on your server

There are two ways you can start using Plausible. Sign up for their official managed hosting. You’ll have to pay for the service and this eventually helps the development of the Plausible project. They do have 30-days trial period and it doesn’t even require any payment information from your side.

The pricing starts at $6 per month for 10k monthly pageviews. Pricing increases with the number of pageviews. You can calculate the pricing on Plausible website.

[Plausible Pricing][7]

You can try it for 30 days and see if you would like to pay to Plausible developers for the service and own your data.

If you think the pricing is not affordable, you can take the advantage of the fact that Plausible is open source and deploy it yourself. If you are interested, read our [in-depth guide on self-hosting a Plausible instance with Docker][8].

At It’s FOSS, we self-host Plausible. Our Plausible instance has three of our websites added.

![Plausble dashboard for It’s FOSS websites][9]

If you maintain the website of an open source project and would like to use Plausible, you can contact us through our [High on Cloud project][10]. With High on Cloud, we help small businesses host and use open source software on their servers.

### Conclusion

If you are not super obsessed with data and just want a quick glance on how your website is performing, Plausible is a decent choice. I like it because it is lightweight and privacy compliant. That’s the main reason why I use it on Linux Handbook, our [ethical web portal for teaching Linux server related stuff][11].

Overall, I am pretty content with Plausible and recommend it to other website owners.

Do you run or manage a website as well? What tool do you use for the analytics or do you not care about that at all?

--------------------------------------------------------------------------------

via: https://itsfoss.com/plausible/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://plausible.io/
[2]: https://gdpr.eu/compliance/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/plausible-graph-lhb.png?resize=800%2C395&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/plausible-stats-lhb-2.png?resize=800%2C333&ssl=1
[5]: https://linuxhandbook.com/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/plausible-geo-ip-stats.png?resize=800%2C331&ssl=1
[7]: https://plausible.io/#pricing
[8]: https://linuxhandbook.com/plausible-deployment-guide/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/plausible-analytics-for-itsfoss.png?resize=800%2C231&ssl=1
[10]: https://highoncloud.com/
[11]: https://linuxhandbook.com/about/#ethical-web-portal
