[#]: subject: (Mozilla Firefox Is Adding Capabilities to Defend Against Malicious Sites on Desktop)
[#]: via: (https://news.itsfoss.com/firefox-defending-malicious-sites/)
[#]: author: (Ankush Das https://news.itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Mozilla Firefox Is Adding Capabilities to Defend Against Malicious Sites on Desktop
======

Mozilla Firefox is a popular privacy-oriented, free and open-source web browser. While privacy and security were always the core focus of their offering, they are introducing a security architecture to isolated websites.

While this was something already present in Chromium, Mozilla has finally joined the party.

It basically changes the way how Mozilla Firefox works on desktop in the background, without affecting the user experience. It is available to test with Firefox beta/nightly, and will roll out to stable releases soon.

Here, I highlight the key takeaways from the [official announcement][1].

### Site Isolation to Protect Against Malicious Attacks

With site isolation security architecture, every website that you load will have a separate process in the operating system.

This will make sure that no malicious component of a website can access any information from another website that you access.

In other words, every website loaded stays isolated from each other by having unique processes in the operating system. Just like the Total Cookie Protection feature introduced with [Firefox 86][2], which separated cookies for every website.

![][3]

Here’s what the announcement mentions about it:

> In more detail, whenever you open a website and enter a password, a credit card number, or any other sensitive information, you want to be sure that this information is kept secure and inaccessible to malicious actors.
>
> As a first line of defence Firefox enforces a variety of security mechanisms, e.g. the [same-origin policy][4] which prevents adversaries from accessing such information when loaded into the same application.

This is definitely something that should be useful in the long run because this happens automatically and you do not have to enable anything to activate the security feature.

### Secure Browsing Experience With Firefox

Technically, the site isolation still depends on the guarantees of the operating system memory protection, but it is a big step towards securing the browsing experience.

In addition to separating every website and its information, there are a couple of other benefits to this new addition as well.

Just because every website will have a different process, when one of the sites that you load require more computing power, it will not necessarily affect the responsiveness of other sites. Similarly, if a tab crashes, it will not affect other websites on other tabs.

Also, this will enable the browser to efficiently use multiple cores in a modern processor and going forward.

For more technical details, and how to test it, you can go through the [official details][1].

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/firefox-defending-malicious-sites/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://hacks.mozilla.org/2021/05/introducing-firefox-new-site-isolation-security-architecture/
[2]: https://news.itsfoss.com/firefox-86-release/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY2OCIgd2lkdGg9IjQ3MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: https://developer.mozilla.org/en-US/docs/Web/Security/Same-origin_policy
