[#]: collector: (lujun9972)
[#]: translator: (chen-ni)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Say WHAAAT? Mozilla has Been Nominated for the “Internet Villain” Award in the UK)
[#]: via: (https://itsfoss.com/mozilla-internet-villain/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Say WHAAAT? Mozilla has Been Nominated for the “Internet Villain” Award in the UK
======

Mozilla Firefox is one of the most popular browsers available out there. A lot of users prefer it over Chrome just because it encourages privacy protection and features options to keep your Internet activity as private as possible.

But, one of the recently proposed features – **[DoH (DNS-over-HTTPS)][1]** which is still in the testing phase didn’t receive a good response from the UK’s ISPs trade association.

So, the ISPA (Internet Services Providers Association) of UK decided to [nominate][2] Mozilla as one of the “Internet Villains” among the nominees for 2019. This is for an award ceremony to be held on 11th July in London by the ISP trade association of the UK.

![][3]

### Why “Mozilla” is the “Internet Villain” here?

In their announcement, the ISPA mentioned that Mozilla is one of the Internet Villains for supporting **DoH** (DNS-over-HTTPS).

> [@mozilla][4] is nominated for the [#ISPAs][5] [#InternetVillain][6] for their proposed approach to introduce DNS-over-HTTPS in such a way as to bypass UK filtering obligations and parental controls, undermining [#internet][7] safety standards in the UK. <https://t.co/d9NaiaJYnk> [pic.twitter.com/WeZhLq2uvi][8]
>
> — Internet Services Providers Association (ISPAUK) (@ISPAUK) [July 4, 2019][9]

Along with Mozilla, Article 13 Copyright Directive and President Donald Trump also appear in the list. Here’s how ISPA explained in their announcement:

_**Mozilla**_ _– for their proposed approach to introduce DNS-over-HTTPS in such a way as to bypass UK filtering obligations and parental controls, undermining internet safety standards in the UK_.

**_Article_ _13 Copyright Directive_** _– for threatening freedom of expression online by requiring ‘content recognition technologies’ across platforms_

_**President Donald Trump**_ _– for causing a huge amount of uncertainty across the complex, global telecommunications supply chain in the course of trying to protect national security_

### What is DNS-over-HTTPS?

DoH basically means that your DNS requests will be encrypted over an HTTPS connection.

Traditionally, the DNS requests are unencrypted and your DNS provider or the ISP can monitor/control your browsing activity. Without DoH, you can easily enforce blocking/content filtering through your DNS provider or the ISP can do that when they want.

[][10]

Suggested read  Firefox: The Internet's Knight in Shining Armor

However, DoH completely takes that out of the equation and hence, you get a private browsing experience.

You can explore [how Mozilla implements this partnering with Cloudflare][11] and set it up for yourself if you want.

### Is DoH helpful?

Yes and no.

Of course, on one side of the coin, it lets user bypass any content filters enforced by the DNS or the ISPs. So, it is a good thing that we want to put a stop to Internet censorship and DoH helps us with that.

But, on the other side, if you are a parent, you can no longer [set content filters][12] if your kid utilizes DoH on Mozilla Firefox. It depends on how good/bad the [firewall is configured][13].

But potentially DoH is a solution for some to bypass parental controls, which could be a bad thing.

Correct me if I’m wrong here – in the comments below.

Also, using DoH means that you can no longer use the local host file (in case you are using it for ad blocking or something else)

### Wrapping Up

What do you think about DoH in general? Is it good enough?

And, what’s your take on ISPA’s decision? Do you think that they are encouraging Internet censorship and government monitoring on netizens with this kind of announcement?

Personally, I find it hilarious. Even if DoH isn’t the ultimate feature that everyone wants, it is always good to have an option to protect your privacy in some way.

Let us know your thoughts in the comments below. Meanwhile, I’ll just put this quote here:

> In a time of universal deceit, telling the truth is a revolutionary act

--------------------------------------------------------------------------------

via: https://itsfoss.com/mozilla-internet-villain/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/DNS_over_HTTPS
[2]: https://www.ispa.org.uk/ispa-announces-finalists-for-2019-internet-heroes-and-villains-trump-and-mozilla-lead-the-way-as-villain-nominees/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/mozilla-internet-villain.jpg?resize=800%2C450&ssl=1
[4]: https://twitter.com/mozilla?ref_src=twsrc%5Etfw
[5]: https://twitter.com/hashtag/ISPAs?src=hash&ref_src=twsrc%5Etfw
[6]: https://twitter.com/hashtag/InternetVillain?src=hash&ref_src=twsrc%5Etfw
[7]: https://twitter.com/hashtag/internet?src=hash&ref_src=twsrc%5Etfw
[8]: https://t.co/WeZhLq2uvi
[9]: https://twitter.com/ISPAUK/status/1146725374455373824?ref_src=twsrc%5Etfw
[10]: https://itsfoss.com/why-firefox/
[11]: https://blog.nightly.mozilla.org/2018/06/01/improving-dns-privacy-in-firefox/
[12]: https://itsfoss.com/how-to-block-porn-by-content-filtering-on-ubuntu/
[13]: https://itsfoss.com/set-up-firewall-gufw/
